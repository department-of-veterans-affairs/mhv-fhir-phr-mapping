


Profile:        MHVallergyIntolerance
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance
//Parent: AllergyIntolerance
Id:             VA.MHV.PHR.allergyIntolerance
Title:          "VA MHV PHR Allergy and Intolerance"
Description:    """
A profile on the AllergyIntolerance resource for MHV PHR exposing Allergies using FHIR API.
"""
* ^extension[$fmm].valueInteger = 4
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  recordIdentifier 0..1 and
  TOid 0..1
* identifier[recordIdentifier].use = #official
* identifier[recordIdentifier].system ^short = "`http://va.gov/systems/` | {intoleranceCondition.recordIdentifier.namespaceId}"
* identifier[recordIdentifier].system obeys HDRid-startswithoid
* identifier[recordIdentifier].value ^short = "{intoleranceCondition.recordIdentifier.identity}"
* identifier[TOid].use = #usual
* identifier[TOid].system ^comment = "use when namespaceId is missing"
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].value ^short = "`AllergyTO` | `.` | {intoleranceCondition.recordIdentifier.identity}"
* clinicalStatus MS
* verificationStatus MS
* verificationStatus ^short = "May indicate entered-in-error"
* code.text 1..1
* code.coding 0..0
* patient 1..1 MS

* recordedDate MS
* category 0..* MS
* category from AllergyCategoryVS (required)
* recorder MS
* recorder.display MS
* recorder ^type.aggregation = #contained
* recorder.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named visn 0..1
* recorder.extension[visn].valueReference only Reference(Organization)
* recorder.extension[visn].valueReference ^type.aggregation = #contained
* reaction 0..* MS
* reaction.manifestation 1..1
* extension contains AllergyObservedHistoric named observedHistoric 0..1 MS

// reaction.manifestation is either VUID or SNOMED
* reaction.substance 0..0
* reaction.description 0..0
* reaction.onset 0..0
* reaction.severity 0..0
* reaction.note 0..0
* note 0..* MS
* note.text 1..1 MS
* note.time 0..1 MS
* note.author[x] 0..0
* criticality 0..0
* encounter 0..0
* asserter 0..0
* lastOccurrence 0..0
* reaction.substance 0..0
* reaction.description 0..0
* reaction.onset 0..0
* reaction.severity 0..0
* reaction.exposureRoute 0..0
* reaction.note 0..0

* onsetDateTime 0..0

ValueSet: AllergyCategoryVS
Title: "Subset of allergy intolerance category"
Description: "not all of them"
* ^experimental = false
* http://hl7.org/fhir/allergy-intolerance-category#food
* http://hl7.org/fhir/allergy-intolerance-category#medication
* http://hl7.org/fhir/allergy-intolerance-category#environment

Extension: AllergyObservedHistoric
Id: allergyObservedHistoric
Title: "Allergy Observed vs Historic"
Description: """
Maps to Vista 120.8 (Allergy) - (6) OBSERVED/HISTORICAL
'o' FOR OBSERVED;
'h' FOR HISTORICAL;
LAST EDITED:  DEC 07, 1990
DESCRIPTION:  
Indicates whether this allergy/adverse reaction has been observed by some personnel, or if it is historical data gathered about the patient.
RECORD INDEXES:  AHDR (#482)
"""
* ^context[+].type = #element
* ^context[=].expression = "AllergyIntolerance"
* value[x] only code
* valueCode from 	AllergyObservedHistoricVS (preferred)
* valueCode 1..1


CodeSystem:  AllergyObservedHistoricCS
Title: "Allergy Observed vs Historic CodeSystem"
Description:  "The codes for Allergy Observed vs Historic"
* ^caseSensitive = true
* ^experimental = false
* #o "OBSERVED" "observed by some personnel"
* #h "HISTORICAL" "historical data gathered about the patient"

ValueSet: AllergyObservedHistoricVS
Title: "Allergy Observed vs Historic ValueSet"
Description:  "The codes for Allergy Observed vs Historic"
* ^experimental = false
* codes from system AllergyObservedHistoricCS




Mapping: AllergyIntolerance-Mapping
Source:	MHVallergyIntolerance
Target: "intoleranceCondition"
Title: "HDR Allergy to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "HDR Allergy" "Vista FileMan"
* identifier -> "intoleranceCondition.recordIdentifer"
* code.text -> "intoleranceCondition.agent.code" "120.8-.02 REACTANT"
* patient -> "GetPatient(intoleranceCondition.patient)" "120.8-.01 PATIENT"
* clinicalStatus -> "`active` if not entered-in-error" "120.8-19 VERIFIED"
* verificationStatus -> "would indicate `entered-in-error`" "120.8-22 ENTERED IN ERROR"
* recordedDate -> "~intoleranceCondition.observationTime.literal" "120.8-9 HISTORICAL DATE/TIME OF EVENT"
* category -> "~intoleranceCondition.allergyType.code" "120.8-3.1 ALLERGY TYPE"
//* code.coding.display -> "intoleranceCondition.drugClass.code" "120.8-3 DRUG CLASSES"
* reaction.manifestation -> "intoleranceCondition.reaction.reaction" "120.8-10 REACTIONS"
* reaction.manifestation.text -> "intoleranceCondition.reaction.reaction.displayText"
* reaction.manifestation.coding.code -> "intoleranceCondition.reaction.reaction.code"
* reaction.manifestation.coding.system -> "if code is 7 digits, then system is VUID, else use SNOMED-CT system"
* note -> "intoleranceCondition.commentEvents" "120.8-26 COMMENTS"
* note.text -> "intoleranceCondition.commentEvents.comment"
* note.time -> "~intoleranceCondition.commentEvents.date.literal"
* extension[observedHistoric] -> "intoleranceCondition.informationSourceCategory" "120.8-6 OBSERVED/HISTORICAL"
* recorder.extension[visn] -> "Organization(intoleranceCondition.facilityIdentifier)"


Mapping: AllergyIntolerance-Old-Mapping
Source:	MHVallergyIntolerance
Target: "eVaultPHR"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map that includes only the elements available in eVault PHR"
* -> "HDR Allergy"
* identifier -> "intoleranceCondition.recordIdentifer"
* code.text -> "intoleranceCondition.agent.code"
* patient -> "GetPatient(intoleranceCondition.patient)"
* clinicalStatus -> "`active` if not entered-in-error"
* verificationStatus -> "would indicate `entered-in-error`"
* recordedDate -> "~intoleranceCondition.observationTime.literal"
* category -> "~intoleranceCondition.allergyType.code"
* reaction.manifestation -> "intoleranceCondition.reaction.reaction"
* reaction.manifestation.text -> "intoleranceCondition.reaction.reaction.displayText"
* note -> "intoleranceCondition.commentEvents"
* note.text -> "intoleranceCondition.commentEvents.comment"
* note.time -> "~intoleranceCondition.commentEvents.date.literal"
* extension[observedHistoric] -> "intoleranceCondition.informationSourceCategory"
* recorder.extension[visn] -> "Organization(intoleranceCondition.facilityIdentifier)"


/* 
<?xml version="1.0" encoding="UTF-8"?>
<!--
== Generated by hyperModel (www.XMLmodeling.com) Fri Dec 28 08:01:47 MST 2007
== Model: VHIM
== Package: Allergies
-->
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:allergies="Allergies" xmlns:basedatatypes="Basedatatypes" xmlns:common="Common" targetNamespace="Allergies" elementFormDefault="unqualified" attributeFormDefault="unqualified">
	<xsd:import namespace="Basedatatypes" schemaLocation="Basedatatypes.xsd"/>
	<xsd:import namespace="Common" schemaLocation="Common.xsd"/>
	<!-- ================================================== -->
	<!-- =====  Complex Type Definitions  -->
	<!-- ================================================== -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  AllergyCommentEvent  <<act, vHIMClass>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="AllergyCommentEvent">
		<xsd:sequence>
			<xsd:element name="date" type="basedatatypes:PointInTime" minOccurs="0"/>
			<xsd:element name="comments" type="xsd:string" minOccurs="0" maxOccurs="1000"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  DrugClass  <<vHIMClass, manufacturedMaterial>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="DrugClass">
		<xsd:sequence>
			<xsd:element name="code" type="basedatatypes:HL72CodedElement" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  IntoleranceCondition  <<vHIMClass, observation>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="IntoleranceCondition">
		<xsd:sequence>
			<xsd:element name="recordIdentifier" type="basedatatypes:HL72EntityIdentifier" minOccurs="0"/>
			<xsd:element name="patient" type="common:PatientLite" minOccurs="0"/>
			<xsd:element name="observationTime" type="basedatatypes:PointInTime" minOccurs="0"/>
			<xsd:element name="agent" type="basedatatypes:HL72CodedElementLite" minOccurs="0"/>
			<xsd:element name="allergyType" type="basedatatypes:HL72CodedElementLite" minOccurs="0"/>
			<xsd:element name="informationSourceCategory" type="basedatatypes:HL72CodedElementLite" minOccurs="0"/>
			<xsd:element name="status" type="xsd:string" minOccurs="0"/>
			<xsd:element name="reaction" type="allergies:ReactionObservationEvent" minOccurs="0" maxOccurs="1000"/>
			<xsd:element name="commentEvents" type="allergies:AllergyCommentEvent" minOccurs="0" maxOccurs="1000"/>
			<xsd:element name="drugClass" type="allergies:DrugClass" minOccurs="0" maxOccurs="1000"/>
			<xsd:element name="facilityIdentifier" type="basedatatypes:HL72OrganizationIdentifier" minOccurs="0"/>
			<xsd:element name="recordSource" type="basedatatypes:HL72FacilityIdentifier" minOccurs="0"/>
			<xsd:element name="recordVersion" type="xsd:int" minOccurs="0"/>
			<xsd:element name="recordUpdateTime" type="basedatatypes:PointInTime" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!--  ReactionObservationEvent  <<vHIMClass, observation>>  -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsd:complexType name="ReactionObservationEvent">
		<xsd:sequence>
			<xsd:element name="reaction" type="basedatatypes:HL72CodedElementLite" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>
</xsd:schema>

	<xsd:complexType name="HL72CodedElementLite">
		<xsd:sequence>
			<xsd:element name="code" type="xsd:string" minOccurs="0"/>
			<xsd:element name="displayText" type="xsd:string" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>

    	<xsd:complexType name="HL72EntityIdentifier">
		<xsd:sequence>
			<xsd:element name="identity" type="xsd:string"/>
			<xsd:element name="namespaceId" type="xsd:string" minOccurs="0"/>
			<xsd:element name="universalId" type="xsd:string" minOccurs="0"/>
			<xsd:element name="universalIdType" type="xsd:string" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>

    <xsd:complexType name="PointInTime">
		<xsd:sequence>
			<xsd:element name="literal" type="xsd:string" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>

	<xsd:complexType name="HL72OrganizationIdentifier">
		<xsd:sequence>
			<xsd:element name="identity" type="xsd:string" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>

	<xsd:complexType name="HL72FacilityIdentifier">
		<xsd:sequence>
			<xsd:element name="namespaceId" type="xsd:string" minOccurs="0"/>
			<xsd:element name="universalId" type="xsd:string" minOccurs="0"/>
			<xsd:element name="universalIdType" type="xsd:string" minOccurs="0"/>
		</xsd:sequence>
	</xsd:complexType>

	<xsd:complexType name="AllergyCommentEvent">
		<xsd:sequence>
			<xsd:element name="date" type="basedatatypes:PointInTime" minOccurs="0"/>
			<xsd:element name="comments" type="xsd:string" minOccurs="0" maxOccurs="1000"/>
		</xsd:sequence>
	</xsd:complexType>
*/
