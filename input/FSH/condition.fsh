


Profile:        MHVcondition
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns
//Parent: Condition
Id:             VA.MHV.PHR.condition
Title:          "VA MHV PHR problems"
Description:    """
A profile on the Condition resource for MHV PHR exposing Problems using FHIR API.

- The mock example maps best to VIA_v4.0.7_uat.wsdl. 
- Should be based on US-Core for Condition Resource
- Presume we will not expose those that are ProblemTO.removed = true

TODO:
- not clear if the ProblemTO.location is describing, is it evidence?
- what are the other values for ProblemTO.status
- not clear what ProblemTO.accuity.tag is
- not clear what ProblemTo.facility is
"""
* identifier 1..
//* code.text 1..1

Mapping: Condition-Mapping
Source:	MHVcondition
Target: "ProblemTO"
Title: "VDIF to MHV-PHR"
* -> "ProblemTO" "MHV PHR FHIR API"
* identifier -> "ProblemTO.id"
* code.text -> "ProblemTO.type.name"
* asserter -> "GetPractitioner(ProblemTO.observer)"
* clinicalStatus -> "ProblemTO.status | !ProblemTO.removed ? `#active` : todo"
* verificationStatus -> "ProblemTO.verified ? `#confirmed` : `#unconfirmed`"
* note -> "ProblemTO.comments + ProblemTO.comment"
* recordedDate -> "ProblemTO.modifiedDate"
* onsetDateTime -> "ProblemTO.onsetDate"
* abatementDateTime -> "ProblemTO.abatementDateTime"
* meta.lastUpdated -> "ProblemTO.timestamp"
* evidence.detail -> "~ProblemTO.location[hospitalLocationTO]"
* code.coding -> "ICD-9 # ProblemTO.icd"
* evidence.detail -> "~ProblemTO.serviceConnected"
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
*/
