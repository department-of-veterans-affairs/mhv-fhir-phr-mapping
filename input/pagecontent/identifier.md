
Our FHIR database will track linkages to source objects using the FHIR resource `.identifier` element, and the Vista `.id` element.

1. As far as I can tell the `.id` values coming from Vista (Fileman) are given to us as strings. They are unique strings at the source for that given context of that data. (for a given Vista instance the ImmunizationTO.id is unique, but that id value might be a different ImmunizationTO object at a different Vista site, and that id value on a different object like NoteTO at the original Vista site)
2. The `.id` values sometimes have a two or three part to them separated by `;`. I don't know if there is something we can interpret, or if I am just looking at non-real examples.
3. In FHIR [Identifier datatype](http://hl7.org/fhir/datatypes.html#Identifier) tend to be made up of two parts. The identifier value, and the system value within which that identifier value is known to be unique.
4. Thus when we know the data received is from VIA we can look up the given id as identifier of system+id.
5. The VA CDA generation does a similar transform of the `.id` values into CDA `.id` values. We should use the same algorithm so that the same data is easily recognized regardless of if the data was received via CDA or our FHIR api. They do not transform all id values. Thus we should follow their lead where they have taken a lead so as to not create a de-duplication problem.
6. The Lighthouse does not keep the id values in their FHIR output. So there is no precedent to follow.
7. There is an OID directory for all facility OIDs. So there is a unique OID that can be used for each Vista instance.
8. [OID assigned to VA](https://oidref.com/2.16.840.1.113883.4.349) `urn:oid:2.16.840.1.113883.4.349`
9. OID pattern for facilities is at `.4.{station number}`. There is a spreadsheet tracking all of the facility OIDs.

**Concerns from Jay Lyle discussion 7/18/2023**

- Concern with pattern in 9 above using `.4.`.
- currently am slicing on `.use`; but might be better to slice on `.type` and define types.
- If slicing on `.type`; then it might not be necessary to prefix the `.id` with a data object string.
- Note the benefit of the prefix is global uniqueness and quicker comparison as the identifier value is either a match or not, where as using .type requires identifier match and type match; and type is not part of a token search parameter.

Recommendation:

- The `use` value will always be `usual`
- The `system` value is a fixed OID assigned to THAT Vista facility
- the `value` is then composed of the id from the data plus (prefixed) identifier of the context datatype.

> {context} | `.` | {id}

Given that there is no need for a `value` to be numeric, we can just use the Vista datatype.

Context:

| Vista Datatype | context prefix to use |
|----------------|-----------------------|
UserTO.id | `UserTO`
PatientTO.id | `PatientTO`
AuthorTO.id | `AuthorTO`
HospitalLocationTO.id | `HospitalLocationTO`
AllergyTO.id | `AllergyTO`
ClinicalProcedureTO.id | `ClinicalProcedureTO`
VitalSignTO.id | `VitalSignTO`
ImmunizationTO.id | `ImmunizationTO`
NoteTO.id | `NoteTO`
LabReportTO.id | `LabReportTO`
LabReportTO.caseNumber | `LabReportTO.caseNumber`
LabSpecimenTO.id | `LabSpecimen`
LabResultTO.labSiteId | `labSiteId`
LabTestTO.id | `LabTestTO`
ImagingExamTO.id | `ImagingExamTO`
{: .grid}

Thus for a ClinicalProcedureTO.id value of 1234 from site 989. (I assume 989 is a test site that shows up in the test data often)

example in json

```json
"identifier" : {
  "use" : "usual",
  "system" : "urn:oid:2.16.840.1.113883.4.349.4.989",
  "value" : "ClinicalProcedureTO.1234"
}
```

profile in sushi

```fs
* identifier[TOid].use = #usual
* identifier[TOid].system obeys TOid-startswithoid
* identifier[TOid].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value ^short = "`ClinicalProcedureTO` | `.` | {ClinicalProcedureTO.id}"
```

### Encounter id

Note that Encounter is more complex, and the VA CDA team have set a precedent. This because there are often multiple encounters that are spawned off of one parent, and they are all given the same id. The VA CDA team has come up with the pattern using the LOINC code in that Encounter:

Note that they are not using the above OID pattern for station number, they put the station number into the value. So they use the root OID  `urn:oid:2.16.840.1.113883.4.349` for system

> {SectionLOINC} | `.` | {stationNbr} | `.` | {id}

Note that the VA CDA does not include the id on Immunizations. From what I can tell the VA CDA does not expose any other id values.

### Accession id

Accession ID will be `use` of `formal`, and identify the `type` as `ACSN`, and the `value` will use the prefix `Accession`

```fs
* identifier[accessionNumber].use = #official
* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* identifier[accessionNumber].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[accessionNumber].system obeys TOid-startswithoid
* identifier[accessionNumber].value ^short = "`Accession` | `.` | {ImagingExamTO.accessionNum}"
```

### Case Number

Case Number will be `use` of `secondary`, and use the prefix `CaseNum`

```fs
* identifier[casenum].use = #secondary
* identifier[casenum].system ^short = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[casenum].system obeys TOid-startswithoid
* identifier[casenum].value ^short = "`CaseNum` | `.` | {ImagingExam.casenum}"
```

### Organization

Organization resources are different in that they are defining a facility. So, we use the identifier.system value of the fixed OID, and the value of the station

```fs
* identifier[TOid].system 1..1
* identifier[TOid] ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].value ^short = "{stationNumber} or `LabSiteTO.` + {LabSiteTO.id}"
* identifier[TOid].use = #usual
```

#### HospitalLocationTO

HospitalLocationTO will be a `use` of `usual`, and use the prefix `HospitalLocationTO`, but will use the root OID **without the station number**

```fs
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.{stationNbr}"
* identifier[TOid].value = "`HospitalLocationTO` | `.` | {HospitalLocationTO.id}"
```

see mapping [VIA labSiteID](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-via-to-mhv-fhir-phr-labsiteto)

#### HDR orderingFacilityIdentifier

orderingFacilityIdentifier will be a `.use` of `usual`, and use the fixed OID for `.system`. The orderingFacilityIdentifier has a `.stationNumber` element that we will use for the `.value`. Since we know this is the station number, we will not add a prefix.

```fs
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4"
* identifier[TOid].value ^short = "{orderingFacilityIdentifier.identity}"
```

see mapping [HDR PerformingOrganization](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-hdr-to-mhv-fhir-phr-performingorganization)

#### Patient

I don't know enough about how patient id is managed. I understand that we are just going to use the MHV assigned patient identifier and nothing more. The Patient resource is populated from the MHV eVault patient details.
