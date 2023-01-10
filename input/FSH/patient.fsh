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

Mapping to [VDIF PatientTO](StructureDefinition-VA.MHV.PHR.patient-mappings.html#mappings-for-vdif-to-mhv-phr-patientto)
"""
* extension contains http://hl7.org/fhir/StructureDefinition/patient-religion named religion 0..1
* extension contains http://hl7.org/fhir/StructureDefinition/patient-birthPlace named birthPlace 0..1
// TODO: could define some slices for the various names, addresses, telecom, and contact


Mapping: Patient-Mapping
Source:	MHVpatient
Target: "PatientTO"
Title: "VDIF to MHV-PHR"
* -> "PatientTO" "MHV PHR FHIR API"
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
