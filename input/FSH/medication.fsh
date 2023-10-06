


Profile:        MHVmedicationRequest
// us-core didn't profile MedicationRequest 
//Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest
Parent: MedicationRequest
Id:             VA.MHV.PHR.medicationRequest
Title:          "VA MHV PHR medication request"
Description:    """
A profile on the MedicationRequest resource for MHV PHR exposing current VA prescribed medications using FHIR API.
"""
* ^extension[$fmm].valueInteger = 0





Mapping: MedicationRequest-Mapping
Source:	MHVmedicationRequest
Target: "Vista"
Title: "Vista to mhv-fhir-phr"
* -> "Medication"




/* 
HL7 Message: MedicationsTO -> MedicationList (0..* MedicationDetailTO ( 0..* trackingList; 0..* rxRecords))

MedicationDetailTO
	private String refillStatus;
	private String refillSubmitDate;
	private String refillDate;
	private Integer refillRemaining;
	private String facilityName;
	private Boolean isRefillable;
	private Boolean isTrackable;
	private Long prescriptionId;
	private String sig;
	private String orderedDate;
	private Integer quantity;
	private String expirationDate;;
	private String prescriptionNumber;
	private String prescriptionName;
	private String dispensedDate;
	private String stationNumber;
	private Boolean inCernerTransition;
	private String  notRefillableDisplayMessage;
	private String cmopDivisionPhone;
	private String cmopNdcNumber;
	
	private Long id;
	private Long userId;
	private String providerFirstName;
	private String providerLastName;
	private String remarks; 	
	private String divisionName;
	private String modifiedDate;		
	private Long institutionId;	
	private String dialCmopDivisionPhone;
	private String dispStatus;   
  private String  ndc;    
  private String  reason; 
  private String  prescriptionNumberIndex;
  private String  prescriptionSource;
  private String  disclaimer;    
  private String 	indicationForUse;
  private String 	indicationForUseFlag;
  private String category;
  boolean isTracking;    
	private MedicationTrackingList trackingList;	
	private MedicationDetailList rxRFRecords;


*/



Profile:        MHVmedicationDispense
// us-core didn't profile MedicationDispense 
//Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationdispense
Parent: MedicationDispense
Id:             VA.MHV.PHR.medicationDispense
Title:          "VA MHV PHR medication dispense"
Description:    """
A profile on the MedicationDispense resource for MHV PHR exposing current medications dispense using FHIR API.
"""
* ^extension[$fmm].valueInteger = 0





Mapping: MedicationDispense-Mapping
Source:	MHVmedicationDispense
Target: "Vista"
Title: "Vista to mhv-fhir-phr"
* -> "Medication"




/* 
Dispense uses the same structure  MedicationDetailTO

*/



Profile:        MHVmedicationTracking
Parent: SupplyDelivery
Id:             VA.MHV.PHR.medicationTracking
Title:          "VA MHV PHR medication dispense tracking"
Description:    """
A profile on the SupplyDelivery resource for MHV PHR exposing current medications dispense tracking using FHIR API.
"""
* ^extension[$fmm].valueInteger = 0





Mapping: MedicationTracking-Mapping
Source:	MHVmedicationTracking
Target: "Vista"
Title: "Vista to mhv-fhir-phr"
* -> "MedicationTracking"




/* 
in the MedicationDetailTO there are two lists
	- private MedicationTrackingList trackingList;	
    - this is tracking details for a dispense
	- private MedicationDetailList rxRFRecords;
    - This is the details of a dispense


MedicationTrackingTO

	private Long id;
	private String stationNumber;
	private String rxNumber;
	private String carrier;
	private String trackingNumber;
	private String completeDateTime;
	private String divisionPhone;
	private String ndc;
	private String dateLoaded;
	private boolean isOthersInSamePackage;
	private boolean isViewImageDisplayed;
	private boolean isLocalTracking;

*/
