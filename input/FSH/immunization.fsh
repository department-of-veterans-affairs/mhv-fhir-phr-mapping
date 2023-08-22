// MHV Immunization
Profile:        MHVimmunization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization
Id:             VA.MHV.PHR.immunization
Title:          "VA MHV PHR Immunization"
Description:    """
A profile on the Immunization that declares how MHV will expose PHR immunization.
"""
* status = #completed
* occurrence[x] only dateTime
* occurrence[x] 1..1 MS
* recorded 1..1 MS
* primarySource = false
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`ImmunizationTO` | `.` | {ImmunizationTO.id}"
* note 0..1 MS
* reaction.detail.display MS
* reaction.detail.display ^short = "may be `YES (DO NOT REPEAT THIS VACCINE)`"
* reaction.detail ^type.aggregation = #contained
* reaction.detail only Reference(MHVimmunizationReaction)
* location.display MS
* manufacturer MS
* lotNumber MS
* performer MS
* protocolApplied MS
* protocolApplied.series MS
* protocolApplied.doseNumberString MS
// not allowed
* route 0..0
* statusReason 0..0
* reportOrigin 0..0
* encounter 0..0
* expirationDate 0..0
* doseQuantity 0..0
* reasonCode 0..0
* reasonReference 0..0
* isSubpotent 0..0
* education 0..0
* programEligibility 0..0
* fundingSource 0..0
* reaction.detail.identifier 0..0
* reaction.date 0..0
* reaction.reported 0..0
* protocolApplied.authority 0..0
* protocolApplied.targetDisease 0..0
* protocolApplied.seriesDoses[x] 0..0
* protocolApplied.doseNumberPositiveInt 0..0



Mapping: Immunization-Mapping
Source:	MHVimmunization
Target: "ImmunizationTO"
Title: "VDIF to MHV-PHR"
* -> "ImmunizationTO"
* vaccineCode.text -> "ImmunizationTO.name"
* note.text -> "ImmunizationTO.comments"
* reaction.detail.display -> "if a ImmunizationTO.contraindicated=1 and no ImmunizationTo.reaction, then `YES (DO NOT REPEAT THIS VACCINE)`"
* reaction.detail.reference -> "contained Observation with ImmunizationTO.reaction"
* occurrenceDateTime -> "ImmunizationTO.administeredDate"
* recorded -> "ImmunizationTO.administeredDate"
* performer.actor -> "GetPractitioner(ImmunizationTO.administrator.[UserTO]) | `AP`"
* performer.actor -> "GetPractitioner(ImmunizationTO.orderedBy.[UserTO]) | `OP`"
* site.text -> "ImmunizationTO.anatomicSurface"
* vaccineCode.coding.code -> "ImmunizationTO.cptCode.id"
* vaccineCode.coding.display -> "ImmunizationTO.cptCode.name"
* location.display -> "ImmunizationTO.encounter.location.name"
* performer.actor -> "GetOrganization(ImmunizationTO.encounter.facility.name)"
* identifier -> "{StationNbr} and {ImmunizationTO.id}"
* lotNumber -> "ImmunizationTO.lotNumber"
* manufacturer -> "ImmunizationTO.manufacture"
* protocolApplied.series -> "translation of ImmunizationTO.series"
* protocolApplied.doseNumberString -> "ImmunizationTO.series"
* patient -> "patient"
* status -> "`completed`"
* primarySource -> "`false`"


/* 
  <xs:complexType final="extension restriction" name="immunizationTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="administrator" type="tns:userTO"/>
          <xs:element form="unqualified" minOccurs="0" name="administeredDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="anatomicSurface" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="comments" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="contraindicated" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="cptCode" type="tns:cptCodeTO"/>
          <xs:element form="unqualified" minOccurs="0" name="encounter" type="tns:visitTO"/>
          <xs:element form="unqualified" minOccurs="0" name="lotNumber" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="manufacturer" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="orderedBy" type="tns:userTO"/>
          <xs:element form="unqualified" minOccurs="0" name="shortName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dateTime" type="xs:dateTime"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="reaction" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="encounterProvider" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="orderingProvider" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="series" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/



Profile:        MHVimmunizationReaction
Parent: Observation
Id:             VA.MHV.PHR.immunizationReaction
Title:          "VA MHV PHR Immunization Reaction"
Description:    """
A profile for the contained Observation indicating an immunization reaction

- status final
- code.text ImmunizationTO.reaction
- valueCodeableConcept - SNOMED#401515003 Known present
"""
* status = #final
* code.text 1..1
* valueCodeableConcept = SCT#410515003
* category 0..0
* code.coding 0..0
* basedOn 0..0
* partOf 0..0
* subject 0..0
* focus 0..0
* encounter 0..0
* effectiveDateTime 0..0
* issued 0..0
* performer 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* note 0..0
* bodySite 0..0
* method 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* component 0..0

Mapping: ImmunizationReaction-Mapping
Source:	MHVimmunizationReaction
Target: "Immunization.reaction"
Title: "VDIF to MHV-PHR"
* -> "ImmunizationTO"
* status -> "`final`"
* code.text -> "ImmunizationTO.reaction"
* valueCodeableConcept -> "SCT#410515003"

