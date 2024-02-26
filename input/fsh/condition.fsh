


Profile:        MHVcondition
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns
//Parent: Condition
Id:             VA.MHV.PHR.condition
Title:          "VA MHV PHR problems"
Description:    """
A profile on the Condition resource for MHV PHR exposing Problems using FHIR API.
"""
* ^extension[$fmm].valueInteger = 3
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].value ^short = "`ProblemTO` | `.` | {ProblemTO.id}"
* code 1..1 MS
* code.text 1..1 MS
* code.coding 1..1 MS
// already limited to us-core patient * subject only Reference(Patient)
* recorder MS
* recorder only Reference(Practitioner)
* recorder ^type.aggregation = #contained
* recorder.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named location 0..1
* recorder.extension[location].valueReference only Reference(Location)
* recorder.extension[location].valueReference ^type.aggregation = #contained
* clinicalStatus from ConditionClinicalStatusVS (required)
* verificationStatus from ConditionVerificationVS (required)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* note MS
* recordedDate MS
* onset[x] only dateTime
* onsetDateTime MS
* abatement[x] only dateTime
* abatementDateTime MS
* evidence 0..0
* severity 0..0
* bodySite 0..0
* encounter 0..0
* asserter 0..0
* stage 0..0
* evidence 0..0


ValueSet: ConditionVerificationVS
Title: "Subset of condition verification status"
Description: "not all of them"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* http://terminology.hl7.org/CodeSystem/condition-ver-status#entered-in-error

ValueSet: ConditionClinicalStatusVS
Title: "Subset of condition clinical status"
Description: "Not all of them"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/condition-clinical#active
* http://terminology.hl7.org/CodeSystem/condition-clinical#inactive

Mapping: Condition-Mapping
Source:	MHVcondition
Target: "ProblemTO"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "ProblemTO" "Vista FileMan"
* identifier -> "{StationNbr} and {ProblemTO.id}"
* code.text -> "ProblemTO.type.name" "9000011-.01 DIAGNOSIS"
* code.coding -> "ProblemTO.icd" "9000011-.01 DIAGNOSIS"
* recorder -> "GetPractitioner(ProblemTO.observer)" "9000011-1.05 RESPONSIBLE PROVIDER"
* clinicalStatus -> "ProblemTO.status (Active, Inactive)" "9000011-.12 STATUS"
* verificationStatus -> "ProblemTO.verified (confirmed, unconfirmed, entered-in-error)" "9000011-1.02 CONDITION"
* note -> "ProblemTO.comments" "??? 9000011-.05 PROVIDER NARRATIVE"
* recordedDate -> "ProblemTO.timestamp" "9000011-1.09 DATE RECORDED"
* onsetDateTime -> "ProblemTO.onsetDate" "9000011-.13 DATE OF ONSET"
* abatementDateTime -> "ProblemTO.abatementDateTime" "9000011-1.07 DATE RESOLVED"
* recorder.extension[location] -> "~ProblemTO.facility" "9000011-.06 FACILITY"
* subject -> "patient" "9000011-.02 PATIENT NAME"
* category -> "`problem-list-item`"

Mapping: Condition-Old-Mapping
Source:	MHVcondition
Target: "ProblemTO"
Title: "eVault-PHR to MHV-PHR"
Description: "Informative map to include only the elements available in eVault PHR"
* -> "ProblemTO" "eVault"
* code.text -> "ProblemTO.type.name" "PROBLEM"
* recorder -> "GetPractitioner(ProblemTO.observer)" "PROVIDER"
* clinicalStatus -> "ProblemTO.status (Active, Inactive)" "STATUS"
* note -> "ProblemTO.comments" "COMMENTS"
* recordedDate -> "ProblemTO.modifiedDate" "EVENT_TIME"
* subject -> "patient"
* category -> "`problem-list-item`"




/* 
  <xs:complexType final="extension restriction" name="problemTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="removed" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="verified" type="xs:boolean"/>
          <xs:element form="unqualified" minOccurs="0" name="comments" type="tns:taggedNoteArray"/>
          <xs:element form="unqualified" minOccurs="0" name="acuity" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="status" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="providerNarrative" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="onsetDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="modifiedDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="resolvedDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="exposures" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="noteNarrative" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="priority" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="observer" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:taggedText"/>
          <xs:element form="unqualified" minOccurs="0" name="type" type="tns:observationTypeTO"/>
          <xs:element form="unqualified" minOccurs="0" name="comment" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="organizationalProperties" type="tns:taggedTextArray"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="location" type="tns:hospitalLocationTO"/>
          <xs:element form="unqualified" minOccurs="0" name="icd" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="serviceConnected" type="xs:boolean"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="observationTypeTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="category" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="shortName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataId" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataName" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="dataType" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

*/
