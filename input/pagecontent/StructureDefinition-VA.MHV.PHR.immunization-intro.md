
- based on US-Core Immunization Resource profile
  - US-Core already requires: `status`, `vaccineCode`, `patient`, `occurrence[x]`, `primarySource`
- `patient` is a reference to this patient
- `status` is `completed` or `entered-in-error`
- `primarySource` is not populated as it is unknown
- `identifier` will hold the record identifier from Vista
- `vaccineCode.text` and
  - `vaccineCode.coding` may be a CPT coding
  - do not have any other codes available
- `note.text` may have comments
- `reaction.detail` may be a contained Observation with reaction detail
- `occurrenceDateTime` when the immunization given
- `recorded` may be the date/time the immunization was recorded
- `performer.actor` may be a Practitioner administering (AP) the immunization
- `performer.actor` may be an Organization for the VAMC
- `protocolApplied.series` may be derived from the series
- `protocolApplied.doseNumberString` may be the series
- `location` may be the location where the immunization was given
- if an immunization is removed (e.g. entered-in-error) it will no longer be returned on the API
- no other elements are populated

Should search for entries that do **not** have `status=entered-in-error` (might also work to look for only `completed`)
> GET {path}/Immunization?patient={patient}&status:not!=entered-in-error
