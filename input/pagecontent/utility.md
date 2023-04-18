
To support functions and resources:

### Support Resources

To support the primary FHIR Resources, there are some utility Resources that will be needed. These will be created upon demand, based on a lookup need.

#### GetPractitioner()

Input: UserTO, AuthorTO, etc

Return: a Practitioner resource reference

If a Practitioner is not found given the input parameters, then one is created and populated with the input parameters.

If a Practitioner is found, and the details given are different, then presume parameters are newer and use them to update the found Practitioner Resource.

Profiled [Practitioner](StructureDefinition-VA.MHV.PHR.practitioner.html)

#### GetPatient()

Input: ICN, PatientTO

Return: a Patient resource reference

If a Patient is not found given the input parameters, then one is created and populated with the input prameters.

If a Patient is found, and the details given are different, then presume parameters are newer and use them to update the found Patient Resource.

**QUESTION: Should the patient also be populated with given patient demographics found in eVault?**

Profiled [Patient](StructureDefinition-VA.MHV.PHR.patient.html)

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

### Conversions

Historic data is using different dataTypes that can be well defined

#### ConvertDate()

see [ConvertDate](ConvertDate.html)

##### Code Lookup

Most of the historic data just uses strings. Will need some method to convert these enum or strings to a standards based code like LOINC, SNOMED, CVX, NDC, or other. These utilities can be based on a [FHIR ConceptMap](http://hl7.org/fhir/conceptmap.html) resource, thus making maintaining it easy.

##### Formal code systems of interest

- SCT = http://snomed.info/sct
- UCUM = http://unitsofmeasure.org
- LOINC = http://loinc.org
- ICD = http://terminology.hl7.org/CodeSystem/icd9cm
- CPT = http://www.ama-assn.org/go/cpt

##### VA specific code systems

There is often a system specified, but it is specified as a simple short string. These are not acceptable in FHIR. FHIR needs a URI or URL. So I propose we do the following conversion.

Given a system ABCD, use `http://va.gov/systems/ABCD`

These are systems I have used:

- http://va.gov/systems/99VA95.3
- http://va.gov/systems/99VA60
- http://va.gov/systems/99VA61
- http://va.gov/systems/99VA64
- http://va.gov/systems/HL70070
- http://va.gov/systems/mpiPID
- http://va.gov/systems/localPID

##### Concept mapping

For every context use of a concept encoded as a string, we presume they are unique within that context. The context identifies a specific ConceptMap, and a lookup of the string in that ConceptMap will result in the mapped standard code value.

A failure to find a ConceptMap can be recorded simply as the given string. These cases should be logged for evaluation and possibily update of the given ConceptMap.

##### UCUM code

Some of the codes used in Vista are not proper codes.

| Vista code | Proper UCUM |
|------------|-------------|
`in` | `[in_i]`
`lb` | `[lb_av]`
{: .grid}

#### Identifier

See [Identifier vs id](identifier.html)
