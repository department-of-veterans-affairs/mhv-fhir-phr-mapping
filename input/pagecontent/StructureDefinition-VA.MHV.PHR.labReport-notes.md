
- The [mock example 1](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/labs.xml)
- maps to [LabReportTO, LabTestTO, LabResultTO and LabSpecimenTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VDIF - LabReportTO +](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-vdif-to-mhv-phr-labreportto)
- [Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
- should be based on US-Core for DiagnosticReport
  - This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
- The LabTestTO plus LabResultTO are combined and mapped onto a FHIR [Observation for laboratory result](StructureDefinition-VA.MHV.PHR.labTest.html) that is contained in the DiagnosticReport. The map to [VDIF LabTestTO and LabResultTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-vdif-to-mhv-phr-labtestto).
- The LabSpecimen is mapped into a [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html) resource that is contained in the DiagnosticReport. The map to [VDIF LabSpecimenTO](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-vdif-to-mhv-phr-labspecimen).
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the specimen and observations are no individually findable or referenceable.
- should have `meta.profile` set to `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.labReport` to indicate the intent to be compliant with this profile
- `code.text` contains the original `labReportTO.title`
  - `code` also includes the type in LOINC
- `category` must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
  - `category` also holds 1..* codes from the contained Observation.code

#### Mapping Concerns

- Are there other labReportTO.type values beyond SP, and MI? or is the example limited to just these? We really need to find a legitimate LOINC code for these two kinds of reports.
- I am not confident of the LOINC code I picked for the MI (LOINC#79381-0), I am slightly more confident of the code I picked for SP (LOINC#60567-5)