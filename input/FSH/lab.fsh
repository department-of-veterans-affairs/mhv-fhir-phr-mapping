
Profile:        MHVlab
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Id:             VA.MHV.PHR.lab
Title:          "VA MHV PHR lab"
Description:    """
A profile showing how Labs will be exposed using FHIR API to MyHealtheVet PHR.

- This profile is based on US-Core Lab
- sometimes a contained Specimen is needed
  - Specimen.identifier <- LabSpecimenTO.id
  - Specimen.type.text <- LabSpecimenTO.name
  - Specimen.collection.collectedDateTime <- ConvertDate(LabSpecimenTO.collectionDate)
  - Specimen.accessionIdentifier <- LabSpecimenTO.accessionNum
"""
* identifier 1..
* note 1..

Mapping: Lab-Mapping-LabReportTO
Source:	MHVlab
Target: "LabReportTO"
Title: "VDIF to MHV-PHR"
* -> "LabReportTO" "MHV PHR FHIR API"
* category -> "laboratory"
* status -> "final"
* subject -> "patient"
* hasMember -> "(0..*) Observation(LabResultTO)"
* performer -> "GetPractitioner(LabReportTO.author)"
* basedOn.identifier -> "LabReportTO.caseNumber"
* note.text -> "LabReportTO.comment + LabReportTO.text"
* performer -> "GetLocation(LabReportTO.facility)"
* identifier -> "LabReportTO.id"
* specimen -> "Contained Specimen (LabReportTO.specimen.[LabSpecimenTO])"
* effectiveDateTime -> "ConvertDate(LabReportTO.timestamp)"
* code.text -> "LabReportTO.title"
* code.coding -> "LabReportTO.type -- should be converted to LOINC"


Mapping: Lab-Mapping-LabResultTO
Source:	MHVlab
Target: "LabTestTO"
Title: "VDIF to MHV-PHR"
* -> "LabTestTO / LabResultTO" "MHV PHR FHIR API"
* specimen -> "Contained Specimen (LabTestTO.specimen.[LabSpecimenTO])"
* identifier -> "LabTestTO.id"
* code.text -> "LabTestTO.name"
* code.coding -> "LabTestTO.loinc"
* effectiveDateTime -> "ConvertDate(LabResultTO.timestamp)"
* valueString -> "LabResultTO.value"
* performer -> "GetOrganization(LabResultTO.labSiteId)"
