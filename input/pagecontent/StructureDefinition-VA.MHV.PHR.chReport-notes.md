
- Chem-Hem comes from HDR (not VIA), thus is different schema than the others.
- The given labTestPromise example aligns with the [CDS WSClient](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/tree/development/src/main/resources/xsd/templates/MHVLabChemHemRead1) `Lab.xsd` schema.
- A profile showing how `labTestPromise` is mapped into a FHIR `DiagnosticReport`, `ServiceRequest`, `Observation`, and `Specimen`. Where the `labTestPromise` only has `labSubscript` of `CH` (Chem-Hem).
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/hdr_lab_sample.xml)
- This profile is based on:
  - [US-Core DiagnosticReport profile for Laboratory Results Reporting]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) and 
  - [US Core ServiceRequest Profile]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-servicerequest.html)
  - [US Core Laboratory Result Observation Profile]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-observation-lab.html) and
  - [FHIR Specimen as US Core didn't profile]({{site.data.fhir.path}}specimen.html)
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.chReport` to indicate the intent to be compliant with this profile
- The `labTestPromises` is mapped onto this FHIR `DiagnosticReport` for laboratory reporting. The mapping to [HDR labTestPromise](StructureDefinition-VA.MHV.PHR.chReport-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-labtestpromises)
  - code.text must be `CH`. No other coding values
- category must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
- category also holds 1..* codes from the contained Observation.code -- This is only to allow possibility to find the contained Observations, as there might be an interest to find lab observations like Cholesterol.
- the `labTestPromises.labTests.orderedTestCode` is recorded as a [Ordered test](StructureDefinition-VA.MHV.PHR.chOrder.html) that is contained in the DiagnosticReport. The map to [HDR orderedTestCode](StructureDefinition-VA.MHV.PHR.chOrder-mappings.html#mappings-for-hdr-labtests-order-to-mhv-fhir-phr-labtestpromises-labtests-orderedtestcode).
- The `labTestPromises.labTests.chemistryResult` are each recorded as a FHIR [Observation result](StructureDefinition-VA.MHV.PHR.chTest.html) that is contained in the DiagnosticReport. The map to [HDR chTestPromise](StructureDefinition-VA.MHV.PHR.chTest-mappings.html#mappings-for-hdr-labtests-to-mhv-fhir-phr-labtestpromises-labtests).
- The `labTestPromises.specimen` is mapped into a FHIR [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html) resource that is contained in the DiagnosticReport. The map to [HDR Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-fhir-phr-labtestpromises-specimen).
  - There is only one Specimen.
  - There is no Specimen profile in us-core 5.0
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the ServiceRequest, Specimen and Observations are not individually findable or referenceable.
  - Future improvement that is not needed today, devise some way that these resources are able to be not-contained. For now this is okay for the use-cases.
- note to API use, the Observations here are lab results and thus would include: Blood Sugar, Cholesterol, and INR
- See [99VA code system conversion](utility.html#code-lookup) (i.e., `99VA60` = `http://va.gov/terminology/vistaDefinedTerms/60`)
- ChemistryResult ObservationStatus translated to Observation.status using [concept map translation](ConceptMap-VF-ChemistryResult-ObservationStatus.html)
- DiagnosticReport.status is set to `final` if all Observations are final; and `preliminary` if any Observations are not final.
- DiagnosticReport.status could be set to `entered-in-error` if `ORDER CANCELED` or deleted
- ServiceRequest.status is always `unknown` as we are creating a contained resource for this

#### Mapping Concerns

- would like to have vista field mapping, but so far few fields are sure
  - are trying to find older data that might be more traceable
  - have gotten a mapping table from HDR but it is to HL7v2, so not helpful
- Need data
  - different status
  - deleted/entered-in-error

#### Business Rules

rules interpreted from ChemistryTransformer.java

- Ignore anything not `CH`
- Ignore anything without a stationNumber
- hold is calculated from reportCompleteDate, (midnight on this day is presumed)
  - DiagnosticReport.issued
- no hold date for reports that have been amended (status of `C`)
- no hold date for COVID
  
#### Mapping

MHV eVault has one object definition that gets replicated for each portion (Lab, Order, and Test), identified by recordSubType element. (Test is chemistryResult, Order is orderedTest, Lab is overall?)

<figure>
{%include chLab.svg%}
<figcaption><b>Figure: Chem-Hem Labs</b></figcaption>
</figure>
<br clear="all">

| V | Vn | HDR labTestPromises                                |   MHV eVault                    | FHIR                                | Note |
|---|----|--------------------------------------------------- |---------------------------------|-------------------------------------|------------|
|   |    |                                                    |  icn={icn}                      | DiagnosticReport.subject            |  |
|   |    | recordSource/                                      |  stationNumber={namespaceId}    | DiagnosticReport.performer[org]     |  |
|   |    | (labTestRequest, specimen, labTests)               | recordSubType                   |                                     | `LAB` / `PANEL` / `TEST` |
| 63.07-3 |  | labTests[n]/orderedTestCode/                   | orderedTest = {displayText}     | ServiceRequest[n].code              |  |
|   |    | labTests[n]/chemistryResults[m]/testIdentifier/    | labTestName={originalText}      | Observation[m].code                 |  |
| 63.04-10 |  | labTests[n]/chemistryResults[m]/observationStatus  | status                          | Observation[m].status          | see table below |
|   |    | labTests[n]/chemistryResults[m]/observationValue   | result                          | Observation[m].value[x]             |  |
|   |    | labTests[n]/chemistryResults[m]/observationUnits   | units                           | Observation[m].valueQuantity.units  |  |
|   |    | labTests[n]/chemistryResults[m]/valueInterpretation | resultIndicator                | Observation[m].interpretation       | see translation |
|   |    | labTests[n]/chemistryResults[m]/referenceRange     | referenceRange                  | Observation[m].referenceRange.text  |  |
|   |    | labTests[n]/chemistryResults[m]/labCommentEvents   | interpretation                  | Observation[m].note.text            | multiple |
|   |    | labTests[n]/chemistryResults[m]/performingOrganization/ | performingLocation={location} | Observation[m].performer[org]    |  |
|   |    |   ""                                               | performingLocationName={name}   |                                     |  |
|   |    | labTestRequest/author/                             | orderingProvider={name}         | ServiceRequest.author               |  |
|   |    | labCommentEvents                                   | comments                        | DiagnosticReport.extension[notes]   | multiple |
|   |    | labSubscript                                       | labType                         | DiagnosticReport.code.text          | `CH` |
|   |    | specimen/specimenTakenDate                         | collectedOnDatePrecise          | Specimen.collectedDateTime          |  |
|   |    |  ""                                                | collectedOnDateImprecise        |                                     |  |
|   |    |  ""                                                |                                 | DiagnosticReport.effectiveDateTime  |  |
|   |    |  ""                                                |                                 | Observation[*].effectiveDateTime    |  |
|   |    | recordIdentifier                                   | recordId                        | DiagnosticReport.identifier[Rid]    |  |
|   |    | specimen/specimenSource/                           | specimenSource={displayText}    | Specimen.type                       |  |
|   |    | labTestRequest/orderingFacilityIdentifier/         | orderingLocation={name}         | ServiceRequest.performer[location]  |  |
|   |    | reportCompleteDate                                 | reportCompleteDatePrecise       | DiagnosticReport.issued             |  |
|   |    |  ""                                                | reportCompleteDateImprecise     |                                     |  |
|   |    | reportCompleteDate                                 | reportCompleteDatePrecise       | Observation[*].issued               |  |
|   |    |                                                    |                                 | DiagnosticReport.category=`LAB`     | also all chTest code |
|   |    |                                                    |                                 | DiagnosticReport.category=`v2-0074#CH` |  |
|   |    |                                                    |                                 | DiagnosticReport.status             | based on all Observation.status. So `final` or `preliminary` |
|   |    |                                                    |                                 | Specimen.status=`available`         |  |
|   |    |                                                    |                                 | Specimen.request = {ServiceRequest} | multiple |
|   |    |                                                    |                                 | ServiceRequest[n].category=`Laboratory procedure`     |  |
|   |    |                                                    |                                 | ServiceRequest[n].status=`unknown`  |  |
|   |    |                                                    |                                 | ServiceRequest[n].intent=`order`    |  |
|   |    |                                                    |                                 | Observation[m].category=`laboratory` |  |
|   |    |                                                    |                                 | Observation[m].specimen = {Specimen} |  |
|   |    |                                                    |                                 | Observation[m].basedOn = {ServiceRequest}  |  |
|   |    | recordVersion | | | |
|   |    | recordUpdateTime/ | | | |
{: .grid}

##### observationStatus code

FHIR mapping. Same as [concept map translation](ConceptMap-VF-ChemistryResult-ObservationStatus.html)

| code | meaning                | MHV PHR     |  FHIR Observation.status |
|-----|-------------------------|-------------|-------------|
| C   | CORRECTED RESULTS       | AMENDED     | corrected   |
| F   | FINAL RESULTS           | FINAL       | final       |
| Y   | NO ORDER ON RECORD      | UNKNOWN     | unknown     |
| R   | NOT VERIFIED            | UNKNOWN     | preliminary |
| X   | ORDER CANCELED          | CANCELLED   | cancelled   |
| O   | ORDER RECEIVED          | UNKNOWN     | registered  |
| P   | PRELIMINARY             | UNKNOWN     | preliminary |
| S   | PROCEDURE SCHEDULED     | UNKNOWN     | registered  |
| A   | SOME RESULTS AVAILABLE  | UNKNOWN     | unknown     |
| I   | SPECIMEN RECEIVED       | PRELIMINARY | preliminary |
{: .grid}

#### How to convert a `recordIdentifier` into an `Identifier`

Given:

``` xml
      <labTestPromises>
         <recordIdentifier>
            <identity>1103030001</identity>
            <namespaceId>LR</namespaceId>
            <universalId>TEST.SALT-LAKE.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordIdentifier>
```

Option to use `urn` encoding with a "Federated Content" according to [RFC 4198](https://www.rfc-editor.org/rfc/rfc4198)

convert as:

``` fs
* identifier[Rid].system ^short = "DNS universalIdType: `urn:fdc:` + {universalID} + `:` + {namespaceId}"
* identifier[Rid].value ^short = "{labTestPromises.recordIdentifier.identity}"
```

becomes:

``` fs
* identifier[Rid].value = "1103030001" 
* identifier[Rid].system = "urn:fdc:TEST.SALT-LAKE.MED.VA.GOV:LR"
```

##### valueInterpretation - Observation.interpretation.coding

The string we are given in valueInterpretation always goes into Observation.interpretation.text

FHIR mapping. Same as [concept map translation](ConceptMap-VF-ChemistryResult-valueInterpretation.html)

| code | meaning     |  FHIR Observation.intepretation.coding |
|------|-------------|---------------------------|
| L    | Low         | L 
| LL   | Very Low    | LL
| L*   | Very Low    | LL
| H    | High        | H
| HH   | Very High   | HH
| H*   | Very High   | HH
| A    | Abnormal    | A
{: .grid}

All other codes do NOT translate into a code.
