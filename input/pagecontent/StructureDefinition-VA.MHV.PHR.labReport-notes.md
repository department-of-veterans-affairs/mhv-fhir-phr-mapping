
- The [mock example 1](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/labs.xml)
- maps to [LabReportTO, LabTestTO, LabResultTO and LabSpecimenTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VIA - LabReportTO +](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-via-to-mhv-fhir-phr-labreportto)
- [Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
- should be based on US-Core for DiagnosticReport
  - This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
- The LabTestTO plus LabResultTO are combined and mapped onto a FHIR [Observation for laboratory result](StructureDefinition-VA.MHV.PHR.labTest.html) that is contained in the DiagnosticReport. The map to [VIA LabTestTO and LabResultTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-via-to-mhv-fhir-phr-labtestto).
- The LabSpecimen is mapped into a [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html) resource that is contained in the DiagnosticReport. The map to [VIA LabSpecimenTO](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-via-to-mhv-fhir-phr-labspecimen).
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the specimen and observations are no individually findable or referenceable.
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.labReport` to indicate the intent to be compliant with this profile
- `code.text` contains the original `labReportTO.title`
  - `code` also includes the type in LOINC
    - SP -> LOINC#60567-5 "Comprehensive pathology report panel"
    - MI -> LOINC#79381-0 "Gastrointestinal pathogens panel - Stool by NAA with probe detection"
- `category` must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
  - `category` also holds 1..* codes from the contained Observation.code

#### Mapping Concerns

- The mock data I have is from the 1990s. Is that old enough for cross referenceing?
- There does not appear to be anything that could be the ServiceRequest
- The labReportTO
  - type: Are there other labReportTO.type values beyond SP, and MI? or is the example limited to just these? We really need to find a legitimate LOINC code for these two kinds of reports.
  - I am not confident of the LOINC code I picked for the MI (LOINC#79381-0), I am slightly more confident of the code I picked for SP (LOINC#60567-5)
  - id is not just a number - e.g. `<id>MI;7049269</id>` -- is the leading `MI`, just repeating the type of lab, as this was in a type `MI`? Or is there some other meaning?
  - no performer, possibly the Organization is in result.labSiteId - e.g., `<labSiteId>989</labSiteId>`
  - schema values but no examples: author, caseNumber, comment, facility
- Specimen examples didn't have much populated
  - not clear what site and facility might contain, so can't tell where they would go
  - some examples are likely FHIR Device (old hardware left foot), so this might change
  - how do I derive a useful accession from what I am given? - e.g., `<accessionNum>PARAS 95 264</accessionNum>`
  - specimen id seems to just be index on report id - e.g. `<id>MI;7049269;1</id>`
- All of the Observations mock examples I have are 
  - value is just string
  - name is just a string
  - no performer
  - no date, I guess I just use the date from the labReportTO.restult.timestamp
  - schema has a loinc element, but it is not populated in mock examples

#### TODO

- should I do a table like I did for chem-hem?
  - It did help me determine what values MHV pulls from the VIA feed, and thus what might be populated but where I don't have data today.
- should I do a plantuml diagram like I did for chem-hem?
