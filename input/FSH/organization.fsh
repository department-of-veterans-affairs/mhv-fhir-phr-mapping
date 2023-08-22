/*
To support GetOrganization()
*/


Profile:        MHVorganization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
//Parent: Organization
Id:             VA.MHV.PHR.organization
Title:          "VA MHV PHR Organization"
Description:    """
A profile on the Organization resource for MHV PHR exposing Organization using FHIR API.

- based on US-Core for Organization
  - must have a status
  - must have a name
  - there are other things us-core defines that are not manditory (NPI, CLIA)
- two identifier types defined TOid and HDRid
- used for Lab Site. In FHIR R4, the Lab site needs to go into .performer which can't take a Location. (TechnicalDebt)

Map to [VIA labSiteID](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-via-to-mhv-phr-labsiteto)

Map to [HDR PerformingOrganization](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-hdr-to-mhv-phr-performingorganization)
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains TOid 0..*
* identifier[TOid].system 1..1
* identifier[TOid] ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].value ^short = "{stationNumber} or `LabSiteTO.` + {LabSiteTO.id}"
* identifier[TOid].use = #usual


Mapping: Organization-LabSiteTO
Source:	MHVorganization
Target: "labSiteTO"
Title: "VIA to MHV-PHR"
* -> "labSiteTO"
* identifier.use -> "`usual`"
* identifier.system -> "`urn:oid:2.16.840.1.113883.4.349`"
* identifier.value -> "`LabSiteTO.` + {LabSiteTO.id}"
* name -> "Lab Site {number}"
* active -> "`true`"

/*
	<xsd:complexType name="HL72OrganizationIdentifierExtended">
		<xsd:all>
			<xsd:element name="identity" type="xsd:string" minOccurs="0"/>
			<xsd:element name="name" type="xsd:string" minOccurs="0"/>
			<xsd:element name="assigningAuthority" type="xsd:string" minOccurs="0"/>
			<xsd:element name="nameTypeCode" type="xsd:string" minOccurs="0"/>
			<xsd:element name="identityTypeCode" type="xsd:string" minOccurs="0"/>
			<xsd:element name="nameRepresentation" type="xsd:string" minOccurs="0"/>
			<xsd:element name="stationNumber" type="xsd:string" minOccurs="0"/>
		</xsd:all>
	</xsd:complexType>
	<xsd:complexType name="UsMailingAddress">
		<xsd:all>
			<xsd:element name="line1" type="xsd:string" minOccurs="0"/>
			<xsd:element name="line2" type="xsd:string" minOccurs="0"/>
			<xsd:element name="city" type="xsd:string" minOccurs="0"/>
			<xsd:element name="state" type="xsd:string" minOccurs="0"/>
			<xsd:element name="postalCode" type="xsd:string" minOccurs="0"/>
			<xsd:element name="country" type="xsd:string" minOccurs="0"/>
		</xsd:all>
	</xsd:complexType>
  	<xsd:complexType name="PerformingOrganization">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="identifier" type="basedatatypes:HL72OrganizationIdentifierExtended"/>
			<xsd:element minOccurs="0" name="address" type="basedatatypes:UsMailingAddress"/>
		</xsd:sequence>
	</xsd:complexType>
*/
Mapping: Organization-performingOrganization
Source: MHVorganization
Target: "PerformingOrganization"
Title: "HDR to MHV-PHR"
* -> "PerformingOrganization"
* identifier.use -> "`usual`"
* identifier.system -> "`urn:oid:2.16.840.1.113883.4.349`"
* identifier.value -> "{identifier.stationNumber}"
* name -> "{identifier.name}"
* address -> "{address}"
* active -> "`true`"

/* 
 <labSiteId>989</labSiteId>
*/
Instance: ex-MHV-organization-989
InstanceOf: MHVorganization
Title: "Organization lab site 989"
Description: "This example derived off of a mock diagnostic report"
Usage: #example
* active = true
* name = "Lab Site 989"
* identifier[TOid].use = #usual
* identifier[TOid].value = "LabSiteTO.989"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234"


/* HDR Lab Sample
               <performingOrganization>
                  <identifier>
                     <identity>552</identity>
                     <name>DAYTON, OH VAMC</name>
                     <assigningAuthority>USVHA</assigningAuthority>
                     <nameTypeCode>L</nameTypeCode>
                     <identityTypeCode>FI</identityTypeCode>
                     <nameRepresentation>A</nameRepresentation>
                     <stationNumber>552</stationNumber>
                  </identifier>
                  <address>
                     <line1>4100 W. THIRD STREET</line1>
                     <city>DAYTON</city>
                     <postalCode>45428</postalCode>
                     <country>USA</country>
                     <state>OH</state>
                  </address>
               </performingOrganization>
*/
Instance: ex-MHV-organization-552
InstanceOf: MHVorganization
Title: "Organization HDR Lab 552"
Description: "This example derived off of a mock HDR Lab report"
Usage: #example
* active = true
* name = "DAYTON, OH VAMC"
* identifier[TOid].use = #usual
* identifier[TOid].value = "552"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].type.text = "L"
* address.line = "4100 W. THIRD STREET"
* address.city = "DAYTON"
* address.postalCode = "45428"
* address.country = "USA"
* address.state = "OH"

/* HDR Lab Sample
            <orderingFacilityIdentifier>
               <identity>660</identity>
               <name>VA SALT LAKE CITY HEALTH CARE SYSTEM (660)</name>
               <assigningAuthority>USVHA</assigningAuthority>
               <nameTypeCode>L</nameTypeCode>
               <identityTypeCode>FI</identityTypeCode>
               <nameRepresentation>A</nameRepresentation>
               <stationNumber>660</stationNumber>
            </orderingFacilityIdentifier>
	...
	            <performingOrganization>
                  <identifier>
                     <identity>660</identity>
                     <name>VA SALT LAKE CITY HEALTH CARE SYSTEM (660)</name>
                     <assigningAuthority>USVHA</assigningAuthority>
                     <nameTypeCode>L</nameTypeCode>
                     <identityTypeCode>FI</identityTypeCode>
                     <nameRepresentation>A</nameRepresentation>
                     <stationNumber>660</stationNumber>
                  </identifier>
                  <address>
                     <line1>500 FOOTHILL BLVD.</line1>
                     <city>SALT LAKE CITY</city>
                     <postalCode>84148</postalCode>
                     <country>USA</country>
                     <state>UT</state>
                  </address>
               </performingOrganization>
*/
Instance: ex-MHV-organization-660
InstanceOf: MHVorganization
Title: "Organization HDR Lab 660"
Description: "This example derived off of a mock HDR Lab report"
Usage: #example
* active = true
* name = "VA SALT LAKE CITY HEALTH CARE SYSTEM (660)"
* identifier[TOid].use = #usual
* identifier[TOid].value = "660"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].type.text = "FI"
* address.line = "500 FOOTHILL BLVD."
* address.city = "SALT LAKE CITY"
* address.postalCode = "84148"
* address.country = "USA"
* address.state = "UT"

/*
from HDR example
         <recordSource>
            <namespaceId>979</namespaceId>
            <universalId>SLC10.FO-BAYPINES.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordSource>
*/
Instance: ex-MHV-organization-979
InstanceOf: MHVorganization
Title: "Organization HDR Lab 979"
Description: "This example derived off of a mock HDR Lab report"
Usage: #example
* active = true
* identifier[TOid].use = #usual
* identifier[TOid].value = "979"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].type.text = "FI"
* name = "Organization 979"
