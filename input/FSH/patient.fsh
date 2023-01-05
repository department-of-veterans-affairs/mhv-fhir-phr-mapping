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
- record the ICN value into the Patient.identifier
"""
* extension contains http://hl7.org/fhir/StructureDefinition/patient-religion named religion 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/patient-birthPlace named birthPlace 0..1
// TODO: could define some slices for the various names, addresses, telecom, and contact


Mapping: Patient-Mapping
Source:	MHVpatient
Target: "PatientTO"
Title: "VDIF to MHV-PHR"
* -> "PatientTO" "MHV PHR FHIR API"
* active -> "true"
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
