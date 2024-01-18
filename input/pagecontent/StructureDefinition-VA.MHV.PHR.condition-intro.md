
- based on US-Core Condition Resource profile
- `subject` is a reference to this patient
- `identifier` will hold the record identifier from Vista
- a `clinicalStatus` of `active`
- `verificationStatus` only `confirmed` | `unconfirmed` | `entered-in-error`
- `category` will be `problem-list-item`
- `code` is the condition, problem or diagnosis
  - `code.coding` may be populated with an ICD-9 code
  - do not have any other codes available
- `recorder` the clinician
- `note` may have notes
- `recordedDate` indicate last modified date on Vista
- `onsetDateTime` will hold the onsetDate
- `abatementDateTime` may hold the abatement date
- `evidence.detail` may have hospital location detail
- no other elements are populated

Should search for entries that do **not** have `verificationStatus=entered-in-error`
> GET {path}/Condition?patient={patient}&verification-status:not!=entered-in-error
