
- Chem-Hem comes from HDR (not VIA), thus is different schema than the others.
- The given labTestPromise example aligns with the [CDS WSClient](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/tree/development/src/main/resources/xsd/templates/MHVLabChemHemRead1) `Lab.xsd` schema.
- A profile showing how `labTestPromise` is mapped into a FHIR `DiagnosticReport`, `Observation`, and `Specimen`. Where the `labTestPromise` only has `labSubscript` of `CH` (Chem-Hem).
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/hdr_lab_sample.xml) 
- should be based on US-Core for DiagnosticReport
  - This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.chReport` to indicate the intent to be compliant with this profile
- The `labTestPromises` is mapped onto this FHIR `DiagnosticReport` for laboratory reporting. The mapping to [HDR labTestPromise](StructureDefinition-VA.MHV.PHR.chReport-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-labtestpromises)
- code.text must be `CH`. No other coding values
- category must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
- category also holds 1..* codes from the contained Observation.code -- TODO might not do this
- the `labTestPromises.labTests.orderedTestCode` is recorded as a [Ordered test](StructureDefinition-VA.MHV.PHR.chOrder.html) that is contained in the DiagnosticReport. The map to [HDR orderedTestCode](StructureDefinition-VA.MHV.PHR.chOrder-mappings.html#mappings-for-hdr-labtests-order-to-mhv-fhir-phr-labtestpromises-labtests-orderedtestcode).
- The `labTestPromises.labTests.chemistryResult` are each recorded as a FHIR [Observation result](StructureDefinition-VA.MHV.PHR.chTest.html) that is contained in the DiagnosticReport. The map to [HDR chTestPromise](StructureDefinition-VA.MHV.PHR.chTest-mappings.html#mappings-for-hdr-labtests-to-mhv-fhir-phr-labtestpromises-labtests). 
- The `labTestPromises.specimen` is mapped into a FHIR [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html) resource that is contained in the DiagnosticReport. The map to [HDR Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-fhir-phr-labtestpromises-specimen).
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the specimen and observations are no individually findable or referenceable. -- TODO would be good if the Observations were not forced as contained, but there is no identifier.
- note to API use, the Observations here are would include: Blood Sugar, Cholesterol, and INR

#### Mapping Concerns

- would like to have vista field mapping, but so far few fields are sure
  - are trying to find older data that might be more traceable
  - have gotten a mapping table from HDR but it is to HL7v2, so not helpful
- need a .code for Diagnostic Report for `CH`
- could make standalone Observations using the DiagnosticReport id+position
  - Only if we can make the ServiceRequest and the Specimen also standalone. Which is just as possible.
  - the benefit is unclear as there is not currently a use-case asking for this.
- Should ServiceRequest.specimen also be populated to the specimen?
- There are many system values that I don't know what to do with, so I just invent a canonical
  - http://va.gov/systems/99VA64
  - http://va.gov/systems/99VA60
  - http://va.gov/systems/99VA95.3
  - http://va.gov/systems/99VA61

- recordSource - is this a Location or Organization (currently using Organization, as looked last week and given three digits would likely be vamc)
  - schema defined as `<xsd:element minOccurs="0" name="recordSource" type="basedatatypes:HL72FacilityIdentifier"/>`
  - example 
```
<recordSource>
  <namespaceId>989</namespaceId>
  <universalId>DAYT29.FO-BAYPINES.MED.VA.GOV</universalId>
  <universalIdType>DNS</universalIdType>
</recordSource>
```
- not clear what to do with observationStatus. 
```
  case "F": return ObservationStatus.FINAL;
  case "C": return ObservationStatus.AMENDED;
  case "I": return ObservationStatus.PRELIMINARY;
  case "X": return ObservationStatus.CANCELLED;
  default: return ObservationStatus.UNKNOWN;
```
- resolve DiagnosticReport.category if it holds all of the codes for the lab tests performed. It does not seem to be needed for use-cases, but it might be handy if they ever want to show observations.

TODO

- TODO can likely fill out completely a US-Core Practitioner for the ServiceRequest.requester
- TODO do we have data for everything? -- Maruf is looking for historic data
- TODO update diagnostic report profile and api narrative
- TODO make sure markdown table matches profile

#### Business Rules

rules interpreted from ChemistryTransformer.java

- Ignore anything not `CH`
- Ignore anything without a stationNumber
- Ignore less than 48 hour (INCREMENTAL_GRACE_PERIOD) -- later is a 36 hour hold  ???
- no hold date for reports that have been amended (status of `C`)
- no hold date for covid
- some kind of "Wipe and Refresh" logic
  
#### Mapping

MHV eVault has one object definition that gets replicated for each portion (Lab, Order, and Test), identified by recordSubType element. (Test is chemistryResult, Order is orderedTest, Lab is overall?)

DiagnosticReport
- DiagnosticReport.result = contained Observation[chTest or chOrder]
  - ServiceRequest[chOrder] - comes from orderedTestCode, and only hasMember pointing to chTest(s) within this orderedTest
    - Observation[chTest] - mostly filled with chemistryResults found within that orderedTestCode
- DiagnosticReport.specimen = contained Specimen[specimen]
- DiagnosticReport.performer = contained Practitioner or Organization
- DiagnosticReport.category = all codes from contained Observations to enable finding them since they are contained

| Vista | Vista Field Name          | HDR labTestPromises |   MHV eVault      | FHIR              | Note |
|-------|-------------------------- |---------------------|-------------------|-------------------|------------|
|  |  |                                                 |  id |  |  |
|  |  |                                                 |  oplock |  |  |
|  |  |                                                 |  createdDate |  |  |
|  |  |                                                 |  modifiedDate |  |  |
|  |  |                                                 |  icn={icn}                      | DiagnosticReport.subject            |  |
|  |  | recordSource/                                   |  stationNumber={namespaceId}    | DiagnosticReport.performer          |  |
|  |  |                                                 |  requestMsgCtrlId |  |  |
|  |  |                                                 |  responseMsgCtrlId |  |  |
|  |  |                                                 |  extractStatus=`NEW`            |                                     | unclear how this might change |
|  |  |                                                 |  recordStatus |  |  |
|  |  |                                                 |  key |  |  |
|  |  | (labTestRequest, specimen, labTests)            | recordSubType                   |                                     | `LAB` / `PANEL` / `TEST` |
| 63.07-3 |  | labTests[n]/orderedTestCode/                    | orderedTest = {displayText}     | ServiceRequest[chOrder].code           |  |
|  |  | labTests[n]/chemistryResults[m]/testIdentifier/    | labTestName={originalText}      | Observation[chTest].code            |  |
| 63.04-10 |  | labTests[n]/chemistryResults[m]/observationStatus  | status                          | Observation[chTest].status          | mock data -> `F` and `C`-> Corrected |
|  |  | labTests[n]/chemistryResults[m]/observationValue   | result                          | Observation[chTest].value[x]        |  |
|  |  | labTests[n]/chemistryResults[m]/observationUnits   | units                           | Observation[chTest].valueQuantity.units |  |
|  |  | labTests[n]/chemistryResults[m]/valueInterpretation | resultIndicator                | Observation[chTest].interpretation  | L->Low, LL->Critical Low, H->High, HH->Critical High |
|  |  | labTests[n]/chemistryResults[m]/referenceRange     | referenceRange                  | Observation[chTest].referenceRange.text  |  |
|  |  | labTests[n]/chemistryResults[m]/labCommentEvents   | interpretation                  | Observation[chTest].note.text       | multiple |
|  |  | labTests[n]/chemistryResults[m]/performingOrganization/ | performingLocation={location} | Observation[chTest].performer[org]  |  |
|  |  |   ""                                            | performingLocationName={name}   |                                     |  |
|  |  | labTestRequest/author/                          | orderingProvider={name}         | ServiceRequest.author               |  |
|  |  | labCommentEvents                                | comments                        | DiagnosticReport.extension[notes]   | multiple |
|  |  | labSubscript                                    | labType                         | DiagnosticReport.code.text          | `CH` |
|  |  | specimen/specimenTakenDate                      | collectedOnDatePrecise          | Specimen.collectedDateTime          |  |
|  |  |  ""                                             | collectedOnDateImprecise        |  |  |
|  |  | recordIdentifier                                | recordId                        | DiagnosticReport.identifier[Rid]    |  |
|  |  | specimen/specimenSource/                        | specimenSource={displayText}    | Specimen.type                       |  |
|  |  | labTestRequest/orderingFacilityIdentifier/      | orderingLocation={name}         | ServiceRequest.performer[location]  |  |
|  |  | reportCompleteDate                              | reportCompleteDatePrecise       | DiagnosticReport.effectiveDateTime  |  |
|  |  |  ""                                             |                                 | DiagnosticReport.issued             |  |
|  |  |  ""                                             | reportCompleteDateImprecise     |  |  |
|  |  | labTests[n]/status                              | amendedStatus if amended        | ???? |  |
|  |  |                                                 | pid                             |  | ++ each order / result |
|  |  |                                                 | lid                             |  | ++ each lab |
|  |  |                                                 | hold                            |  | if hold |
|  |  |                                                 |                                 | DiagnosticReport.category=`LAB`     | also all chTest code |
|  |  |                                                 |                                 | DiagnosticReport.status=`final`     |  |
|  |  |                                                 |                                 | Specimen.status=`available`         |  |
|  |  |                                                 |                                 | ServiceRequest[chOrder].category=`Laboratory procedure`     |  |
|  |  |                                                 |                                 | ServiceRequest[chOrder].status=`unknown` |  |
|  |  |                                                 |                                 | ServiceRequest[chOrder].intent=`order` |  |
|  |  |                                                 |                                 | ServiceRequest[chOrder].specimen = {Specimen}  |  |
|  |  |                                                 |                                 | Observation[chTest].category=`laboratory`     |  |
|  |  |                                                 |                                 | Observation[chTest].status=`final`  |  |
|  |  |                                                 |                                 | Observation[chTest].specimen = {Specimen}  |  |
|  |  |                                                 |                                 | Observation[chTest].basedOn = {ServiceRequest}  |  |
|  |  | recordVersion
|  |  | recordUpdateTime/
{: .grid}


##### observation status  code

code | meaning
-----|--------
C | CORRECTED RESULTS
F | FINAL RESULTS
Y | NO ORDER ON RECORD
R | NOT VERIFIED
X | ORDER CANCELED
O | ORDER RECIEVED
P | PRELIMINARY
S | PROCEDURE SCHEDULED
A | SOME RESULTS AVAILABLE
I | SPECIMEN RECEIVED
{: .grid}
