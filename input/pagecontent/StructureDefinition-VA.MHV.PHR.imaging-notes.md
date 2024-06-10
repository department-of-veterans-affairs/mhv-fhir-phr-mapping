
- maps to [imagingExamTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/e40d5615d08d4b41d4ff01dbaffd568522c4b29e/src/main/resources/VIA_v4.0.7_uat.wsdl#L1456) schema.
- the [mock sample SOAP message](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/radiology.xml) MHV receives.
- [mapping to VIA](StructureDefinition-VA.MHV.PHR.imaging-mappings.html#mappings-for-via-to-mhv-fhir-phr-imagingexamto)
- based on [US-Core for Report and Note Exchange]({{site.data.fhir.hl7fhiruscore}}StructureDefinition-us-core-diagnosticreport-note.html)
- the [XSLT to transform](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/imagingxslt.xslt) to FHIR.
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.imaging` to indicate the intent to be compliant with this profile
- category[us-core] = LOINC#LP29684-5 "Radiology"

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
- unclear the difference between the imagingStudyTO.timestamp and the radiologyReport.timestamp. Logic would be that the first is the timestamp of the study, and the second is the timestamp of the report. All data has them as the same values.
- unclear if there will ever be more than one Order
- unclear if there will ever be more than one radiologyReportTO. I think the code handles only one radiologyReportTO per imagingExamTO.
- is VIA the only source? Or do we also get some from CVIX? (asked Barry)

#### Mapping

MHV eVault has one object definition that gets replicated for each imagingExamTO with one radiologyReportTO

VIA sends 
- imagingExamTO
  - OrderTO
  - radiologyReportTO

| V | Vn | VIA                                  |   MHV eVault                  | FHIR                                  | Note       |
|---|----|------------------------------------- |-------------------------------|---------------------------------------|------------|
|   |    | imagingExamTO.accessionNum           |                               |                                       | no data
|   |    | imagingExamTO.casenum                |                               | DiagnosticReport.identifier[casenum]
|   |    | imagingExamTO.encounterId            |                               | DiagnosticReport.encounter.identifier
|   |    | imagingExamTO.facility               |                               |                                       | no data
|   |    | imagingExamTO.hasImages              |                               |                                       |           |
|   |    | imagingExamTO.id                     |                               | DiagnosticReport.identifier[TOid]
|   |    | imagingExamTO.imagingType            |                               | DiagnosticReport.code.text
|   |    | imagingExamTO.interpretation         |                               | DiagnosticReport.conclusion 
|   |    | imagingExamTO.imagingLocation        |                               | DiagnosticReport.performer [Org] 
|   |    | imagingExamTO.modifiers              |                               |                                       | no data
|   |    | imagingExamTO.name                   |                               | DiagnosticReport.title
|   |    | imagingExamTO.order [OrderTO]        |                               | DiagnosticReport.basedOn = ServiceRequest
|   |    | imagingExamTO.provider               | provider                      | DiagnosticReport.resultsInterpreter
|   |    |   """                                |                               | ServiceRequest.requester
|   |    | imagingExamTO. [radiologyReportTO]   |
|   |    | imagingExamTO.reportId               |                               |                                       | no data
|   |    | imagingExamTO.status                 |                               |                                       | presume always `COMPLETE`
|   |    | imagingExamTO.timestamp              | eventTime                     | DiagnosticReport.effectiveDateTime    |
|   |    | imagingExamTO.type.id                |                               | DiagnosticReport.code.coding.code     | CPT code
|   |    | imagingExamTO.type.name              |                               | DiagnosticReport.code.coding.display
|   |    | orderTO.id                           |                               | ServiceRequest.identifier
|   |    | orderTO.type.name1                   |                               | ServiceRequest.code.text
|   |    | orderTO.*                            |                               |                                       | no data
|   |    | radiologyReportTO.accessionNumber    |                               | DiagnosticReport.identifier[accessionNumber]
|   |    | radiologyReportTO.caseNumber         |                               | DiagnosticReport.identifier[casenum]
|   |    | radiologyReportTO.id                 |                               |                                       | duplicates imagingExamTO.id
|   |    | radiologyReportTO.title              | title                         | DiagnosticReport.presentedForm.title
|   |    | radiologyReportTO.timestamp          |                               | 
|   |    | radiologyReportTO.author             |                               |                                       | no data
|   |    | radiologyReportTO.facility           | facility                      | ServiceRequest.performer
|   |    | radiologyReportTO.status             |                               |                                       | always `Verified`
|   |    | radiologyReportTO.cptCode            |                               |                                       | no data
|   |    | radiologyReportTO.clinicalHx         |                               |                                       | no data
|   |    | radiologyReportTO.impression         |                               |                                       | no data
|   |    | radiologyReportTO.text               |                               | DiagnosticReport.presentedForm.data   |
|   |    |  text {Date Verified}                |                               | DiagnosticReport.issued               | used for Hold
|   |    |  text {Req Phys}                     | requesting_provider           | ServiceRequest.requester
|   |    |  text {Report}                       | reporttext                    |                                       | subset of the text
|   |    |  text {Impression}                   | impressiontext                |                                       | subset of the text
|   |    |  text {Exm Date}                     | examDateImprecise             |                                       | seems ImagingExamTO.timestamp
|   |    |  text {Report Status}                | status
|   |    |  text {Clinical History}             | clinical_history
|   |    |  text {reason for study}             | reason_for_study              |                                       | no data
|   |    |  text {Date Reported}                |                               | DiagnosticReport.presentedForm.created | 
|   |    | /recordsource/                       | performing_location_st_number
|   |    |                                      |                               | ServiceRequest.category = SCT#363679005 "Imaging"
|   |    |                                      |                               | ServiceRequest.status = `unknown`
|   |    |                                      |                               | ServiceRequest.intent = `order`
|   |    |                                      |                               | ServiceRequest.subject = {patient}
|   |    |                                      |                               | DiagnosticReport.category = LOINC#LP29684-5 Radiology
|   |    |                                      |                               | DiagnosticReport.status = `final` if not `entered-in-error
|   |    |                                      |                               | DiagnosticReport.subject = {patient}
|   |    |                                      |                               | DiagnosticReport.presentedForm.contentType = `text/plain`
{: .grid}
