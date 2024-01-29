
Profile:        MHVvitals
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
//Parent: Observation
Id:             VA.MHV.PHR.vitals
Title:          "VA MHV PHR Vital-Signs"
Description:    """
A profile on the Observation resource for MHV PHR exposing Vital-Signs using FHIR API.
"""
* ^extension[$fmm].valueInteger = 4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`VitalSignTO` | `.` | {VitalSignTO.type.id}"
* status MS
* status ^short = "May indicate entered-in-error"
//* status = #final
* category MS
* code.text MS
* code.coding MS
* subject 1..1
* effectiveDateTime 1..1
* performer MS
* performer ^type.aggregation = #contained
* performer.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named site 0..1
* performer.extension[site].valueReference only Reference(Location)
* performer.extension[site].valueReference ^type.aggregation = #contained
* value[x] MS
* dataAbsentReason MS
/* could do this if there was a list of codes, but no list of codes available
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains @default 0..*
* component[@default].dataAbsentReason 1..1
* component[@default].value[x] 0..0
*/
* bodySite MS 
* extension contains http://hl7.org/fhir/StructureDefinition/observation-bodyPosition named bodyPosition 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/observation-deviceCode named deviceCode 0..1
* method MS

* device 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* interpretation 0..0
* specimen 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* note 0..0 

Mapping: Vitals-Mapping
Source:	MHVvitals
Target: "VitalSignTO"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "VitalSignTO"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name" "VITAL_TYPE - 120.5-.03 VITAL TYPE"
* code.coding -> "VitalSignTO.type.name convert to LOINC using VF_VitalsCodes"
* subject -> "patient" "PATIENT - 120.5-.02 PATIENT"
* effectiveDateTime -> "VitalSignTO.timestamp" "DATE_TIME_TAKEN - 120.5-.01 Date/Time Vitals Taken"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units" "MEASUREMENT - 120.5-.1.2 RATE"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "contained VitalSignTO.recorder" "120.5-.06 ENTERED BY"
* performer -> "contained VitalSignTO.observer" ""
* performer.extension[site] -> "Location(VitalSignTO.location)" "120.5-.05 HOSPITAL LOCATION"
* component.code -> "all non matched Qualifier" "120.5 QUALIFIER"
* bodySite -> "VF_VitalsSite(Qualifier)" "120.5 QUALIFIER"
* extension[bodyPosition] -> "VF_VitalsPosition(Qualifier)" "120.5 QUALIFIER"
* method -> "VF_VitalsMethod(Qualifier)" "120.5 QUALIFIER"
* extension[deviceCode] -> "VF_VitalsDevice(Qualifier)" "120.5 QUALIFIER"
// Laterality
// Position
//* note.text -> "VitalSignTO.comments" ""

Mapping: Vitals-Old-Mapping
Source:	MHVvitals
Target: "VitalSignTO"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map to include only the elements available in eVault PHR"
* -> "VitalSignTO" "eVault"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name" "VITAL_TYPE - 120.5-.03 VITAL TYPE"
* subject -> "patient" "patient - 120.5-.02 Patient"
* effectiveDateTime -> "VitalSignTO.timestamp" "DATE_TIME_TAKEN - 120.5-.01 Date/Time Vitals Taken"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units" "MEASUREMENT - 120.5-.1.2 RATE"




Profile:        MHVvitalsPain
Parent: Observation
//Parent:         VA.MHV.PHR.vitals
Id:             VA.MHV.PHR.vitalsPain
Title:          "VA MHV PHR Vital-Signs for PAIN"
Description:    """
A profile on the Observation resource for Pain

Not drived from us-core vitals, us-core does not have Pain and forbids valueInteger. 
"""
// note must use Quantity as we want to derive off of us-core, but us-core does not include Pain.
// alternative is to use Integer, and write the profile ourself.

* ^extension[$fmm].valueInteger = 4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`VitalSignTO` | `.` | {VitalSignTO.type.id}"
* status MS
* status ^short = "May indicate entered-in-error"
//* status = #final
* category MS
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains VSCat 1..1
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.text MS
* code.coding MS
* code.coding 1..
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains pain 1..1
* code.coding[pain] = LOINC#72514-3
* subject 1..1
* effectiveDateTime 1..1
* performer MS
* performer ^type.aggregation = #contained
* performer.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named site 0..1
* performer.extension[site].valueReference only Reference(Location)
* performer.extension[site].valueReference ^type.aggregation = #contained
* value[x] MS
* value[x] only integer
* valueInteger.value ^minValueInteger = 0
* valueInteger.value ^maxValueInteger = 10
* dataAbsentReason MS
/* could do this if there was a list of codes, but no list of codes available
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains @default 0..*
* component[@default].dataAbsentReason 1..1
* component[@default].value[x] 0..0
*/
* bodySite MS 
* extension contains http://hl7.org/fhir/StructureDefinition/observation-bodyPosition named bodyPosition 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/observation-deviceCode named deviceCode 0..1
* method MS

* device 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* interpretation 0..0
* specimen 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* note 0..0 


Mapping: VitalsPain-Mapping
Source:	MHVvitalsPain
Target: "MHVvitalsPain"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "VitalSignTO Pain"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name"
* code.coding -> "LOINC 72514-3"
* subject -> "patient"
* effectiveDateTime -> "VitalSignTO.timestamp"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "VitalSignTO.recorder and VitalSignTO.observer"
* performer.extension[site] -> "Location(VitalSignTO.location)"
* component.code -> "all non matched Qualifier" "120.5 QUALIFIER"
* bodySite -> "VF_VitalsSite(Qualifier)" "120.5 QUALIFIER"
* extension[bodyPosition] -> "VF_VitalsPosition(Qualifier)" "120.5 QUALIFIER"
* method -> "VF_VitalsMethod(Qualifier)" "120.5 QUALIFIER"
* extension[deviceCode] -> "VF_VitalsDevice(Qualifier)" "120.5 QUALIFIER"





Profile:        MHVvitalsOx
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry
//Parent: Observation
Id:             VA.MHV.PHR.vitalsOx
Title:          "VA MHV PHR Pulse Oximetry Vital-Signs"
Description:    """
A profile on the Observation resource for MHV PHR exposing Pluse Oximetry Vital-Signs using FHIR API.

Note that VIA does not provide us the supplemental O2 concentration or flowrate
"""
* ^extension[$fmm].valueInteger = 4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`VitalSignTO` | `.` | {VitalSignTO.type.id}"
* status MS
* status ^short = "May indicate entered-in-error"
//* status = #final
* category MS
* code.text MS
* code.coding MS
* subject 1..1
* effectiveDateTime 1..1
* performer MS
* performer ^type.aggregation = #contained
* performer.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named site 0..1
* performer.extension[site].valueReference only Reference(Location)
* performer.extension[site].valueReference ^type.aggregation = #contained
* value[x] MS
* dataAbsentReason MS
* component[FlowRate] 0..0
* component[Concentration] 0..0
/* could do this if there was a list of codes, but no list of codes available
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains @default 0..*
* component[@default].dataAbsentReason 1..1
* component[@default].value[x] 0..0
*/
* bodySite MS 
* extension contains http://hl7.org/fhir/StructureDefinition/observation-bodyPosition named bodyPosition 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/observation-deviceCode named deviceCode 0..1
* method MS

* device 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* interpretation 0..0
* specimen 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* note 0..0 

Mapping: VitalsOx-Mapping
Source:	MHVvitalsOx
Target: "VitalSignTO"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "VitalSignTO"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name" "VITAL_TYPE - 120.5-.03 VITAL TYPE"
* code.coding[PulseOx] -> "LOINC 59408-5"
* code.coding[O2Sat] -> "LOINC 2708-6"
* subject -> "patient" "PATIENT - 120.5-.02 PATIENT"
* effectiveDateTime -> "VitalSignTO.timestamp" "DATE_TIME_TAKEN - 120.5-.01 Date/Time Vitals Taken"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units" "MEASUREMENT - 120.5-.1.2 RATE"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "contained VitalSignTO.recorder" "120.5-.06 ENTERED BY"
* performer -> "contained VitalSignTO.observer" ""
* performer.extension[site] -> "Location(VitalSignTO.location)" "120.5-.05 HOSPITAL LOCATION"
* component.code -> "Qualifier" "120.5 QUALIFIER"
* component.code -> "all non matched Qualifier" "120.5 QUALIFIER"
* bodySite -> "VF_VitalsSite(Qualifier)" "120.5 QUALIFIER"
* extension[bodyPosition] -> "VF_VitalsPosition(Qualifier)" "120.5 QUALIFIER"
* method -> "VF_VitalsMethod(Qualifier)" "120.5 QUALIFIER"
* extension[deviceCode] -> "VF_VitalsDevice(Qualifier)" "120.5 QUALIFIER"

Mapping: VitalsOx-Old-Mapping
Source:	MHVvitalsOx
Target: "VitalSignTO"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map to include only the elements available in eVault PHR"
* -> "VitalSignTO" "eVault"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name" "VITAL_TYPE - 120.5-.03 VITAL TYPE"
* code.coding[PulseOx] -> "LOINC 59408-5"
* code.coding[O2Sat] -> "LOINC 2708-6"
* subject -> "patient" "patient - 120.5-.02 Patient"
* effectiveDateTime -> "VitalSignTO.timestamp" "DATE_TIME_TAKEN - 120.5-.01 Date/Time Vitals Taken"
* value[x] -> "VitalSignTO.value1 and VitalSignTO.units" "MEASUREMENT - 120.5-.1.2 RATE"







Profile:        MHVvitalsBP
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure
//Parent: Observation
Id:             VA.MHV.PHR.vitalsBP
Title:          "VA MHV PHR Vital-Signs for Blood Pressure"
Description:    """
A profile on the Observation resource for Blood Pressure
"""
* ^extension[$fmm].valueInteger = 4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`VitalSignTO` | `.` | {VitalSignTO.type.id}"
* status MS
* status ^short = "May indicate entered-in-error"
//* status = #final
* category MS
* code.text MS
* code.coding MS
* subject 1..1
* effectiveDateTime 1..1
* performer MS
* performer ^type.aggregation = #contained
* performer.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named site 0..1
* performer.extension[site].valueReference only Reference(Location)
* performer.extension[site].valueReference ^type.aggregation = #contained
* note 0..0 
* dataAbsentReason MS
/*
* component contains @default 0..*
* component[@default].code 1..1
* component[@default].code.coding 1..1
* component[@default].code.coding.system 1..1
* component[@default].code.coding.code 1..1
* component[@default].dataAbsentReason 1..1
* component[@default].value[x] 0..0
* component ^slicing.rules = #closed
*/
* bodySite MS 
* extension contains http://hl7.org/fhir/StructureDefinition/observation-bodyPosition named bodyPosition 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/observation-deviceCode named deviceCode 0..1
* method MS

* device 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* interpretation 0..0
* specimen 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* value[x] 0..0
// leveraging that US-Core has already defined the component

Mapping: VitalsBP-Mapping
Source:	MHVvitalsBP
Target: "MHVvitalsBP"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "VitalSignTO BP"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name"
* code.coding -> "LOINC 8480-6"
* subject -> "patient"
* effectiveDateTime -> "VitalSignTO.timestamp"
* component[systolic] -> "For BP is used for value1 parsed out to systolic and diastolic"
* component[diastolic] -> "For BP is used for value1 parsed out to systolic and diastolic"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "VitalSignTO.recorder and VitalSignTO.observer"
* performer.extension[site] -> "Organization(VitalSignTO.location)"
* component.code -> "Qualifier" "120.5 QUALIFIER"
* component.code -> "all non matched Qualifier" "120.5 QUALIFIER"
* bodySite -> "VF_VitalsSite(Qualifier)" "120.5 QUALIFIER"
* extension[bodyPosition] -> "VF_VitalsPosition(Qualifier)" "120.5 QUALIFIER"
* method -> "VF_VitalsMethod(Qualifier)" "120.5 QUALIFIER"
* extension[deviceCode] -> "VF_VitalsDevice(Qualifier)" "120.5 QUALIFIER"


Mapping: VitalsBP-Old-Mapping
Source:	MHVvitalsBP
Target: "VitalSignTO"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map to include only the elements available in eVault PHR"
* -> "VitalSignTO BP" "eVault"
* status -> "`final` if not `entered-in-error`"
* category -> "`vital-signs`"
* code.text -> "VitalSignTO.type.name"
* subject -> "patient"
* effectiveDateTime -> "VitalSignTO.timestamp"
* component[systolic] -> "For BP is used for value1 parsed out to systolic and diastolic"
* component[diastolic] -> "For BP is used for value1 parsed out to systolic and diastolic"
* identifier -> "{StationNbr} and {VitalSignTO.type.id}"
* performer -> "VitalSignTO.recorder and VitalSignTO.observer"
* performer.extension[site] -> "Organization(VitalSignTO.location)"



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

Instance:   VF-VitalsCodes
InstanceOf: ConceptMap
Title:      "Map between Vital Sign ObservationTypeTO.name to Loinc Code"
Description: "Map between VitalSignTO.type(ObservationTypeTO.name) VUID/string and LOINC code."
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsCodes"
* name =  "VF_VitalsCodes"
* title = "Vital Sign ObservationTypeTO.name to Loinc Code"
* experimental = false
* status = #active
* date = 2023-10-05
* publisher = "VA KBS"
* description = "Map between VitalSignTO.type(ObservationTypeTO.name) VUID/string and LOINC code."
* purpose = "VF_VitalsCodes"
* group.source = VUID
* group.target = LOINC
* group.element[+].code = #4688718 
* group.element[=].display = "AUDIOMETRY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #28615-3
* group.element[=].target.display = "Audiology study"
* group.element[+].code = #4500634 
* group.element[=].display = "BLOOD PRESSURE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #85354-9
* group.element[=].target.display = "Blood pressure panel with all children optional"
* group.element[+].code = #4500638 
* group.element[=].display = "TEMPERATURE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8310-5
* group.element[=].target.display = "Body temperature"
* group.element[+].code = #4688719 
* group.element[=].display = "CENTRAL VENOUS PRESSURE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8591-0
* group.element[=].target.display = "Central venous pressure (CVP) Mean"
* group.element[+].code = #4688720 
* group.element[=].display = "CIRCUMFERENCE%2FGIRTH"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #9844-2
* group.element[=].target.display = "Body region Circumference"
* group.element[+].code = #4688721 
* group.element[=].display = "FETAL HEART TONES"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #11616-0
* group.element[=].target.display = "Fetal Heart Narrative Activity US"
* group.element[+].code = #4688722 
* group.element[=].display = "FUNDAL HEIGHT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #11881-0
* group.element[=].target.display = "Uterus Fundal height Tape measure"
* group.element[+].code = #4688723
* group.element[=].display = "HEARING"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #32437-6
* group.element[=].target.display = "Physical findings of Hearing"
* group.element[+].code = #4688724
* group.element[=].display = "HEIGHT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8302-2
* group.element[=].target.display = "Body height"
* group.element[+].code = #4500635
* group.element[=].display = "PAIN"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #72514-3
* group.element[=].target.display = "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* group.element[+].code = #4500637
* group.element[=].display = "PULSE OXIMETRY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #2708-6
* group.element[=].target.display = "Oxygen saturation in Arterial blood"
* group.element[+].code = #4500636
* group.element[=].display = "PULSE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #8867-4
* group.element[=].target.display = "Heart rate"
* group.element[+].code = #4688725
* group.element[=].display = "RESPIRATION"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #9279-1
* group.element[=].target.display = "Respiratory Rate"
* group.element[+].code = #4688726
* group.element[=].display = "TONOMETRY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #28630-2
* group.element[=].target.display = "Tonometry study"
* group.element[+].code = #4688727
* group.element[=].display = "VISION CORRECTED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #70936-0
* group.element[=].target.display = "Vision testing Narrative"
* group.element[+].code = #4688728
* group.element[=].display = "VISION UNCORRECTED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #70936-0
* group.element[=].target.display = "Vision testing Narrative"
* group.element[+].code = #4500639
* group.element[=].display = "WEIGHT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #29463-7
* group.element[=].target.display = "Body weight"
* group.element[+].code = #unknown
* group.element[=].display = "ABDMONAL GIRTH"
* group.element[=].target.equivalence = #unmatched
* group.element[+].code = #unknown
* group.element[=].display = "HEAD CIRCUMFERENCE"
* group.element[=].target.equivalence = #unmatched
