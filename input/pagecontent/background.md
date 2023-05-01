
MyHealtheVet acts as a FHIR Server.

Utility Resources:

- [Patient](StructureDefinition-VA.MHV.PHR.patient.html)
  - [Mappings from VDIF - PatientTO](StructureDefinition-VA.MHV.PHR.patient-mappings.html#mappings-for-vdif-to-mhv-phr-patientto)
  - [Examples](StructureDefinition-VA.MHV.PHR.patient-examples.html)
- [Practitioner](StructureDefinition-VA.MHV.PHR.practitioner.html)
  - [Mappings from VDIF - UserTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-vdif-to-mhv-phr-userto)
  - [Mappings from VDIF - AuthorTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-vdif-to-mhv-phr-authorto)
  - [Examples](StructureDefinition-VA.MHV.PHR.practitioner-examples.html)
- [Location](StructureDefinition-VA.MHV.PHR.location.html)
  - [Mappings from VDIF - HospitalAllocationTO](StructureDefinition-VA.MHV.PHR.location-mappings.html#mappings-for-vdif-to-mhv-phr-hospitallocationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.location-examples.html)
- [Organization](StructureDefinition-VA.MHV.PHR.organization.html)
  - [Mapping from VDIF - LabSiteTO](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-vdif-to-mhv-phr-labsiteto)
  - [Mapping from HDR PerformingOrganization](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-hdr-to-mhv-phr-performingorganization)
  - [Examples](StructureDefinition-VA.MHV.PHR.organization-examples.html)

Clinical Resources:

- [Allergy and Intolerance](StructureDefinition-VA.MHV.PHR.allergyIntolerance.html)
  - [Mappings from VHIM Allergy](StructureDefinition-VA.MHV.PHR.allergyIntolerance-mappings.html#mappings-for-vhim-allergy-to-mhv-phr-intolerancecondition)
  - [Examples](StructureDefinition-VA.MHV.PHR.allergyIntolerance-examples.html)
- [Chem-Hem (CH) Diagnostic Report](StructureDefinition-VA.MHV.PHR.chReport.html) 
  - [Mapping from HDR labTestPromises to DiagnosticReport](StructureDefinition-VA.MHV.PHR.chReport-mappings.html#mappings-for-hdr-to-mhv-phr-labtestpromises)
    - [Examples](StructureDefinition-VA.MHV.PHR.chReport-examples.html)
  - contained [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html)
    - Mappings from [HDR labTestPromises.specimen](StructureDefinition-VA.MHV.PHR.chSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-phr-labtestpromises-specimen)
  - contained Results [Observation(s)](StructureDefinition-VA.MHV.PHR.chTest.html)
    - Mapping from [HDR labTests](StructureDefinition-VA.MHV.PHR.chTest-mappings.html#mappings-for-hdr-labtests-to-mhv-phr-labtestpromises-labtests)
  - contained Panels [Observation(s)](StructureDefinition-VA.MHV.PHR.chPanel.html)
    - Mapping from [HDR labTests.orderedTestCode](StructureDefinition-VA.MHV.PHR.chPanel-mappings.html#mappings-for-hdr-labtests-panel-to-mhv-phr-labtestpromises-labtests-orderedtestcode)
- [Conditions](StructureDefinition-VA.MHV.PHR.condition.html)
  - [Mapping from VDIF - ProblemTO](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-vdif-to-mhv-phr-problemto)
  - [Examples](StructureDefinition-VA.MHV.PHR.condition-examples.html)
- [ECG](StructureDefinition-VA.MHV.PHR.ecg.html)
  - [Mapping from VDIF - ClinicalProcedureTO](StructureDefinition-VA.MHV.PHR.ecg-mappings.html#mappings-for-vdif-to-mhv-phr-clinicalprocedureto)
  - [Examples](StructureDefinition-VA.MHV.PHR.ecg-examples.html)
- [Immunization](StructureDefinition-VA.MHV.PHR.immunization.html)
  - [Mapping from VDIF - ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-vdif-to-mhv-phr-immunizationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)
- [LabReport](StructureDefinition-VA.MHV.PHR.labReport.html) including Microbiology and Pathology
  - [Mapping from VDIF - LabReportTO +](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-vdif-to-mhv-phr-labreportto)
    - [Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
  - Contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
    - Mapping from [VDIF LabSpecimen](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-vdif-to-mhv-phr-labspecimen)
  - Contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
    - Mapping from [VDIF LabTestTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-vdif-to-mhv-phr-labtestto)
- [Notes](StructureDefinition-VA.MHV.PHR.note.html)
  - [Mapping from VDIF - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-vdif-to-mhv-phr-noteto)
  - [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- [Radiology](StructureDefinition-VA.MHV.PHR.imaging.html)
  - [Mapping from VDIF - ImagingExamTO](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-vdif-to-mhv-phr-imagingexamto)
  - [Examples](StructureDefinition-VA.MHV.PHR.imaging-examples.html)
  - most [examples are within this Bundle](https://johnmoehrke.github.io/MHV-PHR/Bundle-images.html), and thus not individually exposed.
- [Vitals](vitals.html)

### todo

Note in Muazzam spreadsheet

- Appointments
- Medication History

#### in progress

- Allergies Examples
- xslt for CH

#### other

- Provenance -- track where the data has come from, and if from multiple places track all.
  
unknown (FHIR supports the following topics but unclear if this data exists in PHR)

- care plan / care team resources
- allergy intolerance resources
  - AllergyTO is defined for VIA
- encounter resources
- device resources
- goal resources
- procedure resources
- questionnaire / questionnaireResponse resources
- related person resources
- service request resources
- coverage resources

The use of FHIR AuditEvent should be used to track all uses of the FHIR API. This is a base configuration of the HAPI FHIR Server. See IHE Implementation Guide on the use of [Basic Audit Log Patterns](https://profiles.ihe.net/ITI/BALP/index.html)

### Data input processing

General Pattern

1. Our FHIR database will assign id value naturally using normal HAPI method (likely UUID)
2. Our FHIR database will put external identifiers (e.g. Those from the Vista id such as ImmunizationTO.id) into the .identifier element
3. Our FHIR database should have one Organization resource… or are there multiple?
4. Our FHIR database will have [support resources](utility.html#support-resources) for common resource types: Patient, Practitioner, Location, etc -- a Patient resource for each patient within the database, Location for all locations, and Practitioner for all clinicians (Users) - So that clinical resources can point at these resources as appropriate. For example when an Immunization was given at a specific location, we point at a Location resource with the details. Thus all clinical resources that were associated with that location all point at the one instance of Location. Same for Practitioner (Users), and Patients. 
5. Our FHIR database will have Provenance resource indicating each time a resource is created/updated/deleted. This will aid with the management of data changes and provide linkage back to origination and mapping details.

### General Processing of clinical resources

<figure>
{%include update-flow.svg%}
<figcaption>General Processing flow</figcaption>
</figure>
<br clear="all">

1. given an id value on the data we are given, we look for the corresponding FHIR Resource with an identifier element equal to that id value. Thus the identifier element within our FHIR database is the linkage to original data id value.
2. When nothing is found, we create a new instance of that clinical resource and populate it with the data we are given. Populating the .identifier element with the id of the data we were given.
3. When one item is found, we compare the data we have with the data we were given. If no change, then nothing more is done. If there is a difference, then we update our data.
4. When creating a new instance, or updating an existing instance, create a Provenance instance to track what was imported, from what, to what, when, and given some detail to indicate the translation used.

### References

Source of data received from VDIF using a SOAP xml schema that might be from one of:

- [VIA_v4.0.7_uat.wsdl](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl)
- [mockey-mdws3-service.wsdl](https://github.com/department-of-veterans-affairs/mhv-ap-vde-support/blob/development/src/test/wsdl/mockey-mdws3-service.wsdl)
- [EmrService.wsdl](https://github.com/department-of-veterans-affairs/mhv-hla-app-ui/blob/dbb0301be4a17f31e67048300d72c87c0977aa09/hra-mock-via-app/src/main/java/gov/va/hra/integration/via/mock/ws/EmrService.wsdl)
- VA [Vista Fileman](http://www.vistapedia.com/index.php/Main_Page)

