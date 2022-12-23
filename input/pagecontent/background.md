
## MyHealtheVet makes PHR available using FHIR

MyHealtheVet acts as a FHIR Server.

- [Patient](StructureDefinition-VA.MHV.PHR.patient.html)
  - [Mappings from VDIF](StructureDefinition-VA.MHV.PHR.patient-mappings.html#mappings-for-vdif-to-mhv-phr-patientto)
  - [Examples](StructureDefinition-VA.MHV.PHR.patient-examples.html)
- [Practitioner](StructureDefinition-VA.MHV.PHR.practitioner.html)
  - [Mappings from VDIF - User](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-vdif-to-mhv-phr-userto)
  - [Mappings from VDIF - Author](StructureDefinition-VA.MHV.PHR.practitioner-mappings.html#mappings-for-vdif-to-mhv-phr-authorto)
  - [Examples](StructureDefinition-VA.MHV.PHR.practitioner-examples.html)
- [Location](StructureDefinition-VA.MHV.PHR.location.html)
  - [Mappings from VDIF](StructureDefinition-VA.MHV.PHR.location-mappings.html#mappings-for-vdif-to-mhv-phr-hospitallocationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.location-examples.html)
- [Immunization](StructureDefinition-VA.MHV.PHR.immunization.html)
  - [Mapping from VDIF](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-vdif-to-mhv-phr-immunizationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)
- [Notes](StructureDefinition-VA.MHV.PHR.note.html)
  - [Mapping from VDIF](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-vdif-to-mhv-phr-noteto)
  - [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- [Labs](StructureDefinition-VA.MHV.PHR.lab.html)
  - [Mapping from VDIF - LabReport](StructureDefinition-VA.MHV.PHR.lab-mappings.html#Lab-Mapping-LabResultTO)
  - [Mapping from VDIF - LabResult](StructureDefinition-VA.MHV.PHR.lab-mappings.html#Lab-Mapping-LabResultTO)
  - [Examples](StructureDefinition-VA.MHV.PHR.lab-examples.html)

### Data input processing

General Pattern

1. Our FHIR database will assign id value naturally using normal HAPI method (likely GUID)
2. Our FHIR database will put external identifiers (e.g. Those from the Vista id such as ImmunizationTO.id) into the .identifier element
3. Our FHIR database should have one Organization resource… or are there multiple?
4. Our FHIR database will have [support resources](background.html#support-resources) for common resource types: Patient, Practitioner, Location, etc -- a Patient resource for each patient within the database, Location for all locations, and Practitioner for all clinicians (Users) - So that clinical resources can point at these resources as appropriate. For example when an Immunization was given at a specific location, we point at a Location resource with the details. Thus all clinical resources that were associated with that location all point at the one instance of Location. Same for Practitioner (Users), and Patients. 
5. Our FHIR database will have Provenance resource indicating each time a resource is created/updated/deleted. This will aid with the management of data changes and provide linkage back to origination and mapping details.

### General Processing of clinical resources 

<div>
{%include update-flow.svg%}
</div>
<br clear="all">

1. given an id value on the data we are given, we look for the cooresponding FHIR Resource with an identifier element equal to that id value. Thus the identifier element within our FHIR database is the linkage to original data id value.
2. When nothing is found, we create a new instance of that clinical resource and populate it with the data we are given. Populating the .identifier element with the id of the data we were given.
3. When one item is found, we compare the data we have with the data we were given. If no change, then nothing more is done. If there is a difference, then we update our data.
4. When creating a new instance, or updating an existing instance, create a Provenance instance to track what was imported, from what, to what, when, and given some detail to indicate the translation used.


### References

Source of data received from VDIF using a SOAP xml schema that might be from one of:

- [VIA_v4.0.7_uat.wsdl](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl)
- [mockey-mdws3-service.wsdl](https://github.com/department-of-veterans-affairs/mhv-ap-vde-support/blob/development/src/test/wsdl/mockey-mdws3-service.wsdl)
- VA [Vista Fileman](http://www.vistapedia.com/index.php/Main_Page)

## Utility Functions

To support functions and resources:

### Support Resources

To support the primary FHIR Resources, there are some untility Resources that will be needed. These will be created upon demand, based on a lookup need.

#### GetPractitioner()

Input: UserTO, AuthorTO, etc

Return: a Practitioner resource reference

If a Practitioner is not found given the input parameters, then one is created and populated with the input parameters.

If a Practitioner is found, and the details given are different, then presume parameters are newer and use them to update the found Practitioner Resource.

#### GetPatient()

Input: ICN, PatientTO

Return: a Patient resource reference

If a Patient is not found given the input parameters, then one is created and populated with the input prameters.

If a Patient is found, and the details given are different, then presume parameters are newer and use them to update the found Patient Resource.

**QUESTION: Should the patient also be populated with given patient demographics found in eVault?**

#### GetLocation()

Input: hospitalLocationTO, SiteTO

Return: a Location resource reference

If a Location is not found given the input parameters, then one is created and populated with the input prameters.

If a Location is found, and the details given are different, then presume parameters are newer and use them to update the found Location Resource.

#### GetOrganization()

Input: organiztion id (e.g. Lab id)

Return: a Organization resource reference

If a Organization is not found given the input parameters, then one is created and populated with the input prameters.

If a Organization is found, and the details given are different, then presume parameters are newer and use them to update the found Organization Resource.

### Conversions

Historic data is using different dataTypes that can be well defined

#### ConvertDate()

Input: Fileman Date

Return: FHIR DateTime

Given that the Fileman date is slightly different than HL7. The conversion is simple.

See [FileMan date](http://www.vistapedia.com/index.php/Date_formats)

#### Code Lookup

Most of the historic data just uses strings. Will need some method to convert these enum or strings to a standards based code like LOINC, SNOMED, CVX, NDC, or other. These utilities can be based on a [FHIR ConceptMap](http://hl7.org/fhir/conceptmap.html) resource, thus making maintaining it easy.

For every context use of a concept encoded as a string, we presume they are unique within that context. The context identifies a specific ConceptMap, and a lookup of the string in that ConceptMap will result in the mapped standard code value.

A failure to find a ConceptMap can be recorded simply as the given string. These cases should be logged for evaluation and possiblly update of the given ConceptMap.

#### Id vs Identifier

Our FHIR database will track linkages to source objects using the FHIR resource `.identifier` element, and the Vista `.id` element.

1. As far as I can tell the `.id` values coming from Vista (Fileman) are given to us as strings. I presume unique strings at the source for that given context of that data. (for a given Vista instance the ImmunizationTO.id is unique, but that id value might be a different ImmunizationTO object at a different Vista site, and that id value on a different object like NoteTO at the original Vista site)
2. In FHIR [Identifier datatype](http://hl7.org/fhir/datatypes.html#Identifier) tend to be made up of two parts. The identifier value, and the system value within which that identifier value is known to be unique. We should define a system value for each Vista Site, and each context. In this way when more data sources come along we don't have clashes of id because we can differentiate them with the system+id. For example when we receive Cerner data.
3. Thus when we know the data received is from VDIF we can look up the given id as identifier of system+id.

The system value should be composed of the Vista site and object context

> {canonical root}/Vista/{Vista Site}/{context}

Context:

- UserTO.id
- PatientTO.id
- AutorTO.id
- HospitalLocationTO.id
- ImmunizationTO.id
- NoteTO.id
- LabReportTO.id
- LabReportTO.caseNumber
- LabSpecimenTO.id
- LabResultTO.labSiteId
- LabTestTO.id

For example, for Vista site 111, and the UserTO.id context:
```
https://johnmoehrke.github.io/MHV-PHR/Vista/111/UserTO.id
```
   