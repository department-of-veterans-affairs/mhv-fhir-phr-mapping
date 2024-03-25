




Profile: MHVchSpecimen
Parent: Specimen
// Note no Specimen profile in US-Core
Id: VA.MHV.PHR.chSpecimen
Title: "VA MHV PHR HDR CH Specimen"
Description: """
A profile showing how the `labTestPromises.specimen` is mapped into a FHIR Specimen.

- This is usually a contained resource, contained in the Lab Report. The use of contained is for simplicity sake and to limit the need to manage Specimen resource instances
- must have a type 
  - `Specimen.type.text` <- `labTestPromises.specimen.specimenSource`
- should have a `collectedDateTime` derived from `labTestPromises.specimen.specimenTakenDate`
"""
* status = #available
* collection MS
* collection.collectedDateTime MS
* type 1..1 MS
* request 1..* MS
// nothing else
* receivedTime 0..0
* parent 0..0
* collection.collector 0..0
* collection.duration 0..0
* collection.quantity 0..0
* collection.method 0..0
* collection.bodySite 0..0
* collection.fastingStatus[x] 0..0
* processing 0..0
* container 0..0
* condition 0..0
* note 0..0
* identifier 0..0
* subject 0..0

Mapping: CH-Mapping-labTestPromiseSpecimen
Source: MHVchSpecimen
Target: "labTestPromises.specimen"
Title: "HDR labTestPromises.specimen to mhv-fhir-phr"
* -> "labTestPromises.specimen"
* status -> "`available`"
* type -> "labTestPromises.specimen.specimenSource"
* collection.collectedDateTime -> "ConvertDate(labTestPromises.specimen.specimenTakenDate)"
* request -> "Reference(ServiceRequest)"

Extension: Notes
Id: Notes
Title: "Notes"
Description: """
Notes
"""
* ^context[+].type = #element
* ^context[=].expression = "DiagnosticReport"
* value[x] only string
* valueString 1..1



Profile: MHVchReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.chReport
Title: "VA MHV PHR HDR Chem-Hem Report"
Description: """
Profile on DiagnosticReport for Chem-Hem lab report.
"""
* ^extension[$fmm].valueInteger = 1
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  Rid 1..1
* identifier[Rid].use = #usual
* identifier[Rid].system ^short = "DNS universalIdType: `urn:fdc:` + {universalID} + `:` + {namespaceId}"
* identifier[Rid].value ^short = "{labTestPromises.recordIdentifier.identity}"
* subject 1..1
* code.text 1..1 MS
* code.text = "CH"
* code.coding 0..0
/*
* category MS
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains LaboratorySlice 1..1
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
*/
* effectiveDateTime 1..1 MS
* issued 1..1 MS
* extension contains Notes named note 0..* MS
* specimen 1..1 MS
* specimen ^type.aggregation = #contained
* specimen only Reference(MHVchSpecimen)
* result MS
* result 0..*
* result ^type.aggregation = #contained
* result only Reference(MHVchTest)
* basedOn 1..* MS
* basedOn ^type.aggregation = #contained
* basedOn only Reference(MHVchOrder)
* performer 1..1 MS
* performer ^short = "recordSource"
* performer only Reference(MHVorganization)
* performer ^type.aggregation = #contained
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusion 0..0
* conclusionCode 0..0
* presentedForm 0..0


Mapping: CH-Mapping-labTestPromises
Source:	MHVchReport
Target: "labTestPromises"
Title: "HDR to mhv-fhir-phr"
* -> "HDR labTestPromises"
* category -> "`LAB`"
* category -> "all codes from contained labTests"
* status -> "`final`"
* subject -> "patient"
* effectiveDateTime -> "ConvertDate(labTestPromises.specimen.specimenTakenDate)"
* issued -> "ConvertDate(labTestPromises.reportCompleDate.literal)"
* code.text -> "`CH`, no coding"
* extension[note] -> "labTestPromises.labCommentEvents.comments"
* performer -> "GetOrganization(labTestPromises.recordSource)"
* result -> "Contained Observation(labTestPromises.labTests)"
* specimen -> "Contained Specimen (labTestPromises.specimen)"
* basedOn -> "Contained ServiceRequest (labTestPromises.orderedTestCode)"
//* meta.lastUpdated -> "ConvertDate(labTestPromises.recordUpdateTime)"


Profile:        MHVchOrder
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest
//Parent: ServiceRequest 
Id:             VA.MHV.PHR.chOrder
Title:          "VA MHV PHR CH labTests.orderedTestCode"
Description:    """
A profile showing how HDR labTests.orderedTestCode (Order) using FHIR API to MyHealtheVet PHR.

One ServiceRequest holds one `labTests.orderedTestCode`. Where multiple orderedTestCode elements exist, multiple ServiceRequest are used.
- `.subject` must be the patient from the DiagnosticReport
- code = {labTests.orderedTestCode}
- status = `unknown` -- as we dont know - TODO
- intent = `order`
- category = SCT#108252007 Laboratory procedure
- specimen = specimen
- not populating US-Core must support as we dont have the values
	- occurrence[x], authoredOn
- no other elements are populated
"""
* code 1..1 MS
* code ^short = "labTests.orderedTestCode"
* code.coding MS
* code.coding ^short = "code and alternateCode"
* code.text ^short = "displayText"
//* category[us-core] = SCT#108252007 "Laboratory procedure"
* status = #unknown
* intent = #order
* subject 1..1 MS
* requester ^short = "labTestPromises.labTestRequest.author"
//* requester only Reference(Practitioner)
* performer ^short = "labTestPromises.labTestRequest.orderingFacilityIdentifier"
* performer only Reference(MHVorganization)
* specimen 0..0
// Not these from us-core
* occurrence[x] 0..0
* authoredOn 0..0

// other things not used
* identifier 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* replaces 0..0
* requisition 0..0
* priority 0..0
* doNotPerform 0..0
* orderDetail 0..0
* quantity[x] 0..0
* encounter 0..0
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

Mapping: CH-Mapping-labOrder
Source:	MHVchOrder
Target: "labTestPromises.labTests.orderedTestCode"
Title: "HDR labTests Order to mhv-fhir-phr"
* -> "HDR labTests.orderedTestCode"
* code -> "orderedTestCode"
* code.text -> "displayText"
* code.coding -> "code and alternateCode"
* category -> "`Laboratory procedure`"
* status -> "`unknown`"
* intent -> "`order`"
* subject -> "patient"
* requester -> "GetPractitioner(labTestPromises.labTestRequest.author)"
* performer -> "GetOrganization(labTestPromises.labTestRequest.orderingFacilityIdentifier)"

Profile:        MHVchTest
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.chTest
Title:          "VA MHV PHR CH labTest.chemistryResults"
Description:    """
A profile showing how HDR labTests.chemistryResults will be exposed using FHIR API to MyHealtheVet PHR.

One Observation holds one `labTests.chemistryResults`
- This profile is based on [US-Core Lab](https://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)
	- category must have `http://terminology.hl7.org/CodeSystem/observation-category#laboratory`
- `.subject` must be the patient from the DiagnosticReport
- `valueInterpretation` -> `.interpretation` 
  - `L` -> http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
  - 'H' -> http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
- `observedStatus` (mock data has `F`, `C`, ) (? final vs preliminary ?)
- `testIdentifier` -> `.code` -- where LN is Loinc
- `referenceRange` -> `.referenceRange.text` -- dont try to break out further as there is little use of this value
- `labCommentEvents` -> `.note.text`
- value[x] either String or Quantity with units
- `observationValue` -> `.valueQuantity.value`
- `observationUnits.unit` -> `.valueQuantity.unit`
- `observationUnits.code` -> `.valueQuantity.code` - likely need to adjust some
- `observationUnits.codingSystem` -> `.valueQuantity.system`
- `performingOrganization` -> `.performer`
- `labCommentEvents` -> '.note`
- `effective[x]` is same as the DiagnosticReport
- `issued` is same as the DiagnosticReport
- `specimen` = specimen
- `basedOn` = ServiceRequest
- `ObservationStatus' -> [concept map translation](ConceptMap-VF-ChemistryResult-ObservationStatus.html) -> `.status`
"""
* code 1..1 MS
* code ^short = "testIdentifier"
* code.coding MS
* code.coding ^short = "testIdentifier.code"
* code.text ^short = "testIdentifier.displayText"
* category MS
* category ^short = "`laboratory`"
* interpretation MS
* interpretation.text MS
* interpretation.text ^short = "valueInterpreation"
* status MS
* status ^short = "observationStatus"
* performer MS
* performer ^short = "performingOrganization"
* performer only Reference(MHVorganization)
* value[x] only Quantity or string
* value[x] ^short = "observationValue"
* referenceRange MS
* referenceRange.text MS
* referenceRange.low 0..0
* referenceRange.high 0..0
* referenceRange.type 0..0
* referenceRange.appliesTo 0..0
* referenceRange.age 0..0
* note 0..* MS
* note ^short = "labCommentEvents"
* specimen MS
* specimen only Reference(MHVchSpecimen)
* basedOn 1..1 MS
* basedOn only Reference(MHVchOrder)
* effectiveDateTime MS
* issued MS

// other things not used
* identifier 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* dataAbsentReason 0..0
* bodySite 0..0
* method 0..0
* device 0..0
* derivedFrom 0..0
* component 0..0
* hasMember 0..0

Mapping: CH-Mapping-labTests
Source:	MHVchTest
Target: "labTestPromises.labTests"
Title: "HDR labTests to mhv-fhir-phr"
* -> "HDR labTests"
* code -> "testIdentifier"
* code.text -> "testIdentifier.displayText"
* code.coding -> "testIdentifier.code"
* status -> "~observationStatus map with VF-ChemistryResult-ObservationStatus()"
* interpretation.text -> "valueInterpretation"
* interpretation.coding -> "`L` -> http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L"
* interpretation.coding -> "`H` -> http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H"
* valueQuantity -> "observatonValue when quantity"
* valueString -> "observationValue when string"
* referenceRange -> "referenceRange"
* performer -> "GetOrganization(performingOrganization)"
* category -> "`laboratory`"
* subject -> "patient"
* specimen -> "Specimen (labTestPromises.specimen)"
* basedOn -> "ServiceRequest (labTestPromises.orderedTestCode)"
* note -> "labCommentEvents"
* effectiveDateTime -> "ConvertDate(labTestPromises.specimen.specimenTakenDate)"
* issued -> "ConvertDate(labTestPromises.reportCompleDate.literal)"

Instance:   VF-ChemistryResult-ObservationStatus
InstanceOf: ConceptMap
Title:      "Map between ChemistryResult ObservationStatus to FHIR Observation.status codes"
Description: "Map between ChemistryResult.ObservationStatus and FHIR Observation.status code."
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-ChemistryResult-ObservationStatus"
* name =  "VF_ChemistryResult_ObservationStatus"
* title = "ChemistryResult.ObservationStatus to Observation.status"
* experimental = false
* status = #active
* date = 2024-03-25
* publisher = "VA KBS"
* description = "Map between ChemistryResult.ObservationStatus and FHIR Observation.status code."
* purpose = "VF_ChemistryResult-ObservationStatus"
//* group.source = "VA"
* group.target = "http://hl7.org/fhir/observation-status"
* group.element[+].code = #C
* group.element[=].display = "CORRECTED RESULTS"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #corrected
* group.element[=].target.display = "Corrected"
* group.element[+].code = #F
* group.element[=].display = "FINAL RESULTS"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #final
* group.element[=].target.display = "Final"
* group.element[+].code = #Y
* group.element[=].display = "NO ORDER ON RECORD"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #unknown // or entered-in-error ?
* group.element[=].target.display = "Unknown"
* group.element[+].code = #R
* group.element[=].display = "NOT VERIFIED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #preliminary
* group.element[=].target.display = "Preliminary"
* group.element[+].code = #X
* group.element[=].display = "ORDER CANCELED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #cancelled
* group.element[=].target.display = "Cancelled"
* group.element[+].code = #O
* group.element[=].display = "ORDER RECEIVED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #registered
* group.element[=].target.display = "Registered"
* group.element[+].code = #P
* group.element[=].display = "PRELIMINARY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #preliminary
* group.element[=].target.display = "Preliminary"
* group.element[+].code = #S
* group.element[=].display = "PROCEDURE SCHEDULED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #registered
* group.element[=].target.display = "Registered"
* group.element[+].code = #A
* group.element[=].display = "SOME RESULTS AVAILABLE"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #unknown
* group.element[=].target.display = "Unknown"
* group.element[+].code = #I
* group.element[=].display = "SPECIMEN RECEIVED"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #preliminary
* group.element[=].target.display = "Preliminary"

/* Lab.xsd

<?xml version="1.0" encoding="UTF-8"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:basedatatypes="Basedatatypes" xmlns:common="Common" xmlns:lab="Lab" attributeFormDefault="unqualified" elementFormDefault="unqualified" targetNamespace="Lab">
	<xsd:import namespace="Basedatatypes" schemaLocation="Basedatatypes.xsd"/>
	<xsd:import namespace="Common" schemaLocation="Common.xsd"/>
	<!-- ================================================== -->
	<!-- =====  Complex Type Definitions  -->
	<!-- ================================================== -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  ChemistryResult  <<vHIMClass, observation>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="ChemistryResult">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="valueInterpretation" type="xsd:string"/>
			<xsd:element minOccurs="0" name="observationStatus" type="xsd:string"/>
			<xsd:element minOccurs="0" name="testIdentifier" type="basedatatypes:HL72CodedElementExtended"/>
			<xsd:element minOccurs="0" name="referenceRange" type="xsd:string"/>
			<xsd:element maxOccurs="1000" minOccurs="0" name="labCommentEvents" type="lab:LabCommentEvent"/>
			<xsd:element minOccurs="0" name="observationValue" type="xsd:string"/>
			<xsd:element minOccurs="0" name="observationUnits" type="basedatatypes:HL72CodedElementLite"/>
			<xsd:element minOccurs="0" name="performingOrganization" type="lab:PerformingOrganization"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  LabCommentEvent  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="LabCommentEvent">
		<xsd:sequence>
			<xsd:element maxOccurs="1000" minOccurs="0" name="comments" type="xsd:string"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  LabTest  <<vHIMClass, observation>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="LabTest">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="orderedTestCode" type="basedatatypes:HL72CodedElement"/>
			<xsd:element maxOccurs="1000" minOccurs="0" name="chemistryResults" type="lab:ChemistryResult"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  LabTestPromise  <<vHIMClass, act>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="LabTestPromise">
		<xsd:sequence>
			<xsd:element name="recordIdentifier" type="basedatatypes:HL72EntityIdentifier"/>
			<xsd:element name="patient" type="common:PatientLite"/>
			<xsd:element minOccurs="0" name="reportCompleteDate" type="basedatatypes:PointInTime"/>
			<xsd:element minOccurs="0" name="labSubscript" type="xsd:string"/>
			<xsd:element minOccurs="0" name="status" type="xsd:string"/>
			<xsd:element maxOccurs="1000" minOccurs="0" name="labCommentEvents" type="lab:LabCommentEvent"/>
			<xsd:element minOccurs="0" name="labTestRequest" type="lab:LabTestRequest"/>
			<xsd:element name="specimen" type="lab:Specimen"/>
			<xsd:element maxOccurs="1000" minOccurs="0" name="labTests" type="lab:LabTest"/>
			<xsd:element minOccurs="0" name="recordSource" type="basedatatypes:HL72FacilityIdentifier"/>
			<xsd:element name="recordVersion" minOccurs="0" type="xsd:int"/>
			<xsd:element name="recordUpdateTime" minOccurs="0" type="basedatatypes:PointInTime"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  LabTestRequest  <<vHIMClass, act>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="LabTestRequest">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="author" type="common:PractitionerLite"/>
			<xsd:element minOccurs="0" name="orderingFacilityIdentifier" type="basedatatypes:HL72OrganizationIdentifierExtended"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  PerformingOrganization  <<observation, vHIMClass>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="PerformingOrganization">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="identifier" type="basedatatypes:HL72OrganizationIdentifierExtended"/>
			<xsd:element minOccurs="0" name="address" type="basedatatypes:UsMailingAddress"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  Specimen  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="Specimen">
		<xsd:sequence>
			<xsd:element minOccurs="0" name="specimenSource" type="basedatatypes:HL72CodedElementExtended"/>
			<xsd:element minOccurs="0" name="specimenTakenDate" type="basedatatypes:PointInTime"/>
		</xsd:sequence>
	</xsd:complexType>
</xsd:schema>
*/