
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
  - note that va.gov has been directed to now show reaction. The reason is that this is not available in Vista for clinician use anymore.
- `status` will be `completed` for those we receive from VIA, those we no longer receive will be changed to `entered-in-error`
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
  - Thus we will be using [Update-and-Expunge](background.html#entered-in-error)
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

Note will NOT be using the SNOMED conversion as it is only partial and may not be perfect. So just using text.

#### Mapping Concerns

- codes for protocolApplied.series and translation of `series` to a code for protocolApplied -- TODO Leaf 62
  - not a priority as current text is sufficient for now.
- codes for reaction -- TODO Leaf 60
  - not a priority as current text is sufficient for now.
  - some of the codes can be mapped, but others are multiple things in an OR relationship

#### changes needed

- Historic (those immunizations not given at the VA) can be entered with partial dateTime. Common to not have a time, also not uncommon to only have a year. Current source-code converts these dates wrongly. Dates without time are converted to dates with a midnight time. Dates that are just the year are not recorded at all. The second issue is more critical as the va.gov UI doesn't show times. Both should be fixed. [DateUtilExt.java](https://github.com/department-of-veterans-affairs/mhv-np-phr-api-v2/blob/1d85f200f1c4253bb730718d7960804781dad30e/src/main/java/gov/va/med/mhv/integration/util/DateUtilExt.java)
  - MHV-52880
- The contained Location resource should have the meta.profile populated for consistency and validation
- If the reaction is "NONE", then we should record a contained Observation indicating no reaction.
  - 293104008 Adverse reaction to component of vaccine product
    - 2667000 Absent
    - 410516002 Known absent
- Implement  [Update-and-Expunge](background.html#entered-in-error) - immunizations no longer fed to with VIA need to have their `.status` changed to `#entered-in-error`
