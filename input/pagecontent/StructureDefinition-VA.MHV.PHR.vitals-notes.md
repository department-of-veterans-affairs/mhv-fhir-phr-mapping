- Mock Data samples
  - The [mock 1 example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/vitals.xml)
  - The [mock 2 example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/1013699421V762086_Vitals.xml)
- maps to [VitalSignTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [VitalSignTo](StructureDefinition-VA.MHV.PHR.vitals-mappings.html#mappings-for-via-to-mhv-fhir-phr-vitalsignto)
- [Vivian table 120.5](https://vivian.worldvista.org/dox/Global_XkdNUigxMjAuNQ==.html)
- [va.gov team requirements for vital-signs](https://github.com/department-of-veterans-affairs/va.gov-team/blob/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records/data-domains/vitals/vitals-brief.md)
  - note that this mixes labs and images with vital-signs
  - this also indicates some labs as vital-signs: Cholesterol, Blood Sugar, and INR
  - Note that Pulse-Ox is sometimes a vital-sign, such as when taken with a finger sensor by a nurse/doctor; but is also a lab result at times (10226-9 Intravascular Oxygen, etc...).
- based on [US-Core for Vital-Signs Observation Resource](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-vital-signs.html)
  - Blood-Pressure is based off of the Blood-Pressure profile
- should have `meta.profile` set to - JIRA
  - General Vital-Signs `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals`
  - Pain `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain`
  - Blood-Pressure `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP`
  - Pulse-Ox `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals-pulse-oximetry`
- `status` of `final` unless `entered-in-error`
- `category` code of `vital-signs`
- `code.text` the original `VitalSignTO.type.name`
  - `coding` should be LOINC if available
    - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-VF-VitalsCodes.html)
- must have `identifier` as cross reference to original source
- `subject` is the patient
- Not preserving the VitalSignTO.low and .high as they are referenceRange
- value
  - Blood Pressure - no `.value[x]`, but has `.component`
    - Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
      - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
  - Pain - `.valueQuantity`
    - Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
      - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)
      - rational for model, esp use of quantity - [LOINC 72514-3](https://loinc.org/72514-3/)
  - Those with units use `.valueQuantity` else `.valueString`
- value units
  - There is a units within the data, and it seems mostly to be the proper code from the proper code system UCUM
  - some units are not proper formal UCUM, so I had to fix `lb`, `F`, `cmH2O`, and `in` - [Utility UCUM](utility.html#ucum-code)
  - populate the valueQuantity.units with the value from VIA feed
  - populate the valueQuantity.code with corrected ucum code value
- populate `effectiveDateTime`
- populate `performer`
  - contained Location(`VitalSignTO.location`)
    - mock data is all 4 digit location.id values
  - contained Practitioner(`VitalSignTO.recorder`)
  - contained Practitioner(`VitalSignTO.observer`)
- timestamp is confirmed to be date taken
- Vital-Sign Type
  - Have a [ConceptMap VF_VitalCodes](ConceptMap-VF-VitalsCodes.html) to convert the Vista code for the vital type to LOINC code
  - MVP: Blood Pressure, Height, Weight, Pulse, Respiration, Temperature, and Pulse-OX
    - not pain, or CVP (or any other Vista defined vitals)
  - There are examples, all of which have been converted into
    - BLOOD PRESSURE (SYSTOLIC BLOOD PRESSURE, DIASTOLIC BLOOD PRESSURE) = 26 (26, 26)
    - HEIGHT = 12
    - WEIGHT = 20
    - PULSE = 20
    - PAIN = 16
    - RESPIRATION = 9
    - TEMPERATURE = 18
    - Have added examples of Pulse-OX
  - Where there is not specific profile conversion of value should be handled by the default value handling (Those with units use `.valueQuantity` else `.valueString`)
  - note that there was a wrong understanding that Cholesterol, Blood-Sugar, and INR were vital-signs. These are labs, not vital-signs.
- mock example didn't include these elements, so I don't map. and they have never been preserved in eVault MHV
  - type.shortName, type.dataId, type.dataName, or type.dataType
  - value2
  - facility
- comments has been saved in the past, but there is no way to enter a comment on a vital and no place in vista/fileman for a comment.
- Pulse-OX - supplemental oxygen concentration and rate are NOT sent to us in VIA. Thus we don't have these to convert.

Qualifiers are beyond current MHV eVault, so are not MVP. Given that KBS is still working on defining what should be done, we should not implement any use of qualifiers.

- qualifiers
  - lookup in following ConceptMap for:
    - `.bodySite` = [ConceptMap VF_VitalSite](ConceptMap-VF-VitalsSite.html)
    - `.extension[observation-deviceCode]` =  [ConceptMap VF_VitalDevice](ConceptMap-VF-VitalsDevice.html)
    - `.method` =  [ConceptMap VF_VitalMethod](ConceptMap-VF-VitalsMethod.html)
    - `.extension[observation-bodyPosition]` =  [ConceptMap VF_VitalPosition](ConceptMap-VF-VitalsPosition.html)
    - Can record 0..1; so if find more than one of these, place the other into .component
  - lookup in following ConceptMap and place into .component
    - [ConceptMap VF_VitalLaterality](ConceptMap-VF-VitalsSite.html)
    - [ConceptMap VF_VitalUnits](ConceptMap-VF-VitalsSite.html)
  - anything that does not match a concept map, place in .component
    - `component[=].code` either ConceptMap target code, or original VUID if none
    - no .component.value[x]
    - `component[=].dataAbsentReason` = `http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable`

#### Mapping Concerns

- Not clear how we learn of previously good vitals that should be changed and marked as entered-in-error
  - seems likely that VIA filters these out
- should we take the location (a location IEN) and figure out which site (Organization) manages that location (institution) so that we can have an Organization rather than just Location.  (CDW does this)
  - or should we do a lookup in MHV similar to what we did with allergies.
- testing of all the vista supported vitals beyond the MVP 8 should be done to assure that we can handle them without problem.

#### source-code review

august 21, 2023

- lines 214-229, seems to be prototype code that should be removed?
- lines 233-242, processing of identifier. I can't understand this code, but it does not seem to be putting the right pattern in.
  - we have no business identifier, so there should be no identifier until we come up with a plan
- line 244, sets status final, will eventually need this to follow the status of updates
- lines 247-254, (category) is wrong. `vital-signs` is not a loinc code it is `http://terminology.hl7.org/CodeSystem/observation-category`
- lines 256-268, (code) is wrong. This code seems to be looking at the input name, but then just assuming it is loinc unless the name happens to be "X". I guess that this switch statement was going to implement the [mapping table](ConceptMap-VF-VitalsCodes.html) that I provide, but did not.
  - Note that this mapping table could be implemented as a FHIR ConceptMap, and thus be dynamically improved without changes to the code.
  - should have the logic to determine if the type/id is a VUID
- line 270, This line seems to be consistent with allergy when the patient is new, but does not have the if statement tha allergy has.
- line 272-280, (effectiveDate), seems okay
- line 281-288, (recorder and observer), seems okay
- lines 289-295, (value), seems mostly okay for quantity, but should also handle string, blood pressure, and pain
  - for quantity, some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- lines 301-310, This is code to just throw a warning if we see data we did not have a map to. Should this code go to production, or be disabled in production? It might be useful to detect information we don't have a map for.
- line 312 has "DocumentReference" but surely this is wrong, I guess this should be "Observation"?

also:

- preserve location in an extension/contained
- the code should be defensive for anything beyond the 6 defined domains, such as a robust map anything else generally to valueString or valueQuantity
- code mapping may need to be confirmed that the code/map is doing what is defined here.
- need to implement solution for entered-in-error, Likely Update-and-Expunge, typical of VIA
- should to add support for qualifiers and their conversion to bodySite, deviceCode, method, and bodyPosition
- should add conversion of ucum to [fixed ucum codes](utility.html#ucum-code)
- Pain is now an valueInteger

#### TODO

there is KBS work on how to process the qualifiers. This work is not done, so no code change recommendation at this time.
