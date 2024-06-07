Radiology Diagnostic Report

- This profile is based on:
  - [US-Core DiagnosticReport profile for Report and Note Exchange]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-diagnosticreport-note.html)
- `subject` is a reference to this patient
- `category` = LOINC#LP29684-5
- `code.coding` may hold CPT code from ImagingExamTO.type
- `code.text` will hold the ImagingExamTO.name
- `status` = `final` if not `entered-in-error` or derived from ImagingExamTO.status
- `identifier`:
  - will hold the unique identifier of this report
  - may hold case number
  - may hold accession number
- `performer` may point at the imaging study location
- `resultsInterpreter` will point at the provider
- `effectiveDateTime` will point at the date of the report
- `encounter.identifier` may hold the encounter identifier
- `basedOn` may point at a the order [ServiceRequest(s)](StructureDefinition-VA.MHV.PHR.irOrder.html)
- `conclusion` will hold the interpretation
- `presentedForm.title` will hold the title of the radiology report
- `presentedForm.creation` will hold the timestamp on the report
- `presentedForm.contentType` will be `text/plain`
- `presentedForm.data` will hold the base64 encoded radiology report
- Note there are no Observations or Specimen with a radiology report

### Search Consideration

- Should search for entries that do **not** have `status=entered-in-error` (i.e., `&status:not=entered-in-error`)
- Should search for entries with category of Radiology to get only Radiology DiagnosticReport resources

> GET {path}/DiagnosticReport?patient={patient}&status:not=entered-in-error&category=http://loinc.org#LP29684-5
