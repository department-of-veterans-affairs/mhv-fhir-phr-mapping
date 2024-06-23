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
- `performer` may point at the imaging study organization
- `resultsInterpreter` will point at the provider
- `issued` will be the date of the report Verified
- `effectiveDateTime` will be the date of the Exam
- `encounter.identifier` may hold the encounter identifier
- `conclusion` will hold the interpretation
- `presentedForm.title` will hold the title of the radiology report
- `presentedForm.creation` will hold the timestamp on the report
- `presentedForm.contentType` will be `text/plain`
- `presentedForm.data` will hold the base64 encoded radiology report
- `basedOn` may point at a the order [ServiceRequest](StructureDefinition-VA.MHV.PHR.irOrder.html)
  - `ServiceRequest.code.text` will be the name of the order
  - `ServiceRequest.identifier` will be the identifier of the order
  - `ServiceRequest.category` will be Imaging
  - `ServiceRequest.intent` will be `order`
  - `ServiceRequest.requester` may be the Requesting Physician
  - `ServiceRequest.performer` may be the imaging center organization
- Note there are no Observations or Specimen with a radiology report

### Search Consideration

- Should search for entries that do **not** have `status=entered-in-error` (i.e., `&status:not=entered-in-error`)
- Should search for entries with category of Radiology to get only Radiology DiagnosticReport resources

> GET {path}/DiagnosticReport?patient={patient}&status:not=entered-in-error&category=http://loinc.org|LP29684-5
