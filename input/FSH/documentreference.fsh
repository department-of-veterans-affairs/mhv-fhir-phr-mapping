Profile:        MHVdocumentReference
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.documentReference
Title:          "VA MHV All DocumentReference"
Description:    """
A profile on the DocumentReference resource that covers all uses of FHIR DocumentReference in the MyHealtheVet FHIR API. 

- based on US-Core for Clinical Notes
- `.type` indicates the type of note
- the text note will be in the `.content.attachment.data` element
- not used in DocumentReference
  - masterIdentifier 0..0
  - docStatus 0..0
  - relatesTo 0..0
  - description 0..0
  - securityLabel 0..0
  - content.format 0..0
  - context.encounter 0..0
  - context.event 0..0
  - context.facilityType 0..0
  - context.practiceSetting 0..0
  - context.sourcePatientInfo 0..0
- **Business Rule**: Only `completed` reports are included (`.status` == `current`)
"""
* identifier MS
* type from DocumentReferenceTypeVS (required)
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* status = #current
* date MS
* content 1..1
* author MS
* authenticator MS
* context.related MS
* context.period MS
* content.attachment.contentType MS
* content.attachment.data MS
* masterIdentifier 0..0
* docStatus 0..0
* relatesTo 0..0
* description 0..0
* securityLabel 0..0
* content.format 0..0
* context.encounter 0..0
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
