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
  * code.coding may should be a CVX but we don't have such.
  * Might have a CPT code
* must have a date (occuranceDateTime) the vaccine was administered from the UI
  * will also be used for recorded date
* must be indicated this data are not official record (primarySource=false)
* any reaction is recorded as a contained observation
* may have a comment note
* once created will have an id, versionId, lastUpdated.
* Not sure if text will be populated
"""
* status = #completed
//* vaccineCode from http://hl7.org/fhir/us/core/ValueSet/us-core-vaccines-cvx
// TODO is this set of codes the right one? It likely is more modern than the existing MHV list
* occurrence[x] only dateTime
* occurrence[x] 1..1
* recorded 1..1
* primarySource = false
* identifier 1..
* note 0..1
// US-Core already requires these
// 
* reaction.detail ^type.aggregation = #contained
// TODO characterize the contained Observations for the given reactions.
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

// profile Contained Observation holding reaction


Mapping: Immunization-Mapping
Source:	MHVimmunization
Target: "ImmunizationTO"
Title: "VIA/VDIF to MHV-PHR"
* -> "ImmunizationTO" "MHV PHR FHIR API"
* vaccineCode.text -> "ImmunizationTO.name"
* note.text -> "ImmunizationTO.comments"
* reaction.detail -> "ImmunizationTO.reaction"
* occurrenceDateTime -> "ImmunizationTO.administeredDate"
* recorded -> "ImmunizationTO.administeredDate"
* performer.actor.display -> "ImmunizationTO.administrator.[UserTO]"
* site.text -> "ImmunizationTO.anatomicSurvace"
* vaccineCode.coding.code -> "ImmunizationTO.cptCode.id"
* vaccineCode.coding.display -> "ImmunizationTO.cptCode.name"
* encounter -> "ImmunizationTO.encounter.[VisitTO]"
* location.display -> "ImmunizationTO.encounter.location.name or ImmunizationTO.encounter.facility.name"
* identifier -> "ImmunizationTO.id"
* lotNumber -> "ImmunizationTO.lotNumber"
* manufacturer -> "ImmunizationTO.manufacture"
* performer.actor.display -> "ImmunizationTO.orderedBy.[UserTO]"
* protocolApplied.series -> "ImmunizationTO.series"



