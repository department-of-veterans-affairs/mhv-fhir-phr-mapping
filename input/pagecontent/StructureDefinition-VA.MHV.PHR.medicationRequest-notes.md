
MHV requests updates on medications from Vista using HL7 v2 messaging. This request is for table rows (RDT sgement), thus the result is not a defined HL7v2 message, it is some table. I don't have the definition of this table. The returned message of table rows is decomposed into Java objects. The Java objects are shown in the following diagram.

<figure>
{%include medications.svg%}
<figcaption>MHV Java Object for Medications</figcaption>
</figure>
<br clear="all">

- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/SampleMedicationsServResp.json)
- This is not a VIA or HDR feed, so there is no schema. There is only the MHV Java Object definition (Note the convention of postfix of `TO` (e.g. MedicationDetail`TO`) is used in the java code object definition, but not an indication of VIA or any externally defined schema).
The results of the HL7 v2 request is a:
- the List of Medications is defined by a MedicationDetailTO which may have dispensed information and tracking information)
  - The outer MedicationDetailTO is is mapped to **MedicationRequest**
  - Inside these outer MedicationDetailTO are lists of two objects
    - MedicationTrackingList trackingList -> tracking
      - No clear place to put this (Location, SupplyDelivery, Basic)
    - MedicationDetailList rxRFRecords -> rfRecord
      - fill out the **MedicationDispense**

#### Mapping from

All of the US-Core requirements are fulfilled.
Many of the source items have no place to go in MedicationRequest, they are more dispense related. 
Some have no place to go, we could create extensions for them but then we would be passing information that ultimately will not be available from Cerner. Could use .supportingInformation to hold contained resources.
Many elements in the FHIR MedicationRequest would not be populated.
Rows with `???` seem like we should be able to populate them.

| MHV MedicationDetailTO | fhir MedicationRequest
|---------------------|-----------------------------|
| refillStatus;       | ~status
| refillSubmitDate;
| refillDate;
| refillRemaining;
| facilityName;
| isRefillable;
| isTrackable;
| prescriptionId;     | identifier[prescriptionId]
| sig;                | dosageInstruction.text
| orderedDate;        | authoredOn
| quantity;           | dispenseRequest.numberOfRepeatsAllowed
| expirationDate;     | dispenseRequest.validityPeriod.end
| prescriptionNumber; | identifier[prescriptionNumber]
| prescriptionName;   | medicationCodeableConcept.text
| dispensedDate;
| stationNumber;      | 
| inCernerTransition; |
| notRefillableDisplayMessage;
| cmopDivisionPhone;
| cmopNdcNumber;
| id;                 | *dup of prescriptionId*
| userId;             | requester(Practitioner)
| providerFirstName;  | requester(Practitioner)
| providerLastName;   | requester(Practitioner)
| remarks; 	          | note.text
| divisionName;
| modifiedDate;       | meta.lastUpdated
| institutionId;	
| dialCmopDivisionPhone;
| dispStatus;         |  ~status ???
| ndc;                | medicationCodeableConcept[NDC]
| reason; 
| prescriptionNumberIndex;
| prescriptionSource;
| disclaimer;    
| indicationForUse;
| indicationForUseFlag;
| category;         | ??? reportedBoolean ???
| isTracking;
|                  | intent=`order` (no other codes)
|                  | subject=Patient
|  | category ???
|  | priority ???
|  | doNotPerform
|  | encounter
|  | supportingInformation (could use to hold anything)
|  | performer
|  | performerType
|  | recorder
|  | reasonCode ???
|  | reasonReference
|  | instantiatesCanonical
|  | instantiatesUri
|  | basedOn
|  | groupIdentifier
|  | courseOfTherapyType
|  | insurance
|  | dispenseRequest ???
|  | substitution
|  | priorPrescription
|  | detectedIssue
|  | eventHistory
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

| CategoryTypeEnumeration | FHIR |
|-------------------------|------|
| M("M", "Rx Medication"),
| OTC("OTC", "Over-the-Counter"),
| H("H", "Herbal"),
| S("S", "Supplement"),
| O("O", "Other");
{:.grid}

##### frequency

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

- not sure what to do when the inner MedicationDetailTO is different than the outer MedicationDetailTO in ways that are not consistent with a MedicationDispense
- MedicationDispense.status does not have a clear source
  - It seems we only get current, so how can we change a previously active to now be inactive?
  - possibly `dispStatus`, or `refillStatus`?
- source `category` seems to have value of `Rx Medication` or `Documented by VA`
  - Should `Documented by VA` set MedicationRequest.reported[x]?
- source `quantity` from the mock data I have, this seems like the number of refills, and only is populated in the outer MedicationDetailTO
- no clear place to record tracking. No clear linkage between a tracking and which dispense.
