
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
* identifier[+].value = "5281919" 
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/NoteTO.id"
* identifier[=].use = #usual
* date = 2022-08-12T12:50:56Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-37569)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-37569)
* context.related[+] = Reference(Location/ex-MHV-location-552)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAxMiwgMjAyMkAxMjo1MDo1NiAgRU5UUlkgREFURTogQVVHIDEyLCAyMDIyQDEyOjUwOjU2ICAgICAgCiAgICAgIEFVVEhPUjogS0hBTixNVUFaWkFNICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMTIsIDIwMjJAMTI6NTA6NTYuCgpQRU5JQ0lMTElOCgpBdXRob3IncyBjb21tZW50czoKCnRlc3QgCgogCi9lcy8gTVVBWlpBTSBLSEFOClBoeXNpY2lhbgpTaWduZWQ6IDA4LzEyLzIwMjIgMTI6NTE="



Instance: ex-MHV-note-1
InstanceOf: VA.MHV.PHR.note
Title: "Example 1 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[+].value = "5281863" 
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/NoteTO.id"
* identifier[=].use = #usual
* date = 2022-08-05T16:56:00Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#11505-5 "Physician procedure note"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyMzo1NCAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjIzOjU0ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMDUsIDIwMjJAMTE6MjM6NTQuCgpXSElURSBGSVNICgpBdXRob3IncyBjb21tZW50czoKCk1hcnVmJ3MgdGVzdCBkYXRhIAoKIAovZXMvIE1BUlVGIEFITUVEClBIWVNJQ0lBTgpTaWduZWQ6IDA4LzA4LzIwMjIgMTA6NTA="



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
* identifier[+].value = "5281856" 
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/NoteTO.id"
* identifier[=].use = #usual
* date = 2022-08-05T11:23:54Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
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
* identifier[+].value = "5281855" 
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/NoteTO.id"
* identifier[=].use = #usual
* date = 2022-08-05T11:22:39Z
* content.attachment.title = "Adverse React/Allergy"
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* type.text = "ALLERGY &amp; IMMUNOLOGY ADVERSE EVENT NOTE"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* context.related[+] = Reference(Location/ex-MHV-location-984)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAwNSwgMjAyMkAxMToyMjozOSAgRU5UUlkgREFURTogQVVHIDA1LCAyMDIyQDExOjIyOjM5ICAgICAgCiAgICAgIEFVVEhPUjogQUhNRUQsTUFSVUYgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMDUsIDIwMjJAMTE6MjI6MzkuCgpQT0xMRU4gQUxMRVJHRU5JCgpBdXRob3IncyBjb21tZW50czoKCk1hcnVmJ3MgdGVzdCBkYXRhIAoKIAovZXMvIE1BUlVGIEFITUVEClBIWVNJQ0lBTgpTaWduZWQ6IDA4LzA4LzIwMjIgMTE6MDM="



Instance: ex-MHV-note-4
InstanceOf: VA.MHV.PHR.note
Title: "Example 4 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:

Note dropped cosigner
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* identifier[+].value = "5281877" 
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/NoteTO.id"
* identifier[=].use = #usual
* date = 2022-08-09T13:41:23Z
* content.attachment.title = "Discharge Summary"
* type = LOINC#18842-5 "Discharge summary"
* type.text = "DISCHARGE SUMMARY"
* author = Reference(Practitioner/ex-MHV-practitioner-36556)
* authenticator = Reference(Practitioner/ex-MHV-practitioner-36556)
* context.related[+] = Reference(Location/ex-MHV-location-552)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IERpc2NoYXJnZSBTdW1tYXJ5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogRElTQ0hBUkdFIFNVTU1BUlkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgIERJQ1QgREFURTogQVVHIDA5LCAyMDIyQDEzOjQyICAgICBFTlRSWSBEQVRFOiBBVUcgMDksIDIwMjJAMTM6NDM6MDIgICAgICAKIERJQ1RBVEVEIEJZOiBBSE1FRCxNQVJVRiAgICAgICAgICAgICBBVFRFTkRJTkc6IEFITUVELE5BSkVFQiAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogcm91dGluZSAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAKIApEQVRFIE9GIEFETUlTU0lPTjoKREFURSBPRiBESVNDSEFSR0U6IEF1ZyA5LDIwMjIKIApQUklOQ0lQTEUgRElTQ0hBUkdFIERJQUdOT1NJUzogVEVTVCBESVNHTk9TSVMsIE1hcnVmIEFobWVkLgpBRERJVElPTkFMIERJQUdOT1NFUzoKIApDT05TVUxUQU5UKFMpOgpQUk9DRURVUkUoUyk6CiAKQlJJRUYgQURNSVNTSU9OIEhJU1RPUlk6CjcxIHllYXIgb2xkIE1BTEUgdGVzdAogCkJSSUVGIEFETUlTU0lPTiBQSFlTSUNBTCBFWEFNOiAgdGVzdCBleGFtCiAKQURNSVNTSU9OIExBQi9FS0cvWC1SQVkgUkVTVUxUUzogIHRlc3QgYWdhaW4KIApIT1NQSVRBTCBDT1VSU0U6CiAgdmlhMnZkaWYgdHJhbnNzdGl0aW9uCiAKQ09ORElUSU9OIE9OIERJU0NIQVJHRTogdGVzdAogCkRJU0NIQVJHRSBJTlNUUlVDVElPTlM6CiAgIEFjdGl2aXR5OiAgICB0ZXN0MQogICBEaWV0OiAgICAgICAgdGVzdDIKICAgTWVkaWNhdGlvbnM6IHRlc3QzCiAgIFNwZWNpYWwgSW5zdHJ1Y3Rpb25zOiB0ZXN0IGFnYWluCiAgIEZvbGxvdy11cCBQbGFuczogdGVzdCBhZ2FpbiBhZ2FpbgogCi9lcy8gTUFSVUYgQUhNRUQKUEhZU0lDSUFOClNpZ25lZDogMDgvMDkvMjAyMiAxMzo0NAogCi9lcy8gTVVBWlpBTSBLSEFOClBoeXNpY2lhbgpDb3NpZ25lZDogMDgvMTIvMjAyMiAxMjoxNwpmb3IgTkFKRUVCIEFITUVEICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApBTU9E"



