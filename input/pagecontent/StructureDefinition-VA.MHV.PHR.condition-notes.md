
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/problems.xml) 
- maps to [ProblemTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema. 
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-via-to-mhv-fhir-phr-problemto)
- [Vivian Condition](https://vivian.worldvista.org/dox/Global_XkFVUE5QUk9C.html)
- [User Requirements for Conditions](https://github.com/department-of-veterans-affairs/va.gov-team/blob/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records/data-domains/health-issues/health-issues-brief.md)
- based on US-Core for Condition Resource profile
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.condition` to indicate the intent to be compliant with this profile
- Presume we will not expose those that are ProblemTO.removed = true, but we should update our FHIR database in case the previous was recorded.
  - `clinicalStatus` set to `active`
- `ProblemTO.status` is only seen as `ACTIVE`.
- `note` to have as many indexes to handle all the ProblemTO.comments and ProblemTO.comment
- `icd` is not always ICD-9, sometimes it is ICD-10. The following algorithm by Jay Lyle:
  - if the code starts with a number, its ICD-9
  - if the code starts with `V` and does not end with a letter, its ICD-9
  - if the code starts with `E`and followed by 3 numerals before the dot, its ICD-9
  - else it is ICD-10

#### Mapping Concerns

- not clear if the ProblemTO.location is describing, is it evidence?
- not clear what ProblemTO.acuity.tag is
- not clear what ProblemTo.facility is
- **are we ever exposed to ProblemTO.removed=true**
- **what are the other values for ProblemTO.status**
  - how do we handle when a problem is moved from active to not active? Are we made aware of this? Should we delete, mark not active, or mark entered-in-error?

#### 2023-10-12

change:
- use .recorder not .asserter

TODO
- look at VIA mapping. Are we specifically getting Problems table
- can .status other than "ACTIVE". Might it be "INACTIVE" being a map to .12
- verificationStatus - might turn into a don't map as we are unclear
- is the modifiedDate the right one to keep? as KBS seems to think this is a last updated concept, not when it was first recorded.
- review source-code

