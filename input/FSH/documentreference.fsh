Profile:        MHVdocumentReference
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.documentReference
Title:          "VA MHV All DocumentReference"
Description:    """
A profile on the DocumentReference resource that covers all uses of FHIR DocumentReference in the MyHealtheVet FHIR API. This includes Physician Notes, Discharge Summary, ECG/EKG, and Imaging reports.
"""
* identifier MS
* type from DocumentReferenceTypeVS (required)
// us-core sets category to `clinical-note`
* status = #current
* date MS
* author MS
* authenticator MS
* custodian MS
* context.related MS
* context.period MS
* content 1..1
* content.attachment.contentType MS
* content.attachment.data MS
* content.attachment.title MS
* content.attachment.creation MS
* description MS

* masterIdentifier 0..0
* docStatus 0..0
* relatesTo 0..0
* securityLabel 0..0
* content.format 0..0
* content.attachment.language 0..0
* content.attachment.url 0..0
* content.attachment.size 0..0
* content.attachment.hash 0..0
* context.event 0..0
* context.facilityType 0..0
* context.practiceSetting 0..0
* context.sourcePatientInfo 0..0


ValueSet: DocumentReferenceTypeVS
Title: "Known DocumentReference types"
Description: "DocumentReference types"
* ^experimental = false
// Notes
* codes from valueset NoteTypeVS
// ECG
* LOINC#11524-6
// imaging
* LOINC#18748-4