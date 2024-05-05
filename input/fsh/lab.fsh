Profile: MHVlabSpecimen
Parent: Specimen
Id: VA.MHV.PHR.LabSpecimen
Title: "VA MHV PHR Lab Specimen"
Description: """
A profile showing how the `LabSpecimenTO` is mapped into a FHIR Specimen.

- This is a contained resource, contained in the Lab Report or the Lab Test. The use of contained is for simplicity sake and to limit the need to manage Specimen resource instances
- must have a type 
  - `Specimen.type.text` <- `LabSpecimenTO.name`
  - type should be a code derived from LabSpecimenTO.name
- should have a `collectedDateTime` derived from `LabSpecimenTO.collectionDate`
- may have an `identifier` - `Specimen.identifier` <- `LabSpecimenTO.id`
  - if no `LabSpecimenTO.id` is given, then the Specimen resource must be contained
- should have an `accessionIdentifier` derived from `LabSpecimenTO.accessionNum`
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
* collection.bodySite 0..0
* collection.fastingStatus[x] 0..0
* processing 0..0
* container 0..0
* condition 0..0
* note 0..0

Mapping: Lab-Mapping-LabSpecimenTO
Source: MHVlabSpecimen
Target: "LabSpecimen"
Title: "VIA to mhv-fhir-phr"
* -> "LabSpecimenTO"
* identifier -> "{StationNbr} and {LabSpecimenTO.id}"
* accessionIdentifier -> "{StationNbr} and {LabSpecimenTO.accessionNum}"
* status -> "`available`"
* type.text -> "LabSpecimenTO.name"
* collection.collectedDateTime -> "ConvertDate(LabSpecimenTO.collectionDate)"


Profile: MHVSPlabReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.SPlabReport
Title: "VA MHV PHR SP Lab Report"
Description: """
A profile showing how SP LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.
"""
* ^extension[$fmm].valueInteger = 2
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabReportTO` | `.` | {LabReportTO.id}"
* subject 1..1
* code 1..1 MS
* code.text 1..1 MS
* code.coding ..1 MS
* code.coding = LOINC#11526-1
* category contains SPLabSlice 1..1
* category[SPLabSlice].coding 1..1
* category[SPLabSlice].coding = http://terminology.hl7.org/CodeSystem/v2-0074#SP
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
* performer ^short = "LabReportTO.facility"
* performer only Reference(MHVorganization)
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0
* conclusion 0..0
* basedOn 0..0

Profile: MHVMBlabReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.MBlabReport
Title: "VA MHV PHR MB Lab Report"
Description: """
A profile showing how MB LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.
"""
* ^extension[$fmm].valueInteger = 2
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabReportTO` | `.` | {LabReportTO.id}"
* subject 1..1
* code 1..1 MS
* code.text 1..1 MS
* code.coding ..1 MS
* code.coding = LOINC#18725-2
* category contains MBLabSlice 1..1
* category[MBLabSlice].coding 1..1
* category[MBLabSlice].coding = http://terminology.hl7.org/CodeSystem/v2-0074#MB
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
* performer ^short = "LabReportTO.facility"
* performer only Reference(MHVorganization)
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0
* conclusion 0..0
* basedOn 0..0

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
* performer -> "GetPractitioner(LabReportTO.author)"
* basedOn.identifier -> "LabReportTO.caseNumber"
* presentedForm.data -> "base64(LabReportTO.text)"
* presentedForm.contentType -> "`text/plain`"
* performer -> "GetLocation(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -> LOINC"

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
* performer -> "GetPractitioner(LabReportTO.author)"
* basedOn.identifier -> "LabReportTO.caseNumber"
* presentedForm.data -> "base64(LabReportTO.text)"
* presentedForm.contentType -> "`text/plain`"
* performer -> "GetLocation(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -> LOINC"


Profile:        MHVlabTest
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.labTest
Title:          "VA MHV PHR labTest"
Description:    """
A profile showing how LabTestTO and LabResultTO will be exposed using FHIR API to MyHealtheVet PHR.

- This profile is based on US-Core Lab
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
* specimen -> "Specimen (LabTestTO.specimen.[LabSpecimenTO])"
* identifier -> "{StationNbr} and {LabTestTO.id}"
* code.text -> "LabTestTO.name"
* code.coding -> "LabTestTO.loinc"
* effectiveDateTime -> "ConvertDate(LabResultTO.timestamp)"
* issued -> "ConvertDate(LabResultTO.timestamp)"
* valueString -> "LabResultTO.value"
* performer -> "GetOrganization(LabResultTO.labSiteId)"
* status -> "`final`"
* category -> "`laboratory`"

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