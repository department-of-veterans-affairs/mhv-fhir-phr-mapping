
MHV requests updates on medications from Vista using HL7 v2 messaging. This request is for table rows (RDT segment), thus the result is not a defined HL7v2 message, it is some table. I don't have the definition of this table. The returned message of table rows is decomposed into Java objects. The Java objects are shown in the following diagram.

<figure>
{%include medications.svg%}
<figcaption>MHV Java Object for Medications</figcaption>
</figure>
<br clear="all">

- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/MHV-PHR/blob/main/mocks/SampleMedicationsServResp.json)
- This is not a VIA or HDR feed, so there is no schema. There is only the MHV Java Object definition (Note the convention of postfix of `TO` (e.g. MedicationDetail`TO`) is used in the java code object definition, but not an indication of VIA or any externally defined schema).
The results of the HL7 v2 request is a:
- the List of Medications is defined by a MedicationDetailTO which may have dispensed information and tracking information)
  - The outer MedicationDetailTO is is mapped to [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html) and a [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html)
  - Inside these outer MedicationDetailTO are lists of two objects
    - MedicationTrackingList trackingList -> tracking
      - fill out the [Medication Tracking](StructureDefinition-VA.MHV.PHR.medicationTracking.html)
    - MedicationDetailList rxRFRecords -> rfRecord
      - fill out the [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html)

#### Mapping from

US-Core did not profile the SupplyDelivery.
The following map is using the tracking information found within the outer MedicationDetailTO.
The SupplyDelivery would be good to related to a [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html), but we don't have that information. We do have the rx number so can associate it with the [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html).
Rows with `???` seem like we should be able to populate them.

| MHV MedicationTracking |  fhir SupplyDelivery
|-----------------------|----------------------------|
| id;                   | identifier[trackingId]
| stationNumber;        | supplier(Organization)
| rxNumber;             | **alternate-reference**([Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html))
| carrier;              | identifier[carrierId].system
| trackingNumber;       | identifier[carrierId].value
| completeDateTime;     | occurrencePeriod.end
| divisionPhone;        | ???
| ndc;                  | ???
| dateLoaded;           | occurrencePeriod.start
| isOthersInSamePackage; | suppliedItem.quantity = 1 or -1
| isViewImageDisplayed; | ???
| isLocalTracking;      | ???
|                       | patient = patient
|                       | type = #medication
{:.grid}


#### Mapping Concerns

- Need specifics of how to put a carrier and tracking number into FHIR Identifier
- rxNumber could also be recorded in the identifier
- Not sure what to do with:
  - divisionPhone --  Is this the supplier, destination, or receiver
  - ndc -- is this the same NDC code put into the dispense? or is this only where it appears? If so, should we update the medicationRequest?
  - isOtherInSamePackage -- will represent this as a suppliedItem.quantity of 1 or -1 (-1 will mean more than one)
  - isViewedImageDisplayed
  - isLocalTracking
