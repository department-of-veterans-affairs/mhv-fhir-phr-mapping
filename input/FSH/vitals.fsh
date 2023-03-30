


Profile:        MHVvitals
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
//Parent: Observation
Id:             VA.MHV.PHR.vitals
Title:          "VA MHV PHR Vital-Signs"
Description:    """
A profile on the Observation resource for MHV PHR exposing Vital-Signs using FHIR API.

- The mock example maps best to VIA_v4.0.7_uat.wsdl. 
  - BLOOD PRESSURE (SYSTOLIC BLOOD PRESSURE, DIASTOLIC BLOOD PRESSURE) = 26 (26, 26)
  - HEIGHT = 12
  - WEIGHT = 20
  - PULSE = 20
  - PAIN = 16
  - RESPIRATION = 9
  - TEMPERATURE = 18
- Should be based on US-Core for Vital-Signs Observation Resource
- status of `final`
- category code of `vital-signs`
- code should be LOINC if available, but sample code is just strings
- patient
- Not preserving the VitalSignTO.low and .high as they are referenceRange
- Blood Pressure in the mock examples is triple recorded: First with both values, Second with just Systolic, Third with Diastolic. There only seems to be a nearness relationship. Note that only the first one has a type.id. So I recommend we use only the first, and split the values out. Note no pulse is recorded.
- mock example didn't include, so I don't map
  - type.shortName, type.dataId, type.dataName, or type.dataType
  - value2
  - comments
  - recorder
  - observer
  - facility
  - location
  - qualifiers, qualifierItems
- FETAL HEART TONES, HEARING, VISION CORRECTED, VISION UNCORRECTED - This is in theory in the VitalSignTO data, but I have no example and no clear mapping to loinc
  - for these and anything else that does not match known map, will simply map strings with no attempt at codes or units

TODO:
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`VitalSignTO` | `.` | {VitalSignTO.id}"
* status = #final
* code.text MS
* code.coding MS


Mapping: Vitals-Mapping
Source:	MHVvitals
Target: "VitalSignTO"
Title: "VDIF to MHV-PHR"
* -> "VitalSignTO" "MHV PHR FHIR API"
* status -> "`final`"
* category -> "`vital-signs`"
* code -> "VitalSignTO.type.name convert to LOINC using ObservationTypeTOVsLoincCode"
* subject -> "patient"
* effectiveDateTime -> "VitalSignTO.timestamp"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "VitalSignTO.recorder and VitalSignTO.observer"
* note.text -> "VitalSignTO.comments"



/* 
  <xs:complexType name="vitalSignTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="type" type="tns:observationTypeTO"/>
          <xs:element form="unqualified" minOccurs="0" name="value1" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="value2" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="low" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="high" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="observer" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="recorder" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="location" type="tns:hospitalLocationTO"/>
          <xs:element form="unqualified" minOccurs="0" name="comment" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="units" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="qualifiers" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="qualifierItems">
            <xs:complexType>
              <xs:sequence>
                <xs:element form="unqualified" maxOccurs="unbounded" minOccurs="0" name="qualifier" type="tns:qualifierTO"/>
              </xs:sequence>
            </xs:complexType>
          </xs:element>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="qualifierTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="observationTypeTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="category" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="shortName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataType" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/


Instance:   ObservationTypeTOVsLoincCode
InstanceOf: ConceptMap
Title:      "Vital Sign ObservationTypeTO.name to Loinc Code"
Description: "map between Vital Sign ObservationTypeTO.name string and LOINC code."
Usage: #definition
* url = "https://johnmoehrke.github.io/MHV-PHR/ConceptMap/ObservationTypeTOVsLoincCode"
* name =  "ObservationTypeTOVsLoincCode"
* title = "Vital Sign ObservationTypeTO.name to Loinc Code"
* experimental = false
* status = #active
* date = 2023-03-29
* publisher = "John Moehrke (himself)"
* description = "map between Vital Sign ObservationTypeTO.name string and LOINC code."
* purpose = "To be able to use proper LOINC code in the FHIR Observation"
* group.source = "http://service.via.med.va.gov/ObservationTypeTO"
* group.target = LOINC
* group.element[+].code = #"ABDMONAL GIRTH"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.code = #LP31969-6
* group.element[=].target.display = "Abdominal circumference"
* group.element[=].target.comment = "seems like possible match"
* group.element[+].code = #AUDIOMETRY
* group.element[=].target.equivalence = #wider
* group.element[=].target.code = #89015-2
* group.element[=].target.display = "Pure tone threshold audiometry panel"
* group.element[=].target.comment = "seems like possible match"
* group.element[+].code = #"BLOOD PRESSURE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #85354-9
* group.element[=].target.display = "Blood pressure panel with all children optional"
* group.element[+].code = #TEMPERATURE
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8310-5
* group.element[=].target.display = "Body temperature"
* group.element[+].code = #"CENTRAL VENOUS PRESSURE"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.code = #8591-0
* group.element[=].target.display = "Central venous pressure (CVP) Mean"
* group.element[=].target.comment = "seems like possible match"
* group.element[+].code = #CIRCUMFERENCE%2FGIRTH
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.code = #56086-2
* group.element[=].target.display = "Adult Waist Circumference Protocol"
* group.element[=].target.comment = "seems like possible match"
* group.element[+].code = #"FETAL HEART TONES"
* group.element[=].target.equivalence = #inexact
* group.element[=].target.code = #55283-6
* group.element[=].target.display = "Fetal Heart rate"
* group.element[=].target.comment = "Not likely correct as tones vs rate"
* group.element[+].code = #"FUNDAL HEIGHT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #11881-0
* group.element[=].target.display = "Uterus Fundal height Tape measure"
* group.element[+].code = #"HEADCIRCUMFERENCE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #9843-4
* group.element[=].target.display = "Head Occipital-frontal circumference"
* group.element[+].code = #HEARING
* group.element[=].target.equivalence = #inexact
* group.element[=].target.code = #58232-0
* group.element[=].target.display = "Hearing loss risk indicators [Identifier]"
* group.element[=].target.comment = "Not clear if this is Hearing Loss"
* group.element[+].code = #HEIGHT
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8302-2
* group.element[=].target.display = "Body height"
* group.element[+].code = #PAIN
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #72514-3
* group.element[=].target.display = "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* group.element[+].code = #"PULSE OXIMETRY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #2708-6
* group.element[=].target.display = "Oxygen saturation in Arterial blood"
* group.element[+].code = #PULSE
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8867-4
* group.element[=].target.display = "Heart rate"
* group.element[+].code = #RESPIRATION
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #9279-1
* group.element[=].target.display = "Respiratory Rate"
* group.element[+].code = #TONOMETRY
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.code = #LP76227-5
* group.element[=].target.display = "Tonometry"
* group.element[=].target.comment = "seems like possible match"
* group.element[+].code = #"VISION CORRECTED"
* group.element[=].target.equivalence = #unmatched
* group.element[=].target.code = #unknown
* group.element[=].target.display = "unknown"
* group.element[=].target.comment = "no clear match"
* group.element[+].code = #"VISION UNCORRECTED"
* group.element[=].target.equivalence = #unmatched
* group.element[=].target.code = #unknown
* group.element[=].target.display = "unknown"
* group.element[=].target.comment = "no clear match"
* group.element[+].code = #WEIGHT
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #29463-7
* group.element[=].target.display = "Body weight"

