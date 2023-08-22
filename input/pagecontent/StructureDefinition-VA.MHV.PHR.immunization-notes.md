
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/MHV-PHR/blob/main/mocks/immunization.xml) 
- maps to [ImmunizationTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-via-to-mhv-phr-immunizationto)
- [Vivian Immunization](https://vivian.worldvista.org/dox/Global_XkFVUE5WSU1N.html)
- Derived off of US-Core Immunization
  - US-Core already requires: `status`, `vaccineCode`, `patient`, `occurrence[x]`, `primarySource`
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.immunization` to indicate the intent to be compliant with this profile
- must have `identifier` as cross reference to original source
- must be indicated this data are not official record (`primarySource`=false)
  - Given that the field is not used by UX, it does not matter what the value is
  - should change when US-Core 6+ allows the element to be empty
- any reaction is recorded as a contained `Observation`. This Observation is simply
  - status of final
  - code.text from ImmunizationTo.reaction
  - valueCodeableConcept of SNOMED#401515003 Known present
  - see [Immunization Reaction Profile of Observation](StructureDefinition-VA.MHV.PHR.immunizationReaction.html)
- `contraindicated` - '1' for Yes (do not repeat this vaccine), '0' for no (okay to use in the future)
  - when `contraindicated` is '1' then set `.reaction.detail.display` = `YES (DO NOT REPEAT THIS VACCINE)`
  - else .reaction is not populated
- `series` - series of the immunization type was given to the patient
  - see table below for how to set `.protocolApplied.series`
  - put the `series` into `.protocolApplied.doseNumberString`
  - note not using doseNumberPositiveInt as this element is removed in future versions of FHIR so it seems string is more future proof

| `series` |  FHIR `.protocolApplied.series` |
|--------|------|
| 'P' | PARTIALLY COMPLETE |
| 'C' | COMPLETE |
| 'B' | BOOSTER |
| '1' | SERIES 1 |
| '2' | SERIES 2 |
| '3' | SERIES 3 |
| '4' | SERIES 4 |
| '5' | SERIES 5 |
| '6' | SERIES 6 |
| '7' | SERIES 7 |
| '8' | SERIES 8 |
  
#### Mapping Concerns

- Updates must be supported somehow. Fixing the status at completed will only work if data never changes.
- Not mapped due to lack of clarity on what the value is and if it will ever be populated
  - `shortName`
  - `encounterProvider`
  - `orderingProvider`

#### change 2023-07-20

- defined the specifics of the Contained Observation for the reaction
- added `series` handling
- added `contraindicated` handling

##### code inspection concerns

didn't find the following implemented

- recorded
- performer
- site
- lotNumber
- doseNumberString
- manufacture
- primarySource
- recorded
- should set the .meta.profile to the profile so that automatic validation can be done

did find

- occurrenceDateTime
- vaccineCode.text (name)
- vaccineCode.coding (ICD)
- location
- note.text
- identifier (OID+'.4.349', stationNumber + '.' + id)
  - need to fix
- status=completed
- patient
- reaction.detail
- occurrenceDateTime

should handle Organization and Location the same way everywhere.

- Should this be just .display, .identifier, contained .reference, or reference to a server managed resource?
- Looks like .location is implemented as a reference, logical id?

