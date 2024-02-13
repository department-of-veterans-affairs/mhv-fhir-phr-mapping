
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/problems.xml) 
- maps to [ProblemTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema. 
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-via-to-mhv-fhir-phr-problemto)
- [Vivian Condition](https://vivian.worldvista.org/dox/Global_XkFVUE5QUk9C.html)
- [User Requirements for Conditions](https://github.com/department-of-veterans-affairs/va.gov-team/blob/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records/data-domains/health-issues/health-issues-brief.md)
- based on US-Core for Condition Resource profile
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.condition` to indicate the intent to be compliant with this profile
- VIA will not expose those that are ProblemTO.removed = true, but we should update our FHIR database in case the previous was recorded.
  - Thus we will be using [Index-Update-and-Delete](background.html#entered-in-error)
- `note` to have as many indexes to handle all the ProblemTO.comments and ProblemTO.comment
- `icd` is not always ICD-9, sometimes it is ICD-10. The following algorithm by Jay Lyle:
  - if the code starts with a number, its ICD-9
  - if the code starts with `V` and does not end with a letter, its ICD-9
  - if the code starts with `E`and followed by 3 numerals before the dot, its ICD-9
  - else it is ICD-10

#### Mapping

| Vista | Vista Field Name          | VIA ProblemTO       | FHIR Condition    | Confidence |
|-------|-------------------------- |---------------------|-------------------|------------|
| 0.01  | DIAGNOSIS                 | type.name           | code.text         | string including ICD
|       |                           | icd                 | code.coding (icd) |
| 0.02  | PATIENT NAME              | patient             | subject           |
| 0.03  | DATE LAST MODIFIED        |                     |                   | ?
| 0.04  | CLASS (Personal, Family)  |
| 0.05  | PROVIDER NARRATIVE
| 0.06  | FACILITY
| 0.07  | NMBR                      | id                  | identifier        | assumed true
| 0.08  | DATE ENTERED              | modifiedDate        |                          | populated/unclear
| 0.12  | STATUS(Active, Inactive)  | status              | clinicalStatus    | data is `ACTIVE`
| 0.13  | DATE OF ONSET             | onsetDate           | onsetDateTime     | assumed
| 1.01  | PROBLEM
| 1.02  | CONDITION(Transcribed, Permanent, Hidden) | verified  | verificationStatus | ?
| 1.03  | ENTERED BY                |                     | recorder          | ?
| 1.04  | RECORDING PROVIDER        |                     |                   | ?
| 1.05  | RESPONSIBLE PROVIDER      |                     |                   | ?
| 1.06  | SERVICE
| 1.07  | DATE RESOLVED             | resolvedDateTime    | abatementDateTime | assumed
| 1.08  | CLINIC                    | location            | ?                 | assumed
| 1.09  | DATE RECORDED             | timestamp           | recordedDate      | assumed
| 1.1   | SERVICE CONNECTED         | serviceConnected    | ?                 | ?
| 1.11  | AGENT ORANGE EXPOSURE
| 1.12  | IONIZING RADIATION EXPOSURE
| 1.13  | PERSIAN GULF EXPOSURE
| 1.14  | PRIORITY (Acute, Chronic) | acuity              | ?                 | some data is Chronic
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
|       |                           | removed             |           | data is `false`
|       |                           | verified            |           | data is `true`/`false`
|       |                           | comments            |           | no data
|       |                           | providerNarrative   |           | no data
|       |                           | exposures           |           | no data
|       |                           | noteNarrative       |           | no data
|       |                           | priority            |           | no data
|       |                           | observer (id,name)  |           | data is id and name
|       |                           | facility (tag, text) |          | data is tag and text
|       |                           | type.category       |           | data is empty
|       |                           | comment             |           | no data
|       |                           | organizationalProperties |           | no data
|       |                           | providerNarrative   |           | no data
{: .grid}


#### Business Rule

- all conditions are **held for 36 hours past the release date/time**

#### Mapping Concerns

- confirm the mapping
- not clear if the ProblemTO.location is describing, is it evidence?
- not clear what `acuity` (likely 1.14 PRIORITY)is mock data is always `C` / `CHRONIC` vs `A` / `ACUTE`
- not clear what `facility` is
- **are we ever exposed to ProblemTO.removed=true**
- **what are the other values for ProblemTO.status** mock data is always `ACTIVE`
- not clear what `verified` is. All sample data true/false. (1.02 CONDITION - Transcribed, Permenant, Hidden)
- `status` (.12 STATS Active vs Inactive)
- not clear what `type.category` is. All samples are empty
- Do we need to preserve both `modifiedDate` (80201 Date Of Interest) and `timestamp` (Date entered)?
- `location`
- How to preserve the `serviceConnected` boolean
- How to preserve the `observer` (AuthorTO)
- Don't have mock data with the following items defined in the ProblemTO schema -- **Not clear VIA will ever fill them**
  - `organizationalProperties` (taggedTextArray)
  - `comment` (string)
  - `comments` (taggedNoteArray)
  - `priority` (string)  --> Did not see anything relevant on the Vista UI. In FileMan the priority element is Acute vs Chronic, which comes to us as `acuity`.
  - `noteNarrative` (string)
  - `exposures` (string) -- head or neck cancer, military sexual trauma, agent orange
  - `resolvedDate` (string)
  - `onsetDate` (string)
  - `providerNarrative` (string)
  - Vista Fileman seems to indicte a SNOMED-CT (8000`, 80001, 80005). Future of a VHAT concept (80003, 80004). Not clear where this might get to us

#### 2023-10-12

change:
- use .recorder not .asserter

TODO
- look at VIA mapping. Are we specifically getting Problems table
- can .status other than "ACTIVE". Might it be "INACTIVE" being a map to .12
- verificationStatus - might turn into a don't map as we are unclear
- is the modifiedDate the right one to keep? as KBS seems to think this is a last updated concept, not when it was first recorded.

##### Source-Code review

There is no prototype implementation. So the whole resource needs to be written

