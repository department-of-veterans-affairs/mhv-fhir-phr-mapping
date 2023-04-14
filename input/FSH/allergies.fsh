


Profile:        MHVallergyIntolerance
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance
//Parent: AllergyIntolerance
Id:             VA.MHV.PHR.allergyIntolerance
Title:          "VA MHV PHR Allergy and Intolerance"
Description:    """
A profile on the AllergyIntolerance resource for MHV PHR exposing Allergies using FHIR API.

- The mock example maps to [intoleranceConditions](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates/MHVIntoleranceConditionRead40011/template/MHVIntoleranceConditionRead40011.xsd) schema. 
- Should be based on US-Core for AllergyIntolerance Resource profile
- a `clinicalStatus` of the allergy (e.g.,active or resolved)
  - Given that intoleranceCondition.status is unclear; will presume we only see `active`
  - set to `active`
- a `code` which tells you what the patient is allergic to
  - at least `code.text`
  - would be good to have a coding, but there does not appear to be any source for that
- a patient
- category derived from .allergyType (multiple codes are multiple category)
  - `D` -> #medication
  - `F' -> #food
  - `O` -> #environment
- presume if `drugClass` is indicated then the `category` should be #medication

TODO:
- unclear
  - `intoleranceCondition.status` is always `F` in the mock data I have been given, so unclear what the meaning is. From the name 'status' I presume this is the status of the allergy, but unclear.
  - will presume we only get `active`
  - no clear place to record `informationSourceCategory`, `recordSource`, or `facilityIdentifer`
  - reaction.reaction.code seems to be a number, but I can't find a codeSystem with these numbers.
    - would be good to have SNOMED-CT, but this does not seem to be SNOMED
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  recordIdentifier 1..
* identifier[recordIdentifier].use = #usual
* identifier[recordIdentifier].system ^short = "{intoleranceCondition.recordIdentifier.namespaceId}"
* identifier[recordIdentifier].value ^short = "{intoleranceCondition.recordIdentifier.identity}"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* code.text 1..1
* patient 1..1 MS
* onsetDateTime MS
* category 0..* MS
* recorder MS
* reaction 0..* MS
* reaction.manifestation 1..1
* reaction.substance 0..0
* reaction.description 0..0
* reaction.onset 0..0
* reaction.severity 0..0
* reaction.note 0..0
* note 0..* MS
* note.text 1..1 MS
* note.time 0..1 MS
* note.author[x] 0..0
* meta.lastUpdated MS



Mapping: AllergyIntolerance-Mapping
Source:	MHVallergyIntolerance
Target: "intoleranceCondition"
Title: "VHIM Allergy to MHV-PHR"
* -> "VHIM Allergy" "MHV PHR FHIR API"
* identifier -> "intoleranceCondition.recordIdentifer"
* code.text -> "intoleranceCondition.agent.code"
* patient -> "GetPatient(intoleranceCondition.patient)"
* clinicalStatus -> "`active`"
* onsetDateTime -> "~intoleranceCondition.observationTime.literal"
* category -> "~intoleranceCondition.allergyType.code"
* category -> "intoleranceCondition.drugClass.code"
* recorder -> "getFacility(intoleranceCondition.facilityIdentifier.identity)"
* reaction.manifestation -> "intoleranceCondition.reaction.reaction"
* reaction.manifestation.text -> "intoleranceCondition.reaction.reaction.displayText"
* reaction.manifestation.coding.code -> "intoleranceCondition.reaction.reaction.code"
* note -> "intoleranceCondition.commentEvents"
* note.text -> "intoleranceCondition.commentEvents.comment"
* note.time -> "~intoleranceCondition.commentEvents.date.literal"
* meta.lastUpdated -> "intoleranceCondition.recordUpdateTime"


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
