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

Mapping to [VDIF HospitalLocationTO](StructureDefinition-VA.MHV.PHR.location-mappings.html#mappings-for-vdif-to-mhv-phr-hospitallocationto).
"""


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
Title: "VDIF to MHV-PHR"
* -> "HospitalLocationTO" "MHV PHR FHIR API"
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
Usage: #example
* name = "DAYTSHR TEST LAB"
* identifier[+].use = #official
* identifier[=].value = "984"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/HospitalLocationTO"

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
Usage: #example
* name = "DAYTON"
* identifier[+].use = #official
* identifier[=].value = "552"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/HospitalLocationTO"