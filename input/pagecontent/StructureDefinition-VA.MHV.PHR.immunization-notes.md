
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/immunization.xml) 
- maps to [ImmunizationTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-via-to-mhv-fhir-phr-immunizationto)
- [Vivian Immunization](https://vivian.worldvista.org/dox/Global_XkFVUE5WSU1N.html)
- Derived off of US-Core Immunization
  - US-Core already requires: `status`, `vaccineCode`, `patient`, `occurrence[x]`, `primarySource`
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.immunization` to indicate the intent to be compliant with this profile
- must have `identifier` as cross reference to original source
- US-Core requires that this be populated, but we don't get this details
  - Given that the field is not used by UX, it does not matter what the value is
  - do not populate, but add to the element the Data Absent Reason extension
- any reaction is recorded as a contained `Observation`. This Observation is simply
  - status of final
  - code.text from ImmunizationTo.reaction
  - valueCodeableConcept of SNOMED#401515003 Known present
  - see [Immunization Reaction Profile of Observation](StructureDefinition-VA.MHV.PHR.immunizationReaction.html)
- `contraindicated` - '1' for Yes (do not repeat this vaccine), '0' for no (okay to use in the future)
  - no clear place to record this in FHIR and no need for the data, so do not preserve
- `series` - series of the immunization type was given to the patient
  - see table below for how to set `.protocolApplied.series`
  - put the `series` into `.protocolApplied.doseNumberString`
  - note not using doseNumberPositiveInt as this element is removed in future versions of FHIR so it seems string is more future proof
- Not mapped due to lack of clarity on what the value is and if it will ever be populated
  - `shortName`
  - `encounterProvider`
  - `orderingProvider`

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

#### change 2023-07-20

- defined the specifics of the Contained Observation for the reaction
- added `series` handling

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

need to fix

- identifier (OID+'.4.349', stationNumber + '.' + id)
- add series -> protocolApplied.series

#### change 2023-09-22 

- do NOT populate primarySource (previously were setting this to false), 
  - add extension on primarySource so that can indicate Data-Absent-Reason of unknown (given that us-core requires this be populated)
- do not preserve contraindicated
