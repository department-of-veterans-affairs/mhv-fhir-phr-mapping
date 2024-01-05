/*
to support GetLocation()
*/

Profile:        MHVlocation
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-location
Id:             VA.MHV.PHR.location
Title:          "VA MHV PHR Location"
Description:    """
A profile on the Location resource for MHV PHR exposing Location using FHIR API.

- based on US-Core for Location
- `identifier`
  - system = urn:oid:2.16.840.1.113883.4.349
- `name` is the name as known
- always a contained resource, so not exposed RESTfully

NOT USING Mapping to [VIA HospitalLocationTO](StructureDefinition-VA.MHV.PHR.location-mappings.html#mappings-for-via-to-mhv-fhir-phr-hospitallocationto).
"""
* ^extension[$fmm].valueInteger = 3
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`HospitalLocationTO` | `.` | {HospitalLocationTO.id}"
* name 1..1
* status 0..0
* operationalStatus 0..0
* alias 0..0
* description 0..0
* mode 0..0
* type 0..0
* telecom 0..0
* address 0..0
* physicalType 0..0
* position 0..0
* managingOrganization 0..0
* partOf 0..0
* hoursOfOperation 0..0
* availabilityExceptions 0..0
* endpoint 0..0


/*
      <s:complexType name="HospitalLocationTO">
        <s:complexContent mixed="false">
          <s:extension base="tns:AbstractTO">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="id" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="abbreviation" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="department" type="tns:TaggedText"/>
              <s:element minOccurs="0" maxOccurs="1" name="service" type="tns:TaggedText"/>
              <s:element minOccurs="0" maxOccurs="1" name="specialty" type="tns:TaggedText"/>
              <s:element minOccurs="0" maxOccurs="1" name="stopCode" type="tns:TaggedText"/>
              <s:element minOccurs="0" maxOccurs="1" name="creditStopCode" type="tns:TaggedText"/>
              <s:element minOccurs="0" maxOccurs="1" name="facility" type="tns:SiteTO"/>
              <s:element minOccurs="0" maxOccurs="1" name="building" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="floor" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="room" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="bed" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="status" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="phone" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="appointmentTimestamp" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="type" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="physicalLocation" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="visitLocation" type="s:string"/>
              <s:element minOccurs="1" maxOccurs="1" name="askForCheckIn" type="s:boolean"/>
              <s:element minOccurs="0" maxOccurs="1" name="appointmentLength" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="clinicDisplayStartTime" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="displayIncrements" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="maxOverbooksPerDay" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="prohibitAccessToClinic" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="availability" type="tns:TimeSlotArray"/>
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>


*/
Mapping: Location-Mapping
Source:	MHVlocation
Target: "HospitalLocationTO"
Title: "VIA to mhv-fhir-phr"
* -> "HospitalLocationTO"
* identifier -> "HospitalLocationTO.ids"
* name -> "HospitalLocationTO.name"
* alias -> "HospitalLocationTO.abbreviation"
* status -> "HospitalLocationTO.status"
* telecom -> "HospitalLocationTO.phone"

/* 
<location>
  <id>984</id>
  <name>DAYTSHR TEST LAB</name>
</location>
*/
Instance: ex-MHV-location-984
InstanceOf: MHVlocation
Title: "Location DAYTSHR TEST Lab"
Description: "This example derived off of a mock HospitalLocationTO"
Usage: #inline
* name = "DAYTSHR TEST LAB"
* identifier[TOid].use = #usual
* identifier[TOid].value = "HospitalLocationTO.984"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
    <location>
        <id>552</id>
        <name>DAYTON</name>
    </location>
*/
Instance: ex-MHV-location-552
InstanceOf: MHVlocation
Title: "Location DAYTON Lab"
Description: "This example derived off of a mock NoteTO"
Usage: #inline
* name = "DAYTON"
* identifier[TOid].use = #usual
* identifier[TOid].value = "HospitalLocationTO.552"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/* 
<location>
  <id>989</id>
  <name>DAYT29 TEST LAB</name>
</location>
*/
Instance: ex-MHV-location-989
InstanceOf: MHVlocation
Title: "Location DAYT29 TEST Lab"
Description: "This example derived off of a mock ClinicalProcedureTO"
Usage: #inline
* name = "DAYT29 TEST LAB"
* identifier[TOid].use = #usual
* identifier[TOid].value = "HospitalLocationTO.989"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
    <location>
        <id>2938</id>
        <name>PCT_O PATIL (F/U)</name>
    </location>
*/
Instance: ex-MHV-location-2938
InstanceOf: MHVlocation
Title: "Location PCT_O PATIL (F/U)"
Description: "This example derived off of a mock VitalSignTO"
Usage: #inline
* name = "PCT_O PATIL (F/U)"
* identifier[TOid].use = #usual
* identifier[TOid].value = "HospitalLocationTO.2938"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

Instance: location-2901
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.2901"
* name = "REHAB-SCI MD"

Instance: location-1921
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.1921"
* name = "PCT_G"



Instance: location-2171
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.2171"
* name = "ZZZHEMATOLOGY II"


Instance: location-3318
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.3318"
* name = "GI APPALANENI"


Instance: location-1439
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.1439"
* name = "ZZZPCT_G MANGAS P.(HYP)"


Instance: location-1920
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.1920"
* name = "PCT_O"

Instance: location-1148
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.1148"
* name = "SLEEP F/U 2"


Instance: location-3713
InstanceOf: MHVlocation
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "HospitalLocationTO.3713"
* name = "000-EYE NON TREATMENT (LOC)"