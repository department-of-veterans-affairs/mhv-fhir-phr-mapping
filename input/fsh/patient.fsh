/*
to support GetPatient(ICN)
*/

Profile:        MHVpatient
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Id:             VA.MHV.PHR.patient
Title:          "VA MHV PHR Patient"
Description:    """
A profile on the Patient resource for MHV PHR exposing Patient using FHIR API.

- based on US-Core for Patient
- mapping from patient details in eVault (not from VIA/HDR transaction)
  - all elements populated from eVault PHR patient service
  - phrVPRDAO.fetchDetailPatientInfo(icn)
- `identifier`  
  - `value` = GetPatientId
  - `system` = `urn:oid:2.16.840.1.113883.4.349`
  - not using ICN but rather the id value known to eVault. There is concern the ICN is not unique enough.
- `name` - First and Last Name
- `gender`
- `birthDate`
- `active` = true

mapping concerns - TODO
- The Identifier for the ICN is still being discussed
- identifer.use is not being populated so can't use slicing
- name seems to only populate first and last, but puts them both in given
- populating identifier with GetPatientId() - the MHV patientId (jwt subjectId)
  - TODO: **the system value should not be the generic VA oid**, but rather some URI identifying MHV as this is where these id values are unique.
  - TODO: John is requesting an assigned OID for the MHV patientId system
    - Historically `200MH` was used as an assigning authority `USVHA` identifier type (e.g., H7 v2 Identifier)
  - FHIR database will likely need to have the current Patient resources updated. Updating the FHIR database first will continue to work with current client.
  - **MHV-54036**
  - TODO: client will need to change to be specific to the new system value - https://github.com/department-of-veterans-affairs/vets-api/blob/f2733b21112f94c90dae618f0420d712f01cdf49/lib/medical_records/client.rb#L75
- eVault also has, but are not being used in the FHIR Patient
  - MiddleName
  - Ssn
  - Email
  - Icn 
- set .meta.profile
- Would be even better if we could use a common Patient registry. 
- The Patient resource can hold much more such as religion, birth place, other identifiers, etc...
- Integration with Cerner will force even more federation of identities
- Not mapping PatientTO 
"""
* ^extension[$fmm].valueInteger = 3
//* extension contains http://hl7.org/fhir/StructureDefinition/patient-religion named religion 0..1
//* extension contains http://hl7.org/fhir/StructureDefinition/patient-birthPlace named birthPlace 0..1
// could define some slices for the various names, addresses, telecom, and contact
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
    PatientId 1..1
* identifier[PatientId].use = #usual
//* identifier[PatientId].system obeys TOid-startswithoid
* identifier[PatientId].system ^short = "urn:oid:2.16.840.1.113883.4.349"
* identifier[PatientId].value ^short = "{eVault PatientID}"
* name 1..1
* name.given 1..
* name.family 1..1
* gender 1..1
* birthDate 1..1
* active = true
* telecom 0..0
* deceased[x] 0..0
* address 0..0
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* contact 0..0
* communication 0..0
* generalPractitioner 0..0
* managingOrganization 0..0
* link 0..0

/*
PatientTO mapping notes
- record the ICN value into the Patient.identifier
  - seems other ID values are possible too such as mpiPID, localPID, SSN.
- some elements could be converted into `codes` but doing minimal translation. 
- notes given example
  - dropping age as not useful in persisted data, prefer dob
  - dropping occupation - could be recorded as SDOH Observation
  - dropping confidentiality flag - not sure the meaning - could be .meta.security
  - dropping patientFlags - not sure the meaning
  - dropping activeInsurance - could go into Account resource - could go in extension as text blob
  - dropping currentMeansStatus
  - dropping elegibilityCode
- could map these, but to keep to minimal confusion we are also dropping:
  - dropping gender
  - dropping ethnicity
  - dropping religion
  - dropping birth place
  - dropping maritalStatus
  - Dropping telecom
  - dropping contact


Mapping: Patient-Mapping
Source:	MHVpatient
Target: "PatientTO"
Title: "VIA to mhv-fhir-phr"
* -> "PatientTO"
* active -> "`true`"
* identifier -> "ICN"
* managingOrganization -> "MHV PHR - TREATING_FACILITY"
* name -> "PatientTO.name"
* birthDate -> "PatientTO.dob"
* gender -> "PatientTO.gender"
* extension[us-core-race] -> "MHV PHR - RACE"
* extension[us-core-ethnicity] -> "PatientTO.ethnicity"
* extension[religion] -> "PatientTO.religion"
* extension[birthPlace] -> "PatientTO.demographics.demographicsSetTO.Addresses.addressTO.city + PatientTO.demographics.demographicsSetTO.Addresses.addressTO.state"
* maritalStatus -> "ConvertCode(PatientTO.martalStatus)"
* address -> "PatientTO.demographics.demographicsSetTO.Addresses.addressTO"
* telecom -> "PatientTO.demographics.demographicsSetTO.Phones"
* contact -> "PatientTO.PersonArray.Persons.PersonTO"
*/

/*
  <xs:complexType name="patientTO">
    <xs:complexContent>
      <xs:extension base="tns:personTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="occupation" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="employmentStatus" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="employerName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="relationships" type="tns:personArray"/>
          <xs:element form="unqualified" minOccurs="0" name="patientName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="mpiPid" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="mpiChecksum" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="localPid" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="sitePids" type="tns:taggedTextArray"/>
          <xs:element form="unqualified" minOccurs="0" name="vendorPid" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="location" type="tns:hospitalLocationTO"/>
          <xs:element form="unqualified" minOccurs="0" name="cwad" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="restricted" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="admitTimestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="serviceConnected" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="scPercent" type="xs:int"/>
          <xs:element form="unqualified" minOccurs="0" name="inpatient" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="deceasedDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="confidentiality" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="needsMeansTest" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="patientFlags" type="tns:taggedTextArray"/>
          <xs:element form="unqualified" minOccurs="0" name="cmorSiteId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="activeInsurance" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="isTestPatient" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="currentMeansStatus" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="hasInsurance" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="preferredFacility" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="patientType" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="isVeteran" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="isLocallyAssignedMpiPid" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="sites" type="tns:siteArray"/>
          <xs:element form="unqualified" minOccurs="0" name="team" type="tns:team"/>
          <xs:element form="unqualified" minOccurs="0" name="eligibilityCode" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="personTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="type" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="birthPlace" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="religion" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="ssn" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="gender" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dob" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="ethnicity" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="age" type="xs:int"/>
          <xs:element form="unqualified" minOccurs="0" name="maritalStatus" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="homeAddress" type="tns:addressTO"/>
          <xs:element form="unqualified" minOccurs="0" name="homePhone" type="tns:phoneNumTO"/>
          <xs:element form="unqualified" minOccurs="0" name="cellPhone" type="tns:phoneNumTO"/>
          <xs:element form="unqualified" minOccurs="0" name="demographics">
            <xs:complexType>
              <xs:sequence>
                <xs:element form="unqualified" maxOccurs="unbounded" minOccurs="0" name="demographicSetTO" type="tns:demographicSetTO"/>
              </xs:sequence>
            </xs:complexType>
          </xs:element>
          <xs:element form="unqualified" minOccurs="0" name="description" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/