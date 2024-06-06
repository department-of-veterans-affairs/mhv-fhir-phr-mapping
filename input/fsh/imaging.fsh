Profile:        MHVimagingExam
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note
Id:             VA.MHV.PHR.imaging
Title:          "VA MHV PHR Radiology note"
Description:    """
A profile on the DiagnosticReport resource for MHV PHR exposing Radiology note (ImagingExamTO) using FHIR API.
"""
* ^extension[$fmm].valueInteger = 1
/* us-core requires
* status 1..1 MS
* category[us-core]
* code 1..1 MS
* subject 1..1
* encounter MS
* effectiveDateTime MS
* issued MS
* performer MS
* result MS
* media MS
* presentedForm MS
*/
* category[us-core] = LOINC#LP29684-5 "Radiology"
* identifier 1.. MS
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
* performer 1..1 MS
* performer ^short = "imagingLocation"
* performer ^type.aggregation = #contained
* performer only Reference(MHVorganization)
* resultsInterpreter 1..1 MS
* resultsInterpreter ^short = "provider"
* resultsInterpreter ^type.aggregation = #contained
* resultsInterpreter only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner)
* effectiveDateTime 1..1 MS 
* encounter.reference 0..0
* encounter.identifier MS
* basedOn MS
* basedOn ^short = "order"
* basedOn ^type.aggregation = #contained
* basedOn only Reference(VA.MHV.PHR.irOrder)
* conclusion MS
* presentedForm MS
* presentedForm.title MS
* presentedForm.creation MS 
* presentedForm.contentType MS 
* presentedForm.data MS
* issued 0..0
* specimen 0..0
* result 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0

Mapping: ImagingExam-Mapping
Source:	MHVimagingExam
Target: "ImagingExamTO"
Title: "VIA to mhv-fhir-phr"
* -> "ImagingExamTO"
* category -> "`LOINC#LP29684-5`"
* code.coding -> "CPT ImagingExamTO.type"
* code.text -> "ImagingExamTO.imagingType"
* status -> "`final` if not `entered-in-error`"
* resultsInterpreter -> "GetPractitioner(ImagingStudyTO.provider.[UserTO])"
* subject -> "GetPatient()"
* performer -> "GetLocation(ImagingExamTO.imagingLocation)"
* identifier[TOid] -> "{StationNbr} and {ImagingExamTO.id}"
* identifier[accessionNumber] -> "ImagingExamTO.accessionNum"
* identifier[casenum] -> "ImagingExamTO.casenum"
* effectiveDateTime -> "ConvertDate(ImagingExamTO.timestamp)"
* encounter.identifier -> "identifier.value = ImagingExamTO.encounterId"
* basedOn -> "Contained ServiceRequest(ImagingExamTO.order)"
* presentedForm.title -> "ImagingExamTO.name or ImagingExamTO.radiologyReportTo.title"
* presentedForm.creation -> "ConvertDate(ImagingExamTO.radiologyReportTO.timestamp)"
* presentedForm.contentType -> "`text/plain`"
* presentedForm.data -> "Base64Encode(ImagingStudyTO.radiologyReportTo.text)"
* conclusion -> "ImagingStudyTO.interpretation"


Profile:        MHVirOrder
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest
//Parent: ServiceRequest 
Id:             VA.MHV.PHR.irOrder
Title:          "VA MHV PHR ImagingExamTO.order"
Description:    """
A profile showing how ImagingExamTO.order (Order) using FHIR API to MyHealtheVet PHR.

One ServiceRequest holds one `ImagingExamTO.order`. Where multiple order elements exist, multiple ServiceRequest are used.
- `.subject` must be the patient from the DiagnosticReport
- code.text = {imagingExamTO.order.type.name1}
- status = `unknown` -- as we dont know - TODO
- intent = `order`
- category = SCT#363679005 Imaging
- not populating US-Core must support as we dont have the values
	- occurrence[x], authoredOn
- requester is the requesting provider
- facility is the requesting facility
- no other elements are populated
"""
* code 1..1 MS
* code.text ^short = "imagingExamTO.type.name1"
* category[us-core] = SCT#363679005 "Imaging"
* identifier ^short = "imagingExamTO.order.id"
* identifier 1..1
* status = #unknown
* intent = #order
* subject 1..1 MS
* requester ^short = "imagingExamTO.provider"
* requester only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner) // TODO: Should we harmonize this? Not clear how.
* performer ^short = "imagingExamTO.facility"
* performer only Reference(MHVorganization)
* encounter MS
* specimen 0..0
// Not these from us-core
* occurrence[x] 0..0
* authoredOn 0..0

// other things not used
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* replaces 0..0
* requisition 0..0
* priority 0..0
* doNotPerform 0..0
* orderDetail 0..0
* quantity[x] 0..0
* asNeeded[x] 0..0
* performerType 0..0
* locationCode 0..0
* locationReference 0..0
* reasonCode 0..0
* reasonReference 0..0
* insurance 0..0
* supportingInfo 0..0
* bodySite 0..0
* patientInstruction 0..0
* relevantHistory 0..0

Mapping: IR-Mapping-RadOrder
Source:	MHVirOrder
Target: "imagingExamTO.order"
Title: "VIA imagingExamTO Order to mhv-fhir-phr"
* -> "VIA imagingExamTO.order"
* code.text -> "imagingExamTO.order.type.name1"
* identifier -> "imagingExamTO.order.id"
* category -> "`Imaging`"
* status -> "`unknown`"
* intent -> "`order`"
* subject -> "patient"
* requester -> "GetPractitioner(imagingExamTO.provider)"
* performer -> "GetOrganization(imagingExamTO.facility)"



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

  <xs:complexType name="radiologyReportTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="accessionNumber" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="caseNumber" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="title" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="author" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="text" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="status" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="cptCode" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="clinicalHx" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="impression" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="imagingExamTO" type="tns:imagingExamTO"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>

*/