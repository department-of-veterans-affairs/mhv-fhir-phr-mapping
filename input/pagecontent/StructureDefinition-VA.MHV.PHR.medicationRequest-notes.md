
MHV requests updates on medications from Vista using HL7 v2 messaging. This request is for table rows (RDT segment), thus the result is not a defined HL7v2 message, it is some table. I don't have the definition of this table. The returned message of table rows is decomposed into Java objects. The Java objects are shown in the following diagram.

<figure>
{%include medications.svg%}
<figcaption>MHV Java Object for Medications</figcaption>
</figure>
<br clear="all">

- The [mock example](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/SampleMedicationsServResp.json)
- This is not a VIA or HDR feed, so there is no schema. There is only the MHV Java Object definition (Note the convention of postfix of `TO` (e.g. MedicationDetail`TO`) is used in the java code object definition, but not an indication of VIA or any externally defined schema).
The results of the HL7 v2 request is a:
- the List of Medications is defined by a MedicationDetailTO which may have dispensed information and tracking information)
  - The outer MedicationDetailTO is is mapped to [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html)
    - This is also a [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html)
  - Inside these outer MedicationDetailTO are lists of two objects
    - MedicationTrackingList trackingList -> tracking
      - fill out the [Medication Tracking](StructureDefinition-VA.MHV.PHR.medicationTracking.html)
    - MedicationDetailList rxRFRecords -> rfRecord
      - fill out the [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html)
  - Image of the dispensed medication (NDC) is not supported.
    - Could use FHIR **MedicationKnowledge** look up by `.code` by NDC; use the `.drugCharacteristic.valueBase64Binary` where the .type is `http://terminology.hl7.org/CodeSystem/medicationknowledge-characteristic#Image`
    - These MedicationKnowledge resources should be managed at a much broader level than MHV
    - Shortterm - just continue using the lookup API we are providing

#### Mapping from

All of the US-Core requirements are fulfilled.
Note that the outer MedicationDetailTO is also the first dispense.

Some have no place to go, we could create extensions for them but then we would be passing information that ultimately will not be available from Cerner. 

- refillSubmitDate -- we could stage a MedicationDispense with a whenPrepared, but that is not really the meaning of that element
- refillRemaining

unclear what the MHV value of `quantity` holds. how is this related to total, refill, how many left, etc.
- quantity is the number of units in a refill

unclear what the various stations, facilities, and locations mean relative to the ordering location, the dispensing location, the handover location, etc.

Only convert those MedicationDetailTO with .category = "Rx Medication". Those with "Documented by VA" are not to be recorded as a [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html), they might be a MedicationStatement but that is a task for the future.

Could use .supportingInformation to hold contained resources.
Many elements in the FHIR MedicationRequest would not be populated.
Rows with `???` seem like we should be able to populate them.

| MHV MedicationDetail  | FHIR [Medication Request](StructureDefinition-VA.MHV.PHR.medicationRequest.html)  | FHIR [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html) | lost? |
|-----------------------|-------------------------|-------------------------|-------|
| refillStatus;         | ~status                 | ~status
| refillSubmitDate;     |                         |                         | whenPrepared (not really right)   |
| refillDate;           |                         | whenHandedOver
| refillRemaining;      | dispenseRequest.numberOfRepeatsAllowed | dispenseRequest.numberOfRepeatsAllowed
| facilityName;         |                         | location
| isRefillable;         |                         | if !true status=completed
| isTrackable;          |                         |                         | ???   |
| prescriptionId;       | identifier[prescriptionId]    | identifier[prescriptionId]
| sig;                  | dosageInstruction.text        | dosageInstruction.text
| orderedDate;          | authoredOn
| quantity;             |                         | quantity
| expirationDate;       | dispenseRequest.validityPeriod.end | dispenseRequest.validityPeriod.end
| prescriptionNumber;   | identifier[prescriptionNumber]  | identifier[prescriptionNumber]
| prescriptionName;     | medicationCodeableConcept.text  | medicationCodeableConcept.text
| dispensedDate;        |                         | whenHandedOver (dup of refillDate)
| stationNumber;        |                         | location (dup of facilityName)
| inCernerTransition;   |                         |                         | ???   |
| notRefillableDisplayMessage; |  statusReason ?  |
| cmopDivisionPhone;    |                         | performer.actor(Organization)
| cmopNdcNumber;        |                         |                         | ???   |
| id;                   | *dup of prescriptionId*
| userId;               | requester(Practitioner) | performer.actor(Practitioner)
| providerFirstName;    | requester(Practitioner) | performer.actor(Practitioner)
| providerLastName;     | requester(Practitioner) | performer.actor(Practitioner)
| remarks;              | note.text               | note.text
| divisionName;         |                         |                         | ???   |
| modifiedDate;         | meta.lastUpdated        | meta.lastUpdated
| institutionId;        |                         |                         | ???   |
| dialCmopDivisionPhone |                         |                         | ???   |
| dispStatus;           |                         |                         | ???   |
| ndc;                  | medicationCodeableConcept[NDC] | medicationCodeableConcept[NDC]
| reason;               |                         |                         | ???   |
| prescriptionNumberIndex |                       |                         | ???   |
| prescriptionSource;   | must be "RX"            | type(RF-refill, PF-partial)
| disclaimer;           |                         |                         | ???   |
| indicationForUse;     |                         |                         | ???   |
| indicationForUseFlag; |                         |                         | ???   |
| category;             | only "Rx Medication"    |                         | ???   |
| isTracking;           |                         |                         | ???   |
|                       | intent=`order`          | intent=`order`
|                       | subject=Patient         | subject=Patient
|                       |                         | authorizingPrescription=medicationRequest(*)
|                       | category ???            | category ???
|  | priority
|  | doNotPerform
|  | encounter
|  | supportingInformation
|  | performer
|  | performerType
|  | recorder
|  | reasonCode
|  | reasonReference
|  | instantiatesCanonical
|  | instantiatesUri
|  | basedOn
|  | groupIdentifier
|  | courseOfTherapyType
|  | insurance
|  | dispenseRequest.initialFill
|  | dispenseRequest.dispenseInterval
|  | dispenseRequest.quantity
|  | dispenseRequest.expectedSupplyDuration
|  | dispenseRequest.performer
|  | substitution
|  | priorPrescription
|  | detectedIssue
|  | eventHistory
|  |  | category
|  |  | context
|  |  | supportingInformation
|  |  | performer
|  |  | performer.function
|  |  | quantity (amount dispensed)
|  |  | daysSupply
|  |  | destination
|  |  | receiver
|  |  | substitution
|  |  | detectedIssue
|  |  | eventHistory
{:.grid}

##### va.gov UX mapping

From the UX document from va.gov. The first column is the terms they use, the other columns are where they would get that data from FHIR.

| va.gov UX         | MHV med             | MedicationRequest         | MedicationDispense |
|-------------------|---------------------|---------------------------|----------------|
prescription ID     | prescriptionId      | identifier[prescriptionNumber]  | identifier[prescriptionNumber]
prescription Number | prescriptionNumber  | identifier[prescriptionId]
prescription name   | prescriptionName    | medicationCodeableConcept.text
refill status       | refillStatus        | ~status
refill date         | refillDate          |                           | whenHandedOver |
refill submit status | ???
refill remaining    | refillRemaining     |                           | numberOfRepeatsAllowed
facility name       | ???
ordered date        | refillDate          |                           | whenPrepared ~~~
quantity            | quantity            |                           | quantity
expiration date     | ??? is this the date that the prescription did expire ??? Which would be MedicationRequest.status==completed, the value of _lastUpdated
dispense date       | dispensedDate       |                           | whenHandedOver
station number      | stationNumber       |                           | ???
is refillable       | isRefillable        |                           | status==completed
is trackable        | isTrackable         | ???
{:.grid}


##### refillStatus

| PrescriptionStatusEnumeration | FHIR code |
|-------------------------------|-----------|
| ACTIVE("active","Active"),                        | active
| ACTIVE_PARKED("activeParked","Parked"),           | on-hold
| SUBMITTED("submitted","Submitted"),               | draft
| SUSPENDED("suspended","Refill in Process"),       | on-hold
| REFILLINPROCESS("refillinprocess","Refill in Process"), | active
| NONVERIFIED("nonVerified","NonVerified"),         | unknown
| HOLD("hold","Hold"),                              | on-hold
| EXPIRED("expired","Expired"),                     | completed
| DISCONTINUED("discontinued","Discontinued"),      | stopped
| DISCONTINUEDBYPROVIDER("discontinuedByProvider","DiscontinuedByProvider"),    | stopped
| PROVIDERHOLD("providerHold","ProviderHold"),      | on-hold
| DISCONTINUEDEDIT("discontinuedEdit","DiscontinuedEdit"), | ???
| DELETED("deleted","Deleted"),                     | entered-in-error
| TRANSFERRED("transferred","Transferred"),         | cancelled
| REFILLREQUEST("refillRequest","RefillRequest"),   | active
| RENEW("renew","Renew"),                           | active
| NEWORDER("newOrder","NewOrder"),                  | active
| DATEOFDEATHENTERED("dateOfDeathEntered","DateOfDeathEntered"),    | stopped
| UNKNOWN("unknown","Unknown"),                     | unknown
| NONVA("non-va","Non-VA");                         | unknown
{:.grid}

##### category

In theory we only see Rx medication. So the following is not useful. 

Note that the mock sample data does have "Documented by VA", which might be non-VA meds? These should not be converted as they are not dispensable. These could be recorded as a MedicationStatement resource.

| CategoryTypeEnumeration | FHIR |
|-------------------------|------|
| M("M", "Rx Medication"),
| OTC("OTC", "Over-the-Counter"),
| H("H", "Herbal"),
| S("S", "Supplement"),
| O("O", "Other");
{:.grid}

##### frequency

I don't know where this shows up.

| FrequencyEnumeration | FHIR |
|----------------------|------|
| D1("D1", "1xDaily"),
| D2("D2", "2xDaily"),
| D3("D3", "3xDaily"),
| D4("D4", "4xDaily"),
| D5("D5", "5xDaily"),
| W1("W1", "1xWeekly"),
| W2("W2", "2xWeekly"),
| W3("W3", "3xWeekly"),
| W4("W4", "4xWeekly"),
| W5("W5", "5xWeekly"),
| N1("N1", "1xAsNeeded"),
| N2("N2", "2xAsNeeded"),
| N3("N3", "3xAsNeeded"),
| N4("N4", "4xAsNeeded"),
| N5("N5", "5xAsNeeded");
{:.grid}

#### Mapping Concerns

- not sure what to do when the inner MedicationDetailTO is different than the outer MedicationDetailTO in ways that are not consistent with a [Medication Dispense](StructureDefinition-VA.MHV.PHR.medicationDispense.html)
- MedicationDispense.status does not have a clear source
  - It seems we only get current, so how can we change a previously active to now be inactive?
  - possibly `dispStatus`, or `refillStatus`?
    - dispStatus is a more friendly display value derived off of the refillStatus
- source `category` seems to have value of `Rx Medication` or `Documented by VA`
  - Should `Documented by VA` be put these into MedicationStatement?
- source `quantity` from the mock data I have, this seems like the number of refills, and only is populated in the outer MedicationDetailTO
- no clear place to record tracking. No clear linkage between a tracking and which dispense.
