///////////////////////////////////////////////// Mostly Common DiagnosticReport Profile (differnet maps)

RuleSet: CommonLabProfile
* ^extension[$fmm].valueInteger = 2
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1 and
  casenum 0..*
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabReportTO` | `.` | {LabReportTO.id}"
* identifier[casenum].use = #secondary
* identifier[casenum].system obeys TOid-startswithoid
* identifier[casenum].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[casenum].value ^short = "`CaseNum` | `.` | {LabReportTO.casenum}"
* subject 1..1
* code 1..1 MS
* code.text 1..1 MS
* code.coding ..1 MS
* effectiveDateTime MS
* issued MS
* presentedForm MS
* presentedForm.contentType = #text/plain
* presentedForm.language 0..0
* presentedForm.data 1..1
* presentedForm.url 0..0
* presentedForm.size 0..0
* presentedForm.hash 0..0
* presentedForm.title 0..0
* presentedForm.creation 0..0
* specimen MS
* specimen ^type.aggregation = #contained
* specimen only Reference(MHVlabSpecimen)
* result MS
* result ^type.aggregation = #contained
* result only Reference(MHVlabTest)
* performer MS
* performer ^type.aggregation = #contained
* performer.display 0..0
* basedOn 0..0
* basedOn.reference 0..0
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0
* conclusion 0..0


Profile: MHVMBlabReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.MBlabReport
Title: "VA MHV PHR MB Lab Report"
Description: """
A profile showing how Microbiology LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.
"""
* insert CommonLabProfile
* code.coding = LOINC#18725-2
* category contains MBLabSlice 0..1
* category[MBLabSlice] = http://terminology.hl7.org/CodeSystem/v2-0074#MB
* category[MBLabSlice] 1..1
* performer only Reference(MHVorganization or http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner)

Profile: MHVSPlabReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.SPlabReport
Title: "VA MHV PHR SP Lab Report"
Description: """
A profile showing how SP LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.
"""
* insert CommonLabProfile
* code.coding = LOINC#11526-1
* category contains SPLabSlice 1..1
* category[SPLabSlice] = http://terminology.hl7.org/CodeSystem/v2-0074#SP
// should be KindLabReportVS, but don't yet have examples and this binding is more clear
* category[SPLabSlice] 1..1
* performer only Reference(MHVorganization)

ValueSet: LabReportVS
Title: "Known Lab Report types"
Description: "Lab Report types"
* ^experimental = false
* LOINC#18725-2 "Microbiology studies (set)"
* LOINC#11526-1 "Pathology study"

ValueSet: KindLabReportVS
Title: "Kind of Lab Report"
Description: "Specific kind of Pathology or Microbiology mapped from labReportTO/type"
* ^experimental = false
* http://terminology.hl7.org/CodeSystem/v2-0074#SP
* http://terminology.hl7.org/CodeSystem/v2-0074#CP
* http://terminology.hl7.org/CodeSystem/v2-0074#OTH
* SCT#73512001 "Electron microsopic study (procedure)"
* http://terminology.hl7.org/CodeSystem/v2-0074#MB

Mapping: Lab-Mapping-MBLabReportTO
Source:	MHVMBlabReport
Target: "LabReportTO"
Title: "VIA to mhv-fhir-phr"
* -> "LabReportTO"
* category -> "`LAB`"
* category -> "kind of lab"
* category -> "plus all Observation codes"
* status -> "`final`"
* subject -> "patient"
* result -> "Contained Observation(LabResultTO)"
* performer -> "labReportTO/text {provider:}"
* identifier[casenum] -> "LabReportTO.caseNumber"
* presentedForm.data -> "base64(LabReportTO.text)"
* presentedForm.contentType -> "`text/plain`"
* performer -> "GetOrganization(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier[TOid] -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(specimen/collectionDate)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "labReportTO/text {date completed:}"
* issued -> "labReportTO/text {final report =>}"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -> LOINC"

Mapping: Lab-Mapping-MBLabSpecimenTO
Source: MHVlabSpecimen
Target: "LabSpecimen"
Title: "VIA to mhv-fhir-phr"
* -> "LabSpecimenTO Microbiology"
* identifier -> "{StationNbr} and {labReportTO/specimen/id}"
* accessionIdentifier -> "{StationNbr} and {labReportTO/specimen/accessionNum}"
* status -> "`available`"
* type.text -> "labReportTO/specimen/name"
* type.text -> "labReportTO/text {collection sample:}"
* collection.collectedDateTime -> "ConvertDate(labReportTO/specimen/collectionDate)"
* collection.collectedDateTime -> "labReportTO/text {collection date:}"
* collection.bodySite.text -> "labReportTO/text {site/specimen:}"


///////////////////////////////////// Common Specimen Profile (mapping is different)

Profile: MHVlabSpecimen
Parent: Specimen
Id: VA.MHV.PHR.LabSpecimen
Title: "VA MHV PHR Lab Specimen"
Description: """
A profile showing how the Microbiology and Pathology `LabSpecimenTO` is mapped into a FHIR Specimen.
"""
* identifier 0..1 MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains  TOid 0..1 
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabSpecimenTO` | `.` | {LabSpecimenTO.id}"
// Note slicing to get consistency in populating
* accessionIdentifier 0..1 MS
* accessionIdentifier.use = #usual
* accessionIdentifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* accessionIdentifier.system obeys TOid-startswithoid
* accessionIdentifier.system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* accessionIdentifier.value ^short = "`Accession` | `.` | {LabSpecimenTO.accessionNum}"
* collection MS
* collection.collectedDateTime MS
* collection.bodySite MS
* type MS
* type.text 1..1
* subject 0..0
* receivedTime 0..0
* parent 0..0
* request 0..0
* collection.collector 0..0
* collection.duration 0..0
* collection.quantity 0..0
* collection.method 0..0
* collection.fastingStatus[x] 0..0
* processing 0..0
* container 0..0
* condition 0..0
* note 0..0


///////////////////////////////////// Common Observation

Profile:        MHVlabTest
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.labTest
Title:          "VA MHV PHR labTest"
Description:    """
A profile showing how Microbiology and Pathology LabTestTO and LabResultTO will be exposed using FHIR API to MyHealtheVet PHR.

- This profile is based on US-Core Lab Observation
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabTestTO` | `.` | {LabTestTO.id}"
* code 1..1 MS
* code.text 1..1 MS
* code.text ^short = "LabTestTO.name"
* code.coding ..1 MS
* code.coding ^short = "LabTestTO.loinc"
* status MS
* performer only Reference(MHVorganization)
* effectiveDateTime MS
* issued MS
* valueString MS
* specimen MS
* specimen only Reference(MHVlabSpecimen)
// other things not used
* basedOn 0..0
* partOf 0..0
* focus 0..0
* encounter 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* note 0..0
* bodySite 0..0
* method 0..0
* device 0..0
* referenceRange 0..0
* hasMember 0..0
* derivedFrom 0..0
* component 0..0

Mapping: Lab-Mapping-LabResultTO
Source:	MHVlabTest
Target: "LabTestTO"
Title: "VIA to mhv-fhir-phr"
* -> "LabTestTO / LabResultTO"
* specimen -> "{Specimen}"
* identifier -> "{StationNbr} and {LabTestTO.id}"
* code.text -> "LabTestTO.name"
* code.coding -> "LabTestTO.loinc"
* effectiveDateTime -> "{DiagnosticReport.effectiveDate}"
* issued -> "{DiagnosticReport.issued}"
* issued -> "labReportTO/result/timestamp"
* valueString -> "LabResultTO.value"
* performer -> "GetPractitioner(DiagnosticReport.performer)"
* status -> "`final`"
* category -> "`laboratory`"


Mapping: Lab-Mapping-SPLabReportTO
Source:	MHVSPlabReport
Target: "LabReportTO"
Title: "VIA to mhv-fhir-phr"
* -> "LabReportTO"
* category -> "`LAB`"
* category -> "kind of lab"
* category -> "plus all Observation codes"
* status -> "`final`"
* subject -> "patient"
* result -> "Contained Observation(LabResultTO)"
* identifier[casenum] -> "LabReportTO.caseNumber"
* presentedForm.data -> "base64(LabReportTO.text)"
* presentedForm.contentType -> "`text/plain`"
* performer -> "GetLocation(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier[TOid] -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(specimen/collectionDate)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "labReportTO/text {signed}"
* issued -> "labReportTO/text {date completed:}"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -> LOINC"

Mapping: Lab-Mapping-SPLabSpecimenTO
Source: MHVlabSpecimen
Target: "MBLabSpecimen"
Title: "VIA to mhv-fhir-phr"
* -> "LabSpecimenTO Pathology"
* identifier -> "{StationNbr} and {labReportTO/specimen/id}"
* accessionIdentifier -> "{StationNbr} and {labReportTO/specimen/accessionNum}"
* status -> "`available`"
* type.text -> "labReportTO/specimen/name"
* type.text -> "labReportTO/text {specimen}"
* collection.collectedDateTime -> "ConvertDate(labReportTO/specimen/collectionDate)"
* collection.collectedDateTime -> "labReportTO/text {date obtained:}"
* collection.bodySite -> "N/A"

/*
  <xs:complexType name="labReportTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="labTests" type="tns:labTestArray"/>
          <xs:element form="unqualified" minOccurs="0" name="author" type="tns:authorTO"/>
          <xs:element form="unqualified" minOccurs="0" name="caseNumber" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="comment" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:siteTO"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="specimen" type="tns:labSpecimenTO"/>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="title" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="text" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="type" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="result" type="tns:labResultTO"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

  <xs:complexType name="labSpecimenTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="collectionDate" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="accessionNum" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="site" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="facility" type="tns:taggedText"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="labResultTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="timestamp" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="test" type="tns:labTestTO"/>
          <xs:element form="unqualified" minOccurs="0" name="specimenType" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="comment" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="value" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="boundaryStatus" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="labSiteId" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
  <xs:complexType name="labTestTO">
    <xs:complexContent>
      <xs:extension base="tns:abstractTO">
        <xs:sequence>
          <xs:element form="unqualified" minOccurs="0" name="result" type="tns:labResultTO"/>
          <xs:element form="unqualified" minOccurs="0" name="specimen" type="tns:labSpecimenTO"/>
          <xs:element form="unqualified" minOccurs="0" name="id" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="name" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="category" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="units" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="lowRef" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="hiRef" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="refRange" type="xs:string"/>
          <xs:element form="unqualified" minOccurs="0" name="loinc" type="xs:string"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>

Note MHV code data model
- StageEntity
  - StageChemistry (used by Chem-Hem)
    - StageMicrobiology
  - StagePathology

*/