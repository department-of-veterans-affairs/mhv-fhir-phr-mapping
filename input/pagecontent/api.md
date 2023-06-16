
This section is focused on use of the FHIR API. The FHIR API is made up of the data that is mapped. Thus the [Vista Mapping](background.html) is not critical but may be useful background.

All MHV profiles are based on [HL7 FHIR US-Core](http://hl7.org/fhir/us/core/STU5.0.1/index.html) implementation guide, which provides guidance to the USA marketplace that VHA participates within.  Deeper explanation is provided in the US-Core specification.

The MHV FHIR Server would have a similar [CapabilityStatement](CapabilityStatement-MHVcapabilities.html).

- [Allergy and Intolerance](StructureDefinition-VA.MHV.PHR.allergyIntolerance.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.allergyIntolerance-examples.html)
- [Conditions](StructureDefinition-VA.MHV.PHR.condition.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.condition-examples.html)
- [DiagnosticReport](StructureDefinition-VA.MHV.PHR.diagnosticReport.html) shows all of the DiagnosticReport. Including Microbiology, Pathology, and Chem-Hem.
  - [Microbiology and Pathology Examples](StructureDefinition-VA.MHV.PHR.labReport-examples.html)
  - [Chem-Hem Examples](StructureDefinition-VA.MHV.PHR.chReport-examples.html)
- [DocumentReference](StructureDefinition-VA.MHV.PHR.documentReference.html) shows all uses of DocumentReference. Including Notes, Discharge Summary, EKG, and Imaging.
  - [Note Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
    - Clinical Notes, Discharge Summary
  - [ECG Examples](StructureDefinition-VA.MHV.PHR.ecg-examples.html)
  - [Imaging Examples](StructureDefinition-VA.MHV.PHR.imaging-examples.html)
- [Immunization](StructureDefinition-VA.MHV.PHR.immunization.html)
  - [Examples](StructureDefinition-VA.MHV.PHR.immunization-examples.html)
- [Vital-Signs](StructureDefinition-VA.MHV.PHR.vitals.html)
  - Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
    - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
  - Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
    - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)
  - Most [examples are within a Bundle](Bundle-vitals.html), which does not exposed each vital sign.

### Patient

Note that the above APIs take a patient/subject as a parameter. The expectation is that one will provide the ICN in a `patient.identifier` parameter rather than using `patient.id`.
