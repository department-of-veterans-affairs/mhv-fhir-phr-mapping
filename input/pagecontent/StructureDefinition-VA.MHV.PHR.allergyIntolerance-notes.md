
- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/allergies.xml) 
- Received from HDR
- maps to [intoleranceConditions](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates/MHVIntoleranceConditionRead40011/template/MHVIntoleranceConditionRead40011.xsd) schema. 
- [mapping to HDR](StructureDefinition-VA.MHV.PHR.allergyIntolerance-mappings.html#mappings-for-hdr-allergy-to-mhv-fhir-phr-intolerancecondition)
- [Vivian Allegies](https://vivian.worldvista.org/dox/Global_XkdNUigxMjAuOA==.html)
- Should be based on US-Core for AllergyIntolerance Resource profile
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.allergyIntolerance` to indicate the intent to be compliant with this profile
- identifier
  - seems most of the time there is a `intoleranceCondition.recordIdentifier.namespaceId`. this should be used if it is provided
  - else there is an typical TOid slice with the value prefix of `AllergyTO.`
- a `clinicalStatus` of the allergy (e.g.,active or resolved)
  - Given that intoleranceCondition.status is unclear; will presume we only see `active`
  - set to `active`
  - if we receive indications of not active, we should update our data to remove (or set `inactive` or `entered-in-error`) the AllergyIntolerance if we had previously recorded it
- a `code` which tells you what the patient is allergic to
  - at least `code.text`
  - would be good to have a coding, but there does not appear to be any source for that
- if `drugClass` is indicated then the `category` should be #medication
  - `drugClass.code.displayText` -> `.code.coding.display`
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
- not clear if we are getting full `allergyType` details. HL7 v2 uses [two character codes](https://terminology.hl7.org/2.1.0/CodeSystem-v2-0127.html), but it seems we are getting just single character codes. It may not matter as [there is HL7 guidance](https://confluence.hl7.org/pages/viewpage.action?pageId=44499731) that only uses the three categories in FHIR. [HL7 v2 to FHIR IG](https://hl7.org/fhir/uv/v2mappings/2020sep/ConceptMap-table-hl70127-to-allergy-intolerance-type.html)

#### code inspection concerns

- need to handle when an allergy is any combination of medication, environment, and observation. Today no all combinations are supported.
