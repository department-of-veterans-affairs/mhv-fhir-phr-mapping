Profile:        MHVnote
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.note
Title:          "VA MHV PHR Notes"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing Notes using FHIR API.

- based on US-Core for Clinical Notes
"""
* identifier 1..

Mapping: Notes-Mapping
Source:	MHVnote
Target: "NoteTO"
Title: "VIA/VDIF to MHV-PHR"
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
* type.coding -> "NoteTo.type{A, PN, DS, ?} or ConvertTitleToCode(NoteTO.standardTitle)"
* author -> "GetPractitioner(NoteTO.author.[AuthorTO])"
* context.related -> "GetLocation(NoteTO.location.[HospitalLocationTO])"
* authenticator -> "GetPractitioner(NoteTO.approvedBy)"
* content.attachment.creation -> "unknown"
* content.attachment.size -> "calculate"
* content.attachment.hash -> "calculate"
* content.attachment.contentType -> "text"
* content.attachment.data -> "NoteTO.text"