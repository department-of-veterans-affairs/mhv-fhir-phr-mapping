
- maps to [imagingExamTO](https://github.com/department-of-veterans-affairs/mhv-np-cds-wsclient/blob/development/src/main/resources/xsd/templates/MHVIntoleranceConditionRead40011/template/MHVIntoleranceConditionRead40011.xsd) schema. 
- An example of a [transaction Bundle](Bundle-images.html) with many image reports as DocumentReference.
  - This was transformed using the included XSLT below
  - from the [mock sample SOAP message](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/radiology.xml) MHV receives.
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-via-to-mhv-fhir-phr-imagingexamto)
- based on US-Core for Clinical Notes
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.imaging` to indicate the intent to be compliant with this profile
- `type` is LOINC#18748-4 `Diagnostic imaging study`
- Order and Encounter are not converted into FHIR resources, but rather we save the original id into the Reference.identifier encoding.

#### Mapping Concerns

- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them.
  - hasImages
  - imagingType - always was GENERAL RADIOLOGY
  - facility - no clear place in DocumentReference. Need to understand this better, is it data best put inside a contained Encounter?
  - these never appeared in examples
    - modifiers
    - clinicalHX
    - impression
    - imagingExamTO
    - reportId
- Validation does not like some of our CPT codes. These might be deprecated codes, that the codeSystem that the validator is using does not include. These might also be mistakes or test data.
  - (Leaf Request #52)
  - Jay confirmed these are good, but deprecated: 71020, 78465
  - Not yet confirmed: 78478, 78990
  - unclear what other codes may come to us from Vista
  - see [zulip chat with terminology](https://chat.fhir.org/#narrow/stream/179202-terminology/topic/CPT.20code.20not.20found)
