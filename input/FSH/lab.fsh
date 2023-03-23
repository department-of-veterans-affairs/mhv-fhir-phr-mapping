Profile: MHVlabSpecimen
Parent: Specimen
Id: VA.MHV.PHR.LabSpecimen
Title: "VA MHV PHR Lab Specimen"
Description: """
A profile showing how the LabSpecimenTO is mapped into a FHIR Specimen.

- This is usually a contained resource, contained in the Lab Report or the Lab Test. The use of contained is for simplicity sake and to limit the need to manage Specimen resource instances
- must have a type 
  - Specimen.type.text <- LabSpecimenTO.name
  - type should be a code derived from LabSpecimenTO.name
- should have a collectedDateTime derived from LabSpecimenTO.collectionDate
- may have an identifier - Specimen.identifier <- LabSpecimenTO.id
  - if no LabSpecimenTO.id is given, then the Specimen resource must be contained
- should have an accessionIdentifier derived from LabSpecimenTO.accessionNum
- should have a subject (unless Contained)

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
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`LabSpecimenTO` | `.` | {LabSpecimenTO.id}"


Mapping: Lab-Mapping-LabSpecimenTO
Source: MHVlabSpecimen
Target: "LabSpecimen"
Title: "VDIF to MHV-PHR"
* -> "LabSpecimenTO" "MHV PHR FHIR API"
* identifier -> "{StationNbr} and {LabSpecimenTO.id}"
* accessionIdentifier -> "{StationNbr} and {LabSpecimenTO.accessionNum}"
* status -> "`available`"
* type.text -> "LabSpecimenTO.name"
* subject -> "patient"
* collection.collectedDateTime -> "ConvertDate(LabSpecimenTO.collectionDate)"


Profile: MHVlabReport
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
//Parent: DiagnosticReport
Id: VA.MHV.PHR.labReport
Title: "VA MHV PHR Lab Report"
Description: """
A profile showing how LabReportTO is mapped into a FHIR DiagnosticReport, Observation, and Specimen.

The given example aligns with the VIA_v4.0.7_uat.wsdl. LabReportTO, LabTestTO, LabResultTO and LabSpecimenTO

The LabReportTO is mapped onto this FHIR DiagnosticReport for laboratory reporting. The mapping to [VDIF LabReportTO](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-vdif-to-mhv-phr-labreportto)

The LabTestTO plus LabResultTO are combined and mapped onto a FHIR [Observation for laboratory result](StructureDefinition-VA.MHV.PHR.labTest.html) that is contained in the DiagnosticReport. The map to [VDIF LabTestTO and LabResultTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-vdif-to-mhv-phr-labtestto). This does not ultimately need to be contained, but given the mock examples are so minimal these are not useful as standalone Observations.

The LabSpecimen is mapped into a [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html) resource that is contained in the DiagnosticReport. The map to [VDIF LabSpecimenTO](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-vdif-to-mhv-phr-labspecimen). These Specimen could be standalone resources, but given the mock examples are so minimal these are best as contained.

The use of contained means that we do not need to de-duplicate the lab tests or specimen.

TODO determine impact of the new LOINC report on this topic https://loinc.org/file-access/?download-id=22762 the impact has not been assessed. I followed FHIR US-Core.

TODO confirm: Are there other labReportTO.type values beyond SP, and MI? or is the example limited to just these? We really need to find a legitimate LOINC code for these two kinds of reports. I am not confident of the LOINC code I picked for the MI (LOINC#79381-0), I am slightly more confident of the code I picked for SP (LOINC#60567-5)

- This profile should be based on US-Core DiagnosticReport profile for Laboratory Results Reporting and lab Observations.
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

Mapping: Lab-Mapping-LabReportTO
Source:	MHVlabReport
Target: "LabReportTO"
Title: "VDIF to MHV-PHR"
* -> "LabReportTO" "MHV PHR FHIR API"
* category -> "`laboratory`"
* status -> "`final`"
* subject -> "patient"
* result -> "(0..*) Observation(LabResultTO)"
* performer -> "GetPractitioner(LabReportTO.author)"
* basedOn.identifier -> "LabReportTO.caseNumber"
* conclusion -> "LabReportTO.comment + LabReportTO.text"
* performer -> "GetLocation(LabReportTO.facility or LabReportTO.result.labSiteId)"
* identifier -> "{StationNbr} and {LabReportTO.id}"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* issued -> "ConvertDate(LabReportTO.timestamp | LabReportTO.result.timestamp)"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -- should be converted to LOINC"


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


Mapping: Lab-Mapping-LabResultTO
Source:	MHVlabTest
Target: "LabTestTO"
Title: "VDIF to MHV-PHR"
* -> "LabTestTO / LabResultTO" "MHV PHR FHIR API"
* specimen -> "Contained Specimen (LabTestTO.specimen.[LabSpecimenTO])"
* identifier -> "{StationNbr} and {LabTestTO.id}"
* code.text -> "LabTestTO.name"
* code.coding -> "LabTestTO.loinc"
* effectiveDateTime -> "ConvertDate(LabResultTO.timestamp)"
* valueString -> "LabResultTO.value"
* performer -> "GetOrganization(LabResultTO.labSiteId)"
* status -> "`final`"
* category -> "`laboratory`"
