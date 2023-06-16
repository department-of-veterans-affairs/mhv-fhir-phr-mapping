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

TODO questions: 
- examples didn't have much populated
- not clear what site and facility might contain, so can't tell where they would go
- some examples are likely FHIR Device (old hardware left foot), so this might change
"""
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
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabSpecimenTO` | `.` | {LabSpecimenTO.id}"
* subject 0..0
* collection MS
* collection.collectedDateTime MS
* type 1..1 MS

Mapping: Lab-Mapping-LabSpecimenTO
Source: MHVlabSpecimen
Target: "LabSpecimen"
Title: "VDIF to MHV-PHR"
* -> "LabSpecimenTO"
* identifier -> "{StationNbr} and {LabSpecimenTO.id}"
* accessionIdentifier -> "{StationNbr} and {LabSpecimenTO.accessionNum}"
* status -> "`available`"
* type -> "text = LabSpecimenTO.name"
* collection.collectedDateTime -> "ConvertDate(LabSpecimenTO.collectionDate)"


Profile: MHVlabReport
//Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
Parent: DiagnosticReport
Id: VA.MHV.PHR.labReport
Title: "VA MHV PHR Lab Report"
Description: """
A profile showing how LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabReportTO` | `.` | {LabReportTO.id}"
* subject 1..1
* code 1..1 MS
* code.text 1..1 MS
* code.coding ..1 MS
* code.coding from LabReportVS (preferred)
* category MS
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains LaboratorySlice 1..1
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* effectiveDateTime MS
* issued MS
* conclusion MS
* specimen MS
* specimen ^type.aggregation = #contained
* specimen only Reference(MHVlabSpecimen)
* result MS
* result ^type.aggregation = #contained
* result only Reference(MHVlabTest)
* performer MS
* performer ^short = "LabReportTO.facility"
* performer only Reference(MHVorganization or MHVpractitioner)
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0
* presentedForm 0..0


ValueSet: LabReportVS
Title: "Known Lab Report types"
Description: "Lab Report types"
* ^experimental = false
* LOINC#79381-0 "Gastrointestinal pathogens panel - Stool by NAA with probe detection"
* LOINC#60567-5 "Comprehensive pathology report panel"


Mapping: Lab-Mapping-LabReportTO
Source:	MHVlabReport
Target: "LabReportTO"
Title: "VDIF to MHV-PHR"
* -> "LabReportTO"
* category -> "`laboratory`"
* status -> "`final`"
* subject -> "patient"
* result -> "Contained Observation(LabResultTO)"
* performer -> "GetPractitioner(LabReportTO.author)"
* basedOn.identifier -> "LabReportTO.caseNumber"
* conclusion -> "LabReportTO.comment + LabReportTO.text"
* performer -> "GetLocation(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* code -> "text = LabReportTO.title"
* code -> "LabReportTO.type -- should be converted to LOINC:  MI -> LOINC#79381-0,  SP -> LOINC#60567-5"


Profile:        MHVlabTest
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.labTest
Title:          "VA MHV PHR labTest"
Description:    """
A profile showing how LabTestTO and LabResultTO will be exposed using FHIR API to MyHealtheVet PHR.

- This profile is based on US-Core Lab
- sometimes a contained Specimen is needed
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..1
* identifier[TOid].use = #usual
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabTestTO` | `.` | {LabTestTO.id}"
* code 1..1 MS
* code.text 1..1 MS
* code.text ^short = "LabTestTO.name"
* code.coding ..1 MS
* code.coding ^short = "LabTestTO.loinc"
* specimen ^type.aggregation = #contained

Mapping: Lab-Mapping-LabResultTO
Source:	MHVlabTest
Target: "LabTestTO"
Title: "VDIF to MHV-PHR"
* -> "LabTestTO / LabResultTO"
* specimen -> "Contained Specimen (LabTestTO.specimen.[LabSpecimenTO])"
* identifier -> "{StationNbr} and {LabTestTO.id}"
* code -> "text = LabTestTO.name"
* code -> "LabTestTO.loinc"
* effectiveDateTime -> "ConvertDate(LabResultTO.timestamp)"
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

*/