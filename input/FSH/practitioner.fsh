Profile:        MHVpractitioner
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Id:             VA.MHV.PHR.practitioner
Title:          "VA MHV PHR Practitioner"
Description:    """
A profile on the Practitioner resource for MHV PHR exposing Practitioner using FHIR API.

- based on US-Core for Practitioner
- used for UserTO, and AuthorTO
- might be used for PersonTO or is that RelatedPerson?
"""


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
Title: "VDIF to MHV-PHR"
* -> "UserTO" "MHV PHR FHIR API"
* name -> "UserTO.name"
* telecom -> "UserTO.phone"
* telecom -> "UserTO.pager"
* telecom -> "UserTO.digitalPager"
* communication -> "UserTO.greeting"
* identifier -> "UserTO.ids"
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
Title: "VDIF to MHV-PHR"
* -> "AuthorTO" "MHV PHR FHIR API"
* identifier -> "AuthorTO.id"
* name -> "AuthorTO.name"



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