
## MyHealtheVet makes PHR available using FHIR

MyHealtheVet acts as a FHIR Server.

- [Immunization](StructureDefinition-VA.MHV.PHR.immunization.html)
  - [Mapping from VIA/VDIF](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-viavdif-to-mhv-phr-immunizationto)
  - [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)
- [Notes](StructureDefinition-VA.MHV.PHR.note.html)
  - [Mapping from VIA/VDIF](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-viavdif-to-mhv-phr-noteto)
  - [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- [Labs](StructureDefinition-VA.MHV.PHR.lab.html)
  - [Mapping from VIA/VDIF - LabReport](StructureDefinition-VA.MHV.PHR.lab-mappings.html#Lab-Mapping-LabResultTO)
  - [Mapping from VIA/VDIF - LabResult](StructureDefinition-VA.MHV.PHR.lab-mappings.html#Lab-Mapping-LabResultTO)
  - [Examples](StructureDefinition-VA.MHV.PHR.lab-examples.html)

### References

Source of data received from VIA/VDIF using a SOAP xml schema that might be from one of:
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

### Code Lookup

Most of the historic data just uses strings.
