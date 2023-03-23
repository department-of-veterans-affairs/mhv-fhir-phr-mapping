Profile:        MHVecg
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.ecg
Title:          "VA MHV PHR ECG"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing ECG (ClinicalProcedureTO) using FHIR API.

- The mock example maps best to VIA_v4.0.7_uat.wsdl. 
- based on US-Core for Clinical Notes
- must also have category of [Cardiology (LP29708-2)](https://loinc.org/LP29708-2)
- .identifier holds the ClinicalProcedureTO.id
- must have type of LOINC 11524-6

TODO Questions:
- none
"""
// must already be "clinical-note"
* category 2..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains
  LO 1..1
* category[LO] = LOINC#LP29708-2
* type.coding 1..1
* type.coding ^slicing.discriminator.type = #pattern
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains
  LO 1..1
* type.coding[LO].system = LOINC
* type.coding[LO].code 1..1
* type.coding[LO] = LOINC#11524-6
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`ClinicalProcedureTO` | `.` | {ClinicalProcedureTO.id}"


Mapping: Ecg-Mapping
Source:	MHVecg
Target: "ClinicalProcedureTO"
Title: "VDIF to MHV-PHR"
* -> "ClinicalProcedureTO" "MHV PHR FHIR API"
* category -> "`clinical-note` and Cardiology (LP29708-2)"
* status -> "`current`"
* subject -> "GetPatient()"
* identifier -> "{StationNbr} and {ClinicalProcedureTO.id}"
* date -> "ConvertDate(ClinicalProcedureTO.timestamp)"
* content.attachment.title -> "ClinicalProcedureTO.name"
* type.coding -> "LOINC#8601-7"
* context.related -> "GetLocation(ClinicalProcedureTO.facility.sitecode)"
* content.attachment.creation -> "unknown"
* content.attachment.size -> "calculate"
* content.attachment.hash -> "calculate"
* content.attachment.contentType -> "`text`"
* content.attachment.data -> "ClinicalProcedureTO.report"