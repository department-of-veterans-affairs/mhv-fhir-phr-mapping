
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

#### Business Rule

- all conditions are **held for 36 hours past the release date/time**

#### Mapping Concerns

- confirm the mapping
- not clear if the ProblemTO.location is describing, is it evidence?
- not clear what `acuity` is mock data is always `C` / `CHRONIC`
- not clear what `facility` is
- **are we ever exposed to ProblemTO.removed=true**
- **what are the other values for ProblemTO.status** mock data is always `ACTIVE`
- not clear what `verified` is. All sample data true/false.
- not clear what `type.category` is. All samples are empty
- Do we need to preserve both `modifiedDate` and `timestamp`?
- How to preserve the `serviceConnected` boolean
- How to preserve the `observer` (AuthorTO)
- Don't have mock data with the following items defined in the ProblemTO schema -- **Not clear VIA will ever fill them**
  - `organizationalProperties` (taggedTextArray)
  - `comment` (string)
  - `comments` (taggedNoteArray)
  - `priority` (string)
  - `noteNarrative` (string)
  - `exposures` (string)
  - `resolvedDate` (string)
  - `onsetDate` (string)
  - `providerNarrative` (string)

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

