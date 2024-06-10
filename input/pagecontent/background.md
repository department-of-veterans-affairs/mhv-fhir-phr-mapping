
MyHealtheVet acts as a FHIR Server. It receives information from many sources and produces a given set of FHIR Resourrces

<figure>
{%include data-flow.svg%}
<figcaption><b>Figure: Data flow</b></figcaption>
</figure>
<br clear="all">

### Utility Resources

Note that these resources are used purely to provide linkage, they are minimally populated based on the information MHV receives. Often that means all that is populated is an identifier.

- [Patient](StructureDefinition-VA.MHV.PHR.patient.html)
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

This section is dedicated to instructions on how MHV will transition the data we receive into FHIR format. The priority order is:

1. Allergy
2. Immunization
3. Notes
4. Radiology Report
5. Vitals
6. Conditions
7. Chem-Hem
8. Micro / Path Lab Reports
9. EKG/ECG - not likely to continue as no longer get useful reports

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
- contained Orders [ServiceRequest(s)](StructureDefinition-VA.MHV.PHR.chOrder.html)
  - Mapping from [HDR labTests.orderedTestCode](StructureDefinition-VA.MHV.PHR.chOrder-mappings.html#mappings-for-hdr-labtests-order-to-mhv-fhir-phr-labtestpromises-labtests-orderedtestcode)

#### Condition

[Conditions](StructureDefinition-VA.MHV.PHR.condition.html#notes) Mapping Notes

- [Mapping from VIA - ProblemTO](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-via-to-mhv-fhir-phr-problemto)
- [Examples](StructureDefinition-VA.MHV.PHR.condition-examples.html)

#### ECG

[ECG](StructureDefinition-VA.MHV.PHR.ecg.html#notes) Mapping Notes

- [Mapping from VIA - ClinicalProcedureTO](StructureDefinition-VA.MHV.PHR.ecg-mappings.html#mappings-for-via-to-mhv-fhir-phr-clinicalprocedureto)
- [Examples](StructureDefinition-VA.MHV.PHR.ecg-examples.html)

#### Imaging Reports

[Imaging Reports](StructureDefinition-VA.MHV.PHR.imaging.html#notes) Mapping Notes

- [Mapping from VIA - ImagingExamTO](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-via-to-mhv-fhir-phr-imagingexamto)
  - [Examples](StructureDefinition-VA.MHV.PHR.imaging-examples.html)
- Contained [ServiceRequest](StructureDefinition-VA.MHV.PHR.irOrder.html)

#### Immunization

[Immunization](StructureDefinition-VA.MHV.PHR.immunization.html#notes) Mapping Notes

- [Mapping from VIA - ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-via-to-mhv-fhir-phr-immunizationto)
- [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)

#### Pathology LabReport

[Pathology LabReport](StructureDefinition-VA.MHV.PHR.SPlabReport.html#notes)  Mapping Notes

- [Mapping from VIA - SP LabReportTO +](StructureDefinition-VA.MHV.PHR.SPlabReport-mappings.html#mappings-for-via-to-mhv-fhir-phr-labreportto)
  - [Examples](StructureDefinition-VA.MHV.PHR.SPlabReport-examples.html)
- Contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
  - Mapping from [VIA LabSpecimen](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-via-to-mhv-fhir-phr-labspecimen)
- Contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
  - Mapping from [VIA LabTestTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-via-to-mhv-fhir-phr-labtestto)

#### Microbiology LabReport

[Microbiology LabReport](StructureDefinition-VA.MHV.PHR.MBlabReport.html#notes) Mapping Notes

- [Mapping from VIA - MB LabReportTO +](StructureDefinition-VA.MHV.PHR.MBlabReport-mappings.html#mappings-for-via-to-mhv-fhir-phr-labreportto)
  - [Examples](StructureDefinition-VA.MHV.PHR.MBlabReport-examples.html)
- Contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
  - Mapping from [VIA LabSpecimen](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-via-to-mhv-fhir-phr-labspecimen)
- Contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
  - Mapping from [VIA LabTestTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-via-to-mhv-fhir-phr-labtestto)

#### Notes

[Notes](StructureDefinition-VA.MHV.PHR.note.html#notes) Mapping Notes

- [Mapping from VIA - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-via-to-mhv-fhir-phr-noteto)
- [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)

#### Vital-Sign

General [Vital-Signs](StructureDefinition-VA.MHV.PHR.vitals.html#notes) Mapping Notes

- Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
- Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)
- Additional specifics for [Pulse-OX Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsOx.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.vitalsOx-examples.html)
- other [Examples](StructureDefinition-VA.MHV.PHR.vitals-examples.html)

### potential

#### medication

No longer being developed here.

- Medications
  - See [Medication Request notes](StructureDefinition-VA.MHV.PHR.medicationRequest.html#notes)
  - support API for current feature where VA prescribed medications are displayed and where online dispensing is avail the veteran can request dispense
  - Note that this is not defined yet what is the source or goal.
  - I understand that the interface will be using HL7 v2 feed, and CMOP. I note that VIA does have a schema for a MedicationTO.
  - I have heard that there are questions on how to best fit the FHIR medication concept domain.
  - Should support Cerner in the future.
  - non-VA meds is not in scope
  - PGHD meds is not in scope
- Enforcement of Business rules: Today this is enforced as data comes into the PHR, the data that should not be seen is not persisted. This works as the PHR is refreshed often. But with FHIR server we are persisting, and thus the business rule such as a timeframe to wait before showing the patient would need to be enforced on the FHIR API, not on the data feed.

#### other

- Eventually this same API would support data from Cerner. Thus the same API providing comprehensive data from Vista and/or Cerner where ever it is.
- Provenance -- track where the data has come from, and if from multiple places track all.
- Grahame - Intermediaries White Paper -- https://confluence.hl7.org/display/FHIR/Intermediaries+White+Paper
- HL7 FAST - Exchange Routing -- {{site.data.fhir.path}}us/exchange-routing/  

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

## Data input processing

General Pattern

1. Our FHIR database will have a Patient resource that is created as needed from the MHV Patient Profile. It contains minimal elements. The Patient is intended simply for API use.
2. Our FHIR database will assign Resource id value naturally using normal HAPI method (likely UUID)
3. Our FHIR database will put external identifiers (e.g. Those from the Vista id such as ImmunizationTO.id) into the .identifier element
4. The support Resources (Location, Organization, Practitioner, etc) will be contained in the primary clinical FHIR Resource. This because MHV is not told enough about these to properly identify and keep de-duplicated. For example when an Immunization was given at a specific location, we point at a Location resource that is contained in the Immunization with the details. 
5. Updates vs Deletes -  using [Index-Update-and-Delete](background.html#entered-in-error)


<figure>
{%include processing-flow.svg%}
<figcaption><b>Figure: Backend Processing flow</b></figcaption>
</figure>
<br clear="all">

### General Processing of clinical resources

<figure>
{%include update-flow.svg%}
<figcaption><b>Figure: Clinical Resource Processing flow</b></figcaption>
</figure>
<br clear="all">

- We do updates based on the .identifier. HAPI will find that resource, compare what it has with what we put in the bundle, and NOT do an update if there is no change. Thus we rely on HAPI to properly detect changes, so MHV code does not have to.
- The current/historic list could be used to place the current id on entries with the given identifier, these entries can be then marked as conditional update. Where as today it is a conditional update based on a lookup on the .identifier. This will improve the performance of the HAPI server as it will remove an indirect lookup. We can also know which entries are NEW, so we can mark them as create. **MHV-54038**

## Entered-in-Error

As data are removed or marked as entered-in-error on Vista, the MHV often is simply not informed about that object any more. With MHV eVault, this was handled by simply purging all PHR data each refresh. With FHIR database, we are a step away from the database and thus purging the database is not possible. We thus need some way to handle the cases where we previously learned of a resource, but it was then deleted, and we now are no longer told about it. The following are potential candidates. Wipe-and-Replace was used for atime, but it resulted in a large historic version filling up the FHIR database with no value.

Now using **Index-Update-and-Delete**, with the exception that Allergies we mark them with entered-in-error as we receive that status from HDR.

1. **Index-Update-and-Delete**: This model:
   1. pulls current FHIR resource `.identifier` values (use `_elements` [parameter]({{site.data.fhir.path}}search.html#elements) to limit results to just identifiers, id),
   2. When updating the new data, remember the  `.identifier` that were refreshed.
   3. At the end, we can know which `.identifier` values were not updated. (most of the time there will be no unrefreshed data)
   4. We can `delete` those that were not updated
   5. -- Note: Did not require moving to new HAPI Server.
2. **Index-Update-and-Expunge**: This model:
   1. pulls current FHIR resource `.identifier` values (use `_elements` [parameter]({{site.data.fhir.path}}search.html#elements) to limit results to just identifiers, id, status),
   2. When updating the new VIA feed data, remember the  `.identifier` that were refreshed.
   3. At the end, we can know which `.identifier` values were not updated. (most of the time there will be no unrefreshed data)
   4. We can `patch` those that were not updated, by `.id`, status to `entered-in-error`,
   5. -- Note: Patch is not supported in our current HAPI server.
3. **Update-and-Expunge**: This model is made available with an updated HAPI Server (6.10.0) that has the ability to disable history. However with this version we can't use Wipe-and-Replace as that will result in new id values being assigned at each refresh. So Update-and-Expunge is designed. Each VIA feed we convert to FHIR and request an update, but the HAPI server is smart enough to notice that nothing changed so it will not update the meta.lastUpdated. So we will add to our update the use of the  `{{site.data.fhir.path}}StructureDefinition/lastSourceSync` extension, with todays date/time (now). This will force an update. Thus after we have fully processed the VIA feed, we can then look for entries older than now that are still active. This will most of the time return an empty set, but if it does return resources, we will change them to entered-in-error and update them.
4. **Wipe-and-Replace**: Delete the patient's specific Resource (e.g. delete all the Immunizations for this patient) and write using update current data from the VIA refresh -- similar to eVault PHR today. The HAPI server notices an update, by business identifier, of a previously deleted resource, so it brings it back to non-deleted. Thus after a VIA refresh, only current resources are not-deleted. The drawback is that this keeps historic versions, with two versions per refresh, and _lastUpdated is always the refresh time. Also, the ones removed are not marked as entered-in-error. -- **January 2024, decided to abandon this as the database fills to fast with history, and we don't need this history**
5. Get VIA updated
6. Get VDIF to expose their data
7. Get VDIF to expose their data in FHIR form
8. Use Lighthouse FHIR, and thus have the 24 hour problem
9.  Use Lighthouse FHIR, and use a hack for short-term data. Where we only add vitals seen in VIA in the last 24 hours (or some timeframe).
10. Use HDR
11. Use CDW somehow
12. new event service? slack #ves-event-bus
13. track updates, and notice when a VIA update does not include a record we previously had. This would be very expensive and memory intensive. Thus might be something we do only occationally at low compute time.

## References

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
