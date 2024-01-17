Profile:        MHVdocumentReference
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Id:             VA.MHV.PHR.documentReference
Title:          "VA MHV All DocumentReference"
Description:    """
A profile on the DocumentReference resource that covers all uses of FHIR DocumentReference in the MyHealtheVet FHIR API. This includes Physician Notes, Discharge Summary, ECG/EKG, and Imaging reports.
"""
* ^extension[$fmm].valueInteger = 4
//* meta.extension contains http://hl7.org/fhir/StructureDefinition/lastSourceSync named lastSourceSync 0..1 MS
* identifier MS
// slice type so that other alternaives can be included, such as the existing VUID
* type.coding ^slicing.discriminator.type = #pattern
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains LO 1..1
* type.coding[LO].system = $loinc
* type.coding[LO] from DocumentReferenceTypeVS (required)
// us-core sets category to `clinical-note`
* status MS
* status ^short = "May indicate entered-in-error"
//* status = #current
* date MS
* author MS
* author ^type.aggregation = #contained
//* author only Reference(MHVpractitioner)
* authenticator MS
* authenticator ^type.aggregation = #contained
* authenticator only Reference(MHVpractitioner or Practitioner)
* authenticator.extension contains NoteAuthenticatedWhen named when 0..1 MS

* custodian MS
* context.related MS
* context.related ^type.aggregation = #contained
* context.related only Reference(MHVlocation or Location)

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

Extension: NoteAuthenticatedWhen
Id: noteAuthenticatedWhen
Title: "When the authentication happened"
Description: """
DateTime of when the authentication happened
"""
* ^context[+].type = #element
* ^context[=].expression = "DocumentReference.authenticator"
* value[x] only dateTime
* valueDateTime 1..1
