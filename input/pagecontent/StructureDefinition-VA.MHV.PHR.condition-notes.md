
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/problems.xml) 
- maps to [ProblemTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema. 
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-via-to-mhv-fhir-phr-problemto)
- [Vivian Condition](https://vivian.worldvista.org/dox/Global_XkFVUE5QUk9C.html)
- [User Requirements for Conditions](https://github.com/department-of-veterans-affairs/va.gov-team/blob/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records/data-domains/health-issues/health-issues-brief.md)
- based on US-Core for Condition Resource profile
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.condition` to indicate the intent to be compliant with this profile
- VIA will not include those that are removed, we should update our FHIR database in case the previous was recorded.
  - Thus we will be using [Index-Update-and-Delete](background.html#entered-in-error)
- `note` to have as many indexes to handle all the ProblemTO.comments
- `icd` is not always ICD-9, sometimes it is ICD-10. The following algorithm by Jay Lyle:
  - if the code starts with a number, its ICD-9
  - if the code starts with `V` and does not end with a letter, its ICD-9
  - if the code starts with `E`and followed by 3 numerals before the dot, its ICD-9
  - else it is ICD-10
- Service Related and the other more specific service related condition elements: at KBS encouragement, we will not keep any of these into FHIR. These are more related to VA payment than clinical condition, so should be managed elsewhere.
- entered by, recording provider, responsible provider ? Historic MHV documentation seems to indicate responsible provider is used. (ProblemTO.observer)
- `status` -> `clinicalStatus`: `ACTIVE` -> `#active`, `INACTIVE` -> `#inactive`
- `verified` -> `verificationStatus`: `true` -> `#confirmed`, `false` -> `#unconfirmed`

#### Mapping

| Vista | Vista Field Name          | VIA ProblemTO       |   MHV eVault      | FHIR Condition    | Note |
|-------|-------------------------- |---------------------|-------------------|-------------------|------------|
| 0.01  | DIAGNOSIS                 | type.name           | problem           | code.text         | string including SCT
|       |                           | icd                 |                   | code.coding (icd) |
| 0.02  | PATIENT NAME              | patient             | (icn)             | subject           |
| 0.03  | DATE LAST MODIFIED        | modifiedDate        | eventTime         |                   | see note
| 0.04  | CLASS (Personal, Family)  |
| 0.05  | PROVIDER NARRATIVE        |                     |                   |
| 0.06  | FACILITY                  | facility (tag, text) |                  | recorder[location] |
| 0.07  | NMBR                      | id                  |                   | identifier        |
| 0.08  | DATE ENTERED              
| 0.12  | STATUS(Active, Inactive)  | status              | status            | clinicalStatus    |
| 0.13  | DATE OF ONSET             | onsetDate           |                   | onsetDateTime     |
| 1.01  | PROBLEM                   |                     |
| 1.02  | CONDITION(Transcribed, Permanent, Hidden) | verified (true/false)  |             |verificationStatus |
| 1.03  | ENTERED BY                |                     |                   |                   |
| 1.04  | RECORDING PROVIDER        |                     |                   |                   |
| 1.05  | RESPONSIBLE PROVIDER      | observer (id,name)  | provider          | recorder          |
| 1.06  | SERVICE
| 1.07  | DATE RESOLVED             | resolvedDate        |                   | abatementDateTime |
| 1.08  | CLINIC                    | location            |                   |  | see note
| 1.09  | DATE RECORDED             | timestamp           | (hold)            | recordedDate      | see note
| 1.1   | SERVICE CONNECTED         | serviceConnected (true/false)   |                   |                   |
| 1.11  | AGENT ORANGE EXPOSURE
| 1.12  | IONIZING RADIATION EXPOSURE
| 1.13  | PERSIAN GULF EXPOSURE
| 1.14  | PRIORITY (Acute, Chronic) | acuity              | acuity            | ?                 |
| 1.15  | HEAD AND/OR NECK CANCER
| 1.16  | MILITARY SEXUAL TRAUMA
| 1.17  | COMBAT VETERAN
| 1.18  | SHIPBOARD HAZARD & DEFENSE
| 1101  | NOTE FACILITY
| 80001 | SNOMED CT CONCEPT CODE
| 80002 | SNOMED CT DESIGNATION CODE
| 80003 | VHAT CONCEPT VUID (FUTURE)
| 80004 | VHAT DESIGNATION VUID (FUTURE)
| 80005 | SNOMED CT-TO-ICD MAP STATUS
| 80101 | UNIQUE NEW TERM REQUESTED
| 80102 | UNIQUE TERM REQUEST COMMENT
| 80201 | DATE OF INTEREST
| 80202 | CODING SYSTEM
| 80300 | MAPPING TARGETS
|       |                           | removed             |                   |                   | data is `false`
|       |                           | comments.text       | comments          | note[*].text      |
|       |                           | comments.timestamp  |                   | note[*].time      |
|       |                           | comments.author.name |                  | note[*].authorString |
|       |                           | providerNarrative   |                   |           | no data
|       |                           | exposures           |                   |           | no data
|       |                           | noteNarrative       |                   |           | no data
|       |                           | priority            |                   |           | no data
|       |                           | type.category       |                   |           | data is empty
|       |                           | comment             |                   |           | no data
|       |                           | organizationalProperties |              |           | no data
|       |                           | providerNarrative   |                   |           | no data
|       |                           | ../../tag           | stationNumber     | see note
{: .grid}

- MHV would calculate the 36 hour hold based on ProblemTO.timestamp, but never expose this. Rather MHV would expose the ProblemTO.modifiedDate as the eventTime. This does not fit well into the FHIR Condition, which has an element appropriate for timestamp, but does not have a good element for modified. We could add an extension if this is deemed important. Note any extension we add will not be supported by OH, so better to change now.
- what is displayed today for location is likely coming from ../../tag - e.g. "984". The current MHV code preserves this value, and does not seem to preserve the facility. This tag value only goes in Identifier.system values. We have historically not included this value in an element. Likely should be an Organization resource, but there is only a number.
- clinic is available at the UI, but we are not preserving it as it is just a string. It was not previously saved by MHV.

#### Business Rule

- Ignore those without a facility
- Ignore those without an id
- all conditions are **held for 36 hours past the release date/time**
  - 36 hour hold based on `timestamp` 
  - skip those with no timestamp or bad timestamp
- Ignore non-active, deleted are filtered out by VIA

#### Mapping Concerns

- not clear what `acuity` (likely 1.14 PRIORITY) is mock data is always `C` / `CHRONIC` vs `A` / `ACUTE`

##### Source-Code review

There is no prototype implementation. So the whole resource needs to be written
- MHV seems to be adding midnight time to dates that don't have a time.
- MHV does not handle when only a year is given - e.g. <onsetDate>2990000</onsetDate> -> "1999", no month, day, or time.
