
- The [mock example 1](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/labs.xml)
- maps to [LabReportTO, LabTestTO, LabResultTO and LabSpecimenTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VIA - LabReportTO +](StructureDefinition-VA.MHV.PHR.labReport-mappings.html#mappings-for-via-to-mhv-fhir-phr-labreportto)
- [Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
- This profile is based on:
  - [US-Core DiagnosticReport profile for Laboratory Results Reporting]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) and 
  - [US Core Laboratory Result Observation Profile]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-observation-lab.html) and
  - [FHIR Specimen as US Core didn't profile]({{site.data.fhir.path}}specimen.html)
- The LabTestTO plus LabResultTO are combined and mapped onto a FHIR [Observation for laboratory result](StructureDefinition-VA.MHV.PHR.labTest.html) that is contained in the DiagnosticReport. The map to [VIA LabTestTO and LabResultTO](StructureDefinition-VA.MHV.PHR.labTest-mappings.html#mappings-for-via-to-mhv-fhir-phr-labtestto).
- The LabSpecimen is mapped into a [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html) resource that is contained in the DiagnosticReport. The map to [VIA LabSpecimenTO](StructureDefinition-VA.MHV.PHR.LabSpecimen-mappings.html#mappings-for-via-to-mhv-fhir-phr-labspecimen).
- The use of contained means that we do not need to de-duplicate the lab tests or specimen. Note that means that the specimen and observations are no individually findable or referenceable.
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.labReport` to indicate the intent to be compliant with this profile
- `code.text` contains the original `labReportTO.title`
  - `code.coding` also includes the type in LOINC
    - Pathology -> LOINC#11526-1 "Pathology study"
      - SP - Surgical Pathology
      - CY - Cytology
      - EM - Electron Microscopy
    - MI -> LOINC#18725-2 "Microbiology studies (set)"
  - `coding` may have a supplied loinc
- `category` must be `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
  - `category` also holds 0..* codes from the contained Observation.code
- VIA will stop sending us entries. so
  - Thus we will be using [Index-Update-and-Delete](background.html#entered-in-error)
- There is no data available to fill out a ServiceRequest
- Note that recommendation on pathology is to just keep the overall presented form, and not bother with the observations.

### Business rules

- ignore all but `SP`, `CY`, `EM`, and `MI`
  - Process Pathology and Microbiology differently
- Pathology
  - if "STATUS:" is found and not "COMPLETE", then ignore
  - if "DATE COMPLETED:" is found, consider it complete and don't ignore
    - ignore all those with no "Date  completed:" in the text body
    - hold is calculated off of this (if no time is given, midnight on this day is presumed)
    - DiagnosticReport.issued
- Micro
  - ignore with no "FINAL REPORT =>" in the text body, and when the date given is malformed
    - hold is calculated off of this (if no time is given, midnight on this day is presumed)
    - DiagnosticReport.issued

#### Needed examples

- need more examples
  - Need to determine what happens with deleted/entered-in-error
  - Need to better understand body site vs sample identification - labs for blood or Urine tests.
  - schema values but no examples: author, caseNumber, comment, facility

#### Mapping Concerns

- how to handle specimen bodySite vs sample - "Site/Specimen: " or "Collection sample:". from KBS: in vista there is a "collection sample" 60/300 that identifies the sample, "topography" 61/.01 covers where the data came from. historic vista data is not well behaved.
  - TODO: Don't change until we get better data (Blood and urine)
- The labReportTO/type
  - Pathology -> todo: code=LOINC#11526-1 "Pathology study"
    - SP - Surgical Pathology -> TODO category=v2-0074#SP
    - CY - Cytology --- I have no mock data -> TODO category=v2-0074#CP
    - EM - Electron Microscopy  --- I have no mock data -> TODO category=v2-0074#OTH -- 73512001 "Electron microsopic study (procedure)"
  - MI -> todo: code=LOINC#18725-2 "Microbiology studies (set)"  -> TODO category=v2-0074#MB
- no performer, possibly the Organization is in result.labSiteId - e.g., `<labSiteId>989</labSiteId>`
- KBS has a question outstanding with micro. FHIR modeling seems to be from lab perspective, not from EHR.  FHIR-44631
- TODO update fhir mapping from table updates

### Mapping

Pathology and MicroBiology are processed differently. The `text` report is processed line by line to extract out some elements. See `labReportTO/text {foo}` where `foo` is the string searched for. Very little of the xml schema is used.

<figure>
{%include lab.svg%}
<figcaption><b>Figure: Pathology and Microbiology Labs</b></figcaption>
</figure>
<br clear="all">

| V | VN | VIA labReportTO                              |   MHV eVault Pathology          |  MHV eVault Micro     | FHIR                                | Note       |
|---|----|----------------------------------------------|---------------------------------|-----------------------|-------------------------------------|------------|
|   |    | labReportTO/id                               |  id                             | id                    | DiagnosticReport.identifier[TOid]   |  |
|   |    |                                              |  icn={icn}                      | icn={icn}             | DiagnosticReport.subject            |  |
|   |    | taggedLabReportArray/tag                     |  stationNumber={namespaceId}    | stationNumber         | DiagnosticReport.performer[org]     |  |
|   |    |   ""                                         |                                 | orderingLocation      |  |  |
|   |    |   ""                                         |                                 | performingLocation    |  |  |
|   |    | labReportTO/type                             | typeOfReport                    |                       | DiagnosticReport.code.coding        | CY/Cytology, SP/Surgical Pathology, EM/Electron Microscopy
|   |    | labReportTO/facility                         | performingLocation              |                       | DiagnosticReport.performer(Org)     | |
|   |    | labReportTO/text                             | reportText                      | reportText            | DiagnosticReport.presentedForm.data | base64 with contentType=text/plain |
|   |    | labReportTO/text {status:}                   |                                 |                       |                                     | ignore all that are not COMPLETED |
|   |    | labReportTO/text {specimen}                  | specimen                        |                       | Specimen.type.text                  | Not sure why parsed out of the text, vs using specimen/name |
|   |    | labReportTO/text {date obtained:}            | collectedDateTime[x]            |                       | Specimen.collectedDateTime          | Not sure why parsed out of the text, vs using specimen/collectionDate
|   |    | labReportTO/text {signed}                    | completedDateTime[x]            |                       | DiagnosticReport.issued             | signed is used for date if it exists
|   |    | labReportTO/text {date completed:}           | completedDateTime[x]            | completedDateTime[x]  | DiagnosticReport.issued             | used in **hold** for Path |
|   |    | labReportTO/text {test(s) ordered:}          |                                 | orderedTest           |                                     | no mock examples |
|   |    | labReportTO/text {provider:}                 |                                 | orderingProvider      | DiagnosticReport.performer(Pra).display | only have string |
|   |    | labReportTO/text {site/specimen:}            |                                 | specimenSource        | Specimen.collection.bodySite        | location? KBS/TODO |
|   |    | labReportTO/text {collection sample:}        |                                 | collectionSample      | Specimen.type.text                  | |
|   |    | labReportTO/text {collection date:}          |                                 | collectedDateTime[x]  | Specimen.collectedDateTime          | Not sure why parsed out of the text, vs using specimen/collectionDate
|   |    | labReportTO/text {final report =>}           |                                 |                       | DiagnosticReport.issued             | used in **hold** |
|   |    | labReportTO/title                            |                                 |                       | DiagnosticReport.code.text          | |
|   |    |                                              |                                 |                       | DiagnosticReport.category=`LAB`     | also all chTest code |
|   |    |                                              |                                 |                       | DiagnosticReport.status=`final`     |  |
|   |    | labReportTO/id                               |                                 |                       | DiagnosticReport.identifier[Rid]    |  |
|   |    |                                              |                                 |                       | DiagnosticReport.result={Observation} | multiple  |
|   |    |                                              |                                 |                       | DiagnosticReport.specimen={Specimen} |  |
|   |    |                                              |                                 |                       | Specimen.status=`available`         |  |
|   |    | labReportTO/specimen/name                    |                                 |                       | Specimen.type.text                  | not done this way today |
|   |    | labReportTO/specimen/collectionDate          |                                 |                       | Specimen.collectedDateTime          | not done this way today |
|   |    | labReportTO/specimen/accessionNum            |                                 |                       | Specimen.accessionIdentifier        |  |
|   |    | labReportTO/specimen/id                      |                                 |                       | Specimen.identifier                 | might not be an identifier |
|   |    | labReportTO/timestamp                        |                                 |                       | DiagnosticReport.issued             | no mock examples |
|   |    | labReportTO/result/timestamp                 |                                 |                       | DiagnosticReport.issued             |  |
|   |    | labReportTO/result/labSiteId                 |                                 |                       | DiagnosticReport.performer(Org)     | |
|   |    | labReportTO/caseNumber                       |                                 |                       | DiagnosticReport.basedOn.identifier | no mock examples |
|   |    | labReportTO/tests/labTestTO[m]/result/value  |                                 |                       | Observation[m].valueString          | samples all valueString |
|   |    | labReportTO/tests/labTestTO[m]/id            |                                 |                       | Observation[m].identifier[TOid]     | |
|   |    | labReportTO/tests/labTestTO[m]/name          |                                 |                       | Observation[m].code.text            | |
|   |    | labReportTO/tests/labTestTO[m]/loinc         |                                 |                       | Observation[m].code.coding          | no mock examples |
|   |    |                                              |                                 |                       | Observation[m].specimen={Specimen}  |  |
|   |    |                                              |                                 |                       | Observation[m].status=`final`       |  |
|   |    |                                              |                                 |                       | Observation[m].category=`laboratory` |  |
|   |    |   ""                                         |                                 |                       | Observation[m].performer={DiagnosticReport.performer(Org)} | |
|   |    |                                              |                                 |                       | Observation[m].issued={DiagnosticReport.issued} |  |
|   |    |                                              |                                 |                       | Observation[m].effectiveDate={DiagnosticReport.effectiveDate} |  |
|   |    | schema has other elements
{: .grid}



