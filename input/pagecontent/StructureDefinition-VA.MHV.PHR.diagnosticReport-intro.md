
- This profile is based on:
  - [US-Core DiagnosticReport profile for Laboratory Results Reporting]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) and 
  - [US Core ServiceRequest Profile]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-servicerequest.html)
  - [US Core Laboratory Result Observation Profile]({{site.data.fhir.hl7fhiruscore}}/StructureDefinition-us-core-observation-lab.html) and
  - [FHIR Specimen as US Core didn't profile]({{site.data.fhir.path}}specimen.html)

DiagnosticReport:

- `subject` is a reference to this patient
- `category` is `http://terminology.hl7.org/CodeSystem/v2-0074#LAB`
  - `category` may also holds codes from the contained Observation.code
- `identifier` will have cross reference to original source
- `status` is `final` or `preliminary`
- `effectiveDateTime` when the specimen was captured
- `issued` is the lab report timestamp
- `performer` is the lab report author as contained Organization and/or Practitioner
- `specimen` are the specimen details as contained Specimen
- `result` are the lab result details as contained Observation
- Chem-Hem
  - `code.text` = `CH`
  - `extension[note]` is the lab report comments
  - `basedOn` is the lab order as contained ServiceRequest
- Pathology or Microbiology
  - `code.text` = report `title`
  - `code.coding` will be [from Lab Report ValueSet](ValueSet-LabReportVS.html)
  - `basedOn.identifier` may be the caseNumber
  - `presentedForm` is the lab report text
- Note the use of contained `ServiceRequest`, `Specimen`, and `Observation` means that they are not individually findable or referenceable. To find Observations, look for the Observation code in the DiagnosticReport.category, then look for the contained Observation with that code.
- no other elements are populated

More detailed profiling, including the `ServiceRequest`, `Specimen`, and `Observation` details:

### Chem-Hem

[Chem-Hem (CH) Diagnostic Report](StructureDefinition-VA.MHV.PHR.chReport.html)

<figure>
{%include chLab.svg%}
<figcaption><b>Figure: Chem-Hem Labs</b></figcaption>
</figure>
<br clear="all">

### Lab Report

[LabReport for Microbiology and Pathology](StructureDefinition-VA.MHV.PHR.labReport.html)

<figure>
{%include lab.svg%}
<figcaption><b>Figure: Pathology and Microbiology Labs</b></figcaption>
</figure>
<br clear="all">

### Search Consideration

Should search for entries that do **not** have `status=entered-in-error` (i.e., `&status:not=entered-in-error`)
> GET {path}/DiagnosticReport?patient={patient}&status:not=entered-in-error
