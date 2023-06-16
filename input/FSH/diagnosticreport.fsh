


Profile: MHVdiagnosticReport
//Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab
Parent: DiagnosticReport
Id: VA.MHV.PHR.diagnosticReport
Title: "VA MHV DiagnosticReport"
Description: """
This defines the use for Chem-Hem and 
`DiagnosticReport`, with contained `Observation` and `Specimen` as needed.
"""
* identifier 1..
* subject 1..1
* code 1..1 MS
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
* specimen only Reference(MHVchSpecimen or MHVlabSpecimen)
* result MS
* result ^type.aggregation = #contained
* result only Reference(MHVchTest or MHVchPanel or MHVlabTest)
* performer MS
* performer only Reference(MHVorganization or MHVpractitioner)
* encounter 0..0
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusionCode 0..0
* presentedForm 0..0

