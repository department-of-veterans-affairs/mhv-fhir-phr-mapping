// MHV Immunization
Profile:        MHVimmunization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization
Id:             VA.MHV.PHR.immunization
Title:          "VA MHV PHR Immunization"
Description:    """
A profile on the Immunization that declares how MHV will expose PHR immunization.

**Proposed mapping not yet approved for implementation**

* Derived off of US-Core Immunization
  * US-Core already requires: status, vaccineCode, patient, occurance[x], primarySource
* must point at the patient
* must have status of completed 
* must have identifier as cross reference to original source
* must have a code.text or code.coding from a valueset
  * code.coding should be a CVX but we don't have such.
  * Might have a CPT code
* must have a date (occuranceDateTime) the vaccine was administered from the UI
  * will also be used for recorded date
* must be indicated this data are not official record (primarySource=false)
* any reaction is recorded as a contained observation
* may have a comment note
* once created will have an id, versionId, lastUpdated.
* Not sure if text will be populated

Mapping from [ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-vdif-to-mhv-phr-immunizationto)

TODO Questions: 
- The given mock example aligns with both VIA_v4.0.7_uat.wsdl and mockey-mdws3-service.wsdl. The VIA schema has more elements. The mapping is only for elements that were in both and for which I had an example. Better mapping can be done if specific schema can be identifed, and more rich mock example.
- reaction appears to be a controlled vocabulary (e.g. FEVER), or is it a number (1-11 - convertReactionCode())?
- contraindicated -- appears to be a number (e.g. 0). No idea what the values might be or what they might mean
- id - presuming this is a persisted identifier we can cross-reference with
- series - this appears to be a controlled vocabulary (e.g. COMPLETE). What are the possible values and what do they mean?
- encounter - should we convert these to instances of FHIR Encounter?
- could have function that converts a defined set of ImmunizationTO.name values to proper codes. This might be an advanced feature.
"""
* status = #completed
* occurrence[x] only dateTime
* occurrence[x] 1..1
* recorded 1..1
* primarySource = false
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`ImmunizationTO` | `.` | {ImmunizationTO.id}"
* note 0..1
* reaction.detail ^type.aggregation = #contained
// not allowed
* route 0..0
* statusReason 0..0
* reportOrigin 0..0
* encounter 0..0
* location 0..0
* manufacturer 0..0
* lotNumber 0..0
* expirationDate 0..0
* site 0..0
* doseQuantity 0..0
* performer 0..0
* reasonCode 0..0
* reasonReference 0..0
* isSubpotent 0..0
* education 0..0
* programEligibility 0..0
* fundingSource 0..0
* protocolApplied 0..0

// TODO profile Contained Observation holding reaction


Mapping: Immunization-Mapping
Source:	MHVimmunization
Target: "ImmunizationTO"
Title: "VDIF to MHV-PHR"
* -> "ImmunizationTO" "MHV PHR FHIR API"
* vaccineCode.text -> "ImmunizationTO.name"
* note.text -> "ImmunizationTO.comments"
* reaction.detail -> "ImmunizationTO.reaction"
* occurrenceDateTime -> "ImmunizationTO.administeredDate"
* recorded -> "ImmunizationTO.administeredDate"
* performer.actor.display -> "GetPractitioner(ImmunizationTO.administrator.[UserTO])"
* site.text -> "ImmunizationTO.anatomicSurface"
* vaccineCode.coding.code -> "ImmunizationTO.cptCode.id"
* vaccineCode.coding.display -> "ImmunizationTO.cptCode.name"
* encounter -> "GetEncounter(ImmunizationTO.encounter.[VisitTO])"
* location.display -> "ImmunizationTO.encounter.location.name or ImmunizationTO.encounter.facility.name"
* identifier -> "{StationNbr} and {ImmunizationTO.id}"
* lotNumber -> "ImmunizationTO.lotNumber"
* manufacturer -> "ImmunizationTO.manufacture"
* performer.actor.display -> "GetPractitioner(ImmunizationTO.orderedBy.[UserTO])"
* protocolApplied.series -> "ImmunizationTO.series"
* patient -> "patient"
* status -> "`completed`"
* primarySource -> "`false`"


