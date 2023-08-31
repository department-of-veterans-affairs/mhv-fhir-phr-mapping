
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/allergies.xml) 
- Received from HDR
- maps to [intoleranceConditions](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates/MHVIntoleranceConditionRead40011/template/MHVIntoleranceConditionRead40011.xsd) schema. 
- [mapping to HDR](StructureDefinition-VA.MHV.PHR.allergyIntolerance-mappings.html#mappings-for-hdr-allergy-to-mhv-fhir-phr-intolerancecondition)
- [Vivian Allergy 120.8](https://vivian.worldvista.org/dox/Global_XkdNUigxMjAuOA==.html)
- Should be based on US-Core for AllergyIntolerance Resource profile
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.allergyIntolerance` to indicate the intent to be compliant with this profile
- identifier
  - seems most of the time there is a `intoleranceCondition.recordIdentifier.namespaceId`. this should be used if it is provided
  - else there is an typical TOid slice with the value prefix of `AllergyTO.`
- a `clinicalStatus` of the allergy (e.g.,active or resolved)
  - Given that intoleranceCondition.status is unclear; will presume we only see `active`
  - set to `active`
  - if we receive indications of not active, we should update our data to remove (or set `inactive` or `entered-in-error`) the AllergyIntolerance if we had previously recorded it
- a `code.text` which tells you what the patient is allergic to
- `category` derived from `.allergyType`
  - `D` -> #medication
  - `F` -> #food
  - `O` -> #environment
  - multiple codes are multiple category - for example: `DF` -> both #medication and #food
- `reaction.reaction.code` seems to be a number
  - if it is a 7 digit number, then it is a VUID and system=`urn:oid:2.16.840.1.113883.6.233`
  - else it is likely a SNOMED
- `informationSourceCategory` contains one of two values
  - `OBSERVED` shall be mapped to .verificationStatus=`confirmed`
  - `HISTORICAL` shall be mapped to .verificationStatus=`unconfirmed`
- `facilityIdentifier` is where the allergy was first recorded (The VISN number).
  - logical to put this into `.recorder`, but that doesn't support a Organization reference
  - use alternate-reference extension on the recorder, with a Organization holding the facilityIdentifier.
    - `http://hl7.org/fhir/StructureDefinition/alternate-reference`
  - contained Observation
    - if changed to not contained, in order to support _include, we must define a search parameter against alternate-reference so that can be used in search _include.

#### Mapping Concerns

- **updates from Active to not** -- given that we are only told about active allergies; what happens when we are told yesterday about a fooBar allergy, and the fooBar allergy gets removed or changed to inactive in Vista; how would we know?
  - are those `status` that are not `F` changes that we should track in FHIR?
  - Carnetta expresses that it is possible HDR and VIA are filtering out non-current data. If this is the case, then we will need HDR and VIA to stop filtering, and we will might need to have our PHR code more defensive.
  - If we are told, would we delete our instance of that allergy, or mark it inactive, or mark it entered-in-error?
- confirmed vs unconfirmed is using observed vs historical. This is historically the way MHV worked, but KMS indicates it is not correct. (Jay)
- might want to put observationalTime into recordedDate. (Jay)

#### code inspection concerns

2023-08-31
- do NOT map the drugClass.code
- do NOT use drugClass to set category
