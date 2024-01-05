


Profile:        MHVcondition
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns
//Parent: Condition
Id:             VA.MHV.PHR.condition
Title:          "VA MHV PHR problems"
Description:    """
A profile on the Condition resource for MHV PHR exposing Problems using FHIR API.
"""
* ^extension[$fmm].valueInteger = 2
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
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus from ConditionVerificationVS (required)
* note MS
* recordedDate MS
* onset[x] only dateTime
* onsetDateTime MS
* abatement[x] only dateTime
* abatementDateTime MS
* evidence.detail MS
* evidence.detail ^type.aggregation = #contained
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* severity 0..0
* bodySite 0..0
* encounter 0..0
* asserter 0..0
* stage 0..0
* evidence.code 0..0


ValueSet: ConditionVerificationVS
Title: "Subset of condition verification status"
Description: "not all of them"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed



Mapping: Condition-Mapping
Source:	MHVcondition
Target: "ProblemTO"
Title: "VIA to mhv-fhir-phr"
Description: "Informative map to available elements in MHV FHIR API"
* -> "ProblemTO" "Vista FileMan"
* identifier -> "{StationNbr} and {ProblemTO.id}"
* code.text -> "ProblemTO.type.name" "9000011-1.01 PROBLEM"
* recorder -> "GetPractitioner(ProblemTO.observer)" "??? 9000011-1.03 ENTERED BY,  -1.04 RECORDING PROVIDER"
* clinicalStatus -> "ProblemTO.status==ACTIVE & !ProblemTO.removed ? `#active` : `#inactive`" "9000011-.12 STATUS"
* verificationStatus -> "ProblemTO.verified ? `#confirmed` : `#unconfirmed`" "???"
* note -> "ProblemTO.comments + ProblemTO.comment" "9000011-.05 PROVIDER NARRATIVE"
* recordedDate -> "ProblemTO.modifiedDate" "9000011-1.09 DATE RECORDED"
* onsetDateTime -> "ProblemTO.onsetDate" "9000011-.13 DATE OF ONSET"
* abatementDateTime -> "ProblemTO.abatementDateTime" "9000011-1.07 DATE RESOLVED"
//* meta.lastUpdated -> "ProblemTO.timestamp"
* evidence.detail -> "~ProblemTO.location[hospitalLocationTO]" "??? 9000011-.06 FACILITY, 1.08 CLINIC"
* code.coding -> "ICD-9 # ProblemTO.icd" "9000011-.01 DIAGNOSIS"
* evidence.detail -> "~ProblemTO.serviceConnected" "9000011-1.1 SERVICE CONNECTED"
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
* clinicalStatus -> "ProblemTO.status==ACTIVE & !ProblemTO.removed ? `#active` : `#inactive`" "STATUS"
* note -> "ProblemTO.comments" "COMMENTS"
* recordedDate -> "ProblemTO.modifiedDate" "EVENT_TIME"
* subject -> "patient"
* category -> "`problem-list-item`"
//"ProblemTO.Acuity.text" "ACUITY"



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
*/