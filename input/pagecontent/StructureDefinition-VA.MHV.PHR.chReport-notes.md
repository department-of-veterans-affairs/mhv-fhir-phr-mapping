
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
