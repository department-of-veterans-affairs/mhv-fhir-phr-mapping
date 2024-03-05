
- This profile is **not** based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. That profile requires use of us-core Practitioner that I can't extend the way we need to. Except for that problem, I have replicated all the other us-core requirements.
- `subject` is a reference to this patient
- `category` is `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
  - `category` also holds 1..* codes from the contained Observation.code
- `code.text` the original lab type
  - `CH` for Chem-Hem
  - other text values come from Pathology or Microbiology report
  - `code` should be LOINC if available
    - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-VF-VitalsCodes.html)
- `identifier` will have cross reference to original source
- `status` is `final`
- `effectiveDateTime` and `issued` are the lab report timestamp
- `performer` is the lab report author
- `basedOn.identifier` may be the caseNumber
- `conclusion` is the lab report comment or text
- `specimen` are the specimen details as contained Specimen
- `result` are the lab result details as contained Observation
- Note the use of contained Specimen and Observation means that they are not individually findable or referenceable.
- no other elements are populated

More detailed profiling:
- [Chem-Hem (CH) Diagnostic Report](StructureDefinition-VA.MHV.PHR.chReport.html) 
- [LabReport](StructureDefinition-VA.MHV.PHR.labReport.html) including Microbiology and Pathology

Should search for entries that do **not** have `status=entered-in-error`
> GET {path}/DiagnosticReport?patient={patient}&status:not=entered-in-error
