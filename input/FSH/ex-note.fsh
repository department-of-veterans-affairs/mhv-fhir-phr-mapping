
Instance: ex-MHV-note-0
InstanceOf: VA.MHV.PHR.note
Title: "Example 0 of a MHV Note"
Usage: #example
Description: """
Derived from the a mock NoteTO:

TODO, not completely mapped yet
"""
* identifier[+].value = "5281919" 
* identifier[=].use = #usual
* status = #current
* type = LOINC#83320-2 "Allergy and Immunology Adverse event note"
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-1)
* content.attachment.contentType = #text/plain
* content.attachment.data = "TE9DQUwgVElUTEU6IEFkdmVyc2UgUmVhY3QvQWxsZXJneSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTVEFOREFSRCBUSVRMRTogQUxMRVJHWSAmYW1wOyBJTU1VTk9MT0dZIEFEVkVSU0UgRVZFTlQgTk9URSAgICAgICAgIApEQVRFIE9GIE5PVEU6IEFVRyAxMiwgMjAyMkAxMjo1MDo1NiAgRU5UUlkgREFURTogQVVHIDEyLCAyMDIyQDEyOjUwOjU2ICAgICAgCiAgICAgIEFVVEhPUjogS0hBTixNVUFaWkFNICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpUaGlzIHBhdGllbnQgaGFzIGhhZCB0aGUgZm9sbG93aW5nIHJlYWN0aW9ucyAKc2lnbmVkLW9mZiBvbiBBdWcgMTIsIDIwMjJAMTI6NTA6NTYuCgpQRU5JQ0lMTElOCgpBdXRob3IncyBjb21tZW50czoKCnRlc3QgCgogCi9lcy8gTVVBWlpBTSBLSEFOClBoeXNpY2lhbgpTaWduZWQ6IDA4LzEyLzIwMjIgMTI6NTE="
