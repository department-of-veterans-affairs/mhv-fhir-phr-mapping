
- based on US-Core for AllergyIntolerance Resource profile
- `patient` is a reference to this patient
- a `clinicalStatus` is `active` when not entered-in-error
- a `verificationStatus` may be `entered-in-error`
- a `code.text` which tells you what the patient is allergic to
- `category` only `medication`, `food`, and/or `environment`
- `identifier` will hold the record identifier from Vista
- `recordedDate` may hold the observed time
- extension[observedHistoric] will hold observed vs historical
- `recorder` may have an extension `alternate-reference` that points to an Organization resource identifying the VAMC where the allergy was first recorded
  - the Organization.name is a friendly name populated from MHV internal table
- `reaction.manifestation` may have `.text`
  - may have `.coding.code` but no system is known
- `note.text` will hold comments
  - `note.time` will hold the date of the comment
- no other elements are populated

Should search for entries that do **not** have `verificationStatus=entered-in-error` (might also work to look for only `active`)
> GET {path}/AllergyIntolerance?patient={patient}&verification-status:not!=entered-in-error
