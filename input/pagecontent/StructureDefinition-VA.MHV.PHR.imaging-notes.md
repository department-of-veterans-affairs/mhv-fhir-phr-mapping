
- maps to [imagingExamTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/e40d5615d08d4b41d4ff01dbaffd568522c4b29e/src/main/resources/VIA_v4.0.7_uat.wsdl#L1456) schema.
- An example of a [transaction Bundle](Bundle-images.html) with many image reports as DiagnosticReport.
  - This was transformed using the included XSLT below
  - from the [mock sample SOAP message](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/radiology.xml) MHV receives.
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-via-to-mhv-fhir-phr-imagingexamto)
- based on [US-Core for Report and Note Exchange]({{site.data.fhir.hl7fhiruscore}}StructureDefinition-us-core-diagnosticreport-note.html)
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.imaging` to indicate the intent to be compliant with this profile
- category[us-core] = LOINC#LP29684-5 "Radiology"
- Order and Encounter are not converted into FHIR resources, but just the identifiers (TODO this should be contained resources)

#### Business Rules

- Ignore if no facility
- hold is calculated from the "Date Verified:" text found in the report body

#### Mapping Concerns

- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them.
  - hasImages
  - imagingType - always was GENERAL RADIOLOGY
  - facility - no clear place. Need to understand this better, is it data best put inside a contained Encounter?
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
- status
  - radiologyReportTO.status -- always "Verified" in our mock data. not clear what else it might be. Might this be the signature status on the report?
  - imagingExamTO.status -- always "COMPLETE" in our mock data. not clear what else it might be
- effectiveDateTime should be the time of the event, not the report. issued should be used, but that is an Instant datatype which I might not be able to fill.

### TODO

Look thru legacy code to see what is preserved.
- does it preserver hasImages?
- is there a link between reports and images?
- is HDR the only source? Or do we also get some from CVIX?
