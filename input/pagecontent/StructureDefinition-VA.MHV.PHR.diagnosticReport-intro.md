
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
- `status` is `final` or `preliminary` or `entered-in-error`
- `effectiveDateTime` when the specimen was captured
- `issued` is the lab report complete timestamp
- `performer` is the lab report author as contained Organization and/or Practitioner
- Chem-Hem
  - `code.text` = `CH`
  - `category` is `http://terminology.hl7.org/CodeSystem/v2-0074#CH` for Chem-Hem lab results
  - `extension[note]` is the lab report comments
  - `basedOn` is the lab order as contained Orders [ServiceRequest(s)](StructureDefinition-VA.MHV.PHR.chOrder.html)
  - `specimen` are the contained [Specimen](StructureDefinition-VA.MHV.PHR.chSpecimen.html)
  - `results` are the contained [Observation(s)](StructureDefinition-VA.MHV.PHR.chTest.html)
- Microbiology
  - `code.text` = report `title`
  - `code.coding` is `http://terminology.hl7.org/CodeSystem/v2-0074#MB` for Microbiology lab results
  - `presentedForm` is the lab report text
  - `basedOn.identifier` may be the caseNumber
  - `specimen` are the contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
  - `results` are the contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
- Pathology
  - `code.text` = report `title`
  - `code.coding` is `http://terminology.hl7.org/CodeSystem/v2-0074#SP` for Surgical Pathology lab results
  - `presentedForm` is the lab report text
  - `basedOn.identifier` may be the caseNumber
  - `specimen` are the contained [Specimen](StructureDefinition-VA.MHV.PHR.LabSpecimen.html)
  - `results` are the contained [Observation](StructureDefinition-VA.MHV.PHR.labTest.html)
- Note that `specimen` and `observation` are different between Chem-Hem and Microbiology/Pathology.
- Note the use of contained `ServiceRequest`, `Specimen`, and `Observation` means that they are not individually findable or referenceable. To find Observations, look for the Observation code in the DiagnosticReport.category, then look for the contained Observation with that code.
- no other elements are populated

More detailed profiling, including the `ServiceRequest`, `Specimen`, and `Observation` details:

### Chem-Hem

- [Chem-Hem (CH) Diagnostic Report](StructureDefinition-VA.MHV.PHR.chReport.html) most common:
  - Basic Metabolic Panel or BMP
  - Comprehensive Metabolic Panel or CMP
  - CBC (complete blood count)
  - Hemoglobin A1C

<figure>
{%include chLab.svg%}
<figcaption><b>Figure: Chem-Hem Labs</b></figcaption>
</figure>
<br clear="all">

### Lab Report

- [LabReport for Pathology](StructureDefinition-VA.MHV.PHR.SPlabReport.html) most common:
  - PATHOLOGY SURGICAL TISSUE REQUEST
  - CYTOLOGY REQUEST (this one is cytology)
  - SURGICAL PATHOLOGY EXAM
  - PATHOLOGY SURGICAL REQUEST
  - SURGICAL TISSUE EXAM
  - SURGICAL PATHOLOGY
- [LabReport for Microbiology](StructureDefinition-VA.MHV.PHR.MBlabReport.html) most common:
  - Gram Stain
  - Anaerobic Culture
  - Vibrio Culture
  - Spinal Culture
  - Blood Culture
  - Stool Culture
  - Campylobacter Culture

<figure>
{%include lab.svg%}
<figcaption><b>Figure: Pathology and Microbiology Labs</b></figcaption>
</figure>
<br clear="all">

### Search Consideration

Should search for entries that do **not** have `status=entered-in-error` (i.e., `&status:not=entered-in-error`)
> GET {path}/DiagnosticReport?patient={patient}&status:not=entered-in-error
