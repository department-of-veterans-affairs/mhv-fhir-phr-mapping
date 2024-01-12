// MHV Immunization
Profile:        MHVimmunization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization
Id:             VA.MHV.PHR.immunization
Title:          "VA MHV PHR Immunization"
Description:    """
A profile on the Immunization that declares how MHV will expose PHR immunization.
"""
* ^extension[$fmm].valueInteger = 4
* meta.extension contains http://hl7.org/fhir/StructureDefinition/lastSourceSync named lastSourceSync 0..1 MS
//* status = #completed
* status MS
* status ^short = "May indicate entered-in-error"
* occurrence[x] only dateTime
* occurrence[x] 1..1 MS
* recorded MS
* vaccineCode.text 1..1
* primarySource.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named dar 1..1
* primarySource.extension[dar].valueCode = #unknown
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
* reaction.detail.display 0..0
* reaction.detail ^type.aggregation = #contained
* reaction.detail only Reference(MHVimmunizationReaction or Observation)
* location MS
* location ^type.aggregation = #contained
* location only Reference(MHVlocation or Location)
* location.display 0..0
* performer MS
* performer.actor ^type.aggregation = #contained
* performer.actor.display 0..0
* performer ^slicing.discriminator.type = #pattern
* performer ^slicing.discriminator.path = "function"
* performer ^slicing.rules = #closed
* performer contains
  AP 0..* and
  @default 0..*
* performer[AP].function = http://terminology.hl7.org/CodeSystem/v2-0443#AP
* performer[AP].actor only Reference(MHVpractitioner or Practitioner)
* performer[@default].function 0..0
* performer[@default].actor only Reference(MHVorganization or Organization)
* performer.function MS
* protocolApplied MS
* protocolApplied.series MS
* protocolApplied.doseNumberString MS
// not allowed
* site 0..0
* lotNumber 0..0
* manufacturer 0..0
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
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "ImmunizationTO" "Vista FileMan"
* vaccineCode.text -> "ImmunizationTO.name" "9000010.11-.01 IMMUNIZATION"
* note.text -> "ImmunizationTO.comments" "9000010.11-.1101 REMARKS"
* reaction.detail.reference -> "contained Observation with ImmunizationTO.reaction" "9000010.11-.06 REACTION"
* occurrenceDateTime -> "ImmunizationTO.administeredDate" "9000010.11-.1201 EVENT DATE AND TIME"
* recorded -> "ImmunizationTO.dateTime" "9000010.11-.1205 DATE/TIME RECORDED"
* performer -> "GetPractitioner(ImmunizationTO.encounter.provider) | `AP`"
//* performer -> "GetPractitioner(ImmunizationTO.administrator.[UserTO]) | `AP`"
//* performer -> "GetPractitioner(ImmunizationTO.orderedBy.[UserTO]) | `OP`"
//* site.text -> "ImmunizationTO.anatomicSurface" "9000010.11-.09 INJECTION SITE"
* vaccineCode.coding.code -> "ImmunizationTO.cptCode.id" "9000010.11-.13 CREATED BY V CPT ENTRY"
* vaccineCode.coding.display -> "ImmunizationTO.cptCode.name"
* location -> "GetLocation(ImmunizationTO.encounter.location)"
* performer -> "GetOrganization(ImmunizationTO.encounter.facility)"
* identifier -> "{StationNbr} and {ImmunizationTO.id}"
//* lotNumber -> "ImmunizationTO.lotNumber" "9000010.11-.05 LOT"
//* manufacturer -> "ImmunizationTO.manufacture"
* protocolApplied.series -> "translation of ImmunizationTO.series" "9000010.11-.04 SERIES"
* protocolApplied.doseNumberString -> "number from ImmunizationTO.series" "9000010.11-.04 SERIES"
* patient -> "patient" "9000010.11-.02 PATIENT"
* status -> "`completed`"
* primarySource -> "Data Absent Reason - unknown"

Mapping: Immunization-Old-Mapping
Source:	MHVimmunization
Target: "eVaultPHR"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map that includes only the elements available in eVault PHR"
* -> "ImmunizationTO"
* location -> "GetLocation(ImmunizationTO.encounter.location)" "9000010.11-.1215 ORDERING LOCATION"
* vaccineCode.text -> "ImmunizationTO.name" "9000010.11-.01 IMMUNIZATION"
* note.text -> "ImmunizationTO.comments"
* patient -> "patient"
* status -> "`completed`"
* reaction.detail.reference -> "contained Observation with ImmunizationTO.reaction" "9000010.11-.06 REACTION"
* occurrenceDateTime -> "ImmunizationTO.administeredDate" "9000010.11-.1201 EVENT DATE AND TIME"
* performer -> "GetOrganization(ImmunizationTO.encounter.facility)"



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
- effectiveDateTime from ImmunizationTO.administeredDate if known
- subject - the patient
- performer - migth come from ImmunizationTO.encounter.provider but can't have contained resources in a resource that will be contained. 
"""
* status = #final
* code.text 1..1
* valueCodeableConcept 1..1
* valueCodeableConcept = SCT#410515003
* effectiveDateTime MS
//* performer MS
* subject MS
* category 0..0
* code.coding 0..0
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
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
Title: "VIA to mhv-fhir-phr"
* -> "ImmunizationTO"
* status -> "`final`"
* code.text -> "ImmunizationTO.reaction"
* valueCodeableConcept -> "SCT#410515003"

