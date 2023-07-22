
- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/allergies.xml) 
- Received from HDR
- maps to [intoleranceConditions](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates/MHVIntoleranceConditionRead40011/template/MHVIntoleranceConditionRead40011.xsd) schema. 
- [mapping to VHIM](StructureDefinition-VA.MHV.PHR.allergyIntolerance-mappings.html#mappings-for-vhim-allergy-to-mhv-phr-intolerancecondition)
- Should be based on US-Core for AllergyIntolerance Resource profile
- should have `meta.profile` set to `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.allergyIntolerance` to indicate the intent to be compliant with this profile
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

#### Mapping Concerns

- `facilityIdentifier` might be where the allergy was first recorded, but there is no place for this in the FHIR AllergyIntolerance.
  - maybe put in .meta.source or Provenance
- no clear place to record `recordSource`, `recordVersion`
  - maybe in the .meta.source or in a Provenance
- no clear handling of `informationSourceCategory`
  - mock data = 4500978/OBSERVED, 4500975/HISTORICAL
  - this might be FHIR `.verificationStatus`, but we must fill that element with one of the FHIR defined codes (unconfirmed, confirmed, refuted, or entered-in-error)
  - could define a mapping to .verificationStatus codes (might be OBSERVED is confirmed, and HISTORICAL is unconfirmed?)
  - or could define an extension if this is needed
- **updates from Active to not** -- given that we are only told about active allergies; what happens when we are told yesterday about a fooBar allergy, and the fooBar allergy gets removed or changed to inactive in Vista; how would we know? If we are told, would we delete our instance of that allergy, or mark it inactive, or mark it entered-in-error?
  - are those `status` that are not `F` changes that we should track in FHIR?

#### Notes to Roger

- are you handling when an allergy is both a medication and environment and observation?
  - Note medication should be set if EITHER 'D' or a drugClass
- I am unclear on how your .identifier logic results
  - line 312
  - This does not follow the pattern
- The reactant we are given is not always snomed.
  - if it is a 7 digit number, then it is a VUID and system=`urn:oid:2.16.840.1.113883.6.233`
  - else it is likely a SNOMED system=`http://snomed.info/sct`
- should have `meta.profile` set to `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.allergyIntolerance` to indicate the intent to be compliant with this profile

#### Notes to Muazzam

- what are other status values besides `F`?
- only those with `facilityIdentifier` are processed (is this just robustness, or is there a reason?)
- I am unclear on what your logic around `getInformationSourceCategory` is. You seem to have some logic for handling HISTORIC and OBSERVED, but I can't understand the logic.
  - line 224 
  - This seems to not result in anything.
  - I was wondering if there was some value to the InformationSourceCategory values.
  
