
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
- any `reaction` is recorded as a contained `Observation`. This Observation is simply
  - status of final
  - code.text from ImmunizationTo.reaction
  - valueCodeableConcept of SNOMED#401515003 Known present
  - see [Immunization Reaction Profile of Observation](StructureDefinition-VA.MHV.PHR.immunizationReaction.html)
- `contraindicated` - '1' for Yes (do not repeat this vaccine), '0' for no (okay to use in the future)
  - KBS indicates that there is a very small fragment that have this set.
  - KBS discussion, we will follow the definition of the element.  Meaning we presume tha the immunization was given. This could be recorded as a FHIR Immunization with `.status=not-done`.
    - Thus we ignore this element.
  - Some in KBS discussion were pointing out that medically something 'contraindicated' would not be executed. But this understanding does not seem to align with recording an Immunization and indicating contraindicated, but would be recorded as a stopping of the order to give immunization.
- Not mapped due to lack of clarity on what the value is and if it will ever be populated
  - `shortName`
  - `encounterProvider`
  - `orderingProvider`
- Based on experimentation, VIA does not provide the following even if they are populated in vista
  - `site`
  - `lotNumber`
  - `administrator`
  - `orderedBy`
  - `manufacture`
- Updates
  - VIA hides deleted, or removed immunizations (proven with experimentation)
  - Thus we will be using [Wipe-and-replace hack](background.html#entered-in-error)
- `series` - series of the immunization type was given to the patient
  - see table below for how to set `.protocolApplied.series`
  - single character `series` into `.protocolApplied.doseNumberString`
  - note not using doseNumberPositiveInt as this element is removed in future versions of FHIR so it seems string is more future proof

**Table: `series`, VIA converts the series code to the string defined in Vista**

| code |  text |
|------|------|
| P | PARTIALLY COMPLETE |
| C | COMPLETE |
| B | BOOSTER |
| 1 | SERIES 1 |
| 2 | SERIES 2 |
| 3 | SERIES 3 |
| 4 | SERIES 4 |
| 5 | SERIES 5 |
| 6 | SERIES 6 |
| 7 | SERIES 7 |
| 8 | SERIES 8 |
{:.grid}

**Table: `reaction` VIA converts the reaction number found in Vista to the text string defined Vista:**

| num | text    | potential SNOMED |
|-----|---------|-----------------|
| 1 | FEVER | 38666106 |
| 2 | IRRITABILITY | 55929007 |
| 3 | LOCAL REACTION OR SWELLING |
| 4 | VOMITING | 422400008 |
| 5 | RASH OR ITCHING |
| 6 | LETHARGY | 214264003 |
| 7 | CONVULSIONS | 91175000 |
| 8 | ARTHRITIS OR ARTHRALGIAS |
| 9 | ANAPHYLAXIS OR COLLAPSE |
| 10 | RESPIRATORY DISTRESS | 271825005 |
| 11 | OTHER |
| 0 | NONE |
{:.grid}

#### Mapping Concerns

- codes for protocolApplied.series and translation of `series` to a code for protocolApplied -- TODO Leaf 62
  - not a priority as current text is sufficient for now.
- codes for reaction -- TODO Leaf 60
  - not a priority as current text is sufficient for now.
  - some of the codes can be mapped, but others are multiple things in an OR relationship
- need to learn how to enter an immunization without an order? --- works on one of our vista sites, not on another.
  -  TODO: Data has been entered, need to get copy

#### changes needed

currently working as expected
