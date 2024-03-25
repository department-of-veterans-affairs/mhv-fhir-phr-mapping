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
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAxMiwgMjAyMkAxMjo1MDo1NiAgRU5UUlkgREFURTogQVVHIDEyLCAyMDIyQDEyOjUwOjU2ICAgICAgCiAgICAgIEFVVEhPUjogS0hBTixNVUFaWkFNICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMTIsIDIwMjJAMTI6NTA6NTYuCgpQRU5JQ0lMTElOCgpBdXRob3IncyBjb21tZW50czoKCnRlc3QgCgogCi9lcy8gTVVBWlpBTSBLSEFOClBoeXNpY2lhbgpTaWduZWQ6IDA4LzEyLzIwMjIgMTI6NTE="

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
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyMzo1NCAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjIzOjU0ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMDUsIDIwMjJAMTE6MjM6NTQuCgpXSElURSBGSVNICgpBdXRob3IncyBjb21tZW50czoKCk1hcnVmJ3MgdGVzdCBkYXRhIAoKIAovZXMvIE1BUlVGIEFITUVEClBIWVNJQ0lBTgpTaWduZWQ6IDA4LzA4LzIwMjIgMTA6NTA="


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
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyMzo1NCAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjIzOjU0ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMDUsIDIwMjJAMTE6MjM6NTQuCgpXSElURSBGSVNICgpBdXRob3IncyBjb21tZW50czoKCk1hcnVmJ3MgdGVzdCBkYXRhIAoKIAovZXMvIE1BUlVGIEFITUVEClBIWVNJQ0lBTgpTaWduZWQ6IDA4LzA4LzIwMjIgMTA6NTA="


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
* content.attachment.data = "TE9DQUwgVElUTEU6IEFESEMgRElTQ0hBUkdFIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyOSAgICAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjI5OjQ2ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIGlzICBhIHRlc3Qgbm90ZSwgTWFydWYgCiAKL2VzLyBNQVJVRiBBSE1FRApQSFlTSUNJQU4KU2lnbmVkOiAwOC8wNS8yMDIyIDExOjUw"


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
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyMjozOSAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjIyOjM5ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMDUsIDIwMjJAMTE6MjI6MzkuCgpQT0xMRU4gQUxMRVJHRU5JCgpBdXRob3IncyBjb21tZW50czoKCk1hcnVmJ3MgdGVzdCBkYXRhIAoKIAovZXMvIE1BUlVGIEFITUVEClBIWVNJQ0lBTgpTaWduZWQ6IDA4LzA4LzIwMjIgMTE6MDM="

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
* content.attachment.data = "TE9DQUwgVElUTEU6IERpc2NoYXJnZSBTdW1tYXJ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogRElTQ0hBUkdFIFNVTU1BUlkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgIERJQ1QgREFURTogQVVHIDA5LCAyMDIyQDEzOjQyICAgICBFTlRSWSBEQVRFOiBBVUcgMDksIDIwMjJAMTM6NDM6MDIgICAgICAKIERJQ1RBVEVEIEJZOiBBSE1FRCxNQVJVRiAgICAgICAgICAgICBBVFRFTkRJTkc6IEFITUVELE5BSkVFQiAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogcm91dGluZSAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAKIApEQVRFIE9GIEFETUlTU0lPTjoKREFURSBPRiBESVNDSEFSR0U6IEF1ZyA5LDIwMjIKIApQUklOQ0lQTEUgRElTQ0hBUkdFIERJQUdOT1NJUzogVEVTVCBESVNHTk9TSVMsIE1hcnVmIEFobWVkLgpBRERJVElPTkFMIERJQUdOT1NFUzoKIApDT05TVUxUQU5UKFMpOgpQUk9DRURVUkUoUyk6CiAKQlJJRUYgQURNSVNTSU9OIEhJU1RPUlk6CjcxIHllYXIgb2xkIE1BTEUgdGVzdAogCkJSSUVGIEFETUlTU0lPTiBQSFlTSUNBTCBFWEFNOiAgdGVzdCBleGFtCiAKQURNSVNTSU9OIExBQi9FS0cvWC1SQVkgUkVTVUxUUzogIHRlc3QgYWdhaW4KIApIT1NQSVRBTCBDT1VSU0U6CiAgdmlhMnZkaWYgdHJhbnNzdGl0aW9uCiAKQ09ORElUSU9OIE9OIERJU0NIQVJHRTogdGVzdAogCkRJU0NIQVJHRSBJTlNUUlVDVElPTlM6CiAgIEFjdGl2aXR5OiAgICB0ZXN0MQogICBEaWV0OiAgICAgICAgdGVzdDIKICAgTWVkaWNhdGlvbnM6IHRlc3QzCiAgIFNwZWNpYWwgSW5zdHJ1Y3Rpb25zOiB0ZXN0IGFnYWluCiAgIEZvbGxvdy11cCBQbGFuczogdGVzdCBhZ2FpbiBhZ2FpbgogCi9lcy8gTUFSVUYgQUhNRUQKUEhZU0lDSUFOClNpZ25lZDogMDgvMDkvMjAyMiAxMzo0NAogCi9lcy8gTVVBWlpBTSBLSEFOClBoeXNpY2lhbgpDb3NpZ25lZDogMDgvMTIvMjAyMiAxMjoxNwpmb3IgTkFKRUVCIEFITUVEICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApBTU9E"


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
* content.attachment.data = "TE9DQUwgVElUTEU6IFNUQUdJTkcgKFROTSkgVVJJTkFSWSBCTEFEREVSICAgICAgICAgICAgICAgICAgICAgIApEQVRFIE9GIE5PVEU6IE5PViAxNiwgMjAyM0AxNDo0MCAgICAgRU5UUlkgREFURTogTk9WIDE2LCAyMDIzQDE0OjQwOjQ3ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgogICAqKiogU1RBR0lORyAoVE5NKSBVUklOQVJZIEJMQURERVIgSGFzIEFEREVOREEgKioqCgpVUklOQVJZIEJMQURERVIKNnRoIGVkaXRpb24gQUpDQyBDYW5jZXIgU3RhZ2luZyBNYW51YWwKCgp0ZXN0aW5nIG5vdGUgd2l0aCBrYnN0IHRlYW0KIApDTElOICAgUEFUSCAgICAgUFJJTUFSWSBUVU1PUiAoVCkKIFtYXSAgIFsgXSAgIFRYICAgICAgUHJpbWFyeSB0dW1vciBjYW5ub3QgYmUgYXNzZXNzZWQKIFsgXSAgIFsgXSAgIFQwICAgICAgTm8gZXZpZGVuY2Ugb2YgcHJpbWFyeSB0dW1vcgogWyBdICAgWyBdICAgVGEgICAgICBOb24gaW52YXNpdmUgcGFwaWxsYXJ5IGNhcmNpbm9tYQogWyBdICAgWyBdICAgVGlzICAgICBDYXJjaW5vbWEgaW4gc2l0dSAoZmxhdCB0dW1vcikKIFtYXSAgIFsgXSAgIFQxICAgICAgVHVtb3IgaW52YWRlcyBzdWJlcGl0aGVsaWFsIGNvbm5lY3RpdmUgdGlzc3VlCiBbIF0gICBbIF0gICBUMiAgICAgIFR1bW9yIGludmFkZXMgbXVzY2xlCiBbIF0gICBbIF0gICAgICAgICAgIFQyYSAgICAgVHVtb3IgSW52YWRlcyBzdXBlcmZpY2lhbCAoaW5uZXIgaGFsZikKIFsgXSAgIFsgXSAgICAgICAgICAgVDJiICAgICBUdW1vciBJbnZhZGVzIGRlZXAgbXVzY2xlIChvdXRlciBoYWxmKQogWyBdICAgW1hdICAgVDMgICAgICBUdW1vciBpbnZhZGVzIHBlcml2ZXNpY2FsIHRpc3N1ZQogWyBdICAgW1hdICAgICAgICAgICBUM2EgICAgIE1pY3Jvc2NvcGljYWxseQogWyBdICAgWyBdICAgICAgICAgICBUM2IgICAgIE1hY3Jvc2NvcGljYWxseSAoZXh0cmF2ZXNpY2FsIG1hc3MpCiBbIF0gICBbIF0gICBUNCAgICAgIFR1bW9yIGludmFkZXMgYW55IG9mIHRoZSBmb2xsb3dpbmc6IHByb3N0YXRlLAogICAgICAgICAgICAgICAgICAgICAgIHV0ZXJ1cywgdmFnaW5hLCBwZWx2aWMgb3IgYWJkb21pbmFsIHdhbGwKIFsgXSAgIFsgXSAgICAgICAgICAgVDRhICAgICBUdW1vciBpbnZhZGVzIHByb3N0YXRlLCB1dGVydXMsIHZhZ2luYQogW1hdICAgW1hdICAgICAgICAgICBUNGIgICAgIFR1bW9yIGludmFkZXMgcGVsdmljIHdhbGwsIGFiZG9taW5hbCB3YWxsCiAKIAogICAgICAgICAgICAgICBSRUdJT05BTCBMWU1QSCBOT0RFUyAoTikKIFsgXSAgIFsgXSAgIE5YICAgICAgUmVnaW9uYWwgbHltcGggbm9kZSBtZXRhc3Rhc2lzIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgWyBdICAgTjAgICAgICBObyByZWdpb25hbCBseW1waCBub2RlIG1ldGFzdGFzaXMKIFsgXSAgIFtYXSAgIE4xICAgICAgTWV0cyBpbiBhIHNpbmdsZSBseW1waCBub2RlLCAyIGNtIG9yIGxlc3MgaW4KICAgICAgICAgICAgICAgICAgICAgICBncmVhdGVzdCBkaW1lbnNpb24uCiBbIF0gICBbWF0gICBOMiAgICAgIE1ldHMgaW4gYSBzaW5nbGUgbHltcGggbm9kZSBtb3JlIHRoYW4gMiBidXQgbm90CiAgICAgICAgICAgICAgICAgICAgICAgbW9yZSB0aGFuIDUgY20gaW4gZ3JlYXRlc3QgZGltZW5zaW9uOyBtdWx0aXBsZQogICAgICAgICAgICAgICAgICAgICAgIGx5bXBoIG5vZGVzLCBub25lIG1vcmUgdGhhbiA1IGNtIGluIGdyZWF0ZXN0CiAgICAgICAgICAgICAgICAgICAgICAgZGltZW5zaW9uLgogWyBdICAgWyBdICAgTjMgICAgICBNZXRhc3Rhc2lzIGluIGEgbHltcGggbm9kZSBtb3JlIHRoYW4gNSBjbQogCiAgICAgICAgICAgICAgIERJU1RBTlQgTUVUQVNUQVNJUyAoTSkKIFsgXSAgIFtYXSAgIE1YICAgICAgUHJlc2VuY2Ugb2YgZGlzdGFudCBtZXRhc3Rhc2lzIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgW1hdICAgTTAgICAgICBObyBkaXN0YW50IG1ldGFzdGFzaXMKIFsgXSAgIFsgXSAgIE0xICAgICAgRGlzdGFudCBtZXRhc3Rhc2lzCiAKU1RBR0UgR1JPVVBJTkcKIFsgXSAgIFsgXSAgIE9hICAgICAgVGEgICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBPaXMgICAgIFRpcyAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSSAgICAgICBUMSAgICAgIE4wICAgICAgTTAKIFsgXSAgIFtYXSAgIElJICAgICAgVDJhICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICAgICAgICAgIFQyYiAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSUlJICAgICBUM2EgICAgIE4wICAgICAgTTAKIFsgXSAgIFtYXSAgICAgICAgICAgVDNiICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICAgICAgICAgIFQ0YSAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSVYgICAgICBUNGIgICAgIE4wICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBOMSAgICAgIE0wCiBbWF0gICBbIF0gICAgICAgICAgIEFueSBUICAgTjIgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIE4zICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBBbnkgTiAgIE0xCiAKICAgICAgICAgICAgICAgICAgICAgICBHUkFERQogICAgICAgIFsgXSAgIEdYICAgICAgR3JhZGUgY2Fubm90IGJlIGFzc2Vzc2VkCiAgICAgICAgW1hdICAgRzEgICAgICBXZWxsIGRpZmZlcmVudGlhdGVkCiAgICAgICAgW1hdICAgRzIgICAgICBNb2QgZGlmZmVyZW50aWF0ZWQKICAgICAgICBbIF0gICBHMyAgICAgIFBvb3JseSBkaWZmZXJlbnRpYXRlZAogICAgICAgIFsgXSAgIEc0ICAgICAgVW5kaWZmZXJlbnRpYXRlZAogCiAKT1AgIzU5OGMgKDU1MikgQXBwcm92ZWQgMTIvOTkgUmV2IDAzLzAzCiAKL2VzLyBNQVJVRiBBSE1FRApQSFlTSUNJQU4KU2lnbmVkOiAxMS8xNi8yMDIzIDE0OjUwCgoxMS8xNi8yMDIzIEFEREVORFVNICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogVU5TSUdORUQKIFlvdSBtYXkgbm90IFZJRVcgdGhpcyBVTlNJR05FRCBBZGRlbmR1bS4="


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
* content.attachment.data = "TE9DQUwgVElUTEU6IFNUQUdJTkcgKFROTSkgVVJJTkFSWSBCTEFEREVSICAgICAgICAgICAgICAgICAgICAgIApEQVRFIE9GIE5PVEU6IE5PViAxNiwgMjAyM0AxNDo0MCAgICAgRU5UUlkgREFURTogTk9WIDE2LCAyMDIzQDE0OjQwOjQ3ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgogICAqKiogU1RBR0lORyAoVE5NKSBVUklOQVJZIEJMQURERVIgSGFzIEFEREVOREEgKioqCgpVUklOQVJZIEJMQURERVIKNnRoIGVkaXRpb24gQUpDQyBDYW5jZXIgU3RhZ2luZyBNYW51YWwKCgp0ZXN0aW5nIG5vdGUgd2l0aCBrYnN0IHRlYW0KIApDTElOICAgUEFUSCAgICAgUFJJTUFSWSBUVU1PUiAoVCkKIFtYXSAgIFsgXSAgIFRYICAgICAgUHJpbWFyeSB0dW1vciBjYW5ub3QgYmUgYXNzZXNzZWQKIFsgXSAgIFsgXSAgIFQwICAgICAgTm8gZXZpZGVuY2Ugb2YgcHJpbWFyeSB0dW1vcgogWyBdICAgWyBdICAgVGEgICAgICBOb24gaW52YXNpdmUgcGFwaWxsYXJ5IGNhcmNpbm9tYQogWyBdICAgWyBdICAgVGlzICAgICBDYXJjaW5vbWEgaW4gc2l0dSAoZmxhdCB0dW1vcikKIFtYXSAgIFsgXSAgIFQxICAgICAgVHVtb3IgaW52YWRlcyBzdWJlcGl0aGVsaWFsIGNvbm5lY3RpdmUgdGlzc3VlCiBbIF0gICBbIF0gICBUMiAgICAgIFR1bW9yIGludmFkZXMgbXVzY2xlCiBbIF0gICBbIF0gICAgICAgICAgIFQyYSAgICAgVHVtb3IgSW52YWRlcyBzdXBlcmZpY2lhbCAoaW5uZXIgaGFsZikKIFsgXSAgIFsgXSAgICAgICAgICAgVDJiICAgICBUdW1vciBJbnZhZGVzIGRlZXAgbXVzY2xlIChvdXRlciBoYWxmKQogWyBdICAgW1hdICAgVDMgICAgICBUdW1vciBpbnZhZGVzIHBlcml2ZXNpY2FsIHRpc3N1ZQogWyBdICAgW1hdICAgICAgICAgICBUM2EgICAgIE1pY3Jvc2NvcGljYWxseQogWyBdICAgWyBdICAgICAgICAgICBUM2IgICAgIE1hY3Jvc2NvcGljYWxseSAoZXh0cmF2ZXNpY2FsIG1hc3MpCiBbIF0gICBbIF0gICBUNCAgICAgIFR1bW9yIGludmFkZXMgYW55IG9mIHRoZSBmb2xsb3dpbmc6IHByb3N0YXRlLAogICAgICAgICAgICAgICAgICAgICAgIHV0ZXJ1cywgdmFnaW5hLCBwZWx2aWMgb3IgYWJkb21pbmFsIHdhbGwKIFsgXSAgIFsgXSAgICAgICAgICAgVDRhICAgICBUdW1vciBpbnZhZGVzIHByb3N0YXRlLCB1dGVydXMsIHZhZ2luYQogW1hdICAgW1hdICAgICAgICAgICBUNGIgICAgIFR1bW9yIGludmFkZXMgcGVsdmljIHdhbGwsIGFiZG9taW5hbCB3YWxsCiAKIAogICAgICAgICAgICAgICBSRUdJT05BTCBMWU1QSCBOT0RFUyAoTikKIFsgXSAgIFsgXSAgIE5YICAgICAgUmVnaW9uYWwgbHltcGggbm9kZSBtZXRhc3Rhc2lzIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgWyBdICAgTjAgICAgICBObyByZWdpb25hbCBseW1waCBub2RlIG1ldGFzdGFzaXMKIFsgXSAgIFtYXSAgIE4xICAgICAgTWV0cyBpbiBhIHNpbmdsZSBseW1waCBub2RlLCAyIGNtIG9yIGxlc3MgaW4KICAgICAgICAgICAgICAgICAgICAgICBncmVhdGVzdCBkaW1lbnNpb24uCiBbIF0gICBbWF0gICBOMiAgICAgIE1ldHMgaW4gYSBzaW5nbGUgbHltcGggbm9kZSBtb3JlIHRoYW4gMiBidXQgbm90CiAgICAgICAgICAgICAgICAgICAgICAgbW9yZSB0aGFuIDUgY20gaW4gZ3JlYXRlc3QgZGltZW5zaW9uOyBtdWx0aXBsZQogICAgICAgICAgICAgICAgICAgICAgIGx5bXBoIG5vZGVzLCBub25lIG1vcmUgdGhhbiA1IGNtIGluIGdyZWF0ZXN0CiAgICAgICAgICAgICAgICAgICAgICAgZGltZW5zaW9uLgogWyBdICAgWyBdICAgTjMgICAgICBNZXRhc3Rhc2lzIGluIGEgbHltcGggbm9kZSBtb3JlIHRoYW4gNSBjbQogCiAgICAgICAgICAgICAgIERJU1RBTlQgTUVUQVNUQVNJUyAoTSkKIFsgXSAgIFtYXSAgIE1YICAgICAgUHJlc2VuY2Ugb2YgZGlzdGFudCBtZXRhc3Rhc2lzIGNhbm5vdCBiZSBhc3Nlc3NlZAogWyBdICAgW1hdICAgTTAgICAgICBObyBkaXN0YW50IG1ldGFzdGFzaXMKIFsgXSAgIFsgXSAgIE0xICAgICAgRGlzdGFudCBtZXRhc3Rhc2lzCiAKU1RBR0UgR1JPVVBJTkcKIFsgXSAgIFsgXSAgIE9hICAgICAgVGEgICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICBPaXMgICAgIFRpcyAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSSAgICAgICBUMSAgICAgIE4wICAgICAgTTAKIFsgXSAgIFtYXSAgIElJICAgICAgVDJhICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICAgICAgICAgIFQyYiAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSUlJICAgICBUM2EgICAgIE4wICAgICAgTTAKIFsgXSAgIFtYXSAgICAgICAgICAgVDNiICAgICBOMCAgICAgIE0wCiBbIF0gICBbIF0gICAgICAgICAgIFQ0YSAgICAgTjAgICAgICBNMAogWyBdICAgWyBdICAgSVYgICAgICBUNGIgICAgIE4wICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBOMSAgICAgIE0wCiBbWF0gICBbIF0gICAgICAgICAgIEFueSBUICAgTjIgICAgICBNMAogW1hdICAgWyBdICAgICAgICAgICBBbnkgVCAgIE4zICAgICAgTTAKIFtYXSAgIFsgXSAgICAgICAgICAgQW55IFQgICBBbnkgTiAgIE0xCiAKICAgICAgICAgICAgICAgICAgICAgICBHUkFERQogICAgICAgIFsgXSAgIEdYICAgICAgR3JhZGUgY2Fubm90IGJlIGFzc2Vzc2VkCiAgICAgICAgW1hdICAgRzEgICAgICBXZWxsIGRpZmZlcmVudGlhdGVkCiAgICAgICAgW1hdICAgRzIgICAgICBNb2QgZGlmZmVyZW50aWF0ZWQKICAgICAgICBbIF0gICBHMyAgICAgIFBvb3JseSBkaWZmZXJlbnRpYXRlZAogICAgICAgIFsgXSAgIEc0ICAgICAgVW5kaWZmZXJlbnRpYXRlZAogCiAKT1AgIzU5OGMgKDU1MikgQXBwcm92ZWQgMTIvOTkgUmV2IDAzLzAzCiAKL2VzLyBNQVJVRiBBSE1FRApQSFlTSUNJQU4KU2lnbmVkOiAxMS8xNi8yMDIzIDE0OjUwCgoxMS8xNi8yMDIzIEFEREVORFVNICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVECkFkZGVuZHVtIHRlc3Qgd2l0aCBLQlNUIHRlYW0gCiAKL2VzLyBNQVJVRiBBSE1FRApQSFlTSUNJQU4KU2lnbmVkOiAxMS8xNi8yMDIzIDE0OjU3"

