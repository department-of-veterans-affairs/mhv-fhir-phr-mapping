
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

| Vista | Vista Field Name          | VIA ProblemTO       |   MHV eVault      | FHIR Condition    | Confidence |
|-------|-------------------------- |---------------------|-------------------|-------------------|------------|
| 0.01  | DIAGNOSIS                 | type.name           | problem           | code.text         | string including ICD
|       |                           | icd                 |                   | code.coding (icd) |
| 0.02  | PATIENT NAME              | patient             | (icn)             | subject           |
| 0.03  | DATE LAST MODIFIED        | modifiedDate        | eventTime         |                   | populated/unclear
| 0.04  | CLASS (Personal, Family)  |
| 0.05  | PROVIDER NARRATIVE        |                     |                   |
| 0.06  | FACILITY                  | facility (tag, text) |                  |                   | 
| 0.07  | NMBR                      | id                  |                   | identifier        | assumed
| 0.08  | DATE ENTERED              
| 0.12  | STATUS(Active, Inactive)  | status              | status            | clinicalStatus    | data is `ACTIVE`
| 0.13  | DATE OF ONSET             | onsetDate           |                   | onsetDateTime     | assumed
| 1.01  | PROBLEM                   |                     |
| 1.02  | CONDITION(Transcribed, Permanent, Hidden) | verified  |             |verificationStatus | ?
| 1.03  | ENTERED BY                |                     |                   | recorder          | ?
| 1.04  | RECORDING PROVIDER        |                     |                   |                   | ?
| 1.05  | RESPONSIBLE PROVIDER      | observer (id,name)  | provider          |                   | ?
| 1.06  | SERVICE
| 1.07  | DATE RESOLVED             | resolvedDateTime    |                   | abatementDateTime | assumed
| 1.08  | CLINIC                    | location            |                   | ?                 | assumed
| 1.09  | DATE RECORDED             | timestamp           | (hold)            | recordedDate      | assumed
| 1.1   | SERVICE CONNECTED         | serviceConnected    |                   | ?                 | true/false
| 1.11  | AGENT ORANGE EXPOSURE
| 1.12  | IONIZING RADIATION EXPOSURE
| 1.13  | PERSIAN GULF EXPOSURE
| 1.14  | PRIORITY (Acute, Chronic) | acuity              | acuity            | ?                 | +1
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
|       |                           | removed             |                   |           | data is `false`
|       |                           | verified            |                   |           | data is `true`/`false`
|       |                           | comments.text       | comments          |           | multiple entries
|       |                           | comments.timestamp  |                   |           | multiple entries
|       |                           | comments.author     |                   |           | multiple entries
|       |                           | providerNarrative   |                   |           | no data
|       |                           | exposures           |                   |           | no data
|       |                           | noteNarrative       |                   |           | no data
|       |                           | priority            |                   |           | no data
|       |                           | type.category       |                   |           | data is empty
|       |                           | comment             |                   |           | no data
|       |                           | organizationalProperties |              |           | no data
|       |                           | providerNarrative   |                   |           | no data
|       |                           | ../../tag           | stationNumber
{: .grid}

- MHV seems to be adding midnight time to dates that don't have a time.
- deleted problems are not included in VIA. So will need to address.
- look at cerner data to see if they have extensions (location?) -- no
- location might be in a shell of an encounter? could be extension on recorder, or extension on root.
- what is displayed today for location is likely coming from ../../tag - e.g. "984". The current MHV code preserves this value, and does not seem to preserve the facility.
- where should service related and other exposures to be saved (Jay) -- likely not appropriate in Condition as these seem more related to VA payment
- comments are multiple entries, and do show in bluebutton if multiple comments. is this 0.05 PROVIDER NARRATIVE?
- problem catagories at Vista (e.g. cardiology) do not come thru. Could this be .type.category that is always blank.
- where does icd come from? Is this converted by VIA?

#### Business Rule

- all conditions are **held for 36 hours past the release date/time**
- filter out non-active
- 36 hour hold based on `timestamp` - skip those with no timestamp or bad timestamp

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

