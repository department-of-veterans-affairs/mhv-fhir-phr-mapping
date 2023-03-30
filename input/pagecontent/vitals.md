Vital Signs are recorded as Observation resource. Vital Signs are refined into the following profiles:

- Blood Pressure - no `.value[x]`, but has `.component`
- Pain - `.valueInteger`
- Those with units use `.valueQuantity` else `.valueString`

- [Vital-Signs](StructureDefinition-VA.MHV.PHR.vitals.html)
  - [Mapping from VDIF - VitalSignTO](StructureDefinition-VA.MHV.PHR.vitals-mappings.html#mappings-for-vdif-to-mhv-phr-vitalsignto)
  - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-ObservationTypeTOVsLoincCode.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitals-examples.html)
- Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
- Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)

Notes:

- The mock example maps best to VIA_v4.0.7_uat.wsdl.
  - BLOOD PRESSURE (SYSTOLIC BLOOD PRESSURE, DIASTOLIC BLOOD PRESSURE) = 26 (26, 26)
  - HEIGHT = 12
  - WEIGHT = 20
  - PULSE = 20
  - PAIN = 16
  - RESPIRATION = 9
  - TEMPERATURE = 18
- do not have examples for
  - ABDMONAL GIRTH
  - AUDIOMETRY
  - CENTRAL VENOUS PRESSURE
  - CIRCUMFERENCE%2FGIRTH
  - FETAL HEART TONES
  - FUNDAL HEIGHT
  - HEADCIRCUMFERENCE
  - HEARING
  - PULSE OXIMETRY
  - RESPIRATION
  - TONOMETRY
  - VISION CORRECTED
  - VISION UNCORRECTED
- Should be based on US-Core for Vital-Signs Observation Resource
- status of `final`
- category code of `vital-signs`
- code should be LOINC if available
  - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-ObservationTypeTOVsLoincCode.html)
  - note some of these codes are high confidence, many are not
- patient
- Not preserving the VitalSignTO.low and .high as they are referenceRange
- some examples had units, so I used `.valueQuantity`
  - all unknown value types I record using `.valueString`
  - some units are not proper UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- mock example didn't include these elements, so I don't map
  - type.shortName, type.dataId, type.dataName, or type.dataType
  - value2
  - facility
  - location
  - qualifiers, qualifierItems