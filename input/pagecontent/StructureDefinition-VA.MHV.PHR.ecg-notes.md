
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/MHV-PHR/blob/main/mocks/ekg.xml) 
- maps to [ClinicalProcedureTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.ecg-mappings.html#mappings-for-via-to-mhv-phr-clinicalprocedureto)
- based on US-Core for Clinical Notes
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.ecg` to indicate the intent to be compliant with this profile
- must also have category of [Cardiology (LP29708-2)](https://loinc.org/LP29708-2)
- .identifier holds the ClinicalProcedureTO.id
- must have type of LOINC 11524-6
- `content.attachment.title` = `ELECTROCARDIOGRAM`

#### Mapping Concerns

- none
