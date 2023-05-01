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
* -> "LabSpecimenTO" "MHV PHR FHIR API"
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

The given example aligns with the VIA_v4.0.7_uat.wsdl. LabReportTO, LabTestTO, LabResultTO and LabSpecimenTO

The LabReportTO is mapped onto this FHIR DiagnosticReport for laboratory reporting. The mapping to [VDIF LabReportTO](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-vdif-to-mhv-phr-labreportto)

The LabTestTO plus LabResultTO are combined and mapped onto a FHIR [Observation for laboratory result](StructureDefinition-VA.MHV.PHR.labTest.html) that is contained in the DiagnosticReport. The map to [VDIF LabTestTO and LabResultTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-vdif-to-mhv-phr-labtestto).

The LabSpecimen is mapped into a [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html) resource that is contained in the DiagnosticReport. The map to [VDIF LabSpecimenTO](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-vdif-to-mhv-phr-labspecimen).

The use of contained means that we do not need to de-duplicate the lab tests or specimen.

TODO determine impact of the new LOINC report on this topic https://loinc.org/file-access/?download-id=22762 the impact has not been assessed. I followed FHIR US-Core.

TODO confirm: Are there other labReportTO.type values beyond SP, and MI? or is the example limited to just these? We really need to find a legitimate LOINC code for these two kinds of reports. I am not confident of the LOINC code I picked for the MI (LOINC#79381-0), I am slightly more confident of the code I picked for SP (LOINC#60567-5)

- This profile should be based on US-Core DiagnosticReport profile for Laboratory Results Reporting and lab Observations. BUT IS NOT because us-core requires us Practitioner and we can't be compliant with that. So I have replicated the us-core requirements here.
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
* -> "LabReportTO" "MHV PHR FHIR API"
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
* -> "LabTestTO / LabResultTO" "MHV PHR FHIR API"
* specimen -> "Contained Specimen (LabTestTO.specimen.[LabSpecimenTO])"
* identifier -> "{StationNbr} and {LabTestTO.id}"
* code -> "text = LabTestTO.name"
* code -> "LabTestTO.loinc"
* effectiveDateTime -> "ConvertDate(LabResultTO.timestamp)"
* valueString -> "LabResultTO.value"
* performer -> "GetOrganization(LabResultTO.labSiteId)"
* status -> "`final`"
* category -> "`laboratory`"
