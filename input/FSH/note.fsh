Profile:        MHVnote
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.note
Title:          "VA MHV PHR Notes"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing Notes using FHIR API.

- The mock example maps best to VIA_v4.0.7_uat.wsdl. 
- based on US-Core for Clinical Notes

TODO Questions:
- is standardTitle or type used to differentiate between various note types?
- type seems to hold an enum (A, PN, DS). I am not sure what these mean, or if there are other values
  - A - LOINC#83320-2 \"Allergy and Immunology Adverse event note\"
  - PN - LOINC#11505-5 \"Physician procedure note\"
  - DS - LOINC#18842-5 \"Discharge summary\"
- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them.
  - serviceCategory
  - cosigner
  - hasAdendum
  - isAddendum
  - originalNoteID
  - hasImages
  - itemId
  - signatureTimestamp
  - consultId
  - surgicalProcId
  - prfId
  - parentId
  - procTimestamp
  - subject
"""
* identifier 1..

Mapping: Notes-Mapping
Source:	MHVnote
Target: "NoteTO"
Title: "VDIF to MHV-PHR"
* -> "NoteTO" "MHV PHR FHIR API"
* category -> "clinical-note"
* author -> "GetPractitioner(NoteTO.author.[AuthorTO])"
* status -> "current or derived from NoteTo.status"
* subject -> "GetPatient()"
* identifier -> "NoteTO.id"
* date -> "ConvertDate(NoteTO.timestamp)"
* context.period.start -> "ConvertDate(NoteTO.admitTimestamp)"
* context.period.end -> "ConvertDate(NoteTO.dischargeTimestamp)"
* content.attachment.title -> "NoteTO.localTitle"
* type.text -> "NoteTO.standardTitle"
* type.coding -> "NoteTO.type{A, PN, DS, ?} or ConvertTitleToCode(NoteTO.standardTitle)"
* author -> "GetPractitioner(NoteTO.author.[AuthorTO])"
* context.related -> "GetLocation(NoteTO.location.[HospitalLocationTO])"
* authenticator -> "GetPractitioner(NoteTO.approvedBy)"
* content.attachment.creation -> "unknown"
* content.attachment.size -> "calculate"
* content.attachment.hash -> "calculate"
* content.attachment.contentType -> "text"
* content.attachment.data -> "NoteTO.text"