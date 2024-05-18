
To support functions and resources:

### Support Resources

To support the primary FHIR Resources, there are some utility Resources that will be needed. These will be created upon demand, based on available details. Note that when we do not get a source `id` for the object, we will use a `contained` resource with the details we are given. Thus we will use a reference to a resource, that reference will most of the time be to a retrievable resource, but may be to a contained resource.

MVP decision is that these will all be contained. They will not thus be available RESTfully. And thus any references to the following 'functions' are really just processing the contained resource.

#### GetPractitioner()

Note that when we do not get an `id` for the user or author, we will use a `contained` Practitioner resource with the details we are given. The following only applies to cases where we are given an `id`.

Input: UserTO, AuthorTO, etc

Return: a Practitioner resource reference

If a Practitioner is not found given the input parameters, then one is created and populated with the input parameters.

If a Practitioner is found, and the details given are different, then presume parameters are newer and use them to update the found Practitioner Resource.

Profiled [Practitioner](StructureDefinition-VA.MHV.PHR.practitioner.html)

#### GetLocation()

Input: hospitalLocationTO, SiteTO

Return: a Location resource reference

If a Location is not found given the input parameters, then one is created and populated with the input parameters.

If a Location is found, and the details given are different, then presume parameters are newer and use them to update the found Location Resource.

Profiled [Location](StructureDefinition-VA.MHV.PHR.location.html)

#### GetOrganization()

Input: organization id (e.g. Lab id)

Return: a Organization resource reference

If a Organization is not found given the input parameters, then one is created and populated with the input parameters.

If a Organization is found, and the details given are different, then presume parameters are newer and use them to update the found Organization Resource.

Profiled [Organization](StructureDefinition-VA.MHV.PHR.organization.html)

### GetPatient()

Input: ICN, PatientTO

Return: a Patient resource reference

If a Patient is not found given the input parameters, then one is created and populated with the data in MHV eVault for that Patient.

Profiled [Patient](StructureDefinition-VA.MHV.PHR.patient.html)

Note that the ICN, as mapped by Oracle Health (Cerner): Cerner uses the VA root OID as the system for the ICN.

MyHealtheVet patient id: We need to use a unique system value for this. I recommend

### Conversions

Historic data is using different dataTypes that can be well defined

#### ConvertDate()

see [ConvertDate](ConvertDate.html)

##### Code Lookup

Most of the historic data just uses strings. For MVP we are not converting codes, except for some very specific ones. This is because MHV is not scoped to be improving the quality of the data, and the use of the MHV FHIR API is driven by display use. Thus codes are not important.

Beyond MVP we could look to add a method to convert these enum or strings to a standards based code like LOINC, SNOMED, CVX, NDC, or other. These utilities can be based on a [FHIR ConceptMap]({{site.data.fhir.path}}conceptmap.html) resource, thus making maintaining it easy.

##### Formal code systems of interest

- SCT = `http://snomed.info/sct`
- UCUM = `http://unitsofmeasure.org`
- LOINC = `http://loinc.org`
- ICD = `{{site.data.fhir.path}}sid/icd-9-cm`
- CPT = `http://www.ama-assn.org/go/cpt`

##### VA specific code systems

There is often a system specified, but it is specified as a simple short string. These are not acceptable in FHIR. FHIR needs a URI or URL. 

- HL70070 = `http://terminology.hl7.org/CodeSystem/v2-0487`
- VUID = urn:oid:2.16.840.1.113883.6.233

**VA Table based code systems**

There is a pattern that starts with `99VA` and is followed by a number (e.g. `99VA60`). That number is the Vista file that holds those codes. KBS has established a pattern for converting these `99VA` values into URI. There may be a version provided, but it is unreliable so do not use the version number.

- `99VA60` = `http://va.gov/terminology/vistaDefinedTerms/60`
- `99VA95.3` = `http://va.gov/terminology/vistaDefinedTerms/95.3`
- `99VA61` = `http://va.gov/terminology/vistaDefinedTerms/61`
- `99VA64` = `http://va.gov/terminology/vistaDefinedTerms/64`

##### Concept mapping

For every context use of a concept encoded as a string, we presume they are unique within that context. The context identifies a specific ConceptMap, and a lookup of the string in that ConceptMap will result in the mapped standard code value.

A failure to find a ConceptMap can be recorded simply as the given string. These cases should be logged for evaluation and possible update of the given ConceptMap.

##### UCUM code

Some of the codes used in Vista are not proper codes.

- [Drug ConceptMap](ConceptMap-DrugUcumCodes.html)
  - From [KBS provided DrugUcum.csv](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/d3d7f9a099534bbb5c4bce882ae2e18069b822ac/mocks/DrugUcum.csv)
- Lab (no ConceptMap is created as it is too hard to keep up to date and the csv is considered easier)
  - From [KBS provided LabUcum.csv](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/d3d7f9a099534bbb5c4bce882ae2e18069b822ac/mocks/labUcum.csv)
- Other - likely VIA returns SI units that the above ConceptMaps do not include

##### UCUM SI codes

VIA seems to give us SI units or other units not found in the KBS cross reference above.

| VIA code | Proper UCUM |
|------------|-------------|
`/min` | `/min`
`%` | `%`
`in` | `[in_i]`
`lb` | `[lb_av]`
`F` | `[degF]`
`cmH2O` | `cm[H2O]`
{: .grid}

#### Identifier

See [Identifier vs id](identifier.html)
