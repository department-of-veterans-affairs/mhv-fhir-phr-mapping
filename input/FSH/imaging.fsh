Profile:        MHVimagingExam
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.imaging
Title:          "VA MHV PHR Radiology"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing Radiology note (ImagingExamTO) using FHIR API.

- The mock example maps best to VIA_v4.0.7_uat.wsdl. 
- based on US-Core for Clinical Notes
- type LOINC#18748-4 "Diagnostic imaging study"
- see [mapping](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-vdif-to-mhv-phr-imagingexamto) for details

TODO Questions:
- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them.
  - hasImages
  - imagingType - always was GENERAL RADIOLOGY
  - facility - no clear place in DocumentReference. Need to understand this better, is it data best put inside a contained Encounter?
  - these never appeared in examples
    - modifiers
    - clinicalHX
    - impression
    - imagingExamTO
    - reportId
"""
* type.coding 1..2
* type.coding ^slicing.discriminator.type = #pattern
* type.coding ^slicing.discriminator.path = "uri"
* type.coding ^slicing.rules = #open
* type.coding contains
  LO 1..1 and
  CP 0..1
* type.coding[LO].system = LOINC
* type.coding[LO].code 1..1
* type.coding[CP].system = CPT
* type.coding[CP].code 1..1
* type.coding[LO] = LOINC#18748-4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1 and
  accessionNumber 0..* and
  casenum 0..* 
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "system for given Vista site and ImagingExamTO.id"
* identifier[TOid].value ^short = "ImagingExamTO.id"
* identifier[accessionNumber].use = #official
* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* identifier[accessionNumber].system ^short = "system for given Vista site and AccessionNumber"
* identifier[accessionNumber].value ^short = "ImagingExamTO.accessionNum"
* identifier[casenum].use = #secondary
* identifier[casenum].system ^short = "system for given Vista site and casenum"
* identifier[casenum].value ^short = "ImagingExam.casenum"


Mapping: ImagingExam-Mapping
Source:	MHVimagingExam
Target: "ImagingExamTO"
Title: "VDIF to MHV-PHR"
* -> "ImagingExamTO" "MHV PHR FHIR API"
* category -> "`clinical-note`"
* type.coding[LO] -> "LOINC#18748-4"
* type.coding[CP] -> "ImagingExamTO.type"
* status -> "`current` or derived from ImagingExamTO.status"
* docStatus -> "`final` or derived from ImagingExamTO.radiologyReportTO.status"
* author -> "GetPractitioner(ImagingStudyTO.provider.[UserTO])"
* subject -> "GetPatient()"
* custodian -> "GetLocation(ImagingExamTO.imagingLocation)"
* identifier[TOid] -> "ImagingExamTO.id"
* identifier[accessionNumber] -> "ImagingExamTO.accessionNum"
* identifier[casenum] -> "ImagingExamTO.casenum"
* date -> "ConvertDate(ImagingExamTO.timestamp)"
* context.encounter -> "ImagingExamTO.encounterId"
* context.related -> "ImagingExamTO.order[OrderTO]"
* content.attachment.title -> "ImagingExamTO.name or ImagingExamTO.radiologyReportTo.title"
* content.attachment.creation -> "ConvertDate(ImagingExamTO.radiologyReportTO.timestamp)"
* content.attachment.size -> "calculate"
* content.attachment.hash -> "calculate"
* content.attachment.contentType -> "`text`"
* content.attachment.data -> "ImagingStudyTO.radiologyReportTo.text"
* description -> "ImagingStudyTO.interpretation"