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
      - rational for model, esp use of quantity - [LOINC 72514-3](https://loinc.org/72514-3/)
  - Those with units use `.valueQuantity` else `.valueString`
- value units
  - There is a units within the data, and it seems mostly to be the proper code from the proper code system UCUM
  - some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
  - populate the valueQuantity.units with the value from VIA feed
  - populate the valueQuantity.code with corrected ucum code value
- populate `effectiveDateTime`
- populate `performer`
  - contained Location(`VitalSignTO.location`)
    - mock data is all 4 digit location.id values
  - contained Practitioner(`VitalSignTO.recorder`)
  - contained Practitioner(`VitalSignTO.observer`)
- timestamp is confirmed to be date taken
- There are examples, all of which have been converted into 
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
- the `VitalSignTO.comments` has no source in Visa, so even if something comes on the VIA feed we should drop it.

#### Mapping Concerns

- Not clear how we learn of previously good vitals that should be changed and marked as entered-in-error
  - seems likely that VIA filters these out
- QUALIFIER (5) was preserved by eVault PHR. Not clear what it is. Not clear where this comes from in VIA
- SUPPLEMENTAL_O2 (1.4) is preserved by eVault PHR. Not clear what this is.
- should we take the location (a location IEN) and figure out which site (Organization) manages that location (institution) so that we can have an Organization rather than just Location.  (CDW does this)
  - or should we do a lookup in MHV similar to what we did with allergies.
- should really have bodySite, device, method; but these don't come to us in VIA
- should likely have a pulse-OX, but don't have this currently and it is not clear this will come in VIA
  - Can enter it, so need to see what it looks like in VIA
- is there a known set of *ucum* codes that we might see and the translation to formal `ucum` code?

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

also:

- preserve location in an extension/contained
- the code should be defensive for anything beyond the 6 defined domains, such as a robust map anything else generally to valueString or valueQuantity
- code mapping may need to be confirmed that the code/map is doing what is defined here.
- need to implement solution for entered-in-error, which might be hack #1 that deletes current before refreshing with VIA data.

#### Business

TODO: 
- PulseOX is needed. We need examples as no current data has pulseOX. Not clear that MHV evault PHR supported this.
  - can and have now pulseOx data in our vista. Need to see it in VIA
- is CVP (Central Venous Pressure) needed?
- Need examples for Blood Sugar, Cholesterol, and INR

