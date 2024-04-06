
Instance: ex-MHV-ecg-0
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 0 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.41359" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2000-12-14T11:35:00Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = """
UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMQogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMTIvMTQvMDAgMTE6MzUKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46IDA3MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogMTU0CiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA4NiAgICAgICAgUFIgSU5URVJWQUw6IDEzMiAgICAgICBRUlMgRFVSQVRJT046IDEzMgogICAgICAgICBRVDogMzg4ICAgICAgICAgICAgICAgUVRDOiA0NjQKICAgICAgICAgUCBBWElTOiAxMTIgICAgICAgICAgIFIgQVhJUzogNzAgICAgICAgICAgICAgVCBBWElTOiAxNDgKCiAgICBJTlRFUlBSRVRBVElPTjogCgogICAgSU5TVFJVTUVOVCBEWDogIE5vcm1hbCBzaW51cyByaHl0aG0KICAgICAgICAgICAgICAgICAgICBSaWdodCBidW5kbGUgYnJhbmNoIGJsb2NrCiAgICAgICAgICAgICAgICAgICAgTGF0ZXJhbCBpbmZhcmN0ICwgYWdlIHVuZGV0ZXJtaW5lZAogICAgICAgICAgICAgICAgICAgIFBvc3NpYmxlIEluZmVyaW9yIGluZmFyY3QgKGNpdGVkIG9uIG9yIGJlZm9yZSAzMS1KVUwtMjAwMCkKICAgICAgICAgICAgICAgICAgICBBYm5vcm1hbCBFQ0cKICAgICAgICAgICAgICAgICAgICAuCiAgICAgICAgICAgICAgICAgICAgLgogICAgICAgICAgICAgICAgICAgIC4KCiAgICBDT05GSVJNQVRJT04gU1RBVFVTOiBDT05GSVJNRUQKCiAgICBDT01QQVJJU09OOiAKIAoKICAgIENPTU1FTlRTOiAKCiAgICBIRUFSVCBNRURTOgoKICAgIElOVEVSUFJFVEVEIEJZOiBURVNUbWFydGluZXosSm9zZXBo
"""
/*
Pg. 1                                                            09/12/22 10:11
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 12/14/00 11:35
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                            WARD/CLINIC: CARDIOLOGY OUTPATIENT (LOC)
    AGE: 38                                 SEX:  MALE
    HT IN: 071                              WT LBS: 154
    BLOOD PRESSURE:                         TYPE: 

         VENT RATE: 086        PR INTERVAL: 132       QRS DURATION: 132
         QT: 388               QTC: 464
         P AXIS: 112           R AXIS: 70             T AXIS: 148

    INTERPRETATION: 

    INSTRUMENT DX:  Normal sinus rhythm
                    Right bundle branch block
                    Lateral infarct , age undetermined
                    Possible Inferior infarct (cited on or before 31-JUL-2000)
                    Abnormal ECG
                    .
                    .
                    .

    CONFIRMATION STATUS: CONFIRMED

    COMPARISON: 
 

    COMMENTS: 

    HEART MEDS:

    INTERPRETED BY: TESTmartinez,Joseph
*/


Instance: ex-MHV-ecg-1
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 1 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.36185" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2000-07-31T15:44:00Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMDcvMzEvMDAgMTU6NDQKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46IDA3MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogMTU3CiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA3NyAgICAgICAgUFIgSU5URVJWQUw6IDE0MCAgICAgICBRUlMgRFVSQVRJT046IDEzMgogICAgICAgICBRVDogNDAwICAgICAgICAgICAgICAgUVRDOiA0NTMKICAgICAgICAgUCBBWElTOiA2OSAgICAgICAgICAgIFIgQVhJUzogMTM2ICAgICAgICAgICAgVCBBWElTOiAyNAoKICAgIElOVEVSUFJFVEFUSU9OOiAKCiAgICBJTlNUUlVNRU5UIERYOiAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJlZmVycmVkIEJ5OiAgUFJFT1AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPdmVycmVhZCBCeTogTHVuYSBURVNUcm9kcmlndWV6ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRWRpdGVkIEJ5ICA6IE9saXZpYSBURVNUbWFydGluZXogICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFjcXVpcmVkIEJ5OiBFbW1hIFRFU1RzbWl0aCAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgTm9ybWFsIHNpbnVzIHJoeXRobQogICAgICAgICAgICAgICAgICAgIFJpZ2h0IGJ1bmRsZSBicmFuY2ggYmxvY2sKICAgICAgICAgICAgICAgICAgICBMZWZ0IHBvc3RlcmlvciBmYXNjaWN1bGFyIGJsb2NrCiAgICAgICAgICAgICAgICAgICAgKioqIEJpZmFzY2ljdWxhciBibG9jayAqKioKICAgICAgICAgICAgICAgICAgICBDYW5ub3QgcnVsZSBvdXQgSW5mZXJpb3IgaW5mYXJjdCAsIGFnZSB1bmRldGVybWluZWQKICAgICAgICAgICAgICAgICAgICBBYm5vcm1hbCBFQ0cgCgogICAgQ09ORklSTUFUSU9OIFNUQVRVUzogQ09ORklSTUVECgogICAgQ09NUEFSSVNPTjogCiAKCiAgICBDT01NRU5UUzogCgogICAgSEVBUlQgTUVEUzoKCiAgICBJTlRFUlBSRVRFRCBCWTogVEVTVGpvaG5zb24sQ2hhcmxvdHRlCgoKClBnLiAyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMDkvMTIvMjIgMTA6MTIKICAgICAgICAgICAgICAgICAgICAgICAgICAgQ09ORklERU5USUFMIEVDRyBSRVBPUlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgCk1IVkxJU0FPTkUsUk9CRVJUIE0gICAgNjY2LTEyLTM0NTYgICBOT1QgSU5QQVRJRU5UICAgICAgICAgICAgICBET0I6IEFVRyA5LDE5NjIKICAgICAgICAgICAgICAgICAgICAgIFBST0NFRFVSRSBEQVRFL1RJTUU6IDA3LzMxLzAwIDE1OjQ0Ci0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0="

/*
Pg. 1                                                            09/12/22 10:12
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 07/31/00 15:44
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                            WARD/CLINIC: CARDIOLOGY OUTPATIENT (LOC)
    AGE: 37                                 SEX:  MALE
    HT IN: 071                              WT LBS: 157
    BLOOD PRESSURE:                         TYPE: 

         VENT RATE: 077        PR INTERVAL: 140       QRS DURATION: 132
         QT: 400               QTC: 453
         P AXIS: 69            R AXIS: 136            T AXIS: 24

    INTERPRETATION: 

    INSTRUMENT DX:   
                                               Referred By:  PREOP                                 
                                               Overread By: Luna TESTrodriguez                     
                                               Edited By  : Olivia TESTmartinez                       
                                               Acquired By: Emma TESTsmith                           
                     
                     
                    Normal sinus rhythm
                    Right bundle branch block
                    Left posterior fascicular block
                    *** Bifascicular block ***
                    Cannot rule out Inferior infarct , age undetermined
                    Abnormal ECG 

    CONFIRMATION STATUS: CONFIRMED

    COMPARISON: 
 

    COMMENTS: 

    HEART MEDS:

    INTERPRETED BY: TESTjohnson,Charlotte



Pg. 2                                                            09/12/22 10:12
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 07/31/00 15:44
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*/



Instance: ex-MHV-ecg-2
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 2 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.566190" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 1998-12-02T10:01:13Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDA5LzEyLzIyIDEwOjEyCiAgICAgICAgICAgICAgICAgICAgICAgICBFTEVDVFJPQ0FSRElPR1JBTQpNSFZMSVNBT05FLFJPQkVSVCBNICAgIDY2Ni0xMi0zNDU2ICAgICAgICAgICAgICAgICAgICAgRE9COiBBVUcgOSwxOTYyICAoNjApIE5PVCBJTlBBVElFTlQgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIExPQ0FMIFRJVExFOiBDQVJESU9MT0dZIE5PTi1JTlZBU0lWRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMDIsIDE5OThAMTA6MDE6MTMgIEVOVFJZIERBVEU6IERFQyAwMiwgMTk5OEAxMDowMToxMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1R3aWxsaWFtcyxNSUNIRUxFICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKU0VFIE1VU0UKIAovZXMvIE1JQ0hFTEUgVEVTVHdpbGxpYW1zCnN1cGVydmlzb3IsIG1lZGljYWwgbWFjaGluZSB0ZWNoClNpZ25lZDogMTIvMDIvMTk5OCAxMDowMQ=="

/*
Pg. 1                                                  09/12/22 10:12
                         ELECTROCARDIOGRAM
MHVLISAONE,ROBERT M    666-12-3456                     DOB: AUG 9,1962  (60) NOT INPATIENT 
-------------------------------------------------------------------------------
 LOCAL TITLE: CARDIOLOGY NON-INVASIVE                            
DATE OF NOTE: DEC 02, 1998@10:01:13  ENTRY DATE: DEC 02, 1998@10:01:13      
      AUTHOR: TESTwilliams,MICHELE       EXP COSIGNER:                           
     URGENCY:                            STATUS: COMPLETED                     

SEE MUSE
 
/es/ MICHELE TESTwilliams
supervisor, medical machine tech
Signed: 12/02/1998 10:01
*/


Instance: ex-MHV-ecg-3
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 3 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.17160" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 1998-12-02T09:34:00Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMTIvMDIvOTggMDk6MzQKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46IDA3MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogMTYwCiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA3MSAgICAgICAgUFIgSU5URVJWQUw6IDE0MCAgICAgICBRUlMgRFVSQVRJT046IDEzNgogICAgICAgICBRVDogNDI4ICAgICAgICAgICAgICAgUVRDOiA0NjUKICAgICAgICAgUCBBWElTOiA3MiAgICAgICAgICAgIFIgQVhJUzogMTQwICAgICAgICAgICAgVCBBWElTOiA0NQoKICAgIElOVEVSUFJFVEFUSU9OOiAKCiAgICBJTlNUUlVNRU5UIERYOiAgTk9STUFMIFNJTlVTIFJIWVRITQogICAgICAgICAgICAgICAgICAgIFJJR0hUIEJVTkRMRSBCUkFOQ0ggQkxPQ0sKICAgICAgICAgICAgICAgICAgICBSSUdIVFdBUkQgQVhJUwogICAgICAgICAgICAgICAgICAgIEFCTk9STUFMIEVDRwogICAgICAgICAgICAgICAgICAgIE5PIFBSRVZJT1VTIEVDR1MgQVZBSUxBQkxFCgogICAgQ09ORklSTUFUSU9OIFNUQVRVUzogQ09ORklSTUVECgogICAgQ09NUEFSSVNPTjogCiAKCiAgICBDT01NRU5UUzogCgogICAgSEVBUlQgTUVEUzoKCiAgICBJTlRFUlBSRVRFRCBCWTogVEVTVGpvaG5zb24sQ2hhcmxvdHRl"

/*
Pg. 1                                                            09/12/22 10:12
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 12/02/98 09:34
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                            WARD/CLINIC: CARDIOLOGY OUTPATIENT (LOC)
    AGE: 36                                 SEX:  MALE
    HT IN: 071                              WT LBS: 160
    BLOOD PRESSURE:                         TYPE: 

         VENT RATE: 071        PR INTERVAL: 140       QRS DURATION: 136
         QT: 428               QTC: 465
         P AXIS: 72            R AXIS: 140            T AXIS: 45

    INTERPRETATION: 

    INSTRUMENT DX:  NORMAL SINUS RHYTHM
                    RIGHT BUNDLE BRANCH BLOCK
                    RIGHTWARD AXIS
                    ABNORMAL ECG
                    NO PREVIOUS ECGS AVAILABLE

    CONFIRMATION STATUS: CONFIRMED

    COMPARISON: 
 

    COMMENTS: 

    HEART MEDS:

    INTERPRETED BY: TESTjohnson,Charlotte
*/

Instance: ex-MHV-ecg-4
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 4 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.6384" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 1997-12-08T11:35:00Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMTIvMDgvOTcgMTE6MzUKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogCiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA4NSAgICAgICAgUFIgSU5URVJWQUw6IDEzNiAgICAgICBRUlMgRFVSQVRJT046IDEyOAogICAgICAgICBRVDogMzkyICAgICAgICAgICAgICAgUVRDOiA0NjYKICAgICAgICAgUCBBWElTOiA3NiAgICAgICAgICAgIFIgQVhJUzogMTYzICAgICAgICAgICAgVCBBWElTOiAyOAoKICAgIElOVEVSUFJFVEFUSU9OOiAKCiAgICBJTlNUUlVNRU5UIERYOiAgTk9STUFMIFNJTlVTIFJIWVRITQogICAgICAgICAgICAgICAgICAgIFJJR0hUIEJVTkRMRSBCUkFOQ0ggQkxPQ0sKICAgICAgICAgICAgICAgICAgICBMRUZUIFBPU1RFUklPUiBGQVNDSUNVTEFSIEJMT0NLCiAgICAgICAgICAgICAgICAgICAgKioqIEJJRkFTQ0lDVUxBUiBCTE9DSyAqKioKICAgICAgICAgICAgICAgICAgICBBQk5PUk1BTCBFQ0cKICAgICAgICAgICAgICAgICAgICBXSEVOIENPTVBBUkVEIFdJVEggRUNHIE9GIDAzLVNFUC0xOTk3IDE0OjQ0LAogICAgICAgICAgICAgICAgICAgIE5PIFNJR05JRklDQU5UIENIQU5HRSBXQVMgRk9VTkQKCiAgICBDT05GSVJNQVRJT04gU1RBVFVTOiBVTkNPTkZJUk1FRAoKICAgIENPTVBBUklTT046IAogCgogICAgQ09NTUVOVFM6IAoKICAgIEhFQVJUIE1FRFM6CgogICAgSU5URVJQUkVURUQgQlk6"

/*
Pg. 1                                                            09/12/22 10:12
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 12/08/97 11:35
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                            WARD/CLINIC: CARDIOLOGY OUTPATIENT (LOC)
    AGE: 35                                 SEX:  MALE
    HT IN:                                  WT LBS: 
    BLOOD PRESSURE:                         TYPE: 

         VENT RATE: 085        PR INTERVAL: 136       QRS DURATION: 128
         QT: 392               QTC: 466
         P AXIS: 76            R AXIS: 163            T AXIS: 28

    INTERPRETATION: 

    INSTRUMENT DX:  NORMAL SINUS RHYTHM
                    RIGHT BUNDLE BRANCH BLOCK
                    LEFT POSTERIOR FASCICULAR BLOCK
                    *** BIFASCICULAR BLOCK ***
                    ABNORMAL ECG
                    WHEN COMPARED WITH ECG OF 03-SEP-1997 14:44,
                    NO SIGNIFICANT CHANGE WAS FOUND

    CONFIRMATION STATUS: UNCONFIRMED

    COMPARISON: 
 

    COMMENTS: 

    HEART MEDS:

    INTERPRETED BY:
*/



Instance: ex-MHV-ecg-5
InstanceOf: VA.MHV.PHR.ecg
Title: "Example 5 of a MHV ECG"
Usage: #example
Description: """
Derived from the a mock ClinicalProcedureTO:
"""
* status = #current
* category[us-core] = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* category[LO] = LOINC#LP29708-2
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "ClinicalProcedureTO.3396" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 1997-09-03T14:44:00Z
* content.attachment.title = "ELECTROCARDIOGRAM"
* type = LOINC#11524-6
* contained[+] = ex-MHV-location-989
* context.related[+] = Reference(Location/ex-MHV-location-989)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMDkvMDMvOTcgMTQ6NDQKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogWlpaQ0FSRElPTE9HWSBPVVQgU1RBVAogICAgQUdFOiAzNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFWDogIE1BTEUKICAgIEhUIElOOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXVCBMQlM6IDE2MAogICAgQkxPT0QgUFJFU1NVUkU6ICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEU6IAoKICAgICAgICAgVkVOVCBSQVRFOiAwNTkgICAgICAgIFBSIElOVEVSVkFMOiAxNDAgICAgICAgUVJTIERVUkFUSU9OOiAxMzYKICAgICAgICAgUVQ6IDQyOCAgICAgICAgICAgICAgIFFUQzogNDI0CiAgICAgICAgIFAgQVhJUzogNjUgICAgICAgICAgICBSIEFYSVM6IDE0MCAgICAgICAgICAgIFQgQVhJUzogNDAKCiAgICBJTlRFUlBSRVRBVElPTjogCgogICAgSU5TVFJVTUVOVCBEWDogIFNJTlVTIEJSQURZQ0FSRElBCiAgICAgICAgICAgICAgICAgICAgSU5ERVRFUk1JTkFURSBBWElTCiAgICAgICAgICAgICAgICAgICAgUklHSFQgQlVORExFIEJSQU5DSCBCTE9DSwogICAgICAgICAgICAgICAgICAgIEFCTk9STUFMIEVDRwogICAgICAgICAgICAgICAgICAgIFdIRU4gQ09NUEFSRUQgV0lUSCBFQ0cgT0YgMDctTUFZLTE5OTcgMTQ6NTEsCiAgICAgICAgICAgICAgICAgICAgTk8gU0lHTklGSUNBTlQgQ0hBTkdFIFdBUyBGT1VORAoKICAgIENPTkZJUk1BVElPTiBTVEFUVVM6IFVOQ09ORklSTUVECgogICAgQ09NUEFSSVNPTjogCiAKCiAgICBDT01NRU5UUzogCgogICAgSEVBUlQgTUVEUzoKCiAgICBJTlRFUlBSRVRFRCBCWTo="

/*
Pg. 1                                                            09/12/22 10:12
                           CONFIDENTIAL ECG REPORT                            
MHVLISAONE,ROBERT M    666-12-3456   NOT INPATIENT              DOB: AUG 9,1962
                      PROCEDURE DATE/TIME: 09/03/97 14:44
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                            WARD/CLINIC: ZZZCARDIOLOGY OUT STAT
    AGE: 35                                 SEX:  MALE
    HT IN:                                  WT LBS: 160
    BLOOD PRESSURE:                         TYPE: 

         VENT RATE: 059        PR INTERVAL: 140       QRS DURATION: 136
         QT: 428               QTC: 424
         P AXIS: 65            R AXIS: 140            T AXIS: 40

    INTERPRETATION: 

    INSTRUMENT DX:  SINUS BRADYCARDIA
                    INDETERMINATE AXIS
                    RIGHT BUNDLE BRANCH BLOCK
                    ABNORMAL ECG
                    WHEN COMPARED WITH ECG OF 07-MAY-1997 14:51,
                    NO SIGNIFICANT CHANGE WAS FOUND

    CONFIRMATION STATUS: UNCONFIRMED

    COMPARISON: 
 

    COMMENTS: 

    HEART MEDS:

    INTERPRETED BY:
*/