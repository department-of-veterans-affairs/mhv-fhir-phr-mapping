
MyHealtheVet acts as a FHIR Server. It receives information from many sources and produces a given set of FHIR Resourrces

<figure>
{%include data-flow.svg%}
<figcaption>Data flow</figcaption>
</figure>
<br clear="all">

### Utility Resources

Note that these resources are used purely to provide linkage, they are minimally populated based on the information MHV receives. Often that means all that is populated is an identifier.

- [Patient](StructureDefinition-VA.MHV.PHR.patient.html)
  - [Mappings from VIA - PatientTO](StructureDefinition-VA.MHV.PHR.patient-mappings.html#mappings-for-via-to-mhv-fhir-phr-patientto)
  - [Examples](StructureDefinition-VA.MHV.PHR.patient-examples.html)
- [Practitioner](StructureDefinition-VA.MHV.PHR.practitioner.html)
  - [Mappings from VIA - UserTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-via-to-mhv-fhir-phr-userto)
  - [Mappings from VIA - AuthorTO](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-via-to-mhv-fhir-phr-authorto)
  - [Examples](StructureDefinition-VA.MHV.PHR.practitioner-examples.html)
- [Location](StructureDefinition-VA.MHV.PHR.location.html)
  - [Mappings from VIA - HospitalAllocationTO](StructureDefinition-VA.MHV.PHR.location-mappings.html#mappings-for-via-to-mhv-fhir-phr-hospitallocationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.location-examples.html)
- [Organization](StructureDefinition-VA.MHV.PHR.organization.html)
  - [Mapping from VIA - LabSiteTO](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-via-to-mhv-fhir-phr-labsiteto)
  - [Mapping from HDR - PerformingOrganization](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-performingorganization)
  - [Examples](StructureDefinition-VA.MHV.PHR.organization-examples.html)

### mapping Clinical Resources

This section is dedicated to instructions on how MHV will transition the data we receive into FHIR format.

#### Allergy

[Allergy and Intolerance](StructureDefinition-VA.MHV.PHR.allergyIntolerance.html#notes) Mapping Notes

- [Mappings from HDR Allergy](StructureDefinition-VA.MHV.PHR.allergyIntolerance-mappings.html#mappings-for-hdr-allergy-to-mhv-fhir-phr-intolerancecondition)
- [Examples](StructureDefinition-VA.MHV.PHR.allergyIntolerance-examples.html)

#### Chem-Hem

[Chem-Hem (CH) Diagnostic Report](StructureDefinition-VA.MHV.PHR.chReport.html#notes) Mapping Notes

- [Mapping from HDR labTestPromises to DiagnosticReport](StructureDefinition-VA.MHV.PHR.chReport-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-labtestpromises)
  - [Examples](StructureDefinition-VA.MHV.PHR.chReport-examples.html)
- contained [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html)
  - Mappings from [HDR labTestPromises.specimen](StructureDefinition-VA.MHV.PHR.chSpecimen-mappings.html#mappings-for-hdr-labtestpromises-specimen-to-mhv-fhir-phr-labtestpromises-specimen)
- contained Results [Observation(s)](StructureDefinition-VA.MHV.PHR.chTest.html)
  - Mapping from [HDR labTests](StructureDefinition-VA.MHV.PHR.chTest-mappings.html#mappings-for-hdr-labtests-to-mhv-fhir-phr-labtestpromises-labtests)
- contained Panels [Observation(s)](StructureDefinition-VA.MHV.PHR.chPanel.html)
  - Mapping from [HDR labTests.orderedTestCode](StructureDefinition-VA.MHV.PHR.chPanel-mappings.html#mappings-for-hdr-labtests-panel-to-mhv-fhir-phr-labtestpromises-labtests-orderedtestcode)

#### Condition

[Conditions](StructureDefinition-VA.MHV.PHR.condition.html#notes) Mapping Notes

- [Mapping from VIA - ProblemTO](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-via-to-mhv-fhir-phr-problemto)
- [Examples](StructureDefinition-VA.MHV.PHR.condition-examples.html)

#### ECG

[ECG](StructureDefinition-VA.MHV.PHR.ecg.html#notes) Mapping Notes

- [Mapping from VIA - ClinicalProcedureTO](StructureDefinition-VA.MHV.PHR.ecg-mappings.html#mappings-for-via-to-mhv-fhir-phr-clinicalprocedureto)
- [Examples](StructureDefinition-VA.MHV.PHR.ecg-examples.html)

#### Immunization

[Immunization](StructureDefinition-VA.MHV.PHR.immunization.html#notes) Mapping Notes

- [Mapping from VIA - ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-via-to-mhv-fhir-phr-immunizationto)
- [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)

#### LabReport

[LabReport](StructureDefinition-VA.MHV.PHR.labReport.html#notes) including Microbiology and Pathology Mapping Notes

- [Mapping from VIA - LabReportTO +](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-via-to-mhv-fhir-phr-labreportto)
  - [Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
- Contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
  - Mapping from [VIA LabSpecimen](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-via-to-mhv-fhir-phr-labspecimen)
- Contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
  - Mapping from [VIA LabTestTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-via-to-mhv-fhir-phr-labtestto)

#### Notes

[Notes](StructureDefinition-VA.MHV.PHR.note.html#notes) Mapping Notes

- [Mapping from VIA - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-via-to-mhv-fhir-phr-noteto)
- [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)

#### Radiology

[Radiology](StructureDefinition-VA.MHV.PHR.imaging.html#notes) Mapping Notes

- [Mapping from VIA - ImagingExamTO](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-via-to-mhv-fhir-phr-imagingexamto)
- [Examples](StructureDefinition-VA.MHV.PHR.imaging-examples.html)
- most [examples are within this Bundle](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/Bundle-images.html), and thus not individually exposed.

#### Vital-Sign

General [Vital-Signs](StructureDefinition-VA.MHV.PHR.vitals.html#notes) Mapping Notes

- Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
- Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)
- Most [examples are within a Bundle](Bundle-vitals.html), which does not exposed each vital sign.

#### in progress

- Medications
  - See [Medication Request notes](StructureDefinition-VA.MHV.PHR.medicationRequest.html#notes)
  - support API for current feature where VA prescribed medications are displayed and where online dispensing is avail the veteran can request dispense
  - Note that this is not defined yet what is the source or goal.
  - I understand that the interface will be using HL7 v2 feed, and CMOP. I note that VIA does have a schema for a MedicationTO.
  - I have heard that there are questions on how to best fit the FHIR medication concept domain.
  - Should support Cerner in the future.
  - non-VA meds is not in scope
  - PGHD meds is not in scope
- Revisions of artifacts. Unclear how this comes to us via the feeds. Specifically we need to know how we ask for these, vs today just getting current. And what the vocabulary are to support changes
  - IntoleranceCondition (allergies) could have the status change
  - problemTO (conditions) could be removed or not active
  - imagingExamTO.status
  - noteTO -- there is also discussion of notes being amended, appended, and rescinded
  - some artifacts don't seem to have a status in the schema api
    - clinicalProcedureTO (ECG)
    - immunizationTO
    - labReportTO
    - vitalSignTO
- Enforcement of Business rules: Today this is enforced as data comes into the PHR, the data that should not be seen is not persisted. This works as the PHR is refreshed often. But with FHIR server we are persisting, and thus the business rule such as a timeframe to wait before showing the patient would need to be enforced on the FHIR API, not on the data feed.

#### other

- Eventually this same API would support data from Cerner. Thus the same API providing comprehensive data from Vista and/or Cerner where ever it is.
- Provenance -- track where the data has come from, and if from multiple places track all.
  
unknown (FHIR supports the following topics but unclear if this data exists in PHR)

- care plan / care team resources
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

### Entered-in-Error

Before Production use there must be a permanent solution. The solution needs address some update problems (e.g. entered-in-error).  The following are potential candidates

1. Flush the patient's Observations and write new Observations from the VIA refresh -- similar to eVault PHR today.
1. Get VIA updated
1. Get VDIF to expose their data
1. Get VDIF to expose their data in FHIR form
1. Use Lighthouse FHIR, and thus have the 24 hour problem
1. Use Lighthouse FHIR, and use a hack for short-term data. Where we only add vitals seen in VIA in the last 24 hours (or some timeframe).
1. Use HDR
1. Use CDW somehow

### References

Source of data received from VIA using a SOAP xml schema that might be from one of:

- [VIA_v4.0.7_uat.wsdl](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl)
- [mockey-mdws3-service.wsdl](https://github.com/department-of-veterans-affairs/mhv-ap-vde-support/blob/development/src/test/wsdl/mockey-mdws3-service.wsdl)
- [EmrService.wsdl](https://github.com/department-of-veterans-affairs/mhv-hla-app-ui/blob/dbb0301be4a17f31e67048300d72c87c0977aa09/hra-mock-via-app/src/main/java/gov/va/hra/integration/via/mock/ws/EmrService.wsdl)
- VA [Vista Fileman](http://www.vistapedia.com/index.php/Main_Page)
- HDR / VHIM [mhv-np-cds-wsclient](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates) schema.

Vista Model
- [VistA Cross Reference Documentation (aka Vivian)](https://vivian.worldvista.org/dox/)
- [ViViaN Visualizing VistA and Namespaces](https://vivian.worldvista.org/vivian/)
- [ViViaN Github](https://github.com/worldvista/vivian)
- [Open Source Health Records(OSEHRA)](https://yippy.health/brand/osehra)
- [FileMan Files List](https://vivian.worldvista.org/dox/filemanfiles.html)
