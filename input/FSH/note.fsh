Profile:        MHVnote
Parent:         VA.MHV.PHR.documentReference
Id:             VA.MHV.PHR.note
Title:          "VA MHV PHR Notes"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing Notes (NoteTO) using FHIR API.
"""
// Most criteria come from the MHV documentReference
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 0..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`NoteTO` | `.` | {NoteTO.id}"
* type from NoteTypeVS (required)
* context.encounter 0..0
* content.attachment.creation 0..0
* custodian 0..0
* description 0..0

ValueSet: NoteTypeVS
Title: "Known Note types"
Description: "Note types"
* ^experimental = false
//* LOINC#83320-2 "Allergy and Immunology Adverse event note"
* LOINC#11505-5 "Physician procedure note"
* LOINC#18842-5 "Discharge summary"
//* LOINC#11506-3 "Progress note"



Mapping: Notes-Mapping
Source:	MHVnote
Target: "NoteTO"
Title: "VDIF to MHV-PHR"
* -> "NoteTO"
* category -> "`clinical-note`"
* author -> "GetPractitioner(NoteTO.author.[AuthorTO])"
* status -> "`current`"
* subject -> "GetPatient()"
* identifier -> "NoteTO.id"
* date -> "ConvertDate(NoteTO.timestamp)"
* context.period.start -> "ConvertDate(NoteTO.admitTimestamp)"
* context.period.end -> "ConvertDate(NoteTO.dischargeTimestamp)"
* content.attachment.title -> "NoteTO.localTitle"
* type.text -> "NoteTO.standardTitle"
* type.coding -> "NoteTO.type{PN, DS, ?}"
* author -> "GetPractitioner(NoteTO.author.[AuthorTO])"
* context.related -> "GetLocation(NoteTO.location.[HospitalLocationTO])"
* authenticator -> "GetPractitioner(NoteTO.approvedBy)"
* content.attachment.contentType -> "`text/plain`"
* content.attachment.data -> "base64(NoteTO.text)"

/*
  <xs:complexType name="noteTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="admitTimestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dischargeTimestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="serviceCategory" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="localTitle" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="standardTitle" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="author" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="cosigner" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="location" type="tns:hospitalLocationTO"/>
          <xs:element form="unqualified" minOccurs="0" name="text" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="hasAddendum" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="isAddendum" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="originalNoteID" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="hasImages" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="itemId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="approvedBy" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="status" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="type" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="signatureTimestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="consultId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="surgicalProcId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="prfId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="parentId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="procId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="procTimestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="subject" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>

*/