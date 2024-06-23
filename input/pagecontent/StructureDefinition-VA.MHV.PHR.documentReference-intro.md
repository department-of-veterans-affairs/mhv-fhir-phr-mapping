
- based on US-Core documentReference Resource profile for clinical notes
- `category` will have `clinical-note`
  - `category` may have other values
    - ECG/EKG [Cardiology (LP29708-2)](https://loinc.org/LP29708-2)
- `type` indicates the specific type of document
  - `.text` the standard title
  - `.coding` code for broad type of document
    - [Consultation Note (11488-4)](https://loinc.org/11488-4/)
    - [Progress note (11506-3)](https://loinc.org/11506-3/)
    - [Discharge Summary (18842-5)](https://loinc.org/18842-5/)
    - [ECG/EKG (11524-6)](https://loinc.org/11524-6/)
- `subject` is a reference to this patient
- `status` is `current` or `entered-in-error`
- `identifier` will hold the record identifier from Vista
  - may hold case number
- `date` the report date/time (aka. Reference Date/Time)
- `author` the report author
  - In a Discharge Summary the `author` would have historically been known as the Discharge Physician
  - In a Discharge Summary historically the Admitting Physician is harvested from the content body from `ATTENDING:`
- `authenticator` may hold the approver of the report
- `authenticator.extension[when]` may hold the date/time approved
- `context.period` may hold the admit date/time and discharge date/time
- `context.related` may hold the location
- `context.encounter` may hold the encounter identifier
- `content.attachment.title` may be a local title for the report
- `content.attachment.creation` may be the report timestamp
- `content.attachment.contentType` will be `text/plain`
- `content.attachment.data` the report text in base64 encoding
  - Note that Cerner uses `content.attachment.url` that points at a FHIR Binary holding the text
- no other elements are populated

To search for clinical-notes, use the `category` parameter with `clinical-note` code (i.e., `&category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note`).
Should search for entries that do **not** have `status=entered-in-error` (might also work to look for only `current`) (i.e., `&status:not=entered-in-error`)
> GET {path}/DocumentReference?patient={patient}&status:not=entered-in-error&category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note
