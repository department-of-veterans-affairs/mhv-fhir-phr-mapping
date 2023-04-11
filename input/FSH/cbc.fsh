Profile: MHVcbcSpecimen
Parent: Specimen
Id: VA.MHV.PHR.cbcSpecimen
Title: "VA MHV PHR HDR CBC Specimen"
Description: """
A profile showing how the `labTestPromises.specimen` is mapped into a FHIR Specimen.

- This is usually a contained resource, contained in the Lab Report. The use of contained is for simplicity sake and to limit the need to manage Specimen resource instances
- must have a type 
  - `Specimen.type.text` <- `labTestPromises.specimen.specimenSource`
- should have a `collectedDateTime` derived from `labTestPromises.specimen.specimenTakenDate`
"""
* receivedTime 0..0
* parent 0..0
* request 0..0
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
* collection MS
* collection.collectedDateTime MS
* type 1..1 MS

Mapping: CBC-Mapping-labTestPromiseSpecimen
Source: MHVcbcSpecimen
Target: "labTestPromises.specimen"
Title: "HDR labTestPromises.specimen to MHV-PHR"
* -> "labTestPromises.specimen" "MHV PHR FHIR API"
* status -> "`available`"
* type.text -> "labTestPromises.specimen.specimenSource"
* collection.collectedDateTime -> "ConvertDate(labTestPromises.specimen.specimenTakenDate)"


Profile: MHVcbcReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.cbcReport
Title: "VA MHV PHR HDR CBC Report"
Description: """
A profile showing how `labTestPromise` is mapped into a FHIR `DiagnosticReport`, `Observation`, and `Specimen`. Where the `labTestPromise` only has `labSubscript` of `CH` (presumed CBC).
- LOINC#58410-2 'CBC panel - Blood by Automated count'

The given example aligns with the `Lab.xsd` schema. 

The `labTestPromises` is mapped onto this FHIR `DiagnosticReport` for CBC laboratory reporting. The mapping to [HDR labTestPromise](StructureDefinition-VA.MHV.PHR.cbcReport-mappings.html#mappings-for-hdr-to-mhv-phr-labtestpromises)

The `labTestPromises.labTests` are each recorded as a FHIR [Observation for CBC result](StructureDefinition-VA.MHV.PHR.cbcTest.html) that is contained in the DiagnosticReport. The map to [HDR cbcTestPromise](StructureDefinition-VA.MHV.PHR.cbcTest-mappings.html#mappings-for-hdr-labtests-to-mhv-phr-labtestpromises-labtests). 

The `labTestPromises.specimen` is mapped into a FHIR [Specimen](StructureDefinition-VA.MHV.PHR.cbcSpecimen.html) resource that is contained in the DiagnosticReport. The map to [HDR Specimen](StructureDefinition-VA.MHV.PHR.cbcSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-phr-labtestpromises-specimen).

The use of contained means that we do not need to de-duplicate the lab tests or specimen.

TODO determine impact of the new LOINC report on this topic https://loinc.org/file-access/?download-id=22762 the impact has not been assessed. I followed FHIR US-Core.

This profile is based on [US-Core DiagnosticReport profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-lab.html) and lab Observations. Following the [US-Core example for CBC](https://www.hl7.org/fhir/us/core/DiagnosticReport-cbc.html)
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  Rid 1..1
* identifier[Rid].use = #usual
* identifier[Rid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[Rid].value ^short = "`recordIdentifier` | `.` | {labTestPromises.recordIdentifier.identity}"
* subject 1..1
* code 1..1 MS
* code.text = "CH"
* code.coding = LOINC#58410-2 "CBC panel - Blood by Automated count"
* effectiveDateTime MS
* issued MS
* conclusion MS
* presentedForm MS
* specimen ^type.aggregation = #contained
* specimen only Reference(MHVcbcSpecimen)
* result ^type.aggregation = #contained
* result only Reference(MHVcbcTest)
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0


Mapping: CBC-Mapping-labTestPromises
Source:	MHVcbcReport
Target: "labTestPromises"
Title: "HDR to MHV-PHR"
* -> "HDR labTestPromises" "MHV PHR FHIR API"
* category -> "`laboratory`"
* status -> "`final`"
* subject -> "patient"
* effectiveDateTime -> "ConvertDate(labTestPromises.reportCompleDate.literal)"
* issued -> "ConvertDate(labTestPromises.reportCompleDate.literal)"
* code -> "labTestPromises.labSubscript"
* code.coding -> "LOINC#58410-2 'CBC panel - Blood by Automated count'"
* conclusion -> "labTestPromises.labCommentEvents[0].comments"
* presentedForm.title -> "labTestPromises.labCommentEvent[1+].comments - when more than one comment"
* performer -> "GetPractitioner(labTestPromises.labTestRequest.author)"
* performer -> "GetLocation(labTestPromises.labTestRequest.orderingFacilityIdentifier)"
* result -> "Contained Observation(labTestPromises.labTests.)"
* specimen -> "Contained Specimen (labTestPromises.specimen)"


Profile:        MHVcbcTest
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.cbcTest
Title:          "VA MHV PHR CBC labTest"
Description:    """
A profile showing how HDR labTests will be exposed using FHIR API to MyHealtheVet PHR.

One Observation holds one `labTests`
- This profile is based on [US-Core Lab](https://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)
- `orderedTestCode -> `.category`
- 'chemistryResults`
  - `valueInterpretation` -> `.interpretation` (mock data has `L`, `H`, or absent) (? low, high, normal ?)
  - `observedStatus` (mock data has `F`, `C`, ) (? final vs preliminary ?)
  - `testIdentifier` -> `.code`
  - `referenceRange` -> `.referenceRange`
  - `labCommentEvents` -> `.note.text`
  - `observationValue` -> `.valueQuantity.value`
  - `observationUnits.unit` -> `.valueQuantity.unit`
  - `observationUnits.code` -> `.valueQuantity.code` - likely need to adjust some
  - `observationUnits.codingSystem` -> `.valueQuantity.system`
  - `performingOrganization` -> `.performer`
- given this is contained in the DiagnosticReport, then 
  - no `.subject` is populated
  - effective[x] is presumed from the DiagnosticReport
  - issued is presumed from the DiagnosticReport
  - specimen is presumed from the DiagnosticReport
"""
* code 1..1 MS
* code ^short = "testIdentifier"
* code.coding ..1 MS
* code.coding ^short = "LabTestTO.loinc"
* category MS
* category ^short = "orderedTestCode"
* interpretation MS
* interpretation ^short = "valueInterpreation"
* status MS
* status ^short = "observedStatus"
* performer MS
* performer ^short = "performingOrganization"
* value[x] only Quantity
* valueQuantity 1..1
* value[x] ^short = "observationValue"
* note 0..* MS
* note ^short = "labCommentEvents"

// given this is contained in the DiagnosticReport
//* subject 0..0 
* effective[x] 0..0
* issued 0..0
* specimen 0..0

// other things not used
* identifier 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* dataAbsentReason 0..0
* bodySite 0..0
* method 0..0
* device 0..0
* derivedFrom 0..0
* component 0..0

Mapping: CBC-Mapping-labTests
Source:	MHVcbcTest
Target: "labTestPromises.labTests"
Title: "HDR labTests to MHV-PHR"
* -> "HDR labTests" "MHV PHR FHIR API"
* code -> "testIdentifier"
* category -> "orderedTestCode"
* status -> "observedStatus"
* interpretation -> "valueInterpretation"
* valueQuantity -> "observatonValue"
* performer -> "GetOrganization(performingOrganization)"
* category -> "`laboratory`"

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