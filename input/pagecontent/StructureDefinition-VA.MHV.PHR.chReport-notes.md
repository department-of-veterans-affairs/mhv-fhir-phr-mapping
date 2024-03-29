
- Chem-Hem comes from HDR (not VIA), thus is different schema than the others.
- The given labTestPromise example aligns with the [CDS WSClient](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/tree/development/src/main/resources/xsd/templates/MHVLabChemHemRead1) `Lab.xsd` schema.
- A profile showing how `labTestPromise` is mapped into a FHIR `DiagnosticReport`, `ServiceRequest`, `Observation`, and `Specimen`. Where the `labTestPromise` only has `labSubscript` of `CH` (Chem-Hem).
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/hdr_lab_sample.xml)
- should be based on US-Core for DiagnosticReport
  - This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
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

#### Mapping Concerns

- KBS? Should we derive DiagnosticReport.status from the ObservationStatus?
- KBS? Should ServiceRequest.status have a value other than unknown?
- would like to have vista field mapping, but so far few fields are sure
  - are trying to find older data that might be more traceable
  - have gotten a mapping table from HDR but it is to HL7v2, so not helpful

##### How to convert a `recordIdentifier` into an `Identifier`

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

#### Business Rules

rules interpreted from ChemistryTransformer.java

- Ignore anything not `CH`
- Ignore anything without a stationNumber
- Ignore less than 48 hour (INCREMENTAL_GRACE_PERIOD) -- later is a 36 hour hold  ???
- no hold date for reports that have been amended (status of `C`)
- no hold date for covid
  
#### Mapping

MHV eVault has one object definition that gets replicated for each portion (Lab, Order, and Test), identified by recordSubType element. (Test is chemistryResult, Order is orderedTest, Lab is overall?)

<figure>
{%include chLab.svg%}
<figcaption><b>Chem-Hem Labs</b></figcaption>
</figure>
<br clear="all">

| Vista | Vista Field Name          | HDR labTestPromises |   MHV eVault      | FHIR              | Note |
|-------|-------------------------- |---------------------|-------------------|-------------------|------------|
|  |  |                                                 |  id |  |  |
|  |  |                                                 |  oplock |  |  |
|  |  |                                                 |  createdDate |  |  |
|  |  |                                                 |  modifiedDate |  |  |
|  |  |                                                 |  icn={icn}                      | DiagnosticReport.subject            |  |
|  |  | recordSource/                                   |  stationNumber={namespaceId}    | DiagnosticReport.performer[org]     |  |
|  |  |                                                 |  requestMsgCtrlId |  |  |
|  |  |                                                 |  responseMsgCtrlId |  |  |
|  |  |                                                 |  extractStatus=`NEW`            |                                     | unclear how this might change |
|  |  |                                                 |  recordStatus |  |  |
|  |  |                                                 |  key |  |  |
|  |  | (labTestRequest, specimen, labTests)            | recordSubType                   |                                     | `LAB` / `PANEL` / `TEST` |
| 63.07-3 |  | labTests[n]/orderedTestCode/                    | orderedTest = {displayText}     | ServiceRequest[n].code           |  |
|  |  | labTests[n]/chemistryResults[m]/testIdentifier/    | labTestName={originalText}      | Observation[m].code              |  |
| 63.04-10 |  | labTests[n]/chemistryResults[m]/observationStatus  | status                          | Observation[m].status          |  |
|  |  | labTests[n]/chemistryResults[m]/observationValue   | result                          | Observation[m].value[x]          |  |
|  |  | labTests[n]/chemistryResults[m]/observationUnits   | units                           | Observation[m].valueQuantity.units |  |
|  |  | labTests[n]/chemistryResults[m]/valueInterpretation | resultIndicator                | Observation[m].interpretation    | L->Low, LL->Critical Low, H->High, HH->Critical High |
|  |  | labTests[n]/chemistryResults[m]/referenceRange     | referenceRange                  | Observation[m].referenceRange.text  |  |
|  |  | labTests[n]/chemistryResults[m]/labCommentEvents   | interpretation                  | Observation[m].note.text         | multiple |
|  |  | labTests[n]/chemistryResults[m]/performingOrganization/ | performingLocation={location} | Observation[m].performer[org] |  |
|  |  |   ""                                            | performingLocationName={name}   |                                     |  |
|  |  | labTestRequest/author/                          | orderingProvider={name}         | ServiceRequest.author               |  |
|  |  | labCommentEvents                                | comments                        | DiagnosticReport.extension[notes]   | multiple |
|  |  | labSubscript                                    | labType                         | DiagnosticReport.code.text          | `CH` |
|  |  | specimen/specimenTakenDate                      | collectedOnDatePrecise          | Specimen.collectedDateTime          |  |
|  |  |  ""                                             | collectedOnDateImprecise        |  |  |
|  |  |  ""                                             |                                 | DiagnosticReport.effectiveDateTime  |  |
|  |  |  ""                                             |                                 | Observation[*].effectiveDateTime    |  |
|  |  | recordIdentifier                                | recordId                        | DiagnosticReport.identifier[Rid]    |  |
|  |  | specimen/specimenSource/                        | specimenSource={displayText}    | Specimen.type                       |  |
|  |  | labTestRequest/orderingFacilityIdentifier/      | orderingLocation={name}         | ServiceRequest.performer[location]  |  |
|  |  | reportCompleteDate                              | reportCompleteDatePrecise       | DiagnosticReport.issued             |  |
|  |  |  ""                                             | reportCompleteDateImprecise     |  |  |
|  |  | reportCompleteDate                              | reportCompleteDatePrecise       | Observation[*].issued               |  |
|  |  | labTests[n]/status                              | amendedStatus if amended        | ???? |  |
|  |  |                                                 | pid                             |  | ++ each order / result |
|  |  |                                                 | lid                             |  | ++ each lab |
|  |  |                                                 | hold                            |  | if hold |
|  |  |                                                 |                                 | DiagnosticReport.category=`LAB`     | also all chTest code |
|  |  |                                                 |                                 | DiagnosticReport.status=`final`     |  |
|  |  |                                                 |                                 | Specimen.status=`available`         |  |
|  |  |                                                 |                                 | Specimen.request = {ServiceRequest} | multiple |
|  |  |                                                 |                                 | ServiceRequest[n].category=`Laboratory procedure`     |  |
|  |  |                                                 |                                 | ServiceRequest[n].status=`unknown`  |  |
|  |  |                                                 |                                 | ServiceRequest[n].intent=`order`    |  |
|  |  |                                                 |                                 | Observation[m].category=`laboratory` |  |
|  |  |                                                 |                                 | Observation[m].status=`final`       |  |
|  |  |                                                 |                                 | Observation[m].specimen = {Specimen} |  |
|  |  |                                                 |                                 | Observation[m].basedOn = {ServiceRequest}  |  |
|  |  | recordVersion | | | |
|  |  | recordUpdateTime/ | | | |
{: .grid}

##### observationStatus  code

FHIR mapping

| code | meaning                | MHV PHR     | FHIR DiagnosticReport | FHIR Observation
|-----|-------------------------|---------- --|--------|----------------|
| C   | CORRECTED RESULTS       | AMENDED     | corrected | corrected |
| F   | FINAL RESULTS           | FINAL       | final | final |
| Y   | NO ORDER ON RECORD      | UNKNOWN     | unknown | unknown |
| R   | NOT VERIFIED            | UNKNOWN     | preliminary | preliminary |
| X   | ORDER CANCELED          | CANCELLED   | cancelled | cancelled |
| O   | ORDER RECEIVED          | UNKNOWN     | registered | registered |
| P   | PRELIMINARY             | UNKNOWN     | preliminary | preliminary |
| S   | PROCEDURE SCHEDULED     | UNKNOWN     | registered | registered |
| A   | SOME RESULTS AVAILABLE  | UNKNOWN     | partial | unknown |
| I   | SPECIMEN RECEIVED       | PRELIMINARY | preliminary | preliminary |
{: .grid}
