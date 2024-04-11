/* not showing allergy and immunology notes

Instance: ex-MHV-note-0
InstanceOf: VA.MHV.PHR.note
Title: "Example 0 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5281919" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-12T12:50:56Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-37569)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-37569)
* authenticator.extension[when].valueDateTime = 2022-08-12T12:51:34Z
* context.related[+] = Reference(Location/ex-MHV-location-552)
* content.attachment.contentType = #text/plain
* content.attachment.data = "="

*/

Instance: ex-MHV-note-1
InstanceOf: VA.MHV.PHR.note
Title: "Example 1 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:
"""
//* meta.extension[lastSourceSync].valueDateTime = 2024-01-12T16:47:01Z
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5281863" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-05T16:56:00Z
* content.attachment.title = "Adverse React/Allergy"
* type.coding[LO] = LOINC#11506-3 "Progress note"
* contained[+] = ex-MHV-practitioner-36556
* contained[+] = ex-MHV-location-984
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2022-08-05T16:58:46Z
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMTIvMDIvOTggMDk6MzQKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46IDA3MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogMTYwCiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA3MSAgICAgICAgUFIgSU5URVJWQUw6IDE0MCAgICAgICBRUlMgRFVSQVRJT046IDEzNgogICAgICAgICBRVDogNDI4ICAgICAgICAgICAgICAgUVRDOiA0NjUKICAgICAgICAgUCBBWElTOiA3MiAgICAgICAgICAgIFIgQVhJUzogMTQwICAgICAgICAgICAgVCBBWElTOiA0NQoKICAgIElOVEVSUFJFVEFUSU9OOiAKCiAgICBJTlNUUlVNRU5UIERYOiAgTk9STUFMIFNJTlVTIFJIWVRITQogICAgICAgICAgICAgICAgICAgIFJJR0hUIEJVTkRMRSBCUkFOQ0ggQkxPQ0sKICAgICAgICAgICAgICAgICAgICBSSUdIVFdBUkQgQVhJUwogICAgICAgICAgICAgICAgICAgIEFCTk9STUFMIEVDRwogICAgICAgICAgICAgICAgICAgIE5PIFBSRVZJT1VTIEVDR1MgQVZBSUxBQkxFCgogICAgQ09ORklSTUFUSU9OIFNUQVRVUzogQ09ORklSTUVECgogICAgQ09NUEFSSVNPTjogCiAKCiAgICBDT01NRU5UUzogCgogICAgSEVBUlQgTUVEUzoKCiAgICBJTlRFUlBSRVRFRCBCWTogVEVTVGpvaG5zb24sQ2hhcmxvdHRl"

/*
LOCAL TITLE: ADHC DISCHARGE NOTE                                
DATE OF NOTE: AUG 05, 2022@11:29     ENTRY DATE: AUG 05, 2022@11:29:46      
      AUTHOR: TESTmiller,David          EXP COSIGNER:                           
     URGENCY:                            STATUS: COMPLETED                     

This is  a test note, David TESTmiller 
 
/es/ David TESTmiller
PHYSICIAN
Signed: 08/05/2022 11:50
*/

Instance: ex-MHV-note-deleted-1
InstanceOf: VA.MHV.PHR.note
Title: "Example 1 of a MHV Note - marked as entered-in-error"
Usage: #example
Description: """
Derived from the a mock NoteTO:

This is replicated from ex-MHV-note-1, with change of identifier (NoteTO.5), and marked as entered-in-error
"""
//* meta.extension[lastSourceSync].valueDateTime = 2024-01-12T16:47:01Z
* status = #entered-in-error
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-05T16:56:00Z
* content.attachment.title = "Adverse React/Allergy"
* type.coding[LO] = LOINC#11506-3 "Progress note"
* contained[+] = ex-MHV-practitioner-36556
* contained[+] = ex-MHV-location-984
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2022-08-05T16:58:46Z
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = "UGcuIDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwOS8xMi8yMiAxMDoxMgogICAgICAgICAgICAgICAgICAgICAgICAgICBDT05GSURFTlRJQUwgRUNHIFJFUE9SVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTUhWTElTQU9ORSxST0JFUlQgTSAgICA2NjYtMTItMzQ1NiAgIE5PVCBJTlBBVElFTlQgICAgICAgICAgICAgIERPQjogQVVHIDksMTk2MgogICAgICAgICAgICAgICAgICAgICAgUFJPQ0VEVVJFIERBVEUvVElNRTogMTIvMDIvOTggMDk6MzQKLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJEL0NMSU5JQzogQ0FSRElPTE9HWSBPVVRQQVRJRU5UIChMT0MpCiAgICBBR0U6IDM2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VYOiAgTUFMRQogICAgSFQgSU46IDA3MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFdUIExCUzogMTYwCiAgICBCTE9PRCBQUkVTU1VSRTogICAgICAgICAgICAgICAgICAgICAgICAgVFlQRTogCgogICAgICAgICBWRU5UIFJBVEU6IDA3MSAgICAgICAgUFIgSU5URVJWQUw6IDE0MCAgICAgICBRUlMgRFVSQVRJT046IDEzNgogICAgICAgICBRVDogNDI4ICAgICAgICAgICAgICAgUVRDOiA0NjUKICAgICAgICAgUCBBWElTOiA3MiAgICAgICAgICAgIFIgQVhJUzogMTQwICAgICAgICAgICAgVCBBWElTOiA0NQoKICAgIElOVEVSUFJFVEFUSU9OOiAKCiAgICBJTlNUUlVNRU5UIERYOiAgTk9STUFMIFNJTlVTIFJIWVRITQogICAgICAgICAgICAgICAgICAgIFJJR0hUIEJVTkRMRSBCUkFOQ0ggQkxPQ0sKICAgICAgICAgICAgICAgICAgICBSSUdIVFdBUkQgQVhJUwogICAgICAgICAgICAgICAgICAgIEFCTk9STUFMIEVDRwogICAgICAgICAgICAgICAgICAgIE5PIFBSRVZJT1VTIEVDR1MgQVZBSUxBQkxFCgogICAgQ09ORklSTUFUSU9OIFNUQVRVUzogQ09ORklSTUVECgogICAgQ09NUEFSSVNPTjogCiAKCiAgICBDT01NRU5UUzogCgogICAgSEVBUlQgTUVEUzoKCiAgICBJTlRFUlBSRVRFRCBCWTogVEVTVGpvaG5zb24sQ2hhcmxvdHRl"


/* commented out because these are Allergy and Immunology Adverse event notes. MHV is not authorized to show these (as far as I can tell)

Instance: ex-MHV-note-2
InstanceOf: VA.MHV.PHR.note
Title: "Example 2 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5281856" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-05T11:23:54Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2022-08-08T10:50:15Z
* context.related[+] = Reference(Location/ex-MHV-location-552)
* content.attachment.contentType = #text/plain
* content.attachment.data = "="


Instance: ex-MHV-note-3
InstanceOf: VA.MHV.PHR.note
Title: "Example 3 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5281855" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-05T11:22:39Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2022-08-08T11:03:35Z
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = "="

*/

Instance: ex-MHV-note-4
InstanceOf: VA.MHV.PHR.note
Title: "Example 4 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:

Note dropped cosigner
"""
//* meta.extension[lastSourceSync].valueDateTime = 2024-01-12T16:47:01Z
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5281877" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2022-08-09T13:41:23Z
* content.attachment.title = "Discharge Summary"
* type = LOINC#18842-5 "Discharge summary"
* type.text = "DISCHARGE SUMMARY"
* contained[+] = ex-MHV-practitioner-36556
* contained[+] = ex-MHV-location-552
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2022-08-09T13:44:59Z
* context.related[+] = Reference(Location/ex-MHV-location-552)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IERpc2NoYXJnZSBTdW1tYXJ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogRElTQ0hBUkdFIFNVTU1BUlkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgIERJQ1QgREFURTogQVVHIDA5LCAyMDIyQDEzOjQyICAgICBFTlRSWSBEQVRFOiBBVUcgMDksIDIwMjJAMTM6NDM6MDIgICAgICAKIERJQ1RBVEVEIEJZOiBURVNUbWlsbGVyLERhdmlkICAgICAgICAgICAgIEFUVEVORElORzogVEVTVGJyb3duLFNvcGhpYSAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogcm91dGluZSAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAKIApEQVRFIE9GIEFETUlTU0lPTjoKREFURSBPRiBESVNDSEFSR0U6IEF1ZyA5LDIwMjIKIApQUklOQ0lQTEUgRElTQ0hBUkdFIERJQUdOT1NJUzogVEVTVCBESVNHTk9TSVMsIERhdmlkIFRFU1RtaWxsZXIuCkFERElUSU9OQUwgRElBR05PU0VTOgogCkNPTlNVTFRBTlQoUyk6ClBST0NFRFVSRShTKToKIApCUklFRiBBRE1JU1NJT04gSElTVE9SWToKNzEgeWVhciBvbGQgTUFMRSB0ZXN0CiAKQlJJRUYgQURNSVNTSU9OIFBIWVNJQ0FMIEVYQU06ICB0ZXN0IGV4YW0KIApBRE1JU1NJT04gTEFCL0VLRy9YLVJBWSBSRVNVTFRTOiAgdGVzdCBhZ2FpbgogCkhPU1BJVEFMIENPVVJTRToKICB2aWEydmlhIHRyYW5zc3RpdGlvbgogCkNPTkRJVElPTiBPTiBESVNDSEFSR0U6IHRlc3QKIApESVNDSEFSR0UgSU5TVFJVQ1RJT05TOgogICBBY3Rpdml0eTogICAgdGVzdDEKICAgRGlldDogICAgICAgIHRlc3QyCiAgIE1lZGljYXRpb25zOiB0ZXN0MwogICBTcGVjaWFsIEluc3RydWN0aW9uczogdGVzdCBhZ2FpbgogICBGb2xsb3ctdXAgUGxhbnM6IHRlc3QgYWdhaW4gYWdhaW4KIAovZXMvIERhdmlkIFRFU1RtaWxsZXIKUEhZU0lDSUFOClNpZ25lZDogMDgvMDkvMjAyMiAxMzo0NAogCi9lcy8gV2lsbGlhbSBURVNUZGF2aXMKUGh5c2ljaWFuCkNvc2lnbmVkOiAwOC8xMi8yMDIyIDEyOjE3CmZvciBTb3BoaWEgVEVTVGJyb3duICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApBTU9E"

/*
LOCAL TITLE: Discharge Summary                                  
STANDARD TITLE: DISCHARGE SUMMARY                               
   DICT DATE: AUG 09, 2022@13:42     ENTRY DATE: AUG 09, 2022@13:43:02      
 DICTATED BY: TESTmiller,David             ATTENDING: TESTbrown,Sophia                 
     URGENCY: routine                    STATUS: COMPLETED                     

 
 
DATE OF ADMISSION:
DATE OF DISCHARGE: Aug 9,2022
 
PRINCIPLE DISCHARGE DIAGNOSIS: TEST DISGNOSIS, David TESTmiller.
ADDITIONAL DIAGNOSES:
 
CONSULTANT(S):
PROCEDURE(S):
 
BRIEF ADMISSION HISTORY:
71 year old MALE test
 
BRIEF ADMISSION PHYSICAL EXAM:  test exam
 
ADMISSION LAB/EKG/X-RAY RESULTS:  test again
 
HOSPITAL COURSE:
  via2via transstition
 
CONDITION ON DISCHARGE: test
 
DISCHARGE INSTRUCTIONS:
   Activity:    test1
   Diet:        test2
   Medications: test3
   Special Instructions: test again
   Follow-up Plans: test again again
 
/es/ David TESTmiller
PHYSICIAN
Signed: 08/09/2022 13:44
 
/es/ William TESTdavis
Physician
Cosigned: 08/12/2022 12:17
for Sophia TESTbrown                                  
AMOD
*/

Instance: ex-MHV-note-5
InstanceOf: VA.MHV.PHR.note
Title: "Example 5 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:

Note has an unsigned addenda
"""
//* meta.extension[lastSourceSync].valueDateTime = 2024-01-12T16:47:01Z
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5298388" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2023-11-16T14:40:00Z
* content.attachment.title = "STAGING (TNM) URINARY BLADDER"
* type.coding[LO] = LOINC#11506-3 "Progress note"
* contained[+] = ex-MHV-practitioner-36556
* contained[+] = ex-MHV-location-984
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2023-11-16T14:50:26Z
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = """
TE9DQUwgVElUTEU6IFNUQUdJTkcgKFROTSkgVVJJTkFSWSBCTEFEREVSICAgICAgICAgICAgICAgICAgICAgIApEQVRFIE9GIE5PVEU6IE5PViAxNiwgMjAyM0AxNDo0MCAgICAgRU5UUlkgREFURTogTk9WIDE2LCAyMDIzQDE0OjQwOjQ3ICAgICAgCiAgICAgIEFVVEhPUjogVEVTVG1pbGxlcixEYXZpZCAgICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAgICoqKiBTVEFHSU5HIChUTk0pIFVSSU5BUlkgQkxBRERFUiBIYXMgQURERU5EQSAqKioKClVSSU5BUlkgQkxBRERFUgo2dGggZWRpdGlvbiBBSkNDIENhbmNlciBTdGFnaW5nIE1hbnVhbAoKCnRlc3Rpbmcgbm90ZSB3aXRoIGtic3QgdGVhbQogCkNMSU4gICBQQVRIICAgICBQUklNQVJZIFRVTU9SIChUKQogW1hdICAgWyBdICAgVFggICAgICBQcmltYXJ5IHR1bW9yIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgWyBdICAgVDAgICAgICBObyBldmlkZW5jZSBvZiBwcmltYXJ5IHR1bW9yCiBbIF0gICBbIF0gICBUYSAgICAgIE5vbiBpbnZhc2l2ZSBwYXBpbGxhcnkgY2FyY2lub21hCiBbIF0gICBbIF0gICBUaXMgICAgIENhcmNpbm9tYSBpbiBzaXR1IChmbGF0IHR1bW9yKQogW1hdICAgWyBdICAgVDEgICAgICBUdW1vciBpbnZhZGVzIHN1YmVwaXRoZWxpYWwgY29ubmVjdGl2ZSB0aXNzdWUKIFsgXSAgIFsgXSAgIFQyICAgICAgVHVtb3IgaW52YWRlcyBtdXNjbGUKIFsgXSAgIFsgXSAgICAgICAgICAgVDJhICAgICBUdW1vciBJbnZhZGVzIHN1cGVyZmljaWFsIChpbm5lciBoYWxmKQogWyBdICAgWyBdICAgICAgICAgICBUMmIgICAgIFR1bW9yIEludmFkZXMgZGVlcCBtdXNjbGUgKG91dGVyIGhhbGYpCiBbIF0gICBbWF0gICBUMyAgICAgIFR1bW9yIGludmFkZXMgcGVyaXZlc2ljYWwgdGlzc3VlCiBbIF0gICBbWF0gICAgICAgICAgIFQzYSAgICAgTWljcm9zY29waWNhbGx5CiBbIF0gICBbIF0gICAgICAgICAgIFQzYiAgICAgTWFjcm9zY29waWNhbGx5IChleHRyYXZlc2ljYWwgbWFzcykKIFsgXSAgIFsgXSAgIFQ0ICAgICAgVHVtb3IgaW52YWRlcyBhbnkgb2YgdGhlIGZvbGxvd2luZzogcHJvc3RhdGUsCiAgICAgICAgICAgICAgICAgICAgICAgdXRlcnVzLCB2YWdpbmEsIHBlbHZpYyBvciBhYmRvbWluYWwgd2FsbAogWyBdICAgWyBdICAgICAgICAgICBUNGEgICAgIFR1bW9yIGludmFkZXMgcHJvc3RhdGUsIHV0ZXJ1cywgdmFnaW5hCiBbWF0gICBbWF0gICAgICAgICAgIFQ0YiAgICAgVHVtb3IgaW52YWRlcyBwZWx2aWMgd2FsbCwgYWJkb21pbmFsIHdhbGwKIAogCiAgICAgICAgICAgICAgIFJFR0lPTkFMIExZTVBIIE5PREVTIChOKQogWyBdICAgWyBdICAgTlggICAgICBSZWdpb25hbCBseW1waCBub2RlIG1ldGFzdGFzaXMgY2Fubm90IGJlIGFzc2Vzc2VkCiBbIF0gICBbIF0gICBOMCAgICAgIE5vIHJlZ2lvbmFsIGx5bXBoIG5vZGUgbWV0YXN0YXNpcwogWyBdICAgW1hdICAgTjEgICAgICBNZXRzIGluIGEgc2luZ2xlIGx5bXBoIG5vZGUsIDIgY20gb3IgbGVzcyBpbgogICAgICAgICAgICAgICAgICAgICAgIGdyZWF0ZXN0IGRpbWVuc2lvbi4KIFsgXSAgIFtYXSAgIE4yICAgICAgTWV0cyBpbiBhIHNpbmdsZSBseW1waCBub2RlIG1vcmUgdGhhbiAyIGJ1dCBub3QKICAgICAgICAgICAgICAgICAgICAgICBtb3JlIHRoYW4gNSBjbSBpbiBncmVhdGVzdCBkaW1lbnNpb247IG11bHRpcGxlCiAgICAgICAgICAgICAgICAgICAgICAgbHltcGggbm9kZXMsIG5vbmUgbW9yZSB0aGFuIDUgY20gaW4gZ3JlYXRlc3QKICAgICAgICAgICAgICAgICAgICAgICBkaW1lbnNpb24uCiBbIF0gICBbIF0gICBOMyAgICAgIE1ldGFzdGFzaXMgaW4gYSBseW1waCBub2RlIG1vcmUgdGhhbiA1IGNtCiAKICAgICAgICAgICAgICAgRElTVEFOVCBNRVRBU1RBU0lTIChNKQogWyBdICAgW1hdICAgTVggICAgICBQcmVzZW5jZSBvZiBkaXN0YW50IG1ldGFzdGFzaXMgY2Fubm90IGJlIGFzc2Vzc2VkCiBbIF0gICBbWF0gICBNMCAgICAgIE5vIGRpc3RhbnQgbWV0YXN0YXNpcwogWyBdICAgWyBdICAgTTEgICAgICBEaXN0YW50IG1ldGFzdGFzaXMKIApTVEFHRSBHUk9VUElORwogWyBdICAgWyBdICAgT2EgICAgICBUYSAgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgIE9pcyAgICAgVGlzICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJICAgICAgIFQxICAgICAgTjAgICAgICBNMAogWyBdICAgW1hdICAgSUkgICAgICBUMmEgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgICAgICAgICAgVDJiICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJSUkgICAgIFQzYSAgICAgTjAgICAgICBNMAogWyBdICAgW1hdICAgICAgICAgICBUM2IgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgICAgICAgICAgVDRhICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJViAgICAgIFQ0YiAgICAgTjAgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIE4xICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBOMiAgICAgIE0wCiBbWF0gICBbIF0gICAgICAgICAgIEFueSBUICAgTjMgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIEFueSBOICAgTTEKIAogICAgICAgICAgICAgICAgICAgICAgIEdSQURFCiAgICAgICAgWyBdICAgR1ggICAgICBHcmFkZSBjYW5ub3QgYmUgYXNzZXNzZWQKICAgICAgICBbWF0gICBHMSAgICAgIFdlbGwgZGlmZmVyZW50aWF0ZWQKICAgICAgICBbWF0gICBHMiAgICAgIE1vZCBkaWZmZXJlbnRpYXRlZAogICAgICAgIFsgXSAgIEczICAgICAgUG9vcmx5IGRpZmZlcmVudGlhdGVkCiAgICAgICAgWyBdICAgRzQgICAgICBVbmRpZmZlcmVudGlhdGVkCiAKIApPUCAjNTk4YyAoNTUyKSBBcHByb3ZlZCAxMi85OSBSZXYgMDMvMDMKIAovZXMvIERhdmlkIFRFU1RtaWxsZXIKUEhZU0lDSUFOClNpZ25lZDogMTEvMTYvMjAyMyAxNDo1MAoKMTEvMTYvMjAyMyBBRERFTkRVTSAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IFVOU0lHTkVECiBZb3UgbWF5IG5vdCBWSUVXIHRoaXMgVU5TSUdORUQgQWRkZW5kdW0u
"""

/*
LOCAL TITLE: STAGING (TNM) URINARY BLADDER                      
DATE OF NOTE: NOV 16, 2023@14:40     ENTRY DATE: NOV 16, 2023@14:40:47      
      AUTHOR: TESTmiller,David          EXP COSIGNER:                           
     URGENCY:                            STATUS: COMPLETED                     

   *** STAGING (TNM) URINARY BLADDER Has ADDENDA ***

URINARY BLADDER
6th edition AJCC Cancer Staging Manual


testing note with kbst team
 
CLIN   PATH     PRIMARY TUMOR (T)
 [X]   [ ]   TX      Primary tumor cannot be assessed
 [ ]   [ ]   T0      No evidence of primary tumor
 [ ]   [ ]   Ta      Non invasive papillary carcinoma
 [ ]   [ ]   Tis     Carcinoma in situ (flat tumor)
 [X]   [ ]   T1      Tumor invades subepithelial connective tissue
 [ ]   [ ]   T2      Tumor invades muscle
 [ ]   [ ]           T2a     Tumor Invades superficial (inner half)
 [ ]   [ ]           T2b     Tumor Invades deep muscle (outer half)
 [ ]   [X]   T3      Tumor invades perivesical tissue
 [ ]   [X]           T3a     Microscopically
 [ ]   [ ]           T3b     Macroscopically (extravesical mass)
 [ ]   [ ]   T4      Tumor invades any of the following: prostate,
                       uterus, vagina, pelvic or abdominal wall
 [ ]   [ ]           T4a     Tumor invades prostate, uterus, vagina
 [X]   [X]           T4b     Tumor invades pelvic wall, abdominal wall
 
 
               REGIONAL LYMPH NODES (N)
 [ ]   [ ]   NX      Regional lymph node metastasis cannot be assessed
 [ ]   [ ]   N0      No regional lymph node metastasis
 [ ]   [X]   N1      Mets in a single lymph node, 2 cm or less in
                       greatest dimension.
 [ ]   [X]   N2      Mets in a single lymph node more than 2 but not
                       more than 5 cm in greatest dimension; multiple
                       lymph nodes, none more than 5 cm in greatest
                       dimension.
 [ ]   [ ]   N3      Metastasis in a lymph node more than 5 cm
 
               DISTANT METASTASIS (M)
 [ ]   [X]   MX      Presence of distant metastasis cannot be assessed
 [ ]   [X]   M0      No distant metastasis
 [ ]   [ ]   M1      Distant metastasis
 
STAGE GROUPING
 [ ]   [ ]   Oa      Ta      N0      M0
 [ ]   [ ]   Ois     Tis     N0      M0
 [ ]   [ ]   I       T1      N0      M0
 [ ]   [X]   II      T2a     N0      M0
 [ ]   [ ]           T2b     N0      M0
 [ ]   [ ]   III     T3a     N0      M0
 [ ]   [X]           T3b     N0      M0
 [ ]   [ ]           T4a     N0      M0
 [ ]   [ ]   IV      T4b     N0      M0
 [X]   [ ]           Any T   N1      M0
 [X]   [ ]           Any T   N2      M0
 [X]   [ ]           Any T   N3      M0
 [X]   [ ]           Any T   Any N   M1
 
                       GRADE
        [ ]   GX      Grade cannot be assessed
        [X]   G1      Well differentiated
        [X]   G2      Mod differentiated
        [ ]   G3      Poorly differentiated
        [ ]   G4      Undifferentiated
 
 
OP #598c (552) Approved 12/99 Rev 03/03
 
/es/ David TESTmiller
PHYSICIAN
Signed: 11/16/2023 14:50

11/16/2023 ADDENDUM                      STATUS: UNSIGNED
 You may not VIEW this UNSIGNED Addendum.
*/

Instance: ex-MHV-note-6
InstanceOf: VA.MHV.PHR.note
Title: "Example 6 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:

Note has a signed addenda
"""
//* meta.extension[lastSourceSync].valueDateTime = 2024-01-12T16:47:01Z
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[TOid].value = "NoteTO.5298388" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* date = 2023-11-16T14:40:00Z
* content.attachment.title = "STAGING (TNM) URINARY BLADDER"
* type.coding[LO] = LOINC#11506-3 "Progress note"
* contained[+] = ex-MHV-practitioner-36556
* contained[+] = ex-MHV-location-984
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator.extension[when].valueDateTime = 2023-11-16T14:50:26Z
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = """
TE9DQUwgVElUTEU6IFNUQUdJTkcgKFROTSkgVVJJTkFSWSBCTEFEREVSICAgICAgICAgICAgICAgICAgICAgIApEQVRFIE9GIE5PVEU6IE5PViAxNiwgMjAyM0AxNDo0MCAgICAgRU5UUlkgREFURTogTk9WIDE2LCAyMDIzQDE0OjQwOjQ3ICAgICAgCiAgICAgIEFVVEhPUjogVEVTVG1pbGxlcixEYXZpZCAgICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAgICoqKiBTVEFHSU5HIChUTk0pIFVSSU5BUlkgQkxBRERFUiBIYXMgQURERU5EQSAqKioKClVSSU5BUlkgQkxBRERFUgo2dGggZWRpdGlvbiBBSkNDIENhbmNlciBTdGFnaW5nIE1hbnVhbAoKCnRlc3Rpbmcgbm90ZSB3aXRoIGtic3QgdGVhbQogCkNMSU4gICBQQVRIICAgICBQUklNQVJZIFRVTU9SIChUKQogW1hdICAgWyBdICAgVFggICAgICBQcmltYXJ5IHR1bW9yIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgWyBdICAgVDAgICAgICBObyBldmlkZW5jZSBvZiBwcmltYXJ5IHR1bW9yCiBbIF0gICBbIF0gICBUYSAgICAgIE5vbiBpbnZhc2l2ZSBwYXBpbGxhcnkgY2FyY2lub21hCiBbIF0gICBbIF0gICBUaXMgICAgIENhcmNpbm9tYSBpbiBzaXR1IChmbGF0IHR1bW9yKQogW1hdICAgWyBdICAgVDEgICAgICBUdW1vciBpbnZhZGVzIHN1YmVwaXRoZWxpYWwgY29ubmVjdGl2ZSB0aXNzdWUKIFsgXSAgIFsgXSAgIFQyICAgICAgVHVtb3IgaW52YWRlcyBtdXNjbGUKIFsgXSAgIFsgXSAgICAgICAgICAgVDJhICAgICBUdW1vciBJbnZhZGVzIHN1cGVyZmljaWFsIChpbm5lciBoYWxmKQogWyBdICAgWyBdICAgICAgICAgICBUMmIgICAgIFR1bW9yIEludmFkZXMgZGVlcCBtdXNjbGUgKG91dGVyIGhhbGYpCiBbIF0gICBbWF0gICBUMyAgICAgIFR1bW9yIGludmFkZXMgcGVyaXZlc2ljYWwgdGlzc3VlCiBbIF0gICBbWF0gICAgICAgICAgIFQzYSAgICAgTWljcm9zY29waWNhbGx5CiBbIF0gICBbIF0gICAgICAgICAgIFQzYiAgICAgTWFjcm9zY29waWNhbGx5IChleHRyYXZlc2ljYWwgbWFzcykKIFsgXSAgIFsgXSAgIFQ0ICAgICAgVHVtb3IgaW52YWRlcyBhbnkgb2YgdGhlIGZvbGxvd2luZzogcHJvc3RhdGUsCiAgICAgICAgICAgICAgICAgICAgICAgdXRlcnVzLCB2YWdpbmEsIHBlbHZpYyBvciBhYmRvbWluYWwgd2FsbAogWyBdICAgWyBdICAgICAgICAgICBUNGEgICAgIFR1bW9yIGludmFkZXMgcHJvc3RhdGUsIHV0ZXJ1cywgdmFnaW5hCiBbWF0gICBbWF0gICAgICAgICAgIFQ0YiAgICAgVHVtb3IgaW52YWRlcyBwZWx2aWMgd2FsbCwgYWJkb21pbmFsIHdhbGwKIAogCiAgICAgICAgICAgICAgIFJFR0lPTkFMIExZTVBIIE5PREVTIChOKQogWyBdICAgWyBdICAgTlggICAgICBSZWdpb25hbCBseW1waCBub2RlIG1ldGFzdGFzaXMgY2Fubm90IGJlIGFzc2Vzc2VkCiBbIF0gICBbIF0gICBOMCAgICAgIE5vIHJlZ2lvbmFsIGx5bXBoIG5vZGUgbWV0YXN0YXNpcwogWyBdICAgW1hdICAgTjEgICAgICBNZXRzIGluIGEgc2luZ2xlIGx5bXBoIG5vZGUsIDIgY20gb3IgbGVzcyBpbgogICAgICAgICAgICAgICAgICAgICAgIGdyZWF0ZXN0IGRpbWVuc2lvbi4KIFsgXSAgIFtYXSAgIE4yICAgICAgTWV0cyBpbiBhIHNpbmdsZSBseW1waCBub2RlIG1vcmUgdGhhbiAyIGJ1dCBub3QKICAgICAgICAgICAgICAgICAgICAgICBtb3JlIHRoYW4gNSBjbSBpbiBncmVhdGVzdCBkaW1lbnNpb247IG11bHRpcGxlCiAgICAgICAgICAgICAgICAgICAgICAgbHltcGggbm9kZXMsIG5vbmUgbW9yZSB0aGFuIDUgY20gaW4gZ3JlYXRlc3QKICAgICAgICAgICAgICAgICAgICAgICBkaW1lbnNpb24uCiBbIF0gICBbIF0gICBOMyAgICAgIE1ldGFzdGFzaXMgaW4gYSBseW1waCBub2RlIG1vcmUgdGhhbiA1IGNtCiAKICAgICAgICAgICAgICAgRElTVEFOVCBNRVRBU1RBU0lTIChNKQogWyBdICAgW1hdICAgTVggICAgICBQcmVzZW5jZSBvZiBkaXN0YW50IG1ldGFzdGFzaXMgY2Fubm90IGJlIGFzc2Vzc2VkCiBbIF0gICBbWF0gICBNMCAgICAgIE5vIGRpc3RhbnQgbWV0YXN0YXNpcwogWyBdICAgWyBdICAgTTEgICAgICBEaXN0YW50IG1ldGFzdGFzaXMKIApTVEFHRSBHUk9VUElORwogWyBdICAgWyBdICAgT2EgICAgICBUYSAgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgIE9pcyAgICAgVGlzICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJICAgICAgIFQxICAgICAgTjAgICAgICBNMAogWyBdICAgW1hdICAgSUkgICAgICBUMmEgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgICAgICAgICAgVDJiICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJSUkgICAgIFQzYSAgICAgTjAgICAgICBNMAogWyBdICAgW1hdICAgICAgICAgICBUM2IgICAgIE4wICAgICAgTTAKIFsgXSAgIFsgXSAgICAgICAgICAgVDRhICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBJViAgICAgIFQ0YiAgICAgTjAgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIE4xICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBOMiAgICAgIE0wCiBbWF0gICBbIF0gICAgICAgICAgIEFueSBUICAgTjMgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIEFueSBOICAgTTEKIAogICAgICAgICAgICAgICAgICAgICAgIEdSQURFCiAgICAgICAgWyBdICAgR1ggICAgICBHcmFkZSBjYW5ub3QgYmUgYXNzZXNzZWQKICAgICAgICBbWF0gICBHMSAgICAgIFdlbGwgZGlmZmVyZW50aWF0ZWQKICAgICAgICBbWF0gICBHMiAgICAgIE1vZCBkaWZmZXJlbnRpYXRlZAogICAgICAgIFsgXSAgIEczICAgICAgUG9vcmx5IGRpZmZlcmVudGlhdGVkCiAgICAgICAgWyBdICAgRzQgICAgICBVbmRpZmZlcmVudGlhdGVkCiAKIApPUCAjNTk4YyAoNTUyKSBBcHByb3ZlZCAxMi85OSBSZXYgMDMvMDMKIAovZXMvIERhdmlkIFRFU1RtaWxsZXIKUEhZU0lDSUFOClNpZ25lZDogMTEvMTYvMjAyMyAxNDo1MAoKMTEvMTYvMjAyMyBBRERFTkRVTSAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRApBZGRlbmR1bSB0ZXN0IHdpdGggS0JTVCB0ZWFtIAogCi9lcy8gRGF2aWQgVEVTVG1pbGxlcgpQSFlTSUNJQU4KU2lnbmVkOiAxMS8xNi8yMDIzIDE0OjU3
"""

/*
LOCAL TITLE: STAGING (TNM) URINARY BLADDER                      
DATE OF NOTE: NOV 16, 2023@14:40     ENTRY DATE: NOV 16, 2023@14:40:47      
      AUTHOR: TESTmiller,David          EXP COSIGNER:                           
     URGENCY:                            STATUS: COMPLETED                     

   *** STAGING (TNM) URINARY BLADDER Has ADDENDA ***

URINARY BLADDER
6th edition AJCC Cancer Staging Manual


testing note with kbst team
 
CLIN   PATH     PRIMARY TUMOR (T)
 [X]   [ ]   TX      Primary tumor cannot be assessed
 [ ]   [ ]   T0      No evidence of primary tumor
 [ ]   [ ]   Ta      Non invasive papillary carcinoma
 [ ]   [ ]   Tis     Carcinoma in situ (flat tumor)
 [X]   [ ]   T1      Tumor invades subepithelial connective tissue
 [ ]   [ ]   T2      Tumor invades muscle
 [ ]   [ ]           T2a     Tumor Invades superficial (inner half)
 [ ]   [ ]           T2b     Tumor Invades deep muscle (outer half)
 [ ]   [X]   T3      Tumor invades perivesical tissue
 [ ]   [X]           T3a     Microscopically
 [ ]   [ ]           T3b     Macroscopically (extravesical mass)
 [ ]   [ ]   T4      Tumor invades any of the following: prostate,
                       uterus, vagina, pelvic or abdominal wall
 [ ]   [ ]           T4a     Tumor invades prostate, uterus, vagina
 [X]   [X]           T4b     Tumor invades pelvic wall, abdominal wall
 
 
               REGIONAL LYMPH NODES (N)
 [ ]   [ ]   NX      Regional lymph node metastasis cannot be assessed
 [ ]   [ ]   N0      No regional lymph node metastasis
 [ ]   [X]   N1      Mets in a single lymph node, 2 cm or less in
                       greatest dimension.
 [ ]   [X]   N2      Mets in a single lymph node more than 2 but not
                       more than 5 cm in greatest dimension; multiple
                       lymph nodes, none more than 5 cm in greatest
                       dimension.
 [ ]   [ ]   N3      Metastasis in a lymph node more than 5 cm
 
               DISTANT METASTASIS (M)
 [ ]   [X]   MX      Presence of distant metastasis cannot be assessed
 [ ]   [X]   M0      No distant metastasis
 [ ]   [ ]   M1      Distant metastasis
 
STAGE GROUPING
 [ ]   [ ]   Oa      Ta      N0      M0
 [ ]   [ ]   Ois     Tis     N0      M0
 [ ]   [ ]   I       T1      N0      M0
 [ ]   [X]   II      T2a     N0      M0
 [ ]   [ ]           T2b     N0      M0
 [ ]   [ ]   III     T3a     N0      M0
 [ ]   [X]           T3b     N0      M0
 [ ]   [ ]           T4a     N0      M0
 [ ]   [ ]   IV      T4b     N0      M0
 [X]   [ ]           Any T   N1      M0
 [X]   [ ]           Any T   N2      M0
 [X]   [ ]           Any T   N3      M0
 [X]   [ ]           Any T   Any N   M1
 
                       GRADE
        [ ]   GX      Grade cannot be assessed
        [X]   G1      Well differentiated
        [X]   G2      Mod differentiated
        [ ]   G3      Poorly differentiated
        [ ]   G4      Undifferentiated
 
 
OP #598c (552) Approved 12/99 Rev 03/03
 
/es/ David TESTmiller
PHYSICIAN
Signed: 11/16/2023 14:50

11/16/2023 ADDENDUM                      STATUS: COMPLETED
Addendum test with KBST team 
 
/es/ David TESTmiller
PHYSICIAN
Signed: 11/16/2023 14:57
*/