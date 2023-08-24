/*
to support GetPractitioner(UserTO | AuthorTO)
*/
Profile:        MHVpractitioner
//Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
// not using us-core, as it makes it difficult to slice on the VA OID pattern
Parent: Practitioner
Id:             VA.MHV.PHR.practitioner
Title:          "VA MHV PHR Practitioner"
Description:    """
A profile on the Practitioner resource for MHV PHR exposing Practitioner using FHIR API.

- NOT based on US-Core for Practitioner, as that makes slicing on VA OID pattern impossible
- used for VIDF UserTO, and AuthorTO
- used for HDR PractitionerLite
- might be used for PersonTO or is that RelatedPerson?
- always a contained resource, so not exposed RESTfully

Mapping to [VIA UserTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-via-to-mhv-phr-userto) and [VIA AuthorTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-via-to-mhv-phr-authorto)

Mapping to [HDR PractitionerLite](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-hdr-to-mhv-phr-practitionerlite)
"""
* name MS
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains  TOid 0..*
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`UserTO` | `.` | {UserTO.id}"
* identifier[TOid].value ^short = "`AuthorTO` | `.` | {AuthorTO.id}"
* identifier contains  HDRid 0..*
* identifier[HDRid].use = #secondary
* identifier[HDRid].system obeys HDRid-startswithoid
* identifier[HDRid].system ^short = "`http://va.gov/systems/` + {idSourceTable}"
* identifier[HDRid].value ^short = "{identifier.identity}"


Invariant: TOid-startswithoid
Description: "ID system must start with urn:oid:2.16.840.1.113883.4.349.4. The next would be the {stationNbr}"
Severity: #error
Expression: "value.startsWith('urn:oid:2.16.840.1.113883.4.349.4.')"

Invariant: HDRid-startswithoid
Description: "ID system must start with http://va.gov/systems/ The next would be the {idSourceTable}"
Severity: #error
Expression: "value.startsWith('http://va.gov/systems/')"


/*
      <s:complexType name="UserTO">
        <s:complexContent mixed="false">
          <s:extension base="tns:AbstractTO">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="domain" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="SSN" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="DUZ" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="siteId" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="office" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="phone" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="pager" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="digitalPager" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="service" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="title" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="orderRole" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="userClass" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="greeting" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="siteMessage" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="ids" type="tns:TaggedTextArray"/>
              <s:element minOccurs="0" maxOccurs="1" name="emailAddress" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="username" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="demographics" type="tns:DemographicSetTO"/>
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>

*/

Mapping: Practitioner-UserTO
Source:	MHVpractitioner
Target: "UserTO"
Title: "VIA to MHV-PHR"
* -> "UserTO"
* identifier.use -> "`usual`"
* identifier.value -> "`UserTO` + {UserTO.id}"
* identifier.system -> "ID system must start with urn:oid:2.16.840.1.113883.4.349.4. The next would be the {stationNbr}"
* name.text -> "UserTO.name"
* telecom -> "UserTO.phone"
* telecom -> "UserTO.pager"
* telecom -> "UserTO.digitalPager"
* communication -> "UserTO.greeting"
* telecom -> "UserTO.emailAddress"

/*
      <s:complexType name="AuthorTO">
        <s:complexContent mixed="false">
          <s:extension base="tns:AbstractTO">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="id" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="signature" type="s:string"/>
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>

*/
Mapping: Practitioner-AuthorTO
Source:	MHVpractitioner
Target: "AuthorTO"
Title: "VIA to MHV-PHR"
* -> "AuthorTO"
* identifier.use -> "`usual`"
* identifier.value -> "`AuthorTO.` + {AuthorTO.id}"
* identifier.system -> "ID system must start with urn:oid:2.16.840.1.113883.4.349.4. The next would be the {stationNbr}"
* name.text -> "AuthorTO.name"



/* TODO??? PersonTO as Practitioner or RelatedPerson ???

      <s:complexType name="PersonTO">
        <s:complexContent mixed="false">
          <s:extension base="tns:AbstractTO">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="id" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="occupation" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="employmentStatus" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="relationships" type="tns:PersonArray"/>
              <s:element minOccurs="0" maxOccurs="1" name="description" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="religion" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="name" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="ssn" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="gender" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="dob" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="ethnicity" type="s:string"/>
              <s:element minOccurs="1" maxOccurs="1" name="age" type="s:int"/>
              <s:element minOccurs="0" maxOccurs="1" name="maritalStatus" type="s:string"/>
              <s:element minOccurs="0" maxOccurs="1" name="homeAddress" type="tns:AddressTO"/>
              <s:element minOccurs="0" maxOccurs="1" name="homePhone" type="tns:PhoneNumTO"/>
              <s:element minOccurs="0" maxOccurs="1" name="cellPhone" type="tns:PhoneNumTO"/>
              <s:element minOccurs="0" maxOccurs="1" name="demographics" type="tns:ArrayOfDemographicSetTO"/>
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
*/

/*
	<xsd:complexType name="HL72PersonIdentifier">
		<xsd:all>
			<xsd:element name="identity" type="xsd:string" minOccurs="0"/>
			<xsd:element name="assigningFacility" type="xsd:string" minOccurs="0"/>
			<xsd:element name="assigningAuthority" type="xsd:string" minOccurs="0"/>
		</xsd:all>
	</xsd:complexType>
	<xsd:complexType name="HL72PersonName">
		<xsd:all>
			<xsd:element name="prefix" type="xsd:string" minOccurs="0"/>
			<xsd:element name="given" type="xsd:string" minOccurs="0"/>
			<xsd:element name="middle" type="xsd:string" minOccurs="0"/>
			<xsd:element name="family" type="xsd:string" minOccurs="0"/>
			<xsd:element name="suffix" type="xsd:string" minOccurs="0"/>
			<xsd:element name="title" type="xsd:string" minOccurs="0"/>
		</xsd:all>
	</xsd:complexType>
  <xsd:complexType name="PractitionerLite">
		<xsd:all>
			<xsd:element name="identifier" type="basedatatypes:HL72PersonIdentifier" minOccurs="0"/>
			<xsd:element name="idSourceTable" type="xsd:string" minOccurs="0"/>
			<xsd:element name="name" type="basedatatypes:HL72PersonName" minOccurs="0"/>
		</xsd:all>
	</xsd:complexType>
*/
Mapping: Practitioner-PractitionerLite
Source:	MHVpractitioner
Target: "PractitionerLite"
Title: "HDR to MHV-PHR"
* -> "PractitionerLite"
* identifier.use -> "`secondary`"
* identifier.value -> "identifier.identity"
* identifier.system -> "identifier.assigingFacility"
* identifier.system -> "`http://va.gov/systems/` + idSourceTable"
* name -> "name"
* name.prefix -> "name.prefix"
* name.given -> "name.given"
* name.given -> "name.middle"
* name.family -> "name.family"
* name.suffix -> "name.suffix"
* name.suffix -> "name.title"

