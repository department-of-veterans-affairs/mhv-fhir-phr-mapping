Profile:        MHVimagingExam
Parent:         VA.MHV.PHR.documentReference
Id:             VA.MHV.PHR.imaging
Title:          "VA MHV PHR Radiology"
Description:    """
A profile on the DocumentReference resource for MHV PHR exposing Radiology note (ImagingExamTO) using FHIR API.
"""
* ^extension[$fmm].valueInteger = 1
// Most criteria come from the MHV documentReference
* type.coding 1..2
* type.coding ^slicing.discriminator.type = #pattern
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains
  LO 1..1 and
  CP 0..1
* type.coding[LO].system = LOINC
* type.coding[LO].code 1..1
* type.coding[LO] = LOINC#18748-4
* type.coding[CP].system = CPT
* type.coding[CP].code 1..1
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1 and
  accessionNumber 0..* and
  casenum 0..* 
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`ImagingExamTO` | `.` | {ImagingExamTO.id}"
* identifier[accessionNumber].use = #official
* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* identifier[accessionNumber].system obeys TOid-startswithoid
* identifier[accessionNumber].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[accessionNumber].value ^short = "`Accession` | `.` | {ImagingExamTO.accessionNum}"
* identifier[casenum].use = #secondary
* identifier[casenum].system obeys TOid-startswithoid
* identifier[casenum].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[casenum].value ^short = "`CaseNum` | `.` | {ImagingExam.casenum}"


Mapping: ImagingExam-Mapping
Source:	MHVimagingExam
Target: "ImagingExamTO"
Title: "VIA to mhv-fhir-phr"
* -> "ImagingExamTO"
* category -> "`clinical-note`"
* type.coding[LO] -> "LOINC#18748-4"
* type.coding[CP] -> "ImagingExamTO.type"
* status -> "`current` or derived from ImagingExamTO.status"
* docStatus -> "`final` or derived from ImagingExamTO.radiologyReportTO.status"
* author -> "GetPractitioner(ImagingStudyTO.provider.[UserTO])"
* subject -> "GetPatient()"
* custodian -> "GetLocation(ImagingExamTO.imagingLocation)"
* identifier[TOid] -> "{StationNbr} and {ImagingExamTO.id}"
* identifier[accessionNumber] -> "ImagingExamTO.accessionNum"
* identifier[casenum] -> "ImagingExamTO.casenum"
* date -> "ConvertDate(ImagingExamTO.timestamp)"
* context.encounter -> "identifier.value = ImagingExamTO.encounterId"
* context.related -> "identifier.value = ImagingExamTO.order.id"
* context.related -> "identifier.display = ImagingExamTO.order.type.name1"
* content.attachment.title -> "ImagingExamTO.name or ImagingExamTO.radiologyReportTo.title"
* content.attachment.creation -> "ConvertDate(ImagingExamTO.radiologyReportTO.timestamp)"
* content.attachment.contentType -> "`text/plain`"
* content.attachment.data -> "Base64Encode(ImagingStudyTO.radiologyReportTo.text)"
* description -> "ImagingStudyTO.interpretation"

/*
  <xs:complexType name="imagingExamTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="accessionNum" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="casenum" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="encounterId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:siteTO"/>
          <xs:element form="unqualified" minOccurs="0" name="hasImages" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="imagingType" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="interpretation" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="imagingLocation" type="tns:hospitalLocationTO"/>
          <xs:element form="unqualified" maxOccurs="unbounded" minOccurs="0" name="modifiers" type="tns:cptCodeTO"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="order" type="tns:orderTO"/>
          <xs:element form="unqualified" minOccurs="0" name="provider" type="tns:userTO"/>
          <xs:element form="unqualified" minOccurs="0" name="radiologyReportTO" type="tns:radiologyReportTO"/>
          <xs:element form="unqualified" minOccurs="0" name="reportId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="status" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="type" type="tns:cptCodeTO"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/