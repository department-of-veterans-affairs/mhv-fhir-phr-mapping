
- Chem-Hem comes from HDR (not VIA), thus is different schema than the others.
- The given labTestPromise example aligns with the [CDS WSClient](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/tree/development/src/main/resources/xsd/templates/MHVLabChemHemRead1) `Lab.xsd` schema.
- A profile showing how `labTestPromise` is mapped into a FHIR `DiagnosticReport`, `Observation`, and `Specimen`. Where the `labTestPromise` only has `labSubscript` of `CH` (Chem-Hem).
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/hdr_lab_sample.xml) 
- should be based on US-Core for DiagnosticReport
  - This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.chReport` to indicate the intent to be compliant with this profile
- The `labTestPromises` is mapped onto this FHIR `DiagnosticReport` for laboratory reporting. The mapping to [HDR labTestPromise](StructureDefinition-VA.MHV.PHR.chReport-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-labtestpromises)
- code.text must be `CH`. No other codeing values
- category must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
- category also holds 1..* codes from the contained Observation.code
- the `labTestPromises.labTests.orderedTestCode` is recorded as a [Observation panel](StructureDefinition-VA.MHV.PHR.chPanel.html) that is contained in the DiagnosticReport. This is unusual, but preserves the structure we are given from the HDR. The Panel points at the chemestryResults within that labTests. The map to [HDR orderedTestCode](StructureDefinition-VA.MHV.PHR.chPanel-mappings.html#mappings-for-hdr-labtests-panel-to-mhv-fhir-phr-labtestpromises-labtests-orderedtestcode).
- The `labTestPromises.labTests.chemistryResult` are each recorded as a FHIR [Observation result](StructureDefinition-VA.MHV.PHR.chTest.html) that is contained in the DiagnosticReport. The map to [HDR chTestPromise](StructureDefinition-VA.MHV.PHR.chTest-mappings.html#mappings-for-hdr-labtests-to-mhv-fhir-phr-labtestpromises-labtests). 
- The `labTestPromises.specimen` is mapped into a FHIR [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html) resource that is contained in the DiagnosticReport. The map to [HDR Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-fhir-phr-labtestpromises-specimen).
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the specimen and observations are no individually findable or referenceable.

#### Mapping Concerns

- current distinguishing between panel and results is by way of if the `hasMember` element is populated. Panel will have no `value[x]` and will have `hasMember` populated; where as results will have a `value[x]` and will not have `hasMember` populated.
  - Could create a code to use in `category`, but that would mean defining a Canonical URI in this publication which today is informal and published on my personal github repo. Would prefer not creating a code.
  - I checked with the VA C-CDA team to see if they have set a precedence that I could use. --> None
- what I have as chPanel, should this be better modeled as a serviceRequest, and placed in DiagnosticReport.basedOn? - all I have is the ordered Test Code values.
  - Or should this orderedTestCode go into the chTest?
- likely source of Blood Sugar, Cholesterol, and INR
- MHV eVault has processing for an `Amended` status. I have no mock examples
- `DiagnosticReport.conclusion` is just a string, yet the `labPromises.labComments` is an array of comments
- should the station number be recorded in an Organization resource? 
- could go to us-core 6 and not have the conflict mentioned here?
- check concept map
- status other than final? HDR might
- issued vs effectiveDate - not clear I have anything else to use
- performer as author or verifier?
- do we really get a case number?

#### Business Rules

ChemistryTransformer.java
- Ignore anything not `CH`
- Ignore anything without a stationNumber
- Ignore less than 48 hour (INCREMENTAL_GRACE_PERIOD) -- later is a 36 hour hold  ???
  - excluding covid tests
- some kind of "Wipe and Refresh" logic

#### Mapping

MHV eVault has one object definition that gets replicated for each portion (Lab, Panel, and Test), identified by recordSubType element. (Test is chemistryResult, Panel is orderedTest, Lab is overall?)

DiagnosticReport
- DiagnosticReport.result = contained Observation[chTest or chPanel]
  - Observation[chPanel] - comes from orderedTestCode, and only hasMember pointing to chTest(s)
  - Observation[chTest] - mostly filled with chemistryResults
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
|  |  | recordSource/                                   |  stationNumber={namespaceId}                 |                                     | should this be an Organization?  |
|  |  |                                                 |  requestMsgCtrlId |  |  |
|  |  |                                                 |  responseMsgCtrlId |  |  |
|  |  |                                                 |  extractStatus=`NEW`            |                                     | unclear how this might change |
|  |  |                                                 |  recordStatus |  |  |
|  |  |                                                 |  key |  |  |
|  |  | (labTestRequest, specimen, labTests)            | recordSubType                   |                                     | `LAB` / `PANEL` / `TEST` |
|  |  | labTests[n]/orderedTestCode/                    | orderedTest = {displayText}     | Observation[chPanel].code           | should this be a serviceRequest? |
|  |  | labTests[n]/chemistryResults/testIdentifier/    | labTestName={originalText}      | Observation[chTest].code            |  |
|  |  | labTests[n]/chemistryResults/observationStatus  | status                          | Observation[chTest].status          | mock data -> `F` and `C` |
|  |  | labTests[n]/chemistryResults/observationValue   | result                          | Observation[chTest].value[x]        |  |
|  |  | labTests[n]/chemistryResults/observationUnits   | units                           | Observation[chTest].valueQuantity.units |  |
|  |  | labTests[n]/chemistryResults/valueInterpretation | resultIndicator                | Observation[chTest].interpretation  | L->Low, LL->Critical Low, H->High, HH->Critical High |
|  |  | labTests[n]/chemistryResults/referenceRange     | referenceRange                  | Observation[chTest].referenceRange.text  |  |
|  |  | labTests[n]/chemistryResults/labCommentEvents   | interpretation                  | Observation[chTest].note.text       | multiple |
|  |  | labTests[n]/chemistryResults/performingOrganization/ | performingLocation={location} | Observation[chTest].performer[org]  |  |
|  |  |   ""                                            | performingLocationName={name}   |                                     |  |
|  |  | labTestRequest/author/                          | orderingProvider={name}         | DiagnosticReport.performer[author]  |  |
|  |  | labCommentEvents                                | comments                        | DiagnosticReport.conclusion         | multiple |
|  |  | labSubscript                                    | labType                         | DiagnosticReport.code.text          | `CH` |
|  |  | specimen/specimenTakenDate                      | collectedOnDatePrecise          | Specimen.collectedDateTime          |  |
|  |  |  ""                                             | collectedOnDateImprecise        |  |  |
|  |  | recordIdentifier                                | recordId                        | DiagnosticReport.identifier[Rid]    |  |
|  |  | specimen/specimenSource/                        | specimenSource={displayText}    | Specimen.type                       |  |
|  |  | labTestRequest/orderingFacilityIdentifier/      | orderingLocation={name}         | DiagnosticReport.performer[location]  |  |
|  |  | reportCompleteDate                              | reportCompleteDatePrecise       | DiagnosticReport.effectiveDateTime  |  |
|  |  |  ""                                             |                                 | DiagnosticReport.issued             |  |
|  |  |  ""                                             | reportCompleteDateImprecise     |  |  |
|  |  | labTests[n]/status                              | amendedStatus                   |  | if `Amended` |
|  |  |                                                 | pid                             |  | ++ each panel / result |
|  |  |                                                 | lid                             |  | ++ each lab |
|  |  |                                                 | hold                            |  | if hold |
|  |  |                                                 |                                 | DiagnosticReport.category=`LAB`     |  |
|  |  |                                                 |                                 | DiagnosticReport.status=`final`     |  |
|  |  |                                                 |                                 | Specimen.status=`available`         |  |
|  |  |                                                 |                                 | Observation[chPanel].category=`laboratory`     |  |
|  |  |                                                 |                                 | Observation[chPanel].status=`final` |  |
|  |  |                                                 |                                 | Observation[chTest].category=`laboratory`     |  |
|  |  |                                                 |                                 | Observation[chTest].status=`final`  |  |
|  |  | recordVersion
|  |  | recordUpdateTime/
{: .grid}
