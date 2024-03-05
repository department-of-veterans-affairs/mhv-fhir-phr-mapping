
- based on US-Core Condition Resource profile
- `subject` is a reference to this patient
- `identifier` will hold the record identifier from Vista
- a `clinicalStatus` of `active` | `inactive`
- `verificationStatus` only `confirmed` | `unconfirmed` | `entered-in-error`
- `category` will be `problem-list-item`
- `code` is the condition, problem or diagnosis
  - `code.text` will be the problem/condition
  - `code.coding` may be populated with an ICD-9 code
  - do not have any other codes available
- `recorder` the responsible provider/observer
- `note` may have notes
- `recordedDate` indicate date recorded on Vista
- `onsetDateTime` may hold the onsetDate
- `abatementDateTime` may hold the abatement date
- `recorder.extension[location]` may have hospital location / facility
- no other elements are populated

Should search for entries that do **not** have `verificationStatus=entered-in-error`
> GET {path}/Condition?patient={patient}&verification-status:not=entered-in-error
