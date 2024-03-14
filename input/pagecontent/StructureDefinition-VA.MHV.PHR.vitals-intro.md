
- based on US-Core Vital-Signs profile on Observation Resource
  - Blood-Pressure is based off of the Blood-Pressure profile
  - Pulse-Ox is based off of the Pulse-Oximitry profile
- Pain does not have a specific us-core profile to derive from, so is not derived from us-core
- `subject` is a reference to this patient
- `status` is `final` unless `entered-in-error`
- `category` code of `vital-signs`
- `code.text` the original vital-sign type name
  - `coding` may be LOINC if available
    - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-VF-VitalsCodes.html)
- value
  - Blood Pressure - no `.value[x]`, but has `.component` with values
  - Pain - `.valueInteger` - a score 0-10
  - Those with units use `.valueQuantity` else `.valueString`
- `effectiveDateTime` vital-sign timestamp of when observed
- `performer` may have contained recorder, and/or observer
  - may have an extension `alternate-reference` that points to a Location resource identifying the VAMC where the vital-sign was first recorded
- `identifier` will hold the record identifier from Vista

A search for vital-signs would limit the Observations to vital-signs by including the `category` search parameter (i.e. `&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs`).
Should search for entries that do **not** have `status=entered-in-error` (might also work to look for only `completed`) (i.e., `&status:not=entered-in-error`)
> GET {path}/Observation?patient={patient}&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&status:not=entered-in-error

### beyond MVP

The following is a future improvement beyond MVP. There are "qualifiers" in the vista data model with vital signs. They are a flat list of codes. I am working with KBS to figure out the right way to process them, but at this time that is not yet decided. The following is current thinking, but not likely final thinking.

- `.bodySite` may hold the bodySite from qualifiers
- `.extension[observation-bodyPosition]` may hold the bodyPosition from qualifiers
- `.method` may hold the method from qualifiers
- `.device` may hold the device from qualifiers
- `.component.code` may hold any other qualifiers, with no `.component.value[x]`
- no other elements are populated
