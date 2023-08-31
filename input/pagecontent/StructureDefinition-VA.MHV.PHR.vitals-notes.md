- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/vitals.xml) 
- maps to [VitalSignTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [VitalSignTo](StructureDefinition-VA.MHV.PHR.vitals-mappings.html#mappings-for-via-to-mhv-fhir-phr-vitalsignto)
- [Vivian table 120.5](https://vivian.worldvista.org/dox/Global_XkdNUigxMjAuNQ==.html)
- based on US-Core for Vital-Signs Observation Resource
  - Blood-Pressure is based off of the Blood-Pressure profile
- should have `meta.profile` set to - JIRA
  - General Vital-Signs `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals`
  - Pain `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain`
  - Blood-Pressure `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP`
- `status` of `final`
- `category` code of `vital-signs`
- `code.text` the original `VitalSignTO.type.name`
  - `coding` should be LOINC if available
    - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-ObservationTypeTOVsLoincCode.html)
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
  - Those with units use `.valueQuantity` else `.valueString`
- value units
  - There is a units within the data, and it seems mostly to be the proper code from the proper code system UCUM
  - some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- populate `effectiveDateTime`, and `note.text` as mapped
- populate `performer`
  - contained Location(`VitalSignTO.location`)
    - mock data is all 4 digit location.id values
  - contained Practitioner(`VitalSignTO.recorder`)
  - contained Practitioner(`VitalSignTO.observer`)
- timestamp is confirmed to be date taken
- Most [examples are within a Bundle](Bundle-vitals.html), which does not exposed each vital sign.
- There are examples, all of which have been converted into [FHIR resources](Bundle-vitals.html)
  - BLOOD PRESSURE (SYSTOLIC BLOOD PRESSURE, DIASTOLIC BLOOD PRESSURE) = 26 (26, 26)
  - HEIGHT = 12
  - WEIGHT = 20
  - PULSE = 20
  - PAIN = 16
  - RESPIRATION = 9
  - TEMPERATURE = 18
  - do not have examples for the others the MHV code indicates might be available. These are in the concept map, and should be handled by the default value handling (Those with units use `.valueQuantity` else `.valueString`)
- mock example didn't include these elements, so I don't map
  - type.shortName, type.dataId, type.dataName, or type.dataType
  - value2
  - facility
  - qualifiers, qualifierItems
  
#### Mapping Concerns

- Not clear how we learn of previously good vitals that should be changed and marked as entered-in-error
  - seems likely that VIA filters these out
- QUALIFIER (5) was preserved by eVault PHR. Not clear what it is. Not clear where this comes from in VIA
- SUPPLEMENTAL_O2 (1.4) is preserved by eVault PHR. Not clear what this is.


#### code review

august 21, 2023

- lines 214-229, seems to be prototype code that should be removed?
- lines 233-242, processing of identifier. I can't understand this code, but it does not seem to be putting the right pattern in.
  - we have no business identifier, so there should be no identifier until we come up with a plan
- line 244, sets status final, will eventually need this to follow the status of updates
- lines 247-254, (category) is wrong. `vital-signs` is not a loinc code it is `http://terminology.hl7.org/CodeSystem/observation-category`
- lines 256-268, (code) is wrong. This code seems to be looking at the input name, but then just assuming it is loinc unless the name happens to be "X". I guess that this switch statement was going to implement the [mapping table](ConceptMap-ObservationTypeTOVsLoincCode.html) that I provide, but did not.
  - Note that this mapping table could be implemented as a FHIR ConceptMap, and thus be dynamically improved without changes to the code.
  - should have the logic to determine if the type/id is a VUID
- line 270, This line seems to be consistent with allergy when the patient is new, but does not have the if statement tha allergy has.
- line 272-280, (effectiveDate), seems okay
- line 281-288, (recorder and observer), seems okay
- lines 289-295, (value), seems mostly okay for quantity, but should also handle string, blood pressure, and pain
  - for quantity, some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- lines 301-310, This is code to just throw a warning if we see data we did not have a map to. Should this code go to production, or be disabled in production? It might be useful to detect information we don't have a map for.
- line 312 has "DocumentReference" but surely this is wrong, I guess this should be "Observation"?

- preserve location

