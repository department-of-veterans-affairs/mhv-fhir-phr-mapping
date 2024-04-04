
MHV requests updates on medications from Vista using HL7 v2 messaging. This request is for table rows (RDT segment), thus the result is not a defined HL7v2 message, it is some table. I don't have the definition of this table. The returned message of table rows is decomposed into Java objects. The Java objects are shown in the following diagram.

<figure>
{%include medications.svg%}
<figcaption><b>Figure: MHV Java Object for Medications</b></figcaption>
</figure>
<br clear="all">

- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/SampleMedicationsServResp.json)
- This is not a VIA or HDR feed, so there is no schema. There is only the MHV Java Object definition (Note the convention of postfix of `TO` (e.g. MedicationDetail`TO`) is used in the java code object definition, but not an indication of VIA or any externally defined schema).
The results of the HL7 v2 request is a:
- the List of Medications is defined by a MedicationDetailTO which may have dispensed information and tracking information)
  - The outer MedicationDetailTO is is mapped to [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html) and **MedicationDispense**
  - Inside these outer MedicationDetailTO are lists of two objects
    - MedicationTrackingList trackingList -> tracking
      - fill out the [Medication Tracking](StructureDefinition-VA.MHV.PHR.medicationTracking.html)
    - MedicationDetailList rxRFRecords -> rfRecord
      - fill out the **MedicationDispense**

#### Mapping from

see mapping table in [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html#notes) 

#### Mapping Concerns

- not sure what to do when the inner MedicationDetailTO is different than the outer MedicationDetailTO in ways that are not consistent with a MedicationDispense
- MedicationDispense.status does not have a clear source
  - It seems we only get current, so how can we change a previously active to now be inactive?
  - possibly `dispStatus`, or `refillStatus`?
- source `category` seems to have value of `Rx Medication` or `Documented by VA`
  - Should `Documented by VA` set MedicationRequest.reported[x]?
- no clear place to record tracking. No clear linkage between a tracking and which dispense.
