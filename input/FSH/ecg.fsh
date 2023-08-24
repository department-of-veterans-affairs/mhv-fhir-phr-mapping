Profile:        MHVecg
Parent:         VA.MHV.PHR.documentReference
Id:             VA.MHV.PHR.ecg
Title:          "VA MHV PHR ECG"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing ECG/EKG (ClinicalProcedureTO) using FHIR API.
"""
// Most criteria come from the MHV documentReference
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
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].value ^short = "`ClinicalProcedureTO` | `.` | {ClinicalProcedureTO.id}"
* context.encounter 0..0
* content.attachment.creation 0..0
* custodian 0..0
* description 0..0

Mapping: Ecg-Mapping
Source:	MHVecg
Target: "ClinicalProcedureTO"
Title: "VIA to MHV-PHR"
* -> "ClinicalProcedureTO"
* category -> "`clinical-note` and Cardiology (LP29708-2)"
* status -> "`current`"
* subject -> "GetPatient()"
* identifier -> "{StationNbr} and {ClinicalProcedureTO.id}"
* date -> "ConvertDate(ClinicalProcedureTO.timestamp)"
* content.attachment.title -> "ClinicalProcedureTO.name"
* type.coding -> "LOINC#8601-7"
* context.related -> "GetLocation(ClinicalProcedureTO.facility.sitecode)"
* content.attachment.contentType -> "`text`"
* content.attachment.data -> "ClinicalProcedureTO.report"

/*
  <xs:complexType name="clinicalProcedureTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:siteTO"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="note" type="tns:noteTO"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="report" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/