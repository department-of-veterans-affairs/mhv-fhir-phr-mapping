
- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/problems.xml) 
- maps to [ProblemTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema. 
- [mapping to VHIM](StructureDefinition-VA.MHV.PHR.condition-mappings.html#mappings-for-vdif-to-mhv-phr-problemto)
- based on US-Core for Condition Resource profile
- should have `meta.profile` set to `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.condition` to indicate the intent to be compliant with this profile
- Presume we will not expose those that are ProblemTO.removed = true, but we should update our FHIR database in case the previous was recorded.
  - `clinicalStatus` set to `active`
- `ProblemTO.status` is only seen as `ACTIVE`.
- `note` to have as many indexes to handle all the ProblemTO.comments and ProblemTO.comment

#### Mapping Concerns

- not clear if the ProblemTO.location is describing, is it evidence?
- not clear what ProblemTO.acuity.tag is
- not clear what ProblemTo.facility is
- **are we ever exposed to ProblemTO.removed=true**
- **what are the other values for ProblemTO.status**
  - how do we handle when a problem is moved from active to not active? Are we made aware of this? Should we delete, mark not active, or mark entered-in-error?
