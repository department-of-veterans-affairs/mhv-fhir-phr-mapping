/*

The mock notes bundle is nice, but it does not allow the user of the IG to see examples. So in addition to having the bundle in the build, we also want examples. So we explode out the examples using the follow manual process. 

Note that Grahame has said he has a backlog to do this automatically in the IG publisher, but it is not priortized. So this might not be needed in the future.

These examples come from 
1. mocks/notes3a.xml
2. transformed with mocks/notes.xslt (with extensions populating an artifact-title and artifact-description extension)
3. that bundle built into the IG so that the IG build creates the json equivilant (sushi fails if these are bigger than 3500 lines or 29 entries, so tend to just break this up into three files, or standalone IG can handle large xml)
3. Put the json equvilant bundle into "FSH Online" to convert to FSH - https://fshschool.org/FSHOnline/#/  
5. put the result into this FSH file
6. Remove the bundle
7. change inline to example
8. convert extension for description and title 
9. move meta.profile into InstanceOf:
10. use slices on identifier - TOid
12. change contained (author, approvedBy, and location) references to .reference = "#author-0" -- https://chat.fhir.org/#narrow/stream/215610-shorthand/topic/FSHOnline.20contained.20resources

*/

Alias: $loinc = http://loinc.org
Alias: $us-core-documentreference-category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category


Instance: 59c8b73b-3e5f-4f0a-99e7-61572505317e
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 81544045"
Description: "WOUND - SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.374229"
* contained[=].name.text = "TESTmiller,RONALD C"
* contained[=].name.family = "TESTmiller,RONALD C"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.374229"
* contained[=].name.text = "TESTmiller,RONALD C"
* contained[=].name.family = "TESTmiller,RONALD C"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.81544045"
* status = #current
* type = $loinc#11506-3
* type.text = "WOUND CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-11-13T15:27:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-11-13T12:27:38Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogV09VTkQgLSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBXT1VORCBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMTMsIDIwMjNAMTU6MjcgICAgIEVOVFJZIERBVEU6IE5PViAxMywgMjAyM0AxMjoyNzozOCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsUk9OQUxEIEMgICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDExLzEzLzIwMjMgMDM6MjAgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIE9zdG9teSAmIFdvdW5kIENhcmVfVkFQb3J0bGFuZEhDU19PQ0QgClN1YmplY3Q6ICBHZW5lcmFsOlRlc3QgTWVzc2FnZSBmb3IgU2F2ZSB0byBDUFJTIAoKVGVzdCBNZXNzYWdlIGZvciBTYXZlIHRvIENQUlMgLSBOb3RlIHRpdGxlIGVycm9yICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMS8xMy8yMDIzIDAzOjI3IFBNIEVUIApGcm9tOiAgVEVTVG1pbGxlciwgUk9OQUxEICBDIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRlc3QgTWVzc2FnZSBmb3IgU2F2ZSB0byBDUFJTIAoKdHJpYWwKCiAKL2VzLyBST05BTEQgQyBURVNUbWlsbGVyCkFSTlAgQ1dPTgpTaWduZWQ6IDExLzEzLzIwMjMgMTI6MjcK"
* content.attachment.title = "WOUND - SECURE MESSAGING"
* content.attachment.creation = "2023-11-13T15:27:00Z"
* context.related.reference = "#location-0"

Instance: 84f1b9f2-b2e2-4944-b744-58e83af4a5e3
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 81509152"
Description: "UROLOGY SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.422673"
* contained[=].name.text = "TESTdavis,TAMMY L"
* contained[=].name.family = "TESTdavis,TAMMY L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.422673"
* contained[=].name.text = "TESTdavis,TAMMY L"
* contained[=].name.family = "TESTdavis,TAMMY L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.81509152"
* status = #current
* type = $loinc#11506-3
* type.text = "UROLOGY SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-11-09T12:36:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-11-09T09:36:04Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogVVJPTE9HWSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBVUk9MT0dZIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMDksIDIwMjNAMTI6MzYgICAgIEVOVFJZIERBVEU6IE5PViAwOSwgMjAyM0AwOTozNjowNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxUQU1NWSBMICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTEvMDkvMjAyMyAxMjowOSBQTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgVXJvbG9neV9WQVBvcnRsYW5kSENTX09DRCAKU3ViamVjdDogIEdlbmVyYWw6VHJhaW5pbmcgTXNnIDEgZm9yIFRhbW15IAoKdHJhaW5pbmcgbWVzc2FnZSAxICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMS8wOS8yMDIzIDEyOjMzIFBNIEVUIApGcm9tOiAgVEVTVGRhdmlzLCBUQU1NWSAgTCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpUcmFpbmluZyBNc2cgMSBmb3IgVGFtbXkgCgphc2tlZCBxdWVzdGlvbnMuIEknbSBnb2luZyB0byBsZXQgdGhlIHN1cmdlb24ga25vdy4gIFdlIHdpbGwgY29udGFjdCB5b3UuIAoKIAovZXMvIFRBTU1ZIEwgVEVTVGRhdmlzIFJOLCBCU04KUk4sIEJTTgpTaWduZWQ6IDExLzA5LzIwMjMgMDk6MzYK"
* content.attachment.title = "UROLOGY SECURE MESSAGING"
* content.attachment.creation = "2023-11-09T12:36:00Z"
* context.related.reference = "#location-0"

Instance: b28b2dc5-c1b0-48b2-8f81-a13676a3129a
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 80529980"
Description: "EYE - AFTERVISIT SUMMARY SPECTACLE RX"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.273377"
* contained[=].name.text = "TESTjackson,ANNA L"
* contained[=].name.family = "TESTjackson,ANNA L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.273377"
* contained[=].name.text = "TESTjackson,ANNA L"
* contained[=].name.family = "TESTjackson,ANNA L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648GA"
* contained[=].name = "BEND, OR CBOC"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.80529980"
* status = #current
* type = $loinc#11506-3
* type.text = "OPTOMETRY NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-09-01T14:52:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-09-01T14:53:33Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogRVlFIC0gQUZURVJWSVNJVCBTVU1NQVJZIFNQRUNUQUNMRSBSWCAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBPUFRPTUVUUlkgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMDEsIDIwMjNAMTQ6NTIgICAgIEVOVFJZIERBVEU6IFNFUCAwMSwgMjAyM0AxNDo1Mjo1MyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RqYWNrc29uLEFOTkEgTCAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUEVDVEFDTEUgUlgKICAgICAgICBERVBBUlRNRU5UIE9GIFZFVEVSQU5TIEFGRkFJUlMgU1BFQ1RBQ0xFIFBSRVNDUklQVElPTiBGT1JNCiAgICAgICAgICAgICAgICAqTm90IHRvIGJlIGZpbGxlZCBwcml2YXRlbHkgYXQgVkEgZXhwZW5zZSoKIApQYXRpZW50IE5hbWU6ICBNSFZaWlZJU05UV0VOVFksVEVTVCBQQVRJRU5UUiAgICAgICAgICAgIERhdGUgb2YgQmlydGg6ICBKQU4gCjEsMjAwMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogCkZyb20gbm90ZTogRVlFL09QVE9NIC0gRk9MTE9XLVVQIDkvMS8yM0AxNDo1MApNYW5pZmVzdCByZWZyYWN0aW9uOgpSSUdIVCBFWUUgKE9EKToKICswLjUwICswLjUwIHggMDkwCkxFRlQgRVlFIChPUyk6CiArMC41MCArMC4yNSB4IDA5NQpBREQ6ICsyLjUwCiAKIAogCiAKIApFbGVjdHJvbmljYWxseSBTaWduZWQgQnk6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRXllIENhcmUgUHJvdmlkZXI6ICBLYXJlbiBURVNUcm9kcmlndWV6LCBPRCAvIE9SIEFULTM2NDMKRXhhbWluYXRpb24gRGF0ZTogIFNlcCAxLDIwMjMKRXhwaXJhdGlvbiBEYXRlOiAgMiB5ZWFycyBmcm9tIEV4YW1pbmF0aW9uIERhdGUKIApDb250YWN0L0FkZHJlc3MgSW5mb3JtYXRpb24gZm9yIHRoZSBWQVBPUkhDUyBFeWUgU2VydmljZTogKDIwMTkpCiAKVEVMRVBIT05FIC8gRVlFIENBUkUgU0VSVklDRVM6ICA1MDMtNzIxLTc4OTAKICAgICAgT3B0aW9uIDE6ICBTY2hlZHVsaW5nCiAgICAgIE9wdGlvbiAyOiAgTWVkaWNhdGlvbnMKICAgICAgT3B0aW9uIDM6ICBPcHRpY2FsIFNob3AKICAgICAgT3B0aW9uIDQ6ICBDb21tdW5pdHkgQ2FyZQogICAgICBPcHRpb24gNTogIFVyZ2VudCBFeWUgUHJvYmxlbXMKIApCZW5kIENCT0MsIFZBUE9SSENTICAgICAgICAgICBQb3J0bGFuZCBEaXZpc2lvbiwgVkFQT1JIQ1MKRXllIENsaW5pYywgMm5kIEZsb29yICAgICAgICAgRXllIENsaW5pYywgQmxkZyAxMDAsIDgtQwoyNjUwIE5FIENvdXJ0bmV5IERyaXZlICAgICAgICAzNzEwIFNXIFUuUy4gVmV0ZXJhbnMgSG9zcGl0YWwgUmQuCkJlbmQsIE9yZWdvbiA5NzcwMSAgICAgICAgICAgIFBvcnRsYW5kLCBPcmVnb24gOTcyMzkKIApTYWxlbSBDQk9DLCBWQVBPUkhDUyAgICAgICAgICBWYW5jb3V2ZXIgQ2FtcHVzLCBWQVBPUkhDUwpFeWUgQ2xpbmljLCBTdWl0ZSAxMzAgICAgICAgICBFeWUgQ2xpbmljLCBCdWlsZGluZyAxNywgM3JkIEZsb29yCjE3NTAgTWNHaWxjaHJpc3QgU3QuIFNFICAgICAgIDE2MDEgRSBGb3VydGggUGxhaW4gQmx2ZC4KU2FsZW0sIE9SIDk3MzAyICAgICAgICAgICAgICAgVmFuY291dmVyLCBXYXNoaW5ndG9uIDk4NjYxCiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgo="
* content.attachment.title = "EYE - AFTERVISIT SUMMARY SPECTACLE RX"
* content.attachment.creation = "2023-09-01T14:52:00Z"
* context.related.reference = "#location-0"

Instance: aa181f04-6ade-4454-9d9c-cc7fa32ec3d6
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 80341525"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.215568"
* contained[=].name.text = "TESTmartinez,Olivia"
* contained[=].name.family = "TESTmartinez,Olivia"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.215568"
* contained[=].name.text = "TESTmartinez,Olivia"
* contained[=].name.family = "TESTmartinez,Olivia"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.80341525"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-08-21T11:26:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-08-21T09:26:03Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBVUcgMjEsIDIwMjNAMTE6MjYgICAgIEVOVFJZIERBVEU6IEFVRyAyMSwgMjAyM0AwOToyNjowMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixPbGl2aWEgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDgvMjEvMjAyMyAxMTo0NSBBTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgVEVTVG1hcnRpbmV6IE5fU29jaWFsIFdvcmtfUG9ydGxhbmRfU1cgClN1YmplY3Q6ICBHZW5lcmFsOlRlc3QgCgpIZWxsbyAgIAogIAogIApGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgIApodHRwczovL3d3dy52YS5nb3YvZGlyZWN0b3J5L2d1aWRlL3JlZ2lvbi5hc3A/SUQ9MTAyMD8KLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA4LzIxLzIwMjMgMTI6MjUgUE0gRVQgCkZyb206ICBURVNUbWFydGluZXosIE9saXZpYSAgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6VGVzdCAKCkhlbGxvIGJhY2shICAKCiAKL2VzLyBPbGl2aWEgVEVTVG1hcnRpbmV6IExDU1csIE1TVyAKU09DSUFMIFdPUktFUgpTaWduZWQ6IDA4LzIxLzIwMjMgMDk6MjYK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2023-08-21T11:26:00Z"
* context.related.reference = "#location-0"

Instance: a40f1328-20f3-4660-85ca-9f40b3acded9
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 80340830"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.215568"
* contained[=].name.text = "TESTmartinez,Olivia"
* contained[=].name.family = "TESTmartinez,Olivia"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.215568"
* contained[=].name.text = "TESTmartinez,Olivia"
* contained[=].name.family = "TESTmartinez,Olivia"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.80340830"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-08-21T11:06:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-08-21T09:06:53Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBVUcgMjEsIDIwMjNAMTE6MDYgICAgIEVOVFJZIERBVEU6IEFVRyAyMSwgMjAyM0AwOTowNjo1MyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixPbGl2aWEgICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDgvMjEvMjAyMyAxMjowMCBQTSBFVCAKRnJvbTogIFRFU1RtYXJ0aW5leiwgT2xpdmlhICAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgVGVzdDpUZXN0IDEgIAoKSGVsbG8gc2tmanNqZ3NrZ2ogc2tqLiAKCiAKL2VzLyBPbGl2aWEgVEVTVG1hcnRpbmV6IExDU1csIE1TVyAKU09DSUFMIFdPUktFUgpTaWduZWQ6IDA4LzIxLzIwMjMgMDk6MDYK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2023-08-21T11:06:00Z"
* context.related.reference = "#location-0"

Instance: d508be20-c3d7-4056-ba61-90b4fbddfc32
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 80222094"
Description: "CCC: CLINICAL TRIAGE"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.41743"
* contained[=].name.text = "TESTsmith,Charlotte R"
* contained[=].name.family = "TESTsmith,Charlotte R"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.41743"
* contained[=].name.text = "TESTsmith,Charlotte R"
* contained[=].name.family = "TESTsmith,Charlotte R"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.80222094"
* status = #current
* type = $loinc#11506-3
* type.text = "RN PROGRESS NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-08-11T13:03:18Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-08-11T13:03:19Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogQ0NDOiBDTElOSUNBTCBUUklBR0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBSTiBQUk9HUkVTUyBOT1RFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBVUcgMTEsIDIwMjNAMTM6MDM6MTggIEVOVFJZIERBVEU6IEFVRyAxMSwgMjAyM0AxMzowMzoxOCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxDaGFybG90dGUgUiAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCgpQYXRpZW50IERlbW9ncmFwaGljcwpQYXRpZW50IE5hbWU6IFRFU1QgUEFUSUVOVFIgTUhWWlpWSVNOVFdFTlRZClNTTjogNjY2NjYyMDAwClBhdGllbnQgUHJpbWFyeSBBZGRyZXNzOiA0ODE1IE4gQXNzZW1ibHkgU3QgPGJyPlNwb2thbmUsIFdBIDk5MjA1ClBhdGllbnQgRE9COiBKYW51YXJ5IDEsIDIwMDEKUGF0aWVudCBBZ2U6IDIyCkNhbGxlci9SZWNpcGllbnQgUmVsYXRpb24gdG8gUGF0aWVudDogU2VsZgoKVHJpYWdlIFN1bW1hcnkKQ29uZHVjdGVkIHRyaWFnZS9kaXNjdXNzZWQgc3ltcHRvbXMKVXRpbGl6ZWQgdGhlIFRyaWFnZSBUb29sOiBZZXMKQ2hpZWYgQ29tcGxhaW50OiB0ZXN0IHRlc3QKTnVyc2UncyBSZWNvbW1lbmRhdGlvbiAvIFdIRU46IFdpdGhpbiA4IEhvdXJzCk51cnNlJ3MgUmVjb21tZW5kYXRpb24gLyBXSEVSRTogVXJnZW50IE5vbi1WQQoKUGF0aWVudCBEaXNwb3NpdGlvbgpQYXRpZW50L0NhcmVnaXZlciBhZ3JlZXMgdG8gcGxhbiBvZiBjYXJlOiBZZXMKUGF0aWVudCBpcyBVcmdlbnQgb3IgRW1lcmdlbnQKCk51cnNpbmcgUGxhbiBhbmQgRGlzcG9zaXRpb24KUmVmZXJyZWQgcGF0aWVudCB0byBlbWVyZ2VuY3kgc2VydmljZXMKSW5zdHJ1Y3RlZCB0byBnbyB0byBVcmdlbnQgQ2FyZSAoVUMpClByb3ZpZGVkIGxvY2F0aW9uIG9mIFVyZ2VudCBDYXJlIENlbnRlcgpBZHZpc2VkIG9mIE1pc3Npb24gQWN0IFVDIEJlbmVmaXRzCgpOdXJzZSBTdW1tYXJ5Ck51cnNlIFN1bW1hcnk6IHRlc3QgdGVzdCB0ZXN0CgpDbGluaWNhbCBDb250YWN0IENlbnRlciBDb2RlcwpDbGluaWMvTG9jYXRpb246IFYyMCBQT1IgUEhPTkUgQ0NDIFJOCgpOb3RlcwpOb3RlcyAmIEluZm9ybWF0aW9uOiB0ZXN0aW5nIHRlc3RpbmcgdGVzdGluZwogCi9lcy8gQ2hhcmxvdHRlIFIgVEVTVHNtaXRoLCBSTgpQYXRpZW50IEFjY2VzcyBDZW50ZXIgQ29vcmRpbmF0b3IKU2lnbmVkOiAwOC8xMS8yMDIzIDEzOjAzCg=="
* content.attachment.title = "CCC: CLINICAL TRIAGE"
* content.attachment.creation = "2023-08-11T13:03:18Z"
* context.related.reference = "#location-0"

Instance: b87239d6-a8eb-44ed-941e-c0bb751fbffb
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 79745271"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.79745271"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-07-11T09:49:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-07-11T07:49:14Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKVUwgMTEsIDIwMjNAMDk6NDkgICAgIEVOVFJZIERBVEU6IEpVTCAxMSwgMjAyM0AwNzo0OToxNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDcvMTEvMjAyMyAxMDo0MyBBTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgTXlIZWFsdGhlVmV0L1NlY3VyZU1lc3NhZ2luZyBBZG1pbl9WQVBvcnRsYW5kSENTIApTdWJqZWN0OiAgR2VuZXJhbDpUZXN0IAoKcztsZGtjZmo7bHNrbWRjbGtzbWQgIAphcztvZGljam47c2xrZGYgIApdYXNvO2RrZm5jYTtscyAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCmh0dHBzOi8vd3d3LnZhLmdvdi9kaXJlY3RvcnkvZ3VpZGUvcmVnaW9uLmFzcD9JRD0xMDIwPwotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDcvMTEvMjAyMyAxMDo0NCBBTSBFVCAKRnJvbTogIFRFU1Rqb2huc29uLCBCUklBTiAgSyAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpUZXN0IAoKICAKYWRjZGxrYWpqZGZhcyAgCkRLRkpOQVM7TEYgIApBU0xLREpORkwgIAogIAogIApHbyB0byB0aGUgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6ICAKaHR0cHM6Ly93d3cudmEuZ292L3BvcnRsYW5kLWhlYWx0aC1jYXJlLwoKIAovZXMvIEJSSUFOIEsgVEVTVGpvaG5zb24gQkEKU0VDVVJFIE1FU1NBR0lORyBBRE1JTklTVFJBVE9SClNpZ25lZDogMDcvMTEvMjAyMyAwNzo0OQo="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2023-07-11T09:49:00Z"
* context.related.reference = "#location-0"

Instance: 83b85e38-7586-4fda-a75d-c6c45730ece5
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 79686701"
Description: "AVS STUB NOTE"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.11786"
* contained[=].name.text = "TESTwilliams,AMIE M"
* contained[=].name.family = "TESTwilliams,AMIE M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.79686701"
* status = #current
* type = $loinc#11506-3
* type.text = "EDUCATION NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-07-06T10:08:36Z"
* author.reference = "#author-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogQVZTIFNUVUIgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBFRFVDQVRJT04gTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgRElDVCBEQVRFOiBKVUwgMDYsIDIwMjNAMTA6MDg6MzYgIEVOVFJZIERBVEU6IEpVTCAwNiwgMjAyM0AxMDowODozNiAgICAgIAogRElDVEFURUQgQlk6IFRFU1R3aWxsaWFtcyxBTUlFIE0gICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKClRoZSBwYXRpZW50IHdhcyBwcm92aWRlZCB3aXRoIGEgY29weSBvZiBhbiBhZnRlci12aXNpdCBzdW1tYXJ5IGF0IHRoZQpjb25jbHVzaW9uIG9mIHRoZSB2aXNpdC4KClRoZSBhZnRlci12aXNpdCBzdW1tYXJ5IGluY2x1ZGVzIGluZm9ybWF0aW9uIHBlcnRhaW5pbmcgdG8gdGhlIHBhdGllbnQncwplbmNvdW50ZXIsIGluY2x1ZGluZyBkaWFnbm9zZXMsIHZpdGFsIHNpZ25zLCBtZWRpY2F0aW9ucywgYW5kIG5ldyBvcmRlcnMsCmFzIHdlbGwgYXMgYSBsaXN0IG9mIGFueSBhbnkgdXBjb21pbmcgYXBwb2ludG1lbnRzIGFuZCBpbmZvcm1hdGlvbiByZWdhcmRpbmcKdGhlIHBhdGllbnQncyBvbmdvaW5nIGNhcmUuCgpUaGUgcGF0aWVudCdzIG1lZGljYXRpb25zIHdlcmUgcmV2aWV3ZWQgd2l0aCB0aGUgcGF0aWVudCBieSB0aGUgcHJvdmlkZXIKYW5kIHdlcmUgcHJvdmlkZWQgdG8gdGhlIHBhdGllbnQgYXMgYW4gdXBkYXRlZCBsaXN0IG9mIG1lZGljYXRpb25zLiAgVGhlCnBhdGllbnQgd2FzIGluc3RydWN0ZWQgdG8gaW5mb3JtIHRoZSBwcm92aWRlciBvZiBhbnkgbWVkaWNhdGlvbiBjaGFuZ2VzCm9yIGRpc2NyZXBhbmNpZXMgdGhhdCB3ZXJlIG5vdGVkLiAgT3RoZXJ3aXNlLCB0aGUgcGF0aWVudCB3YXMgaW5zdHJ1Y3RlZAp0byBjb250aW51ZSB0aGUgbWVkaWNhdGlvbnMgYXMgcHJlc2NyaWJlZC4KCkEgY29weSBvZiB0aGUgYWZ0ZXItdmlzaXQgc3VtbWFyeSBwcm92aWRlZCB0byB0aGUgcGF0aWVudCBpcyBhdmFpbGFibGUgaW4KVmlzdEEgSW1hZ2luZy4KIAogICAgICAgICAgICAgICAgICAgICAgICAgICAqKiogU0NBTk5FRCBET0NVTUVOVCAqKioKICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNJR05BVFVSRSBOT1QgUkVRVUlSRUQKIAogCiAgRWxlY3Ryb25pY2FsbHkgRmlsZWQ6IDA3LzA2LzIwMjMKICAgICAgICAgICAgICAgICAgICBieTogRVJJQyBDIFRFU1Ricm93bgogICAgICAgICAgICAgICAgICAgICAgICAK"
* content.attachment.title = "AVS STUB NOTE"
* content.attachment.creation = "2023-07-06T10:08:36Z"
* context.related.reference = "#location-0"

Instance: 11b9c29c-bbf3-4eb5-abd9-d6b003e82426
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77100417"
Description: "VIRTUAL EMERG MGMT PHARM"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.155955"
* contained[=].name.text = "TESTbrown,ERIC C"
* contained[=].name.family = "TESTbrown,ERIC C"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.155955"
* contained[=].name.text = "TESTbrown,ERIC C"
* contained[=].name.family = "TESTbrown,ERIC C"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77100417"
* status = #current
* type = $loinc#11506-3
* type.text = "TELEHEALTH NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-01-04T13:41:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-04-19T12:43:06Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogVklSVFVBTCBFTUVSRyBNR01UIFBIQVJNICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBURUxFSEVBTFRIIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMDQsIDIwMjNAMTM6NDEgICAgIEVOVFJZIERBVEU6IEpBTiAwNCwgMjAyM0AxMzo0MTo1NCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ricm93bixFUklDIEMgICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCiAgICoqKiBWSVJUVUFMIEVNRVJHIE1HTVQgUEhBUk0gSGFzIEFEREVOREEgKioqCgoKIk1hcnkgaGFkIGEgbGl0dGxlIGxhbWIuIgpIb3VzZSdzIDgwJ3MgQm9iJ3MKCiJNYXJ5IGhhZCBhIGxpdHRsZSBsYW1iLiIKSG91c2UncyA4MCdzIEJvYidzCiAKL2VzLyBFUklDIEMgVEVTVGJyb3duCgpTaWduZWQ6IDA0LzE5LzIwMjMgMTI6NDMKCjA0LzE5LzIwMjMgQURERU5EVU0gICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQKaGFoYSwgd2hvIHNlbnQgdGhpcz8KIAovZXMvIEVSSUMgQyBURVNUYnJvd24KClNpZ25lZDogMDQvMTkvMjAyMyAxMjo0Mwo="
* content.attachment.title = "VIRTUAL EMERG MGMT PHARM"
* content.attachment.creation = "2023-01-04T13:41:00Z"
* context.related.reference = "#location-0"

Instance: aa33e7a8-438e-4984-aa2c-01541162c62c
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 78118479"
Description: "PC - AFTERVISIT SUMMARY"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.78118479"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-03-17T09:27:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-03-17T09:28:54Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBBRlRFUlZJU0lUIFNVTU1BUlkgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTcsIDIwMjNAMDk6MjcgICAgIEVOVFJZIERBVEU6IE1BUiAxNywgMjAyM0AwOToyNzowNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKCioqKiBDTElOSUMgQUZURVJWSVNJVCBTVU1NQVJZICoqKgogCk1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSCiAKVGhhbmsgeW91IGZvciBhbGxvd2luZyB1cyB0byBwYXJ0aWNpcGF0ZSBpbiB5b3VyIGhlYWx0aGNhcmUuIFBsZWFzZSByZXZpZXcgdGhpcwpkb2N1bWVudC4gIEl0IG1heSBjb250YWluIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gb3IgaW5zdHJ1Y3Rpb25zIGZyb20geW91ciBjYXJlCnByb3ZpZGVyLgogX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KIApQQVRJRU5UIElOU1RSVUNUSU9OUzoKClRoYW5rIHlvdSBmb3IgY29taW5nIGluCgpQbGVhc2UgcmVwb3J0IGZvciBsYWJzCgpQbGVhc2UgbW9uaXRvciB5b3VyIGJsb29kIHByZXNzdXJlIGFuZCBibG9vZCBnbHVjb3NlCgpXZSB3aWxsIG1lZXQgYWdhaW4gaW4gMyBtb250aHMKIAogCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIApUSElTIElTIFlPVVIgTUVESUNBVElPTiBMSVNUIE1BUiAxNywgMjAyMyBZb3Ugc2hvdWxkIGtlZXAgYSBjb3B5IG9mIHlvdXIKbWVkaWNhdGlvbiBsaXN0IGFuZCBicmluZyBpdCB3aXRoIHlvdSB0byBhbGwgb2YgeW91ciBtZWRpY2FsIGFwcG9pbnRtZW50cy4KUGxlYXNlIGNvbnRpbnVlIHRvIHRha2UgdGhlc2UgbWVkaWNhdGlvbnMgYXMgZGlyZWN0ZWQuIENhbGwgdXMgb3Igc2VuZCB1cyBhCnNlY3VyZSBtZXNzYWdlIGlmIHlvdSBzdGFydCwgc3RvcCwgb3IgY2hhbmdlIG1lZGljYXRpb25zLiBUbyBoZWxwIHlvdXIgcHJpbWFyeQpjYXJlIHRlYW0gcHJvdmlkZSB0aGUgc2FmZXN0IGNhcmUgZm9yIHlvdSwgaXQgaXMgaW1wb3J0YW50IGZvciB0aGVtIHRvIGtub3cKYWJvdXQgYWxsIHRoZSBtZWRpY2F0aW9ucyB5b3UgdGFrZSwgZXZlbiBpZiBpdCdzIGp1c3QgYW4gaGVyYmFsIHN1cHBsZW1lbnQgb3IKb3ZlciB0aGUgY291bnRlciBtZWRpY2F0aW9ucy4KIApJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zLCBwbGVhc2Ugbm90aWZ5IGFuIGFzc2lzdGFudCBiZWZvcmUgeW91IGxlYXZlLiAgSWYgeW91Cm5lZWQgdG8gcmVmaWxsIGEgbWVkaWNhdGlvbiwgcGxlYXNlIGNhbGwgMS04ODgtNDAwLTgzODcKIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogCk5FVyBBTkQgRElTQ09OVElOVUVEIE1FRElDQVRJT05TCiAKIApZb3VyIHByb3ZpZGVyIGhhcyBOT1QgcHJlc2NyaWJlZCBhbnkgbmV3IG1lZGljYXRpb25zIHRvZGF5LgogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiAKWW91ciBwcm92aWRlciBoYXMgTk9UIGRpc2NvbnRpbnVlZCBhbnkgb2YgeW91ciBtZWRpY2F0aW9ucyB0b2RheS4KIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogCkNPTlRJTlVFRCBNRURJQ0FUSU9OUyAoYWN0aXZlIFZBIGFuZCBub24tVkEgbWVkcykKIApUaGVzZSBtZWRpY2F0aW9ucyB3ZXJlIG5vdCBjaGFuZ2VkIGR1cmluZyB0aGlzIHZpc2l0LiBZb3Ugc2hvdWxkIGNvbnRpbnVlIHRvCnRha2UgdGhlbSBhcyBwcmVzY3JpYmVkLgpBY3RpdmUgTWVkaWNhdGlvbnMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAxKSBBY2V0YW1pbm9waGVuIDUwME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCBmb3VyIHRpbWVzIGEgZGF5IGFzIG5lZWRlZCAqZG8KICAgICBOb3QgdGFrZSBtb3JlICB0aGFuIDQsMDAwbWcgYSBkYXkgb2YgYWNldGFtaW5vcGhlbgogICAgIEZyb20gYWxsIHNvdXJjZXMgZHVlIHRvIHJpc2sgb2YgIGxpdmVyIGRhbWFnZS4KIDIpIEFsYnV0ZXJvbCAxMDAvSXByYXRybyAyME1jZyAxMjBEIFBvIEluaGwKICAgICBJbmhhbGUgMSBzcHJheSBieSBtb3V0aCBmb3VyIHRpbWVzIGEgZGF5IChlYWNoIGluaGFsZXIKICAgICBDb250YWlucyAxMjAgIHNwcmF5cykKIDMpIEFsbG9wdXJpbm9sIDEwME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCBldmVyeSBkYXkKIDQpIEFzcGlyaW4gMzI1TWcgRWMgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIGV2ZXJ5IGRheQogNSkgQnVzcGlyb25lIEhjbCAxME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCB0d2ljZSBhIGRheSBhcyBuZWVkZWQgZm9yIGFueGlldHkKIDYpIENhcHNhaWNpbiAwLjElIENyZWFtCiAgICAgQXBwbHkgYSBzbWFsbCBhbW91bnQgdG9waWNhbGx5IHR3aWNlIGEgZGF5CiA3KSBDbG9waWRvZ3JlbCBCaXN1bGZhdGUgNzVNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgZXZlcnkgZGF5CiA4KSBEaXBoZW5oeWRyYW1pbmUgSGNsIDI1TWcgQ2FwCiAgICAgVGFrZSBvbmUgY2Fwc3VsZSBieSBtb3V0aCBmb3VyIHRpbWVzIGEgZGF5IGFzIG5lZWRlZAogOSkgRmx1b3hldGluZSBIY2wgMTBNZyBDYXAKICAgICBUYWtlIG9uZSBjYXBzdWxlIGJ5IG1vdXRoIGV2ZXJ5IGRheQoxMCkgRmx1dGljYXMgNTAwL1NhbG1ldGVyb2wgNTAgSW5obCBEaXNrIDYwCiAgICAgSW5oYWxlIDEgaW5oYWxhdGlvbiBieSBtb3V0aCB0d2ljZSBhIGRheSByaW5zZSBtb3V0aCBhbmQKICAgICBTcGl0IGFmdGVyICB1c2UuIERpc2NhcmQgMSBtb250aCBhZnRlciBvcGVuaW5nIGZvaWwgcG91Y2guCjExKSBGb2xpYyBBY2lkIDFNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGggZXZlcnkgZGF5CjEyKSBHbGlwaXppZGUgNU1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCB0d2ljZSBhIGRheSBmb3IgZGlhYmV0ZXMuIFRha2UKICAgICAzMCBNaW51dGVzICBiZWZvcmUgYSBtZWFsLgoxMykgSHlkcm9jaGxvcm90aGlhemlkZSAyNU1nIFRhYgogICAgIFRha2UgdHdvIHRhYmxldHMgYnkgbW91dGggZXZlcnkgbW9ybmluZyBmb3IgYmxvb2QgcHJlc3N1cmUKMTQpIEh5ZHJvY29ydGlzb25lIDElIENyZWFtCiAgICAgQXBwbHkgdGhpbiBmaWxtIHRvcGljYWxseSBldmVyeSBkYXkKMTUpIElidXByb2ZlbiA0MDBNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGggdGhyZWUgdGltZXMgYSBkYXkgYXMgbmVlZGVkCjE2KSBJbnN1bGluIFJlZyAxMDBVL21sIEluaiAxME1sIFZsCiAgICAgSW5qZWN0IDUgdW5pdHMgc3ViY3V0YW5lb3VzbHkgYXMgZGlyZWN0ZWQKMTcpIE1ldGZvcm1pbiBIY2wgNTAwTWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIGV2ZXJ5IGRheQoxOCkgTWV0b3Byb2xvbCBTdWNjaW5hdGUgMjVNZyBTYSBUYWIKICAgICBUYWtlIHR3byB0YWJsZXRzIGJ5IG1vdXRoIGV2ZXJ5IGRheQoxOSkgTXVsdGl2aXRhbWluIENhcC90YWIKICAgICBUYWtlIDEgY2FwL3RhYiBieSBtb3V0aCBldmVyeSBkYXkKMjApIE9tZXByYXpvbGUgMjBNZyBFYyBDYXAKICAgICBUYWtlIG9uZSBjYXBzdWxlIGJ5IG1vdXRoIGV2ZXJ5IGRheQoyMSkgUGlvZ2xpdGF6b25lIEhjbCAxNU1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCBldmVyeSBkYXkKMjIpIFByYXZhc3RhdGluIE5hIDgwTWcgVGFiCiAgICAgVGFrZSBvbmUtaGFsZiB0YWJsZXQgYnkgbW91dGggZXZlcnkgZXZlbmluZyB0byBsb3dlciB5b3VyCiAgICAgQ2hvbGVzdGVyb2wKMjMpIFRhbXN1bG9zaW4gSGNsIDAuNE1nIENhcAogICAgIFRha2Ugb25lIGNhcHN1bGUgYnkgbW91dGggYXQgYmVkdGltZQoyNCkgVGlvdHJvcGl1bSAxOE1jZyBJbmhsIENhcCAzMAogICAgIFBsYWNlIDEgY2Fwc3VsZSAoMTggbWNnKSBpbiBpbmhhbGVyLCBpbmhhbGUgYnkgbW91dGggZXZlcnkKICAgICBEYXkgIHJlcGxhY2VzIGlwcmF0cm9waXVtIChhdHJvdmVudC9jb21iaXZlbnQpLCBmb3IKICAgICBJbmhhbGVyIHVzZSBvbmx5CiAKQWN0aXZlIE5vbi1WQSBNZWRpY2F0aW9uczoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAxKSBBY2V0YW1pbm9waGVuIDUwME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aAogMikgQW1pb2Rhcm9uZSBIY2wgKFBhY2Vyb25lKSAyMDBNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGggZXZlcnkgZGF5CiAzKSBBc3BpcmluCiAgICAgVGFrZSAgYnkgbW91dGggZXZlcnkgZGF5CiA0KSBDbG9waWRvZ3JlbCBCaXN1bGZhdGUgNzVNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGgKIDUpIE11bHRpdml0YW1pbiBDYXAvdGFiCiAgICAgVGFrZSAxIGNhcC90YWIgYnkgbW91dGggZXZlcnkgZGF5CiAKICBZb3UgaGF2ZSAyOSBhY3RpdmUgbWVkaWNhdGlvbnMKIAogCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIApZb3VyIFByaW1hcnkgQ2FyZSBQcm92aWRlciBpczogVW5rbm93bgogCiNGVVRVUkUgQVBQT0lOVE1FTlRTOgpGdXR1cmUgQXBwb2ludG1lbnRzOgpObyBmdXR1cmUgYXBwb2ludG1lbnRzIG9uIGZpbGUKIAojTEFCUyB0aGF0IHdlcmUgb3JkZXJlZCB0b2RheTogICBObyBwZW5kaW5nIGxhYnMuCiAKI0lNQUdJTkcgU1RVRElFUyB0aGF0IHdlcmUgb3JkZXJlZCBpbiB0aGUgbGFzdCAzIG1vbnRoczogICBOTyByZWNlbnQgcGVuZGluZwpSYWRpb2xvZ3kgZm91bmQuCiAKICArIElmIGFuIGltYWdpbmcgc3R1ZHkgKHVsdHJhc291bmQsIENULCBNUkksIGV0YykgaGFzIGJlZW4gb3JkZXJlZCwKICAgIHBsZWFzZSBjYWxsIHRoZSBQb3J0bGFuZCBWQSBNZWRpY2FsIENlbnRlciBJbWFnaW5nIFNjaGVkdWxpbmcgbnVtYmVyCiAgICB0byBtYWtlIGFycmFuZ2VtZW50czogNTAzLTI3My01MTI2LgogCiNDT05TVUxUUyBvciBQUk9DRURVUkVTIHRoYXQgd2VyZSBvcmRlcmVkIGluIHRoZSBwYXN0IHdlZWs6ICAgTk8gcmVjZW50IHBlbmRpbmcKQ29uc3VsdHMgZm91bmQuCiAKWW91ciBoZWFsdGggY2FyZSB0ZWFtIG1heSBoYXZlIGRpc2N1c3NlZCB3aGV0aGVyIG9yIG5vdCB5b3Ugd2VyZSBleHBvc2VkIHRvIGFueQpwb3RlbnRpYWwgdG94aW5zL2hhemFyZHMgZHVyaW5nIHlvdXIgbWlsaXRhcnkgc2VydmljZSBkdXJpbmcgdGhpcyB2aXNpdC4KIApUaGlzIGlzIHJlbGF0ZWQgdG8gYSBuZXcgVG94aWMgRXhwb3N1cmUgU2NyZWVuaW5nIChURVMpIHByb2dyYW0gaW4gdGhlIFZBLiAgSWYKeW91IGJlbGlldmUgeW91IHdlcmUgZXhwb3NlZCB0byBwb3RlbnRpYWwgdG94aW5zL2hhemFyZHMgZHVyaW5nIHlvdXIgc2VydmljZSwKeW91IGNhbiBnbyBoZXJlIHRvIGxlYXJuIG1vcmUgYWJvdXQgd2hhdCB0aGUgVkEgaXMgZG9pbmcgdG8gc3VwcG9ydCBvdXIKVmV0ZXJhbnM6Cmh0dHBzOi8vd3d3LndhcnJlbGF0ZWRpbGxuZXNzLnZhLmdvdi9XQVJSRUxBVEVESUxMTkVTUy9lZHVjYXRpb24vbG9jYWwtb2ZmCmVyaW5ncy9zdXBwb3J0L1RveGljRXhwb3N1cmVTY3JlZW5pbmdFbmdsaXNoLnBkZgogCklmIHlvdSBiZWxpZXZlIHlvdSB3ZXJlIGV4cG9zZWQgdG8gYWdlbnQgb3JhbmdlLCBidXJuIHBpdHMsIG90aGVyIGFpcmJvcm5lCmhhemFyZHMsIHJhZGlhdGlvbiwgb3IgIHNlcnZlZCBpbiBHdWxmIFdhciB0aGVhdGVycywgeW91IG1heSBiZSBlbGlnaWJsZSB0bwpwYXJ0aWNpcGF0ZSBpbiBhIGZyZWUgcmVnaXN0cnkgZXhhbS4gIFlvdSBtYXkgY2FsbCA1MDMtOTA2LTUxMDAgZm9yIG1vcmUKaW5mb3JtYXRpb24uCiAKRm9yIEhlYWx0aGNhcmUgRWxpZ2liaWxpdHkgYW5kIEVucm9sbG1lbnQgcXVlc3Rpb25zLCBjb250YWN0IG91ciBFbnJvbGxtZW50Ck9mZmljZSBhdCA1MDMtMjczLTUwNjkuCiAKRm9yIHF1ZXN0aW9ucyBhYm91dCBCZW5lZml0cyBhbmQgQ2xhaW1zIHlvdSBjYW4gZmluZCBhIFZldGVyYW4gU2VydmljZQpPcmdhbml6YXRpb24gT2ZmaWNlIG5lYXIgeW91IGF0OgpodHRwczovL3d3dy5lYmVuZWZpdHMudmEuZ292L2ViZW5lZml0cy92c28tc2VhcmNoIG9yIGJ5IGNhbGxpbmcgVkJBCjEtODAwLTgyNy0xMDAwLgogCklmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBwaHlzaWNhbCB0aGVyYXB5LCBwbGVhc2UgY2FsbCB0aGUgbnVtYmVyIGJlbG93IHRvCmFycmFuZ2UgYW4gYXBwb2ludG1lbnQ6CkFsbCBjbGluaWNzOiAgICAgICAgICAgICAoNTAzKTI3My01MDE4CiAKIApZb3VyIHZpdGFscyBmb3IgdG9kYXkgYXJlOgogIEJsb29kIFByZXNzdXJlIC0gMTI1LzgwICgwMS8wOC8yMDIwIDE0OjI3KQogIFdlaWdodCAtIDI1NSBsYiBbMTE1LjY3IGtnXSAoMDEvMDgvMjAyMCAxNDoyNykKICBQYWluIExldmVsIC0gMCAoMDEvMDgvMjAyMCAxNDoyNykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KIApJZiB5b3UgaGF2ZSBxdWVzdGlvbnMgb3IgY29uY2VybnMgYWZ0ZXIgdG9kYXksIHBsZWFzZSBjb250YWN0IHRoZSBjbGluaWMgYnkKY2FsbGluZyAxLTgwMC05NDktMTAwNC4gU2VsZWN0IG9wdGlvbiAyIHdoZW4gdGhlIGF1dG9tYXRlZCBtZXNzYWdlIHN0YXJ0cy4KCgo="
* content.attachment.title = "PC - AFTERVISIT SUMMARY"
* content.attachment.creation = "2023-03-17T09:27:00Z"
* context.related.reference = "#location-0"

Instance: 64262c1a-02fc-4772-98e6-e00d53d4dd35
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 78118440"
Description: "PC - NEW"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.78118440"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-03-17T09:25:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-03-17T09:26:05Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBORVcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgT1VUUEFUSUVOVCBOT1RFICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTcsIDIwMjNAMDk6MjUgICAgIEVOVFJZIERBVEU6IE1BUiAxNywgMjAyM0AwOToyNTo0OSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKQ0M6CiAKIApQcm9ibGVtczoKIApEb2N0b3JzL091dHNpZGUgcmVjb3JkczoKIApTdXJnaWNhbCBhZG1pc3Npb25zOgogCk1lZGljYWwgYWRtaXNzaW9uczoKIApXb21lbidzIEhlYWx0aDogZ3hweGF4LCBicmVhc3QgaGlzdG9yeSwgcGFwIGhpc3RvcnksIGZhbWlseSAKcGxhbm5pbmcvY29udHJhY2VwdGlvbiBwbGFuLCBib25lIGhlYWx0aAogCk1lZGljYXRpb25zOgogCkFsbGVyZ2llcyB0byBtZWRzOgogClNvY2lhbCBoaXN0b3J5OgogClRvYmFjY28sIGV0b2gsIHJlYyBkcnVnczoKIApGYW1pbHkgaHg6CiAKTWlsaXRhcnkgaHg6ICAgVGltZSBwZXJpb2Q6ICAgICAgICAgICAgIEJyYW5jaDogSm9iOiAgICAgICAgICAgIExvY2F0aW9uczoKICAgICAgICBJbG5lc3NlcyB3aGlsZSBpbjogICAgICAgICAgICAgIFBUU0Q6CkFueSBleHBlcmllbmNlcyBmb3Igd2hpY2ggd291bGQgbGlrZSBjb3Vuc2VsaW5nOgp3aXRuZXNzZWQgZGVhdGggb3IgY29tYmF0OgogCk1lbnRhbCBIZWFsdGg6CiAKIAogClJvczogbm8gc2VpenVyZSwgbG9jLCBoZWFkYWNoZXMsIHZpc3VhbCBwcm9ibGVtcwogICAgIG5vIGhlYXJpbmcgcHJvYmxlbXMKICAgICBubyBwcm9ibGVtcyB3aXRoIHRlZXRoIG9yIGd1bXMKICAgICAgICBwdWxtb25hcnk6CiAgICAgICAgaHRuIG9yIG11cm11cnM6CiAgICAgbm8gZGlmZmljdWx0eSBzd2FsbG93aW5nLCBubyBzdG9tYWNoIHByb2JsZW1zLCBubyBjb25zdGlwYXRpb24gb3IgCmRpYXJyaGVhLApubyBibG9vZCBpbiBzdG9vbCBvciBvbiB0b2lsZXQgcGFwZXIKICAgICBubyB1cmluYXJ5IGZyZXF1ZW5jeSwgdXJnZW5jeSwgZGlmZmljdWx0eSBzdGFydGluZyBvciBzdG9wcGluZyBzdHJlYW0KICAgICBubyBtdXNjbGUgcHJvYmxlbXMsIG5vIG5ldyBqb2ludCBwcm9ibGVtcwogICAgIG5vIHNraW4gb3IgbmV1cm9sb2dpYWwgcHJvYmxlbXMKIAogCiAKU1VCSkVDVElWRTogTUhWWlpWSVNOVFdFTlRZLFRFU1QgUEFUSUVOVFIgaXMgYSAyMiBZT01BTEUgaGVyZSBmb3IKIAogCk1FRElDQVRJT05TOgpBY3RpdmUgT3V0cGF0aWVudCBNZWRpY2F0aW9ucyAoaW5jbHVkaW5nIFN1cHBsaWVzKToKIAogICAgIEFjdGl2ZSBPdXRwYXRpZW50IE1lZGljYXRpb25zICAgICAgICAgICAgICAgICAgICAgICAgICBTdGF0dXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoxKSAgIEFDRVRBTUlOT1BIRU4gNTAwTUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBGT1VSICBIT0xECiAgICAgICBUSU1FUyBBIERBWSBBUyBORUVERUQgKkRPIE5PVCBUQUtFIE1PUkUgVEhBTgogICAgICAgNCwwMDBNRyBBIERBWSBPRiBBQ0VUQU1JTk9QSEVOIEZST00gQUxMIFNPVVJDRVMgRFVFCiAgICAgICBUTyBSSVNLIE9GIExJVkVSIERBTUFHRS4KMikgICBBTEJVVEVST0wgMTAwL0lQUkFUUk8gMjBNQ0cgMTIwRCBQTyBJTkhMIElOSEFMRSAxICAgICAgQUNUSVZFCiAgICAgICBTUFJBWSBCWSBNT1VUSCBGT1VSIFRJTUVTIEEgREFZIChFQUNIIElOSEFMRVIKICAgICAgIENPTlRBSU5TIDEyMCBTUFJBWVMpCjMpICAgQUxDT0hPTCBQUkVQIFBBRCBVU0UgUEFEIFRPUElDQUxMWSBBUyBESVJFQ1RFRCAgICAgICAgIEFDVElWRSAoUykKNCkgICBBTExPUFVSSU5PTCAxMDBNRyBUQUIgVEFLRSBPTkUgVEFCTEVUIEJZIE1PVVRIIEVWRVJZICAgQUNUSVZFCiAgICAgICBEQVkKNSkgICBBU1BJUklOIDMyNU1HIEVDIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgICAgSE9MRAogICAgICAgREFZCjYpICAgQlVTUElST05FIEhDTCAxME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggVFdJQ0UgIEFDVElWRQogICAgICAgQSBEQVkgQVMgTkVFREVEIEZPUiBBTlhJRVRZCjcpICAgQ0FQU0FJQ0lOIDAuMSUgQ1JFQU0gQVBQTFkgQSBTTUFMTCBBTU9VTlQgVE9QSUNBTExZICAgIEFDVElWRQogICAgICAgVFdJQ0UgQSBEQVkKOCkgICBDTE9QSURPR1JFTCBCSVNVTEZBVEUgNzVNRyBUQUIgVEFLRSBPTkUgVEFCTEVUIEVWRVJZICAgQUNUSVZFCiAgICAgICBEQVkKOSkgICBESVBIRU5IWURSQU1JTkUgSENMIDI1TUcgQ0FQIFRBS0UgT05FIENBUFNVTEUgQlkgICAgICAgQUNUSVZFCiAgICAgICBNT1VUSCBGT1VSIFRJTUVTIEEgREFZIEFTIE5FRURFRAoxMCkgIEZMVU9YRVRJTkUgSENMIDEwTUcgQ0FQIFRBS0UgT05FIENBUFNVTEUgQlkgTU9VVEggICAgICBBQ1RJVkUKICAgICAgIEVWRVJZIERBWQoxMSkgIEZMVVRJQ0FTIDUwMC9TQUxNRVRFUk9MIDUwIElOSEwgRElTSyA2MCBJTkhBTEUgMSAgICAgICBBQ1RJVkUKICAgICAgIElOSEFMQVRJT04gQlkgTU9VVEggVFdJQ0UgQSBEQVkgUklOU0UgTU9VVEggQU5ECiAgICAgICBTUElUIEFGVEVSIFVTRS4gRElTQ0FSRCAxIE1PTlRIIEFGVEVSIE9QRU5JTkcgRk9JTAogICAgICAgUE9VQ0guCjEyKSAgRk9MSUMgQUNJRCAxTUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBFVkVSWSBEQVkgIEFDVElWRQoxMykgIEdMSVBJWklERSA1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBUV0lDRSBBICAgICBBQ1RJVkUKICAgICAgIERBWSBGT1IgRElBQkVURVMuIFRBS0UgMzAgTUlOVVRFUyBCRUZPUkUgQSBNRUFMLgoxNCkgIEdMVUNPU1RJWCBHTFVDT1NFIFRFU1QgU1RSSVAgVVNFIDEgU1RSSVAgSVRFTSBBUyAgICAgICBBQ1RJVkUKICAgICAgIERJUkVDVEVECjE1KSAgSFlEUk9DSExPUk9USElBWklERSAyNU1HIFRBQiBUQUtFIFRXTyBUQUJMRVRTIEJZICAgICAgIEFDVElWRQogICAgICAgTU9VVEggRVZFUlkgTU9STklORyBGT1IgQkxPT0QgUFJFU1NVUkUKMTYpICBIWURST0NPUlRJU09ORSAxJSBDUkVBTSBBUFBMWSBUSElOIEZJTE0gVE9QSUNBTExZICAgICAgQUNUSVZFCiAgICAgICBFVkVSWSBEQVkKMTcpICBJQlVQUk9GRU4gNDAwTUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBUSFJFRSAgICAgQUNUSVZFCiAgICAgICBUSU1FUyBBIERBWSBBUyBORUVERUQKMTgpICBJTlNVTElOIFJFRyAxMDBVL01MIElOSiAxME1MIFZMIElOSkVDVCA1IFVOSVRTICAgICAgICAgQUNUSVZFCiAgICAgICBTVUJDVVRBTkVPVVNMWSBBUyBESVJFQ1RFRAoxOSkgIE1FVEZPUk1JTiBIQ0wgNTAwTUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCAgICAgICBBQ1RJVkUKICAgICAgIEVWRVJZIERBWQoyMCkgIE1FVE9QUk9MT0wgU1VDQ0lOQVRFIDI1TUcgU0EgVEFCIFRBS0UgVFdPIFRBQkxFVFMgQlkgICBBQ1RJVkUKICAgICAgIE1PVVRIIEVWRVJZIERBWQoyMSkgIE1VTFRJVklUQU1JTiBDQVAvVEFCIFRBS0UgMSBDQVAvVEFCIEJZIE1PVVRIIEVWRVJZICAgICBBQ1RJVkUKICAgICAgIERBWQoyMikgIE5FRURMRSAyNUcgMS41SU4gVVNFIE9ORSBJVEVNIEFTIERJUkVDVEVEICAgICAgICAgICAgICBBQ1RJVkUKMjMpICBPTUVQUkFaT0xFIDIwTUcgRUMgQ0FQIFRBS0UgT05FIENBUFNVTEUgQlkgTU9VVEggICAgICAgQUNUSVZFCiAgICAgICBFVkVSWSBEQVkKMjQpICBQSU9HTElUQVpPTkUgSENMIDE1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCAgICAgQUNUSVZFCiAgICAgICBFVkVSWSBEQVkKMjUpICBQUkFWQVNUQVRJTiBOQSA4ME1HIFRBQiBUQUtFIE9ORS1IQUxGIFRBQkxFVCBCWSBNT1VUSCAgQUNUSVZFCiAgICAgICBFVkVSWSBFVkVOSU5HIFRPIExPV0VSIFlPVVIgQ0hPTEVTVEVST0wKMjYpICBUQU1TVUxPU0lOIEhDTCAwLjRNRyBDQVAgVEFLRSBPTkUgQ0FQU1VMRSBCWSBNT1VUSCBBVCAgQUNUSVZFCiAgICAgICBCRURUSU1FCjI3KSAgVElPVFJPUElVTSAxOE1DRyBJTkhMIENBUCAzMCBQTEFDRSAxIENBUFNVTEUgKDE4IE1DRykgIEFDVElWRQogICAgICAgSU4gSU5IQUxFUiwgSU5IQUxFIEJZIE1PVVRIIEVWRVJZIERBWSBSRVBMQUNFUwogICAgICAgSVBSQVRST1BJVU0gKEFUUk9WRU5UL0NPTUJJVkVOVCksIEZPUiBJTkhBTEVSIFVTRQogICAgICAgT05MWQogCiAgICAgQWN0aXZlIE5vbi1WQSBNZWRpY2F0aW9ucyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXR1cwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CjEpICAgTm9uLVZBIEFDRVRBTUlOT1BIRU4gNTAwTUcgVEFCIDUwME1HIE1PVVRIICAgICAgICAgICAgIEFDVElWRQoyKSAgIE5vbi1WQSBBTUlPREFST05FIEhDTCAoUEFDRVJPTkUpIDIwME1HIFRBQiAyMDBNRyAgICAgICBBQ1RJVkUKICAgICAgIE1PVVRIIEVWRVJZIERBWQozKSAgIE5vbi1WQSBBU1BJUklOIFRBQixFQyAgTU9VVEggRVZFUlkgREFZICAgICAgICAgICAgICAgICBBQ1RJVkUKNCkgICBOb24tVkEgQ0xPUElET0dSRUwgQklTVUxGQVRFIDc1TUcgVEFCIDc1TUcgTU9VVEggICAgICAgQUNUSVZFCjUpICAgTm9uLVZBIE1VTFRJVklUQU1JTiBDQVAvVEFCIDEgQ0FQL1RBQiBNT1VUSCBFVkVSWSBEQVkgIEFDVElWRQogCjMyIFRvdGFsIE1lZGljYXRpb25zCiAKQUxMRVJHSUVTOgogIFBFTklDSUxMSU4sIFNVTEZBIERSVUdTLCBFR0dTLCBNQUFMT1ggQU5UQUNJRCwgQURIRVNJVkUgVEFQRSwgVEVUUkFDWUNMSU5FCiAgUFJBWk9TSU4sIExJU0lOT1BSSUwKIApQSFlTSUNBTCBFWEFNOgpCUDEyNS84MCAoMDEvMDgvMjAyMCAxNDoyNykgIFA2NyAoMDEvMDgvMjAyMCAxNDoyNykgIFJSMTIgKDAxLzA4LzIwMjAgMTQ6MjcpIApUOTguOCBGIFszNy4xIENdICgwMS8wOC8yMDIwIDE0OjI3KQpXVDI1NSBsYiBbMTE1LjY3IGtnXSAoMDEvMDgvMjAyMCAxNDoyNykgIEJPRFkgTUFTUyBJTkRFWCAtIE5PIEhFSUdIVFMgRk9VTkQKIApBUFBFQVJBTkNFOiAgV0VMTCBBUFBFQVJJTkcsIElOIE5BRApIRUVOVDogIEFUL05DLCBQRUVSTEEsIEVPTUkKTkVDSzogIE5PIE5PREVTIE9SIE1BU1NFUwpMVU5HUzogIENUQSBCSUxBVEVSQUxMWQpDT1I6ICBSUlIsIE5PIE1SRwpBQkRPTUVOOiBOTyBNQVNTRVMgSU4gQUxMIDQgUVVBRFJBTlRTLCBOTyBIU00KRVhUOiAgTk8gQy9DL0UsIERQIDIrIEJJTEFULCBTRU5TQVRJT04gSU4gVEFDVApHVToKIApMYWJzOgogCmNob2xlc3Rlcm9sICAgICAgIE5vIENIT0xFU1RFUk9MIGluIHRoZSBsYXN0IDFZCmhkbCAgICAgICAgICAgICAgIE5vIEhETCBpbiB0aGUgbGFzdCAxWQpsZGwgY2FsYyAgICAgICAgICBObyBMREwtQ0hPTCBDQUxDIGluIHRoZSBsYXN0IDFZCnRyaWdzICAgICAgICAgICAgIE5vIFRSSUdMWUNFUklERVMgaW4gdGhlIGxhc3QgMVkKZmVycml0aW4gICAgICAgICAgTm8gRkVSUklUSU4gaW4gdGhlIGxhc3QgMVkKSENUICAgICAgICAgICAgICAgTm8gSENUIGluIHRoZSBsYXN0IDFZCkhlbW9nbG9iaW4gICAgICAgIFRoZSBPQkpFQ1QgTEFCLUhHQkExQyB3YXMgTk9UIGZvdW5kLi4uQ29udGFjdCBJUk0uClBTQSAgICAgICAgICAgICAgIE5vIFBST1NUQVRJQyBTUEVDSUZJQyBBTlRJR0VOIGluIHRoZSBsYXN0IDFZCnN0b29sIGNhcmRzICAgICAgIE5vIEdVQUlBQyBHQVNUUklDIGluIHRoZSBsYXN0IDFZCiAKTm8gQ0JDIGluIHRoZSBwYXN0IDFZCiAKTm8gQkFTSUMgTUVUQUJPTElDIFBBTkVMIGluIHRoZSBwYXN0IDFZTm8gR1VBSUFDIEdBU1RSSUMgaW4gdGhlIGxhc3QgMVlObyAKSEVNT0dMT0JJTiBBMUMgaW4gdGhlIGxhc3QgMVlObyBaWkhFUEFUSVRJUyBBIEFOVElCT0RZIFRPVEFMIGluIHRoZSBsYXN0IDFZTm8gCkhFUEFUSVRJUyBCIFNVUkZBQ0UgQU5USUdFTiBpbiB0aGUgbGFzdCAxWVRoZSBPQkpFQ1QgTEFCLSB3YXMgTk9UIApmb3VuZC4uLkNvbnRhY3QgSVJNLgpIRVAgQyBBQlRoZSBPQkpFQ1QgIHdhcyBOT1QgZm91bmQuLi5Db250YWN0IElSTS5MQUItTElWRVIKUFJPRklMRVRoZSBPQkpFQ1QgIHdhcyBOT1QgZm91bmQuLi5Db250YWN0IElSTS5MQUItTUEvQ1IgUkFUSU9UaGUgT0JKRUNUICB3YXMgCk5PVCBmb3VuZC4uLkNvbnRhY3QgSVJNLkxBQi1VUklOQUxZU0lTVGhlIE9CSkVDVCAgd2FzIE5PVCBmb3VuZC4uLkNvbnRhY3QgCklSTS4KIAogCiAKSU1QUkVTU0lPTjogIE1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSIGlzIGEgMjIgWU9NQUxFIGhlcmUgZm9yCiAKUFJPQkxFTVM6CiAKTm8gRnV0dXJlIEFwcG9pbnRtZW50cyBTY2hlZHVsZWQKIApwcm9ibGVtIDEKCnByb2JsZW0gMgoKcHJvYmxlbSAzCiAKL2VzLyBMSVNBIE0gVEVTVGpvbmVzLCBNLkQuClN0YWZmIFBoeXNpY2lhbgpTaWduZWQ6IDAzLzE3LzIwMjMgMDk6MjYK"
* content.attachment.title = "PC - NEW"
* content.attachment.creation = "2023-03-17T09:25:00Z"
* context.related.reference = "#location-0"

Instance: 645125e0-ebe6-4b8e-b1aa-d1ad802e0889
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77830476"
Description: "TLH - PORTLAND/VANCOUVER"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77830476"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE TELEPHONE ENCOUNTER NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-02-27T09:02:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-02-27T09:02:49Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogVExIIC0gUE9SVExBTkQvVkFOQ09VVkVSICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgVEVMRVBIT05FIEVOQ09VTlRFUiBOT1RFICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMjcsIDIwMjNAMDk6MDIgICAgIEVOVFJZIERBVEU6IEZFQiAyNywgMjAyM0AwOTowMjo0OCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgpQUk9WSURFUiBET0NVTUVOVEFUSU9OCgpUZXN0IFRlc3QgVGVzdGVyCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJFUVVFU1QgREVUQUlMUwpSZXF1ZXN0IERldGFpbHMgZm9yIE15IFZBIEltYWdlcyBWaWRlbyByZXF1ZXN0CkNyZWF0ZSBEYXRlOiAwMi8wNi8yMDIzIEAgMDY6NDEgQU0KVGltZSBmcmFtZSBmb3IgVmlkZW8gcmVxdWVzdDogMDIvMDYvMjAyMyB0byAwMi8xMy8yMDIzClJlcXVlc3RpbmcgUHJvdmlkZXI6IFRFU1Rqb2huc29uLCBCUklBTgpGYWNpbGl0eSBOYW1lOiBQb3J0bGFuZCBPUiBWQU1DClN0YXR1czogVmlkZW8gUmVjZWl2ZWQgZnJvbSBQYXRpZW50ClJlcXVlc3QjOiA2M2UxMTE5YjEzZDkwYjVjZTY1ZjhkZWMKUHVycG9zZSBvZiBWaWRlbzogQmFsYW5jZQpUYWtlIGEgVmlkZW8gT2Y6IHN0YW5kaW5nIG9uIG9uZSBsZWcKSW5zdHJ1Y3Rpb25zOiBIZWxsbyAtLSBwbGVhc2UgcHJvdmlkZSB2aWRlbyBzaG93aW5nIHVzIHlvdXIgYmFsYW5jZS4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQQVRJRU5UIFNVQk1JVFRFRCBWSURFTyBBTkQgQ09NTUVOVFMKRGF0ZSBTdWJtaXR0ZWQgYnkgcGF0aWVudDogMDIvMDgvMjAyMyBAIDA4OjI1IEFNCk90aGVyIC0gQmFsYW5hCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpDT01NRU5UUyBTRU5UIFRPIFBBVElFTlQgSU4gTVkgVkEgSU1BR0VTClRlc3QgVmlkZW8gcmVjZWl2ZWQgaW4gVkNNCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDAyLzI3LzIwMjMgMDk6MDIK"
* content.attachment.title = "TLH - PORTLAND/VANCOUVER"
* content.attachment.creation = "2023-02-27T09:02:00Z"
* context.related.reference = "#location-0"

Instance: cfb014bf-9fe7-4801-b377-3a12e461bb62
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77735058"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.305761"
* contained[=].name.text = "TESTgarcia,MARLAINA J"
* contained[=].name.family = "TESTgarcia,MARLAINA J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.305761"
* contained[=].name.text = "TESTgarcia,MARLAINA J"
* contained[=].name.family = "TESTgarcia,MARLAINA J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77735058"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-02-17T14:59:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-02-17T11:59:28Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTcsIDIwMjNAMTQ6NTkgICAgIEVOVFJZIERBVEU6IEZFQiAxNywgMjAyM0AxMTo1OToyOCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RnYXJjaWEsTUFSTEFJTkEgSiAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMyAwMjo0MCBQTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKkNhcmUgSW4gVGhlIENvbW11bml0eV9WQVBvcnRsYW5kSENTIApTdWJqZWN0OiAgR2VuZXJhbDpUcmFpbmluZyBNZXNzYWdlIDMgZm9yIE1hcmxhaW5hIAoKVHJhaW5pbmcgTWVzc2FnZSAzIGZvciBNYXJsYWluYSAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCmh0dHBzOi8vd3d3LnZhLmdvdi9kaXJlY3RvcnkvZ3VpZGUvcmVnaW9uLmFzcD9JRD0xMDIwPwotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMyAwMjo1OCBQTSBFVCAKRnJvbTogIFRFU1RnYXJjaWEsIE1BUkxBSU5BICBKIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgMyBmb3IgTWFybGFpbmEgCgpqZyBnaHZoICAKICAKICAKICAKTWFybGFpbmEgVEVTVGdhcmNpYSwgUk4gIApDb21tdW5pdHkgQ2FyZSBOQ00gCgogCi9lcy8gTUFSTEFJTkEgSiBURVNUZ2FyY2lhLCBNUEgsIFJOCgpTaWduZWQ6IDAyLzE3LzIwMjMgMTE6NTkK"
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2023-02-17T14:59:00Z"
* context.related.reference = "#location-0"

Instance: 3e7c0065-5abb-448d-911c-463e93f502d2
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77713416"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.13582"
* contained[=].name.text = "TESTmiller,SUSAN L"
* contained[=].name.family = "TESTmiller,SUSAN L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.13582"
* contained[=].name.text = "TESTmiller,SUSAN L"
* contained[=].name.family = "TESTmiller,SUSAN L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77713416"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-02-16T13:26:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-02-16T10:26:55Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTYsIDIwMjNAMTM6MjYgICAgIEVOVFJZIERBVEU6IEZFQiAxNiwgMjAyM0AxMDoyNjo1NSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsU1VTQU4gTCAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTYvMjAyMyAwMToyNSBQTSBFVCAKRnJvbTogIFRFU1RtaWxsZXIsIFNVU0FOICBMIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgMyBmb3IgVEVTVG1pbGxlciAKCkkgaGF2ZSBjb21wbGV0ZWQgeW91ciBjb25zdWx0LiAKCiAKL2VzLyBTVVNBTiBMIFRFU1RtaWxsZXIKUk4KU2lnbmVkOiAwMi8xNi8yMDIzIDEwOjI2Cg=="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2023-02-16T13:26:00Z"
* context.related.reference = "#location-0"

Instance: 896d9d92-bc62-4ab7-a017-bf4e3b0f47ba
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77598354"
Description: "NEUROLOGY SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.90042"
* contained[=].name.text = "TESTdavis,EDITHA"
* contained[=].name.family = "TESTdavis,EDITHA"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.90042"
* contained[=].name.text = "TESTdavis,EDITHA"
* contained[=].name.family = "TESTdavis,EDITHA"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77598354"
* status = #current
* type = $loinc#11506-3
* type.text = "NEUROLOGY SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-02-08T16:32:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-02-08T13:32:22Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTkVVUk9MT0dZIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBORVVST0xPR1kgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMDgsIDIwMjNAMTY6MzIgICAgIEVOVFJZIERBVEU6IEZFQiAwOCwgMjAyM0AxMzozMjoyMiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxFRElUSEEgICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzA4LzIwMjMgMDM6NDYgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIE5ldXJvbG9neSBDbGluaWNzX1ZBUG9ydGxhbmRIQ1NfREhTTSAKU3ViamVjdDogIEdlbmVyYWw6VHJhaW5pbmcgTXNnIDIgZm9yIEVkaXRoYSAKClRlc3QgVGVzdCBUZXN0ZXIgMiAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCmh0dHBzOi8vd3d3LnZhLmdvdi9kaXJlY3RvcnkvZ3VpZGUvcmVnaW9uLmFzcD9JRD0xMDIwPwotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMDgvMjAyMyAwNDozMCBQTSBFVCAKRnJvbTogIFRFU1RkYXZpcywgRWRpdGhhICAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpUcmFpbmluZyBNc2cgMiBmb3IgRWRpdGhhIAoKICAKdGVzdCAyICAKICAKICAKRWRpdGggVEVTVGRhdmlzICAKTmV1cm9sb2d5IEFNU0EgCgogCi9lcy8gRWRpdGhhIFRFU1RkYXZpcyBGYWNpbGl0YXRvcgpBZHZhbmNlIE1lZGljYWwgU3VwcG9ydCBBc3N0ClNpZ25lZDogMDIvMDgvMjAyMyAxMzozMgo="
* content.attachment.title = "NEUROLOGY SECURE MESSAGING"
* content.attachment.creation = "2023-02-08T16:32:00Z"
* context.related.reference = "#location-0"

Instance: 135f9560-4af0-44c9-a3db-5632cc0d7691
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77498227"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77498227"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-02-01T17:56:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-02-01T14:56:58Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMDEsIDIwMjNAMTc6NTYgICAgIEVOVFJZIERBVEU6IEZFQiAwMSwgMjAyM0AxNDo1Njo1OCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMDEvMjAyMyAwNTo1NCBQTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgTXlIZWFsdGhlVmV0L1NlY3VyZU1lc3NhZ2luZyBBZG1pbl9WQVBvcnRsYW5kSENTIApTdWJqZWN0OiAgR2VuZXJhbDp0ZXN0aW5nIAoKYmxhaCBibGFoIGJsYWggIAogIAogIApGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgIApodHRwczovL3d3dy52YS5nb3YvZGlyZWN0b3J5L2d1aWRlL3JlZ2lvbi5hc3A/SUQ9MTAyMD8KLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzAxLzIwMjMgMDU6NTYgUE0gRVQgCkZyb206ICBURVNUam9obnNvbiwgQlJJQU4gIEsgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6dGVzdGluZyAKCnRlc3RpbmcgcmVwbHkgYW5kIHNhdmUgdG8gY3BycyAgCiAgCiAgCiAgCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6ICAKaHR0cHM6Ly93d3cudmEuZ292L3BvcnRsYW5kLWhlYWx0aC1jYXJlLwoKIAovZXMvIEJSSUFOIEsgVEVTVGpvaG5zb24gQkEKU0VDVVJFIE1FU1NBR0lORyBBRE1JTklTVFJBVE9SClNpZ25lZDogMDIvMDEvMjAyMyAxNDo1Ngo="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2023-02-01T17:56:00Z"
* context.related.reference = "#location-0"

Instance: 1e47db5d-88c4-4616-8df8-359a6aea4e15
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77429396"
Description: "PC - AFTERVISIT SUMMARY"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77429396"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-01-27T11:56:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-01-27T11:58:04Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBBRlRFUlZJU0lUIFNVTU1BUlkgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMjcsIDIwMjNAMTE6NTYgICAgIEVOVFJZIERBVEU6IEpBTiAyNywgMjAyM0AxMTo1NjozMCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKCioqKiBDTElOSUMgQUZURVJWSVNJVCBTVU1NQVJZICoqKgogCk1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSCiAKVGhhbmsgeW91IGZvciBhbGxvd2luZyB1cyB0byBwYXJ0aWNpcGF0ZSBpbiB5b3VyIGhlYWx0aGNhcmUuIFBsZWFzZSByZXZpZXcgdGhpcwpkb2N1bWVudC4gIEl0IG1heSBjb250YWluIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gb3IgaW5zdHJ1Y3Rpb25zIGZyb20geW91ciBjYXJlCnByb3ZpZGVyLgogX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KIApQQVRJRU5UIElOU1RSVUNUSU9OUzoKClRoYW5rIHlvdSBmb3IgY29taW5nIGluLgoKUGxlYXNlIGNvbnRpbnVlIHRvIGJlIGFjdGl2ZSBtb3N0IGRheXMgb2YgdGhlIHdlZWsuCgpDb250aW51ZSBtYWtpbmcgaGVhbHRoeSBtZWFsIGNob2ljZXMgZm9yIHlvdXIgbnV0cml0aW9uLgoKTGV0IHVzIGtub3cgaWYgeW91IHdvdWxkIGxpa2UgdG8gY29tZSBiYWNrIGZvciBhbnkgdmFjY2luZXMuCgpUaGFuayB5b3UsIERyIFRFU1Rqb25lcwogCiAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogClRISVMgSVMgWU9VUiBNRURJQ0FUSU9OIExJU1QgSkFOIDI3LCAyMDIzIFlvdSBzaG91bGQga2VlcCBhIGNvcHkgb2YgeW91cgptZWRpY2F0aW9uIGxpc3QgYW5kIGJyaW5nIGl0IHdpdGggeW91IHRvIGFsbCBvZiB5b3VyIG1lZGljYWwgYXBwb2ludG1lbnRzLgpQbGVhc2UgY29udGludWUgdG8gdGFrZSB0aGVzZSBtZWRpY2F0aW9ucyBhcyBkaXJlY3RlZC4gQ2FsbCB1cyBvciBzZW5kIHVzIGEKc2VjdXJlIG1lc3NhZ2UgaWYgeW91IHN0YXJ0LCBzdG9wLCBvciBjaGFuZ2UgbWVkaWNhdGlvbnMuIFRvIGhlbHAgeW91ciBwcmltYXJ5CmNhcmUgdGVhbSBwcm92aWRlIHRoZSBzYWZlc3QgY2FyZSBmb3IgeW91LCBpdCBpcyBpbXBvcnRhbnQgZm9yIHRoZW0gdG8ga25vdwphYm91dCBhbGwgdGhlIG1lZGljYXRpb25zIHlvdSB0YWtlLCBldmVuIGlmIGl0J3MganVzdCBhbiBoZXJiYWwgc3VwcGxlbWVudCBvcgpvdmVyIHRoZSBjb3VudGVyIG1lZGljYXRpb25zLgogCklmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMsIHBsZWFzZSBub3RpZnkgYW4gYXNzaXN0YW50IGJlZm9yZSB5b3UgbGVhdmUuICBJZiB5b3UKbmVlZCB0byByZWZpbGwgYSBtZWRpY2F0aW9uLCBwbGVhc2UgY2FsbCAxLTg4OC00MDAtODM4NwogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiAKTkVXIEFORCBESVNDT05USU5VRUQgTUVESUNBVElPTlMKIAogCllvdXIgcHJvdmlkZXIgaGFzIE5PVCBwcmVzY3JpYmVkIGFueSBuZXcgbWVkaWNhdGlvbnMgdG9kYXkuCiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KIApZb3VyIHByb3ZpZGVyIGhhcyBOT1QgZGlzY29udGludWVkIGFueSBvZiB5b3VyIG1lZGljYXRpb25zIHRvZGF5LgogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiAKQ09OVElOVUVEIE1FRElDQVRJT05TIChhY3RpdmUgVkEgYW5kIG5vbi1WQSBtZWRzKQogClRoZXNlIG1lZGljYXRpb25zIHdlcmUgbm90IGNoYW5nZWQgZHVyaW5nIHRoaXMgdmlzaXQuIFlvdSBzaG91bGQgY29udGludWUgdG8KdGFrZSB0aGVtIGFzIHByZXNjcmliZWQuCkFjdGl2ZSBNZWRpY2F0aW9ucwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDEpIEFjZXRhbWlub3BoZW4gNTAwTWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIGZvdXIgdGltZXMgYSBkYXkgYXMgbmVlZGVkICpkbwogICAgIE5vdCB0YWtlIG1vcmUgIHRoYW4gNCwwMDBtZyBhIGRheSBvZiBhY2V0YW1pbm9waGVuCiAgICAgRnJvbSBhbGwgc291cmNlcyBkdWUgdG8gcmlzayBvZiAgbGl2ZXIgZGFtYWdlLgogMikgQWxidXRlcm9sIDEwMC9JcHJhdHJvIDIwTWNnIDEyMEQgUG8gSW5obAogICAgIEluaGFsZSAxIHNwcmF5IGJ5IG1vdXRoIGZvdXIgdGltZXMgYSBkYXkgKGVhY2ggaW5oYWxlcgogICAgIENvbnRhaW5zIDEyMCAgc3ByYXlzKQogMykgQWxsb3B1cmlub2wgMTAwTWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIGV2ZXJ5IGRheQogNCkgQXNwaXJpbiAzMjVNZyBFYyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGggZXZlcnkgZGF5CiA1KSBCdXNwaXJvbmUgSGNsIDEwTWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIHR3aWNlIGEgZGF5IGFzIG5lZWRlZCBmb3IgYW54aWV0eQogNikgQ2Fwc2FpY2luIDAuMSUgQ3JlYW0KICAgICBBcHBseSBhIHNtYWxsIGFtb3VudCB0b3BpY2FsbHkgdHdpY2UgYSBkYXkKIDcpIENsb3BpZG9ncmVsIEJpc3VsZmF0ZSA3NU1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBldmVyeSBkYXkKIDgpIERpcGhlbmh5ZHJhbWluZSBIY2wgMjVNZyBDYXAKICAgICBUYWtlIG9uZSBjYXBzdWxlIGJ5IG1vdXRoIGZvdXIgdGltZXMgYSBkYXkgYXMgbmVlZGVkCiA5KSBGbHVveGV0aW5lIEhjbCAxME1nIENhcAogICAgIFRha2Ugb25lIGNhcHN1bGUgYnkgbW91dGggZXZlcnkgZGF5CjEwKSBGbHV0aWNhcyA1MDAvU2FsbWV0ZXJvbCA1MCBJbmhsIERpc2sgNjAKICAgICBJbmhhbGUgMSBpbmhhbGF0aW9uIGJ5IG1vdXRoIHR3aWNlIGEgZGF5IHJpbnNlIG1vdXRoIGFuZAogICAgIFNwaXQgYWZ0ZXIgIHVzZS4gRGlzY2FyZCAxIG1vbnRoIGFmdGVyIG9wZW5pbmcgZm9pbCBwb3VjaC4KMTEpIEZvbGljIEFjaWQgMU1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCBldmVyeSBkYXkKMTIpIEdsaXBpemlkZSA1TWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIHR3aWNlIGEgZGF5IGZvciBkaWFiZXRlcy4gVGFrZQogICAgIDMwIE1pbnV0ZXMgIGJlZm9yZSBhIG1lYWwuCjEzKSBIeWRyb2NobG9yb3RoaWF6aWRlIDI1TWcgVGFiCiAgICAgVGFrZSB0d28gdGFibGV0cyBieSBtb3V0aCBldmVyeSBtb3JuaW5nIGZvciBibG9vZCBwcmVzc3VyZQoxNCkgSHlkcm9jb3J0aXNvbmUgMSUgQ3JlYW0KICAgICBBcHBseSB0aGluIGZpbG0gdG9waWNhbGx5IGV2ZXJ5IGRheQoxNSkgSWJ1cHJvZmVuIDQwME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCB0aHJlZSB0aW1lcyBhIGRheSBhcyBuZWVkZWQKMTYpIEluc3VsaW4gUmVnIDEwMFUvbWwgSW5qIDEwTWwgVmwKICAgICBJbmplY3QgNSB1bml0cyBzdWJjdXRhbmVvdXNseSBhcyBkaXJlY3RlZAoxNykgTWV0Zm9ybWluIEhjbCA1MDBNZyBUYWIKICAgICBUYWtlIG9uZSB0YWJsZXQgYnkgbW91dGggZXZlcnkgZGF5CjE4KSBNZXRvcHJvbG9sIFN1Y2NpbmF0ZSAyNU1nIFNhIFRhYgogICAgIFRha2UgdHdvIHRhYmxldHMgYnkgbW91dGggZXZlcnkgZGF5CjE5KSBNdWx0aXZpdGFtaW4gQ2FwL3RhYgogICAgIFRha2UgMSBjYXAvdGFiIGJ5IG1vdXRoIGV2ZXJ5IGRheQoyMCkgT21lcHJhem9sZSAyME1nIEVjIENhcAogICAgIFRha2Ugb25lIGNhcHN1bGUgYnkgbW91dGggZXZlcnkgZGF5CjIxKSBQaW9nbGl0YXpvbmUgSGNsIDE1TWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoIGV2ZXJ5IGRheQoyMikgUHJhdmFzdGF0aW4gTmEgODBNZyBUYWIKICAgICBUYWtlIG9uZS1oYWxmIHRhYmxldCBieSBtb3V0aCBldmVyeSBldmVuaW5nIHRvIGxvd2VyIHlvdXIKICAgICBDaG9sZXN0ZXJvbAoyMykgVGFtc3Vsb3NpbiBIY2wgMC40TWcgQ2FwCiAgICAgVGFrZSBvbmUgY2Fwc3VsZSBieSBtb3V0aCBhdCBiZWR0aW1lCjI0KSBUaW90cm9waXVtIDE4TWNnIEluaGwgQ2FwIDMwCiAgICAgUGxhY2UgMSBjYXBzdWxlICgxOCBtY2cpIGluIGluaGFsZXIsIGluaGFsZSBieSBtb3V0aCBldmVyeQogICAgIERheSAgcmVwbGFjZXMgaXByYXRyb3BpdW0gKGF0cm92ZW50L2NvbWJpdmVudCksIGZvcgogICAgIEluaGFsZXIgdXNlIG9ubHkKIApBY3RpdmUgTm9uLVZBIE1lZGljYXRpb25zOgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDEpIEFjZXRhbWlub3BoZW4gNTAwTWcgVGFiCiAgICAgVGFrZSBvbmUgdGFibGV0IGJ5IG1vdXRoCiAyKSBBbWlvZGFyb25lIEhjbCAoUGFjZXJvbmUpIDIwME1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aCBldmVyeSBkYXkKIDMpIEFzcGlyaW4KICAgICBUYWtlICBieSBtb3V0aCBldmVyeSBkYXkKIDQpIENsb3BpZG9ncmVsIEJpc3VsZmF0ZSA3NU1nIFRhYgogICAgIFRha2Ugb25lIHRhYmxldCBieSBtb3V0aAogNSkgTXVsdGl2aXRhbWluIENhcC90YWIKICAgICBUYWtlIDEgY2FwL3RhYiBieSBtb3V0aCBldmVyeSBkYXkKIAogIFlvdSBoYXZlIDI5IGFjdGl2ZSBtZWRpY2F0aW9ucwogCiAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogCllvdXIgUHJpbWFyeSBDYXJlIFByb3ZpZGVyIGlzOiBVbmtub3duCiAKI0ZVVFVSRSBBUFBPSU5UTUVOVFM6CkZ1dHVyZSBBcHBvaW50bWVudHM6Ck5vIGZ1dHVyZSBhcHBvaW50bWVudHMgb24gZmlsZQogCiNMQUJTIHRoYXQgd2VyZSBvcmRlcmVkIHRvZGF5OiAgIE5vIHBlbmRpbmcgbGFicy4KIAojSU1BR0lORyBTVFVESUVTIHRoYXQgd2VyZSBvcmRlcmVkIGluIHRoZSBsYXN0IDMgbW9udGhzOiAgIE5PIHJlY2VudCBwZW5kaW5nClJhZGlvbG9neSBmb3VuZC4KIAogICsgSWYgYW4gaW1hZ2luZyBzdHVkeSAodWx0cmFzb3VuZCwgQ1QsIE1SSSwgZXRjKSBoYXMgYmVlbiBvcmRlcmVkLAogICAgcGxlYXNlIGNhbGwgdGhlIFBvcnRsYW5kIFZBIE1lZGljYWwgQ2VudGVyIEltYWdpbmcgU2NoZWR1bGluZyBudW1iZXIKICAgIHRvIG1ha2UgYXJyYW5nZW1lbnRzOiA1MDMtMjczLTUxMjYuCiAKI0NPTlNVTFRTIG9yIFBST0NFRFVSRVMgdGhhdCB3ZXJlIG9yZGVyZWQgaW4gdGhlIHBhc3Qgd2VlazogICBOTyByZWNlbnQgcGVuZGluZwpDb25zdWx0cyBmb3VuZC4KIApZb3VyIGhlYWx0aCBjYXJlIHRlYW0gbWF5IGhhdmUgZGlzY3Vzc2VkIHdoZXRoZXIgb3Igbm90IHlvdSB3ZXJlIGV4cG9zZWQgdG8gYW55CnBvdGVudGlhbCB0b3hpbnMvaGF6YXJkcyBkdXJpbmcgeW91ciBtaWxpdGFyeSBzZXJ2aWNlIGR1cmluZyB0aGlzIHZpc2l0LgogClRoaXMgaXMgcmVsYXRlZCB0byBhIG5ldyBUb3hpYyBFeHBvc3VyZSBTY3JlZW5pbmcgKFRFUykgcHJvZ3JhbSBpbiB0aGUgVkEuICBJZgp5b3UgYmVsaWV2ZSB5b3Ugd2VyZSBleHBvc2VkIHRvIHBvdGVudGlhbCB0b3hpbnMvaGF6YXJkcyBkdXJpbmcgeW91ciBzZXJ2aWNlLAp5b3UgY2FuIGdvIGhlcmUgdG8gbGVhcm4gbW9yZSBhYm91dCB3aGF0IHRoZSBWQSBpcyBkb2luZyB0byBzdXBwb3J0IG91cgpWZXRlcmFuczoKaHR0cHM6Ly93d3cud2FycmVsYXRlZGlsbG5lc3MudmEuZ292L1dBUlJFTEFURURJTExORVNTL2VkdWNhdGlvbi9sb2NhbC1vZmYKZXJpbmdzL3N1cHBvcnQvVG94aWNFeHBvc3VyZVNjcmVlbmluZ0VuZ2xpc2gucGRmCiAKSWYgeW91IGJlbGlldmUgeW91IHdlcmUgZXhwb3NlZCB0byBhZ2VudCBvcmFuZ2UsIGJ1cm4gcGl0cywgb3RoZXIgYWlyYm9ybmUKaGF6YXJkcywgcmFkaWF0aW9uLCBvciAgc2VydmVkIGluIEd1bGYgV2FyIHRoZWF0ZXJzLCB5b3UgbWF5IGJlIGVsaWdpYmxlIHRvCnBhcnRpY2lwYXRlIGluIGEgZnJlZSByZWdpc3RyeSBleGFtLiAgWW91IG1heSBjYWxsIDUwMy05MDYtNTEwMCBmb3IgbW9yZQppbmZvcm1hdGlvbi4KIApGb3IgSGVhbHRoY2FyZSBFbGlnaWJpbGl0eSBhbmQgRW5yb2xsbWVudCBxdWVzdGlvbnMsIGNvbnRhY3Qgb3VyIEVucm9sbG1lbnQKT2ZmaWNlIGF0IDUwMy0yNzMtNTA2OS4KIApGb3IgcXVlc3Rpb25zIGFib3V0IEJlbmVmaXRzIGFuZCBDbGFpbXMgeW91IGNhbiBmaW5kIGEgVmV0ZXJhbiBTZXJ2aWNlCk9yZ2FuaXphdGlvbiBPZmZpY2UgbmVhciB5b3UgYXQ6Cmh0dHBzOi8vd3d3LmViZW5lZml0cy52YS5nb3YvZWJlbmVmaXRzL3Zzby1zZWFyY2ggb3IgYnkgY2FsbGluZyBWQkEKMS04MDAtODI3LTEwMDAuCiAKSWYgeW91IGFyZSBpbnRlcmVzdGVkIGluIHBoeXNpY2FsIHRoZXJhcHksIHBsZWFzZSBjYWxsIHRoZSBudW1iZXIgYmVsb3cgdG8KYXJyYW5nZSBhbiBhcHBvaW50bWVudDoKQWxsIGNsaW5pY3M6ICAgICAgICAgICAgICg1MDMpMjczLTUwMTgKIAogCllvdXIgdml0YWxzIGZvciB0b2RheSBhcmU6CiAgQmxvb2QgUHJlc3N1cmUgLSAxMjUvODAgKDAxLzA4LzIwMjAgMTQ6MjcpCiAgV2VpZ2h0IC0gMjU1IGxiIFsxMTUuNjcga2ddICgwMS8wOC8yMDIwIDE0OjI3KQogIFBhaW4gTGV2ZWwgLSAwICgwMS8wOC8yMDIwIDE0OjI3KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogCklmIHlvdSBoYXZlIHF1ZXN0aW9ucyBvciBjb25jZXJucyBhZnRlciB0b2RheSwgcGxlYXNlIGNvbnRhY3QgdGhlIGNsaW5pYyBieQpjYWxsaW5nIDEtODAwLTk0OS0xMDA0LiBTZWxlY3Qgb3B0aW9uIDIgd2hlbiB0aGUgYXV0b21hdGVkIG1lc3NhZ2Ugc3RhcnRzLgoKCg=="
* content.attachment.title = "PC - AFTERVISIT SUMMARY"
* content.attachment.creation = "2023-01-27T11:56:00Z"
* context.related.reference = "#location-0"

Instance: 81d9d769-c55a-4d75-9bbb-c426fb3b8deb
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 77429324"
Description: "PC - FOLLOW UP"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.77429324"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2023-01-27T11:53:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2023-01-27T11:56:17Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBGT0xMT1cgVVAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgT1VUUEFUSUVOVCBOT1RFICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMjcsIDIwMjNAMTE6NTMgICAgIEVOVFJZIERBVEU6IEpBTiAyNywgMjAyM0AxMTo1NDowMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKTkFNRTpNSFZaWlZJU05UV0VOVFksVEVTVCBQQVRJRU5UUiAgSkFOIDEsMjAwMQogClBST0JMRU1TOgpIeXBlcmthbGVtaWEgKFNDVCAxNDE0MDAwOSkgICAgICAgICAgICAgQUYtIEF0cmlhbCBGaWJyaWxsYXRpb24gKFNDVCA0OTQzNjAwNCkKQmFzYWwgQ2VsbCBDYXJjaW5vbWEgb2YgU2tpbiAoU0NUIDI1NDcwMVNsZWVwIEFwbmVhIChTQ1QgNzM0MzAwMDYpCkh5cGVydGVuc2l2ZSBoZWFydCBkaXNlYXNlIHdpdGhvdXQgY29uZ2VEaWFiZXRlcyBNZWxsaXR1cyBUeXBlIDIgKFNDVCA0NDA1NDAwNikKRmx5aW5nIHBob2JpYSAoU0NUIDI0Nzg1NDAwMikgICAgICAgICAgIE1lZGljYWwgZXhhbWluYXRpb25zL3JlcG9ydHMgc3RhdHVzIChTQ1QgCjMxMDM2NjAwOCkKU2Vhc29uYWwgYWxsZXJnaWMgcmhpbml0aXMgKFNDVCAzNjc0OTgwMAogClNVQkpFQ1RJVkU6IE1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSIGlzIGEgMjIgWU9NQUxFIGhlcmUgZm9yCiAKIApNRURJQ0FUSU9OUzoKQWN0aXZlIE91dHBhdGllbnQgTWVkaWNhdGlvbnMgKGluY2x1ZGluZyBTdXBwbGllcyk6CiAKICAgICBBY3RpdmUgT3V0cGF0aWVudCBNZWRpY2F0aW9ucyAgICAgICAgICAgICAgICAgICAgICAgICAgU3RhdHVzCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KMSkgICBBQ0VUQU1JTk9QSEVOIDUwME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRk9VUiAgSE9MRAogICAgICAgVElNRVMgQSBEQVkgQVMgTkVFREVEICpETyBOT1QgVEFLRSBNT1JFIFRIQU4KICAgICAgIDQsMDAwTUcgQSBEQVkgT0YgQUNFVEFNSU5PUEhFTiBGUk9NIEFMTCBTT1VSQ0VTIERVRQogICAgICAgVE8gUklTSyBPRiBMSVZFUiBEQU1BR0UuCjIpICAgQUxCVVRFUk9MIDEwMC9JUFJBVFJPIDIwTUNHIDEyMEQgUE8gSU5ITCBJTkhBTEUgMSAgICAgIEFDVElWRSAoUykKICAgICAgIFNQUkFZIEJZIE1PVVRIIEZPVVIgVElNRVMgQSBEQVkgKEVBQ0ggSU5IQUxFUgogICAgICAgQ09OVEFJTlMgMTIwIFNQUkFZUykKMykgICBBTENPSE9MIFBSRVAgUEFEIFVTRSBQQUQgVE9QSUNBTExZIEFTIERJUkVDVEVEICAgICAgICAgQUNUSVZFIChTKQo0KSAgIEFMTE9QVVJJTk9MIDEwME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgICBBQ1RJVkUgKFMpCiAgICAgICBEQVkKNSkgICBBU1BJUklOIDMyNU1HIEVDIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgICAgSE9MRAogICAgICAgREFZCjYpICAgQlVTUElST05FIEhDTCAxME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggVFdJQ0UgIEFDVElWRSAoUykKICAgICAgIEEgREFZIEFTIE5FRURFRCBGT1IgQU5YSUVUWQo3KSAgIENBUFNBSUNJTiAwLjElIENSRUFNIEFQUExZIEEgU01BTEwgQU1PVU5UIFRPUElDQUxMWSAgICBBQ1RJVkUKICAgICAgIFRXSUNFIEEgREFZCjgpICAgQ0xPUElET0dSRUwgQklTVUxGQVRFIDc1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBFVkVSWSAgIEFDVElWRQogICAgICAgREFZCjkpICAgRElQSEVOSFlEUkFNSU5FIEhDTCAyNU1HIENBUCBUQUtFIE9ORSBDQVBTVUxFIEJZICAgICAgIEFDVElWRQogICAgICAgTU9VVEggRk9VUiBUSU1FUyBBIERBWSBBUyBORUVERUQKMTApICBGTFVPWEVUSU5FIEhDTCAxME1HIENBUCBUQUtFIE9ORSBDQVBTVUxFIEJZIE1PVVRIICAgICAgQUNUSVZFCiAgICAgICBFVkVSWSBEQVkKMTEpICBGTFVUSUNBUyA1MDAvU0FMTUVURVJPTCA1MCBJTkhMIERJU0sgNjAgSU5IQUxFIDEgICAgICAgQUNUSVZFCiAgICAgICBJTkhBTEFUSU9OIEJZIE1PVVRIIFRXSUNFIEEgREFZIFJJTlNFIE1PVVRIIEFORAogICAgICAgU1BJVCBBRlRFUiBVU0UuIERJU0NBUkQgMSBNT05USCBBRlRFUiBPUEVOSU5HIEZPSUwKICAgICAgIFBPVUNILgoxMikgIEZPTElDIEFDSUQgMU1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgREFZICBBQ1RJVkUKMTMpICBHTElQSVpJREUgNU1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggVFdJQ0UgQSAgICAgQUNUSVZFCiAgICAgICBEQVkgRk9SIERJQUJFVEVTLiBUQUtFIDMwIE1JTlVURVMgQkVGT1JFIEEgTUVBTC4KMTQpICBHTFVDT1NUSVggR0xVQ09TRSBURVNUIFNUUklQIFVTRSAxIFNUUklQIElURU0gQVMgICAgICAgQUNUSVZFCiAgICAgICBESVJFQ1RFRAoxNSkgIEhZRFJPQ0hMT1JPVEhJQVpJREUgMjVNRyBUQUIgVEFLRSBUV08gVEFCTEVUUyBCWSAgICAgICBBQ1RJVkUKICAgICAgIE1PVVRIIEVWRVJZIE1PUk5JTkcgRk9SIEJMT09EIFBSRVNTVVJFCjE2KSAgSFlEUk9DT1JUSVNPTkUgMSUgQ1JFQU0gQVBQTFkgVEhJTiBGSUxNIFRPUElDQUxMWSAgICAgIEFDVElWRQogICAgICAgRVZFUlkgREFZCjE3KSAgSUJVUFJPRkVOIDQwME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggVEhSRUUgICAgIEFDVElWRQogICAgICAgVElNRVMgQSBEQVkgQVMgTkVFREVECjE4KSAgSU5TVUxJTiBSRUcgMTAwVS9NTCBJTkogMTBNTCBWTCBJTkpFQ1QgNSBVTklUUyAgICAgICAgIEFDVElWRQogICAgICAgU1VCQ1VUQU5FT1VTTFkgQVMgRElSRUNURUQKMTkpICBNRVRGT1JNSU4gSENMIDUwME1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggICAgICAgQUNUSVZFCiAgICAgICBFVkVSWSBEQVkKMjApICBNRVRPUFJPTE9MIFNVQ0NJTkFURSAyNU1HIFNBIFRBQiBUQUtFIFRXTyBUQUJMRVRTIEJZICAgQUNUSVZFCiAgICAgICBNT1VUSCBFVkVSWSBEQVkKMjEpICBNVUxUSVZJVEFNSU4gQ0FQL1RBQiBUQUtFIDEgQ0FQL1RBQiBCWSBNT1VUSCBFVkVSWSAgICAgQUNUSVZFCiAgICAgICBEQVkKMjIpICBORUVETEUgMjVHIDEuNUlOIFVTRSBPTkUgSVRFTSBBUyBESVJFQ1RFRCAgICAgICAgICAgICAgQUNUSVZFCjIzKSAgT01FUFJBWk9MRSAyME1HIEVDIENBUCBUQUtFIE9ORSBDQVBTVUxFIEJZIE1PVVRIICAgICAgIEFDVElWRQogICAgICAgRVZFUlkgREFZCjI0KSAgUElPR0xJVEFaT05FIEhDTCAxNU1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggICAgIEFDVElWRQogICAgICAgRVZFUlkgREFZCjI1KSAgUFJBVkFTVEFUSU4gTkEgODBNRyBUQUIgVEFLRSBPTkUtSEFMRiBUQUJMRVQgQlkgTU9VVEggIEFDVElWRQogICAgICAgRVZFUlkgRVZFTklORyBUTyBMT1dFUiBZT1VSIENIT0xFU1RFUk9MCjI2KSAgVEFNU1VMT1NJTiBIQ0wgMC40TUcgQ0FQIFRBS0UgT05FIENBUFNVTEUgQlkgTU9VVEggQVQgIEFDVElWRQogICAgICAgQkVEVElNRQoyNykgIFRJT1RST1BJVU0gMThNQ0cgSU5ITCBDQVAgMzAgUExBQ0UgMSBDQVBTVUxFICgxOCBNQ0cpICBBQ1RJVkUKICAgICAgIElOIElOSEFMRVIsIElOSEFMRSBCWSBNT1VUSCBFVkVSWSBEQVkgUkVQTEFDRVMKICAgICAgIElQUkFUUk9QSVVNIChBVFJPVkVOVC9DT01CSVZFTlQpLCBGT1IgSU5IQUxFUiBVU0UKICAgICAgIE9OTFkKIAogICAgIEFjdGl2ZSBOb24tVkEgTWVkaWNhdGlvbnMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTdGF0dXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoxKSAgIE5vbi1WQSBBQ0VUQU1JTk9QSEVOIDUwME1HIFRBQiA1MDBNRyBNT1VUSCAgICAgICAgICAgICBBQ1RJVkUKMikgICBOb24tVkEgQU1JT0RBUk9ORSBIQ0wgKFBBQ0VST05FKSAyMDBNRyBUQUIgMjAwTUcgICAgICAgQUNUSVZFCiAgICAgICBNT1VUSCBFVkVSWSBEQVkKMykgICBOb24tVkEgQVNQSVJJTiBUQUIsRUMgIE1PVVRIIEVWRVJZIERBWSAgICAgICAgICAgICAgICAgQUNUSVZFCjQpICAgTm9uLVZBIENMT1BJRE9HUkVMIEJJU1VMRkFURSA3NU1HIFRBQiA3NU1HIE1PVVRIICAgICAgIEFDVElWRQo1KSAgIE5vbi1WQSBNVUxUSVZJVEFNSU4gQ0FQL1RBQiAxIENBUC9UQUIgTU9VVEggRVZFUlkgREFZICBBQ1RJVkUKIAozMiBUb3RhbCBNZWRpY2F0aW9ucwogCkFMTEVSR0lFUzoKICBQRU5JQ0lMTElOLCBTVUxGQSBEUlVHUywgRUdHUywgTUFBTE9YIEFOVEFDSUQsIEFESEVTSVZFIFRBUEUsIFRFVFJBQ1lDTElORQogIFBSQVpPU0lOLCBMSVNJTk9QUklMCiAKUEhZU0lDQUwgRVhBTToKQlAxMjUvODAgKDAxLzA4LzIwMjAgMTQ6MjcpICBQNjcgKDAxLzA4LzIwMjAgMTQ6MjcpICBSUjEyICgwMS8wOC8yMDIwIDE0OjI3KSAKVDk4LjggRiBbMzcuMSBDXSAoMDEvMDgvMjAyMCAxNDoyNykKV1QyNTUgbGIgWzExNS42NyBrZ10gKDAxLzA4LzIwMjAgMTQ6MjcpCiAKQVBQRUFSQU5DRTogIFdFTEwgQVBQRUFSSU5HLCBJTiBOQUQKSEVFTlQ6ICBBVC9OQywgUEVFUkxBLCBFT01JCk5FQ0s6ICBOTyBOT0RFUyBPUiBNQVNTRVMKTFVOR1M6ICBDVEEgQklMQVRFUkFMTFkKQ09SOiAgUlJSLCBOTyBNUkcKQUJET01FTjogTk8gTUFTU0VTIElOIEFMTCA0IFFVQURSQU5UUywgTk8gSFNNCkVYVDogIE5PIEMvQy9FLCBEUCAyKyBCSUxBVCwgU0VOU0FUSU9OIElOIFRBQ1QKR1U6CiAKTGFiczoKIApjaG9sZXN0ZXJvbCAgICAgICBObyBDSE9MRVNURVJPTCBpbiB0aGUgbGFzdCAxWQpoZGwgICAgICAgICAgICAgICBObyBIREwgaW4gdGhlIGxhc3QgMVkKbGRsIGNhbGMgICAgICAgICAgTm8gTERMLUNIT0wgQ0FMQyBpbiB0aGUgbGFzdCAxWQp0cmlncyAgICAgICAgICAgICBObyBUUklHTFlDRVJJREVTIGluIHRoZSBsYXN0IDFZCmZlcnJpdGluICAgICAgICAgIE5vIEZFUlJJVElOIGluIHRoZSBsYXN0IDFZCkhDVCAgICAgICAgICAgICAgIE5vIEhDVCBpbiB0aGUgbGFzdCAxWQpIZW1vZ2xvYmluICAgICAgICBUaGUgT0JKRUNUIExBQi1IR0JBMUMgd2FzIE5PVCBmb3VuZC4uLkNvbnRhY3QgSVJNLgpQU0EgICAgICAgICAgICAgICBObyBQUk9TVEFUSUMgU1BFQ0lGSUMgQU5USUdFTiBpbiB0aGUgbGFzdCAxWQogCk5vIENCQyBpbiB0aGUgcGFzdCAxWQogCk5vIEJBU0lDIE1FVEFCT0xJQyBQQU5FTCBpbiB0aGUgcGFzdCAxWQpObyBHVUFJQUMgR0FTVFJJQyBpbiB0aGUgbGFzdCAxWU5vIEhFTU9HTE9CSU4gQTFDIGluIHRoZSBsYXN0IDFZTm8gWlpIRVBBVElUSVMgQSAKQU5USUJPRFkgVE9UQUwgaW4gdGhlIGxhc3QgMVlObyBIRVBBVElUSVMgQiBTVVJGQUNFIEFOVElHRU4gaW4gdGhlIGxhc3QgMVlObyAKSEVQQyBBTlRJQk9EWSAoU0VFIFBBTkVMICM2NzI3KSBpbiB0aGUgbGFzdCAxWQogCk5vIExJVkVSIEZVTkNUSU9OIFBBTkVMIGluIHRoZSBwYXN0IDFZCk5vIE1JQ1JPQUxCVU1JTi9DUkVBVElOSU5FIFJBVElPIGluIHRoZSBsYXN0IDFZCk5vIFVBIERJUFNUSUNLIE9OTFkgaW4gdGhlIHBhc3QgMVkKIAogCiAKSU1QUkVTU0lPTjogIE1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSIGlzIGEgMjIgWU9NQUxFIGhlcmUgZm9yCiAKUFJPQkxFTVM6CiAKIAovZXMvIExJU0EgTSBURVNUam9uZXMsIE0uRC4KU3RhZmYgUGh5c2ljaWFuClNpZ25lZDogMDEvMjcvMjAyMyAxMTo1Ngo="
* content.attachment.title = "PC - FOLLOW UP"
* content.attachment.creation = "2023-01-27T11:53:00Z"
* context.related.reference = "#location-0"

Instance: d6feb17e-acd7-4730-92f2-34e1789adb5f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76750716"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.347662"
* contained[=].name.text = "TESTrodriguez,NIKI D"
* contained[=].name.family = "TESTrodriguez,NIKI D"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.347662"
* contained[=].name.text = "TESTrodriguez,NIKI D"
* contained[=].name.family = "TESTrodriguez,NIKI D"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76750716"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-12-07T11:21:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-12-07T08:21:11Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMDcsIDIwMjJAMTE6MjEgICAgIEVOVFJZIERBVEU6IERFQyAwNywgMjAyMkAwODoyMToxMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ryb2RyaWd1ZXosTklLSSBEICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMi8wNy8yMDIyIDExOjE4IEFNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBXZXN0IExpbm4gQmVoYXZpb3JhbCBIZWFsdGhfVkFQb3J0bGFuZEhDU19NSCAKU3ViamVjdDogIEdlbmVyYWw6VGVzdCBNZXNzYWdlIGZvciBOaWtpIAoKc2RqY25sa3NqZGhsa3NkICAKYXNkY3NkZlNEICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMi8wNy8yMDIyIDExOjIwIEFNIEVUIApGcm9tOiAgVEVTVHJvZHJpZ3VleiwgTklLSSAgRCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpUZXN0IE1lc3NhZ2UgZm9yIE5pa2kgCgpUaGFuayB5b3UgCgogCi9lcy8gTklLSSBEIFRFU1Ryb2RyaWd1ZXosIFBIRApCSElQIFBTWUNIT0xPR0lTVApTaWduZWQ6IDEyLzA3LzIwMjIgMDg6MjEK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-12-07T11:21:00Z"
* context.related.reference = "#location-0"

Instance: 9afa201e-5907-4ff2-9d86-4e81d2a1d151
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76666064"
Description: "INPAT - MED - ATT - ADMIT"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.42803"
* contained[=].name.text = "TESTmartinez,JENNIFER RENEE"
* contained[=].name.family = "TESTmartinez,JENNIFER RENEE"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.42803"
* contained[=].name.text = "TESTmartinez,JENNIFER RENEE"
* contained[=].name.family = "TESTmartinez,JENNIFER RENEE"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76666064"
* status = #current
* type = $loinc#11506-3
* type.text = "ATTENDING ADMISSION EVALUATION NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-11-30T16:23:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-11-30T16:34:04Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogSU5QQVQgLSBNRUQgLSBBVFQgLSBBRE1JVCAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBBVFRFTkRJTkcgQURNSVNTSU9OIEVWQUxVQVRJT04gTk9URSAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMzAsIDIwMjJAMTY6MjMgICAgIEVOVFJZIERBVEU6IE5PViAzMCwgMjAyMkAxNjoyMzoyNyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixKRU5OSUZFUiBSRU4gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKQ0xJTklDQUwgUkVNSU5ERVIgQUNUSVZJVFkKICBUb3hpYyBFeHBvc3VyZSBTY3JlZW5pbmc6CiAgICBUaGUgVmV0ZXJhbi9jYXJlZ2l2ZXIgd2FzIGFza2VkIGlmIHRoZXkgYmVsaWV2ZSB0aGUgVmV0ZXJhbiBleHBlcmllbmNlZCBhbnkgCiAgICB0b3hpYyBleHBvc3VyZShzKSwgc3VjaCBhcyBPcGVuIEJ1cm4gUGl0cy9BaXJib3JuZSBIYXphcmRzLCBHdWxmIFdhciAKICAgIHJlbGF0ZWQgZXhwb3N1cmVzLCBBZ2VudCBPcmFuZ2UsIFJhZGlhdGlvbiwgY29udGFtaW5hdGVkIHdhdGVyIGF0IENhbXAgCiAgICBMZWpldW5lIG9yIG90aGVyIHN1Y2ggZXhwb3N1cmVzLCB3aGlsZSBzZXJ2aW5nIGluIHRoZSBBcm1lZCBGb3JjZXMuCiAKICAgICAgVmV0ZXJhbi9jYXJlZ2l2ZXIgZG9lc24ndCBrbm93IG9mIGNvbmNlcm5zIGFib3V0IFZldGVyYW4gZXhwb3N1cmUgdG8gCiAgICAgIGhhcm1mdWwgc3Vic3RhbmNlcyB3aGlsZSBzZXJ2aW5nIGluIHRoZSBBcm1lZCBGb3JjZXMuCiAgICAgICAgUHJpbnRlZCBpbmZvcm1hdGlvbiB3YXMgb2ZmZXJlZCBhbmQgY29udGFjdCBpbmZvcm1hdGlvbiBmb3IgbG9jYWwgCiAgICAgICAgcmVzb3VyY2VzIHdlcmUgcHJvdmlkZWQgaWYgcmVxdWVzdGVkLgogCiAgICAgICAgVmV0ZXJhbi9jYXJlZ2l2ZXIgZG9lcyBub3QgaGF2ZSBxdWVzdGlvbnMgYXQgdGhpcyB0aW1lLgogICAgICAgICAgVmV0ZXJhbi9jYXJlZ2l2ZXIgd2FzIGluZm9ybWVkIG9mIGxvY2FsIHBvaW50cyBvZiBjb250YWN0LgogCiAgICAgICAgQ29udGFjdCBpbmZvcm1hdGlvbiBmb3IgbG9jYWwgcmVzb3VyY2VzOgogCiAgICAgICAgRm9yIHF1ZXN0aW9ucyBhYm91dCBURVMgUmVnaXN0cnkgUHJvZ3JhbSwgVmV0ZXJhbiBtYXkgY2FsbCA1MDMtOTA2LTUxMDAKIAogICAgICAgIEZvciBhZGRpdGlvbmFsIGFzc2lzdGFuY2Ugd2l0aCBURVMgUHJvZ3JhbSwgVmV0ZXJhbiBtYXkgY29udGFjdCBsb2NhbAogICAgICAgIFRFUyBOYXZpZ2F0b3IgdGVhbSBhdCA1MDMtMjczLTUwNzUKIAogICAgICAgIEZvciBIZWFsdGhjYXJlIEVsaWdpYmlsaXR5IGFuZCBFbnJvbGxtZW50IHF1ZXN0aW9ucywgVmV0ZXJhbiBtYXkKICAgICAgICBjb250YWN0IGxvY2FsIEVucm9sbG1lbnQgT2ZmaWNlIGF0IDUwMy0yNzMtNTA2OQogCiAgICAgICAgRm9yIHF1ZXN0aW9ucyBhYm91dCBCZW5lZml0cyBhbmQgQ2xhaW1zIFZldGVyYW4gbWF5IGNvbnRhY3QgVmV0ZXJhbgogICAgICAgIGluc3RydWN0ZWQgdG8gd29yayB0aHJvdWdoIGxvY2FsIFZldGVyYW4gU2VydmljZSBPcmdhbml6YXRpb24gT2ZmaWNlIGF0CiAgICAgICAgaHR0cHM6Ly93d3cuZWJlbmVmaXRzLnZhLmdvdi9lYmVuZWZpdHMvdnNvLXNlYXJjaAogCi9lcy8gSi4gUkVORUUgVEVTVG1hcnRpbmV6LCBNRApTdGFmZiBBdHRlbmRpbmcKU2lnbmVkOiAxMS8zMC8yMDIyIDE2OjM0Cg=="
* content.attachment.title = "INPAT - MED - ATT - ADMIT"
* content.attachment.creation = "2022-11-30T16:23:00Z"
* context.related.reference = "#location-0"

Instance: 9dcb8c69-8b84-4fd9-9990-ce035b21d00a
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76264996"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76264996"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-31T16:19:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-31T14:19:31Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMzEsIDIwMjJAMTY6MTkgICAgIEVOVFJZIERBVEU6IE9DVCAzMSwgMjAyMkAxNDoxOTozMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxEQU5JRUwgRSAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDEwLzMxLzIwMjIgMDI6MzMgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIE1ISUNNX1ZBUG9ydGxhbmRIQ1NfTUggClN1YmplY3Q6ICBHZW5lcmFsOlRlc3RpbmcgMS4uLiAKCkxvcmVtIGlwc3VtIGRvbG9yIHNpdCBhbWV0LCBjb25zZWN0ZXR1ciBhZGlwaXNjaW5nIGVsaXQuIFV0IGNvbnNlY3RldHVyIG9ybmFyZSAKYXVndWUuIE51bmMgc2VkIHNvZGFsZXMgbGlndWxhLCBpZCBsb2JvcnRpcyBuaWJoLiAgIAogIAogIApGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgIApodHRwczovL3d3dy52YS5nb3YvZGlyZWN0b3J5L2d1aWRlL3JlZ2lvbi5hc3A/SUQ9MTAyMD8KLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDEwLzMxLzIwMjIgMDU6MTggUE0gRVQgCkZyb206ICBURVNUc21pdGgsIERBTklFTCAgRSAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpUZXN0aW5nIDEuLi4gCgp0aGlzIGlzIGEgcmVwbHkgIAogIAogIAogIApEYW5pZWwgVEVTVHNtaXRoLCBMQ1NXICAKVGVhbSBMZWFkL0Nhc2UgTWFuYWdlciwgTUhJQ00gCgogCi9lcy8gRGFuaWVsIEUuIFRFU1RzbWl0aCwgTENTVwpMaWNlbnNlZCBDbGluaWNhbCBTb2NpYWwgV29ya2VyClNpZ25lZDogMTAvMzEvMjAyMiAxNDoxOQo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-10-31T16:19:00Z"
* context.related.reference = "#location-0"

Instance: 1b6b9822-01be-4563-b783-611e3382944d
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76263140"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76263140"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-31T15:24:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-31T13:24:03Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMzEsIDIwMjJAMTU6MjQgICAgIEVOVFJZIERBVEU6IE9DVCAzMSwgMjAyMkAxMzoyNDowMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxEQU5JRUwgRSAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDEwLzMxLzIwMjIgMDI6MzYgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIE1ISUNNX1ZBUG9ydGxhbmRIQ1NfTUggClN1YmplY3Q6ICBHZW5lcmFsOjMgCgpTZWQgY29udmFsbGlzIGNvbnZhbGxpcyBpcHN1bSwgaWQgbWF0dGlzIHR1cnBpcyB1bHRyaWNlcyBpZC4gSW4gdml2ZXJyYSBldWlzbW9kIAplcm9zLCBhYyBwb3N1ZXJlIHJpc3VzLiAgCiAgCiAgCnRoZSBiZWxvdyBpcyBqdXN0IHdoYXQgaSBwdXQgaW4gbXkgc2lnbmF0dXJlIGJveCAocHJlZnMpIGluc3RlYWQgb2YgbXkgCm5hbWUvdGl0bGU7IHlvdSd2ZSA2NiBjaGFyYWN0ZXJzIHBlciBsaW5lIHdpdGggd2hpY2ggdG8gd29yayBpZiB5b3Ugd2FudCB0byBnZXQgCmNyZWF0aXZlLiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCmh0dHBzOi8vd3d3LnZhLmdvdi9kaXJlY3RvcnkvZ3VpZGUvcmVnaW9uLmFzcD9JRD0xMDIwPwoKIAovZXMvIERhbmllbCBFLiBURVNUc21pdGgsIExDU1cKTGljZW5zZWQgQ2xpbmljYWwgU29jaWFsIFdvcmtlcgpTaWduZWQ6IDEwLzMxLzIwMjIgMTM6MjQK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-10-31T15:24:00Z"
* context.related.reference = "#location-0"

Instance: d957b457-1d66-4d8d-8d12-f0f53a1e180c
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76265401"
Description: "MHD - MHICM PROGRESS NOTE"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76265401"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-31T14:32:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-31T14:32:51Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUhEIC0gTUhJQ00gUFJPR1JFU1MgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIE9VVFBBVElFTlQgTk9URSAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMzEsIDIwMjJAMTQ6MzIgICAgIEVOVFJZIERBVEU6IE9DVCAzMSwgMjAyMkAxNDozMjo1MSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxEQU5JRUwgRSAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKTUhEIC0gTUhJQ00gUFJPR1JFU1MgTk9URSAtIDMxIE9jdCwgMjAyMiBAIDAyOjMyUE0KVmlzaXQgRGF0ZTogIDMwIE5vdiwgMjAyMSBAIDExOjM5IC0gUE9SLVNFQ01TRy1NSCBDV1QvU0UtWAoKTUhUQyBub3QgYXNzaWduZWQKClRFQU0gTUVNQkVSUzoKVEVTVHNtaXRoLERBTklFTCBFOiBTT0NJQUwgV09SS0VSCgpJTlRFUkRJU0NJUExJTkFSWSBJTlRFR1JBVEVEIFNVTU1BUlk6IApDaGllZiBDb21wbGFpbnQvSHggb2YgUHJlc2VudCBJbGxuZXNzCnZhZnYgYQoKRmFtaWx5IENpcmN1bXN0YW5jZXMKYVN2YVZCCgpJbnRlcnByZXRpdmUgU3VtbWFyeToKYWJyZmJhYmFiCgpUUkVBVE1FTlQgUExBTjogClByb2JsZW06IFByb2JsZW0vTmVlZDogW0FESlVTVE1FTlQgRElTT1JERVJdOiBJIGhhdmUgYmVlbiAKICAgICAgICAgZXhwZXJpZW5jaW5nIDRraWU2N2tpZSBpbiByZXNwb25zZSB0byA0aWs0cgogICAgR29hbDogSSB3YW50IHRvIHJlZHVjZSB0aGUgbGV2ZWwgb2YgbXkgZmVlbGluZ3MgCiAgICAgICAgICBvZiBkaXN0cmVzcy4KICAgIE9iamVjdGl2ZTogSSB3aWxsIHRha2UgbWVkaWNhdGlvbnMgYXMgcHJlc2NyaWJlZCB0byAKICAgICAgICAgICAgICAgcHJvbW90ZSBpbXByb3ZlbWVudCBpbiAgNHJpOC4gSW1wcm92ZW1lbnQgd2lsbCAKICAgICAgICAgICAgICAgYmUgbWVhc3VyZWQgdGhyb3VnaCBpbi1vZmZpY2UgYXNzZXNzbWVudCBhbmQgCiAgICAgICAgICAgICAgIHNlbGYtcmVwb3J0LiAgUHJvamVjdGVkIFRhcmdldCBEYXRlOiAxMS8wMS8yMDIyCiAgICAgICAgSW50ZXJ2ZW50aW9uOiBbUFNZQ0hPVEhFUkFQWV0gTXkgcHJvdmlkZXIgd2lsbCB3b3JrIAogICAgICAgICAgICAgICAgICAgICAgd2l0aCBtZSB0byBhY2hpZXZlIHRoaXMgZ29hbCBhbmQgCiAgICAgICAgICAgICAgICAgICAgICBvYmplY3RpdmUgdGhyb3VnaCByNmlrNHIgIFByb3ZpZGVyczogCiAgICAgICAgICAgICAgICAgICAgICBURVNUc21pdGgsREFOSUVMIEUgIFRpbWUgRnJhbWU6IFR3byB0aW1lcyAKICAgICAgICAgICAgICAgICAgICAgIHBlciB3ZWVrIGZvciAxIHdlZWsKICAgICAgICAgICAgICAgVHJlYXRpbmcgU3BlY2lhbHR5OiBNSElDTQogICAgICAgICAgICAgICBSZW5ld2FsIERhdGU6IDA0LzI5LzIwMjMKICAgICAgICAgICAgICAgRW50ZXJlZCBUcmVhdG1lbnQ6IDEwLzMxLzIwMjIgQCAwMjozMFBNCiAgICAgICAgICAgICAgIEFudGljaXBhdGVkIERpc2NoYXJnZTogTm9uZQogICAgICAgICAgICAgICBBY3R1YWwgRGlzY2hhcmdlOiBOb25lCiAKL2VzLyBEYW5pZWwgRS4gVEVTVHNtaXRoLCBMQ1NXCkxpY2Vuc2VkIENsaW5pY2FsIFNvY2lhbCBXb3JrZXIKU2lnbmVkOiAxMC8zMS8yMDIyIDE0OjMyCg=="
* content.attachment.title = "MHD - MHICM PROGRESS NOTE"
* content.attachment.creation = "2022-10-31T14:32:00Z"
* context.related.reference = "#location-0"

Instance: d2da431d-dedd-4891-87ae-1cb58e392c2f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 76265366"
Description: "PROCEDURE - INTRAOSSEOUS VASCULAR ACCESS"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.154424"
* contained[=].name.text = "TESTsmith,DANIEL E"
* contained[=].name.family = "TESTsmith,DANIEL E"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.76265366"
* status = #current
* type = $loinc#11506-3
* type.text = "PROCEDURE NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-31T14:31:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-31T14:31:31Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJPQ0VEVVJFIC0gSU5UUkFPU1NFT1VTIFZBU0NVTEFSIEFDQ0VTUyAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUk9DRURVUkUgTk9URSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMzEsIDIwMjJAMTQ6MzEgICAgIEVOVFJZIERBVEU6IE9DVCAzMSwgMjAyMkAxNDozMTozMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxEQU5JRUwgRSAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKQUNDRVNTICA8UFJPQ0VEVVJFIC0gSU5UUkFPU1NFT1VTIFZBU0NVTEFSIEFDQ0VTUz4gLSAzMSBPY3QsIDIwMjIgQCAwMjozMVBNClZpc2l0IERhdGU6ICA2IEp1bCwgMjAyMiBAIDExOjQyIC0gUE9SLVNFQ01TRy1NSCBJTkQtWAoKTUhUQyBub3QgYXNzaWduZWQKClRFQU0gTUVNQkVSUzoKVEVTVHNtaXRoLERBTklFTCBFOiBTT0NJQUwgV09SS0VSCgpUUkVBVE1FTlQgUExBTjogClByb2JsZW06IFByb2JsZW0vTmVlZDogW0FESlVTVE1FTlQgRElTT1JERVJdOiBJIGhhdmUgYmVlbiAKICAgICAgICAgZXhwZXJpZW5jaW5nIDRraWU2N2tpZSBpbiByZXNwb25zZSB0byA0aWs0cgogICAgR29hbDogSSB3YW50IHRvIHJlZHVjZSB0aGUgbGV2ZWwgb2YgbXkgZmVlbGluZ3MgCiAgICAgICAgICBvZiBkaXN0cmVzcy4KICAgIE9iamVjdGl2ZTogSSB3aWxsIHRha2UgbWVkaWNhdGlvbnMgYXMgcHJlc2NyaWJlZCB0byAKICAgICAgICAgICAgICAgcHJvbW90ZSBpbXByb3ZlbWVudCBpbiAgNHJpOC4gSW1wcm92ZW1lbnQgd2lsbCAKICAgICAgICAgICAgICAgYmUgbWVhc3VyZWQgdGhyb3VnaCBpbi1vZmZpY2UgYXNzZXNzbWVudCBhbmQgCiAgICAgICAgICAgICAgIHNlbGYtcmVwb3J0LiAgUHJvamVjdGVkIFRhcmdldCBEYXRlOiAxMS8wMS8yMDIyCiAgICAgICAgSW50ZXJ2ZW50aW9uOiBbUFNZQ0hPVEhFUkFQWV0gTXkgcHJvdmlkZXIgd2lsbCB3b3JrIAogICAgICAgICAgICAgICAgICAgICAgd2l0aCBtZSB0byBhY2hpZXZlIHRoaXMgZ29hbCBhbmQgCiAgICAgICAgICAgICAgICAgICAgICBvYmplY3RpdmUgdGhyb3VnaCByNmlrNHIgIFByb3ZpZGVyczogCiAgICAgICAgICAgICAgICAgICAgICBURVNUc21pdGgsREFOSUVMIEUgIFRpbWUgRnJhbWU6IFR3byB0aW1lcyAKICAgICAgICAgICAgICAgICAgICAgIHBlciB3ZWVrIGZvciAxIHdlZWsKICAgICAgICAgICAgICAgVHJlYXRpbmcgU3BlY2lhbHR5OiBNSElDTQogICAgICAgICAgICAgICBSZW5ld2FsIERhdGU6IDA0LzI5LzIwMjMKICAgICAgICAgICAgICAgRW50ZXJlZCBUcmVhdG1lbnQ6IDEwLzMxLzIwMjIgQCAwMjozMFBNCiAgICAgICAgICAgICAgIEFudGljaXBhdGVkIERpc2NoYXJnZTogTm9uZQogICAgICAgICAgICAgICBBY3R1YWwgRGlzY2hhcmdlOiBOb25lCiAKL2VzLyBEYW5pZWwgRS4gVEVTVHNtaXRoLCBMQ1NXCkxpY2Vuc2VkIENsaW5pY2FsIFNvY2lhbCBXb3JrZXIKU2lnbmVkOiAxMC8zMS8yMDIyIDE0OjMxCgpSZWNlaXB0IEFja25vd2xlZGdlZCBCeToKMTAvMzEvMjAyMiAxNToxNiAgICAgICAgL2VzLyBMeW5uZSBBLiBURVNUam9obnNvbiwgUE1ITlAtQkMgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQc3ljaGlhdHJpYyBOUCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo="
* content.attachment.title = "PROCEDURE - INTRAOSSEOUS VASCULAR ACCESS"
* content.attachment.creation = "2022-10-31T14:31:00Z"
* context.related.reference = "#location-0"

Instance: dfb2562e-7af3-4473-88ed-ffeb9450ecac
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75912699"
Description: "ENDOCRINOLOGY SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.562335"
* contained[=].name.text = "TESTwilliams,YOLANDA A"
* contained[=].name.family = "TESTwilliams,YOLANDA A"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.562335"
* contained[=].name.text = "TESTwilliams,YOLANDA A"
* contained[=].name.family = "TESTwilliams,YOLANDA A"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75912699"
* status = #current
* type = $loinc#11506-3
* type.text = "ENDOCRINOLOGY SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-05T13:31:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-05T11:31:54Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogRU5ET0NSSU5PTE9HWSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBFTkRPQ1JJTk9MT0dZIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMDUsIDIwMjJAMTM6MzEgICAgIEVOVFJZIERBVEU6IE9DVCAwNSwgMjAyMkAxMTozMTo1NCAgICAgIAogICAgICBBVVRIT1I6IFRFU1R3aWxsaWFtcyxZT0xBTkQgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKICAgKioqIEVORE9DUklOT0xPR1kgU0VDVVJFIE1FU1NBR0lORyBIYXMgQURERU5EQSAqKioKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8wNS8yMDIyIDAyOjAxIFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqQ2FyZSBJbiBUaGUgQ29tbXVuaXR5X1ZBUG9ydGxhbmRIQ1MgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgZm9yIFlvbGFuZGEgLSAzIAoKVGVzdCAzICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8wNS8yMDIyIDAyOjI4IFBNIEVUIApGcm9tOiAgVEVTVHdpbGxpYW1zLCBZT0xBTkRBICBBIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgZm9yIFlvbGFuZGEgLSAzIAoKUGxlYXNlIHJldmlldzogIAoKIAovZXMvIFlPTEFOREEgQSBURVNUd2lsbGlhbXMKQU1TQQpTaWduZWQ6IDEwLzA1LzIwMjIgMTE6MzEKCjEwLzA4LzIwMjIgQURERU5EVU0gICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQKdGVzdAogCi9lcy8gRVJJQ0sgSCBURVNUYnJvd24sIE1EClN0YWZmIFBzeWNoaWF0cmlzdApTaWduZWQ6IDEwLzA4LzIwMjIgMDg6NTQK"
* content.attachment.title = "ENDOCRINOLOGY SECURE MESSAGING"
* content.attachment.creation = "2022-10-05T13:31:00Z"
* context.related.reference = "#location-0"

Instance: 059947f6-5522-4336-b533-9ef9fd3a245d
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75866332"
Description: "MOVE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75866332"
* status = #current
* type = $loinc#11506-3
* type.text = "MOVE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-10-03T08:34:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-10-03T06:34:14Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTU9WRSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNT1ZFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMDMsIDIwMjJAMDg6MzQgICAgIEVOVFJZIERBVEU6IE9DVCAwMywgMjAyMkAwNjozNDoxNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTAvMDMvMjAyMiAwOToyOCBBTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgTUhWIFRlc3QgVHJpYWdlIEdyb3VwIApTdWJqZWN0OiAgR2VuZXJhbDp0ZXN0IAoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8wMy8yMDIyIDA5OjMyIEFNIEVUIApGcm9tOiAgVEVTVGpvaG5zb24sIEJSSUFOICBLIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOnRlc3QgCgpkY1NEY1NEQ1NERiAgCiAgCiAgCiAgCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6ICAKaHR0cHM6Ly93d3cudmEuZ292L3BvcnRsYW5kLWhlYWx0aC1jYXJlLwoKIAovZXMvIEJSSUFOIEsgVEVTVGpvaG5zb24gQkEKU0VDVVJFIE1FU1NBR0lORyBBRE1JTklTVFJBVE9SClNpZ25lZDogMTAvMDMvMjAyMiAwNjozNAo="
* content.attachment.title = "MOVE SECURE MESSAGING"
* content.attachment.creation = "2022-10-03T08:34:00Z"
* context.related.reference = "#location-0"

Instance: 1ae5019e-aaca-4298-9f8c-2745c1fbfc96
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75540140"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387736"
* contained[=].name.text = "TESTjones,JULEE"
* contained[=].name.family = "TESTjones,JULEE"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387736"
* contained[=].name.text = "TESTjones,JULEE"
* contained[=].name.family = "TESTjones,JULEE"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75540140"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-09-08T13:58:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-09-08T11:58:07Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMDgsIDIwMjJAMTM6NTggICAgIEVOVFJZIERBVEU6IFNFUCAwOCwgMjAyMkAxMTo1ODowNyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxKVUxFRSAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA5LzA3LzIwMjIgMDY6MDMgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogICoqTWFsbGFidXJuX1ByaW1hcnlDYXJlX1ZBUG9ydGxhYm5kSENTX1RoZURhbGxlcyAKU3ViamVjdDogIEdlbmVyYWw6Rm9yIEthdGllIFRFU1RnYXJjaWEgLSBUZXN0IFNhdmUgYXMgV29ya2xvYWQgQ3JlZGl0IAoKTG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2NpbmcgZWxpdC4gVml2YW11cyBwdXJ1cyBlcmF0LCAKZmV1Z2lhdCBhIGF1Z3VlIHV0LCBtYXR0aXMgdml2ZXJyYSBkdWkuIAotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDkvMDgvMjAyMiAwMjo1OCBQTSBFVCAKRnJvbTogIFRFU1Rqb25lcywgSlVMRUUgIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOkZvciBLYXRpZSBURVNUZ2FyY2lhIC0gVGVzdCBTYXZlIGFzIFdvcmtsb2FkIENyZWRpdCAKCkkgdW5kZXJzdGFuZCB0aGF0IHlvdXIgcGFpbiBpcyB2ZXJ5IHJlYWwsIGhvd2V2ZXIsIG5hcmNvdGljIHBhaW4gbWVkaWNhdGlvbiBpcyAKbm90IGFuIG9wdGlvbiBhdCB0aGlzIHBvaW50LiAgCiAgCiAgCiAgCkp1bGVlIFRFU1Rqb25lcyAgCkxQTgoKIAovZXMvIEpVTEVFIFRFU1Rqb25lcwpMUE4KU2lnbmVkOiAwOS8wOC8yMDIyIDExOjU4CgpSZWNlaXB0IEFja25vd2xlZGdlZCBCeToKMDkvMDkvMjAyMiAwOToyNCAgICAgICAgL2VzLyBLQVRJRSBELiBURVNUZ2FyY2lhIFBBLUMgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQaHlzaWNpYW4gQXNzaXN0YW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-09-08T13:58:00Z"
* context.related.reference = "#location-0"

Instance: 2c3998aa-1345-4c83-909c-58b9e5986eac
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75535810"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.356886"
* contained[=].name.text = "TESTmiller,MUKHDIP"
* contained[=].name.family = "TESTmiller,MUKHDIP"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.356886"
* contained[=].name.text = "TESTmiller,MUKHDIP"
* contained[=].name.family = "TESTmiller,MUKHDIP"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75535810"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-09-08T11:38:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-09-08T09:38:45Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMDgsIDIwMjJAMTE6MzggICAgIEVOVFJZIERBVEU6IFNFUCAwOCwgMjAyMkAwOTozODo0NSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsTVVLSERJUCAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDkvMDgvMjAyMiAwOToyMyBBTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgU2FsZW0gTWVudGFsIEhlYWx0aCBDbGluaWNfVkFQb3J0bGFuZEhDU19NSCAKU3ViamVjdDogIEdlbmVyYWw6VHJhaW5pbmcgTWVzc2FnZSAyIGZvciBNdWtoZGlwIFRFU1RtaWxsZXIgCgpTZWQgZWdlc3RhcyBtYWduYSBxdWlzIHNlbXBlciBibGFuZGl0LiBQZWxsZW50ZXNxdWUgZWdlc3RhcyBkdWkgbmlzbCwgcXVpcyAKY3Vyc3VzIGRvbG9yIHZlaGljdWxhIGFjLiBQaGFzZWxsdXMgdXQgZGlhbSB0ZWxsdXMuIFNlZCBpbnRlcmR1bSBhYyB0dXJwaXMgCnZpdGFlIGVmZmljaXR1ci4gICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOS8wOC8yMDIyIDEyOjMyIFBNIEVUIApGcm9tOiAgVEVTVG1pbGxlciwgTVVLSERJUCAgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6VHJhaW5pbmcgTWVzc2FnZSAyIGZvciBNdWtoZGlwIFRFU1RtaWxsZXIgCgpoZWxsbyAgCiAgCiAgCiAgCk11a2hkaXAgVEVTVG1pbGxlciwgTUQgIApQc3ljaGlhdHJpc3QKCiAKL2VzLyBNVUtIRElQIFRFU1RtaWxsZXIgTUQKUHN5Y2hpYXRyeSBSZXNpZGVudApTaWduZWQ6IDA5LzA4LzIwMjIgMDk6MzgK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-09-08T11:38:00Z"
* context.related.reference = "#location-0"

Instance: 5d725f54-0a4c-431a-b9fa-5b49a6cb42fa
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75515063"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.629899"
* contained[=].name.text = "TESTgarcia,KATIE D"
* contained[=].name.family = "TESTgarcia,KATIE D"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.629899"
* contained[=].name.text = "TESTgarcia,KATIE D"
* contained[=].name.family = "TESTgarcia,KATIE D"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75515063"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-09-07T10:15:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-09-07T08:15:51Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMDcsIDIwMjJAMTA6MTUgICAgIEVOVFJZIERBVEU6IFNFUCAwNywgMjAyMkAwODoxNTo1MSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RnYXJjaWEsS0FUSUUgRCAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOS8wNy8yMDIyIDEwOjI0IEFNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqKk1hbGxhYnVybl9QcmltYXJ5Q2FyZV9WQVBvcnRsYWJuZEhDU19UaGVEYWxsZXMgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgMSBmb3IgVEVTVGdhcmNpYSAKCnRlc3QgdGVzdCAxICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKaHR0cHM6Ly93d3cudmEuZ292L2RpcmVjdG9yeS9ndWlkZS9yZWdpb24uYXNwP0lEPTEwMjA/Ci0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOS8wNy8yMDIyIDExOjA5IEFNIEVUIApGcm9tOiAgVEVTVGdhcmNpYSwgS0FUSUUgIEQgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6VHJhaW5pbmcgTWVzc2FnZSAxIGZvciBURVNUZ2FyY2lhIAoKICAKR29vZCBtb3JuaW5nICAKICAKICAKS2F0aWUgRC4gVEVTVGdhcmNpYSAgClBBLUMKCiAKL2VzLyBLQVRJRSBELiBURVNUZ2FyY2lhIFBBLUMKUGh5c2ljaWFuIEFzc2lzdGFudApTaWduZWQ6IDA5LzA3LzIwMjIgMDg6MTUK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-09-07T10:15:00Z"
* context.related.reference = "#location-0"

Instance: f74ceff5-15dd-40d0-a7d4-cdf2bab27ccc
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75342335"
Description: "MOVE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.624611"
* contained[=].name.text = "TESTdavis,AHMED S"
* contained[=].name.family = "TESTdavis,AHMED S"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.624611"
* contained[=].name.text = "TESTdavis,AHMED S"
* contained[=].name.family = "TESTdavis,AHMED S"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75342335"
* status = #current
* type = $loinc#11506-3
* type.text = "MOVE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-08-24T11:23:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-08-24T09:23:52Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTU9WRSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNT1ZFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBVUcgMjQsIDIwMjJAMTE6MjMgICAgIEVOVFJZIERBVEU6IEFVRyAyNCwgMjAyMkAwOToyMzo1MiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxBSE1FRCBTICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA4LzI0LzIwMjIgMTE6MjUgQU0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIFdob2xlIEhlYWx0aCBDb2FjaGVzX1ZBUG9ydGxhbmRIQ1MgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgMiBmb3IgQWhtZWQgCgphcztva2M7SkRGO2FkZiAgCkFTT0RDTmQ7a2xmbmpzZDsgIApzbGRpY2puc2xrZG1jbiAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA4LzI0LzIwMjIgMTI6MTMgUE0gRVQgCkZyb206ICBURVNUZGF2aXMsIEFITUVEICBTIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgMiBmb3IgQWhtZWQgCgpIZWxsbwoKIAovZXMvIEFITUVEIFMgVEVTVGRhdmlzCgpTaWduZWQ6IDA4LzI0LzIwMjIgMDk6MjMK"
* content.attachment.title = "MOVE SECURE MESSAGING"
* content.attachment.creation = "2022-08-24T11:23:00Z"
* context.related.reference = "#location-0"

Instance: eac96ae5-e2d3-4c90-9894-4d1f68347705
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 75171050"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.639463"
* contained[=].name.text = "TESTrodriguez,CAITLIN"
* contained[=].name.family = "TESTrodriguez,CAITLIN"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.639463"
* contained[=].name.text = "TESTrodriguez,CAITLIN"
* contained[=].name.family = "TESTrodriguez,CAITLIN"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.75171050"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-08-11T13:29:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-08-11T11:29:24Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBVUcgMTEsIDIwMjJAMTM6MjkgICAgIEVOVFJZIERBVEU6IEFVRyAxMSwgMjAyMkAxMToyOToyNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ryb2RyaWd1ZXosQ0FJVExJTiAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOC8xMS8yMDIyIDAyOjAzIFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBEZWJvZXJfQkhJUCBTb2NpYWwgV29ya19WQVBvcnRsYW5kSENTX0ZhaXJ2aWV3IApTdWJqZWN0OiAgR2VuZXJhbDpUZXN0IE1lc3NhZ2UgMSAKClRlc3QgTWVzc2FnZSAxICAKICAKICAKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwICAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDgvMTEvMjAyMiAwMjoyMiBQTSBFVCAKRnJvbTogIFRFU1Ryb2RyaWd1ZXosIENBSVRMSU4gIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRlc3QgTWVzc2FnZSAxIAoKYXNkZmdoCgogCi9lcy8gQ0FJVExJTiBURVNUcm9kcmlndWV6LCBMQ1NXCkJISVAgU29jaWFsIFdvcmtlcgpTaWduZWQ6IDA4LzExLzIwMjIgMTE6MjkK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-08-11T13:29:00Z"
* context.related.reference = "#location-0"

Instance: e0574562-8746-497d-bbea-67e8ac7c6f4a
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 74791797"
Description: "PROCEDURE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.634497"
* contained[=].name.text = "TESTmartinez,DONNA J"
* contained[=].name.family = "TESTmartinez,DONNA J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.634497"
* contained[=].name.text = "TESTmartinez,DONNA J"
* contained[=].name.family = "TESTmartinez,DONNA J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.74791797"
* status = #current
* type = $loinc#11506-3
* type.text = "PROCEDURE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-07-14T14:19:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-07-14T12:19:32Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJPQ0VEVVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUk9DRURVUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKVUwgMTQsIDIwMjJAMTQ6MTkgICAgIEVOVFJZIERBVEU6IEpVTCAxNCwgMjAyMkAxMjoxOTozMiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixET05OQSBKICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNy8xNC8yMDIyIDAyOjUyIFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBPTVVfUE9QU19TY2hlZHVsaW5nX1ZBUG9ydGxhbmRIQ1NfQCAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIGZvciBEb25uYSAyIAoKYXNkZmFzZmF3ZGYgIAphc2RmXWFzZGZdYXNlZl1hd11GICAKICAKQVNERiAgCkFTICAKREYgIAogIAogIApGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNy8xNC8yMDIyIDAzOjExIFBNIEVUIApGcm9tOiAgVEVTVG1hcnRpbmV6LCBET05OQSAgSiAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDp0ZXN0IG1lc3NhZ2UgZm9yIERvbm5hIDIgCgpsa2RmZ3NsZ2Y7awoKIAovZXMvIERPTk5BIEogVEVTVG1hcnRpbmV6CgpTaWduZWQ6IDA3LzE0LzIwMjIgMTI6MTkK"
* content.attachment.title = "PROCEDURE SECURE MESSAGING"
* content.attachment.creation = "2022-07-14T14:19:00Z"
* context.related.reference = "#location-0"

Instance: bdf442e1-750f-45a0-aafe-e978874a499c
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 74672557"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.637198"
* contained[=].name.text = "TESTsmith,DAVID"
* contained[=].name.family = "TESTsmith,DAVID"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.637198"
* contained[=].name.text = "TESTsmith,DAVID"
* contained[=].name.family = "TESTsmith,DAVID"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.74672557"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-07-06T11:47:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-07-06T09:47:37Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKVUwgMDYsIDIwMjJAMTE6NDcgICAgIEVOVFJZIERBVEU6IEpVTCAwNiwgMjAyMkAwOTo0NzozNyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxEQVZJRCAgICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNy8wNi8yMDIyIDEyOjA1IFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBIb3VnaF9Qc3ljaG9sb2dpc3RfVkFQb3J0bGFuZEhDU19GYWlydmlldyAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIDIgCgphc2RmYXNkZmFzZGZhc2QgIAogIApGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNy8wNi8yMDIyIDEyOjM2IFBNIEVUIApGcm9tOiAgVEVTVHNtaXRoLCBEQVZJRCAgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIDIgCgpnZGRkCgogCi9lcy8gR0VPUkdFIFRFU1RzbWl0aCwgUEguRCwgQUJQUApTVEFGRiBQU1lDSE9MT0dJU1QKU2lnbmVkOiAwNy8wNi8yMDIyIDA5OjQ3Cg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-07-06T11:47:00Z"
* context.related.reference = "#location-0"

Instance: 43a565ad-28aa-4573-a4ac-324aea550b6a
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 74359977"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.120832"
* contained[=].name.text = "TESTjohnson,ALEXANDRIA N"
* contained[=].name.family = "TESTjohnson,ALEXANDRIA N"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.120832"
* contained[=].name.text = "TESTjohnson,ALEXANDRIA N"
* contained[=].name.family = "TESTjohnson,ALEXANDRIA N"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.74359977"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-06-10T11:05:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-06-10T09:50:03Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKVU4gMTAsIDIwMjJAMTE6NTAgICAgIEVOVFJZIERBVEU6IEpVTiAxMCwgMjAyMkAwOTo1MDowMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEFMRVhBTkRSSUEgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNi8xMC8yMDIyIDEyOjQ5IFBNIEVUIApGcm9tOiAgVEVTVGpvaG5zb24sIEFMRVhBTkRSSUEgIE4gClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6ZGZkZiAKCndvdwoKIAovZXMvIEFsZXhhbmRyaWEgTiBURVNUam9obnNvbgpBZHZhbmNlZCBNZWRpY2FsIFN1cHBvcnQgQXNzaXN0YW50ClNpZ25lZDogMDYvMTAvMjAyMiAwOTo1MAo="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-06-10T11:05:00Z"
* context.related.reference = "#location-0"

Instance: 171d2bd5-1366-4827-88e6-643f07705250
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 74359238"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.120832"
* contained[=].name.text = "TESTjohnson,ALEXANDRIA N"
* contained[=].name.family = "TESTjohnson,ALEXANDRIA N"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.120832"
* contained[=].name.text = "TESTjohnson,ALEXANDRIA N"
* contained[=].name.family = "TESTjohnson,ALEXANDRIA N"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.74359238"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-06-10T11:23:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-06-10T09:23:13Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKVU4gMTAsIDIwMjJAMTE6MjMgICAgIEVOVFJZIERBVEU6IEpVTiAxMCwgMjAyMkAwOToyMzoxMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEFMRVhBTkRSSUEgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNi8xMC8yMDIyIDExOjU3IEFNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqKlR2ZWl0ZSBNX1ByaW1hcnkgQ2FyZV9WQVBvcnRsYW5kSENTX0hpbGxzYm9ybyAKU3ViamVjdDogIEdlbmVyYWw6TXNnIGZvciBUcmFpbmluZyAtIFRFU1Rqb2huc29uLCBBbGV4YW5kcmlhIC0gMiAKCnNhZDtsZmtqYXNbZG9mdmtuYVtzZid2YSAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA2LzEwLzIwMjIgMTI6MjEgUE0gRVQgCkZyb206ICBURVNUam9obnNvbiwgQUxFWEFORFJJQSAgTiAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpNc2cgZm9yIFRyYWluaW5nIC0gVEVTVGpvaG5zb24sIEFsZXhhbmRyaWEgLSAyIAoKc2FkZmFzCgogCi9lcy8gQWxleGFuZHJpYSBOIFRFU1Rqb2huc29uCkFkdmFuY2VkIE1lZGljYWwgU3VwcG9ydCBBc3Npc3RhbnQKU2lnbmVkOiAwNi8xMC8yMDIyIDA5OjIzCg=="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-06-10T11:23:00Z"
* context.related.reference = "#location-0"

Instance: f3a217db-318e-4875-9b33-95e7e894c2fc
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 74018973"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.10886"
* contained[=].name.text = "TESTwilliams,CHRISTINA M"
* contained[=].name.family = "TESTwilliams,CHRISTINA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.10886"
* contained[=].name.text = "TESTwilliams,CHRISTINA M"
* contained[=].name.family = "TESTwilliams,CHRISTINA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.74018973"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-05-16T15:04:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-05-16T13:40:06Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVkgMTYsIDIwMjJAMTU6NDAgICAgIEVOVFJZIERBVEU6IE1BWSAxNiwgMjAyMkAxMzo0MDowNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1R3aWxsaWFtcyxDSFJJU1RJTkEgTSAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDUvMTYvMjAyMiAwNDoxNiBQTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKkNhcmUgSW4gVGhlIENvbW11bml0eV9WQVBvcnRsYW5kSENTIApTdWJqZWN0OiAgR2VuZXJhbDpzZGVmc2RmYXNkZiAKCnNkZmFkZmFzZGZhcyAgCiAgCiAgCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA1LzE2LzIwMjIgMDQ6MzcgUE0gRVQgCkZyb206ICBURVNUd2lsbGlhbXMsIENIUklTVElOQSAgTSAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDpzZGVmc2RmYXNkZiAKCnNlbmQgcGljcyAKCiAKL2VzLyBDaHJpc3RpbmEgTSBURVNUd2lsbGlhbXMsIEJTTiwgUk4KUk4gQ29tbXVuaXR5IENhcmUgQ2FzZSBNYW5hZ2VyClNpZ25lZDogMDUvMTYvMjAyMiAxMzo0MAo="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2022-05-16T15:04:00Z"
* context.related.reference = "#location-0"

Instance: bb2e9f89-5bd5-49de-81c8-1f8a0824fb9f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73404339"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.613765"
* contained[=].name.text = "TESTbrown,CLAIRE J"
* contained[=].name.family = "TESTbrown,CLAIRE J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.613765"
* contained[=].name.text = "TESTbrown,CLAIRE J"
* contained[=].name.family = "TESTbrown,CLAIRE J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73404339"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-04-01T13:02:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-04-01T11:20:35Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBBUFIgMDEsIDIwMjJAMTM6MjAgICAgIEVOVFJZIERBVEU6IEFQUiAwMSwgMjAyMkAxMToyMDozNSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ricm93bixDTEFJUkUgSiAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA0LzAxLzIwMjIgMDI6MDYgUE0gRVQgCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIENhbmNlciBDYXJlIE5hdmlnYXRpb24gVGVhbV9Qb3J0bGFuZF8lIApTdWJqZWN0OiAgR2VuZXJhbDp0cmFpbmluZyBtZXNzYWdlIDMgZm9yIFRFU1Ricm93biAKCkxvcmVtIGlwc3VtIGRvbG9yIHNpdCBhbWV0LCBjb25zZWN0ZXR1ciBhZGlwaXNjaW5nIGVsaXQsIAoKCgoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwNC8wMS8yMDIyIDAyOjE2IFBNIEVUIApGcm9tOiAgVEVTVGJyb3duLCBDTEFJUkUgIEogClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6dHJhaW5pbmcgbWVzc2FnZSAzIGZvciBURVNUYnJvd24gCgphc2RmYXNkZiAgCgoKCgoKCgpDbGFpcmUgVEVTVGJyb3duLCBNU1csICBMQ1NXICAKCk9uY29sb2d5IFNvY2lhbCBXb3JrZXIgIAoKCiAKL2VzLyBDbGFpcmUgSiBURVNUYnJvd24sIExDU1cgCk9uY29sb2d5IFNvY2lhbCBXb3JrZXIKU2lnbmVkOiAwNC8wMS8yMDIyIDExOjIwCg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-04-01T13:02:00Z"
* context.related.reference = "#location-0"

Instance: 14c94527-1634-46a8-bceb-3929005dd592
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73325732"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73325732"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-28T12:45:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-28T10:45:09Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMjgsIDIwMjJAMTI6NDUgICAgIEVOVFJZIERBVEU6IE1BUiAyOCwgMjAyMkAxMDo0NTowOSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDMvMjgvMjAyMiAwMTo0MyBQTSBFVCAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgTXlIZWFsdGhlVmV0IENvb3JkaW5hdG9yX1ZBUG9ydGxhbmRIQ1MgClN1YmplY3Q6ICBHZW5lcmFsOnRlc3RpbmcgOy0vIAoKOi8gOy8gOy0vIDstKSAKCgoKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCgpDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKIAovZXMvIEJSSUFOIEsgVEVTVGpvaG5zb24gQkEKU0VDVVJFIE1FU1NBR0lORyBBRE1JTklTVFJBVE9SClNpZ25lZDogMDMvMjgvMjAyMiAxMDo0NQo="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2022-03-28T12:45:00Z"
* context.related.reference = "#location-0"

Instance: d4107cfc-6a1c-43c3-b785-d5f638a9b816
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73170104"
Description: "NUTRITION SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.599832"
* contained[=].name.text = "TESTjones,THEA A R"
* contained[=].name.family = "TESTjones,THEA A R"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.599832"
* contained[=].name.text = "TESTjones,THEA A R"
* contained[=].name.family = "TESTjones,THEA A R"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73170104"
* status = #current
* type = $loinc#11506-3
* type.text = "NUTRITION SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-16T11:26:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-16T09:26:57Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTlVUUklUSU9OIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBOVVRSSVRJT04gU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTYsIDIwMjJAMTE6MjYgICAgIEVOVFJZIERBVEU6IE1BUiAxNiwgMjAyMkAwOToyNjo1NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxUSEVBIEEgUiAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNi8yMDIyIDExOjU0IEFNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqSEJQQ19WQVBvcnRsYW5kSENTX01FVFJPIEJyaWRnZSBDaXR5IApTdWJqZWN0OiAgR2VuZXJhbDpUcmFpbmluZyBNZXNzYWdlIGZvciBUaGVhIDIgCgpMb3JlbSBpcHN1bSBkb2xvciBzaXQgYW1ldCAKCgoKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCgpDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDMvMTYvMjAyMiAxMjoyNSBQTSBFVCAKRnJvbTogIFRFU1Rqb25lcywgVEhFQSAgQSBSIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOlRyYWluaW5nIE1lc3NhZ2UgZm9yIFRoZWEgMiAKCgoKZWF0IHlvdXIgdmVnZ2llcyAgCgoKCgoKVGhlYSBURVNUam9uZXMgCgpEaWV0aXRpYW4KCgogCi9lcy8gVEhFQSBBIFIgVEVTVGpvbmVzCgpTaWduZWQ6IDAzLzE2LzIwMjIgMDk6MjYK"
* content.attachment.title = "NUTRITION SECURE MESSAGING"
* content.attachment.creation = "2022-03-16T11:26:00Z"
* context.related.reference = "#location-0"

Instance: eca1dbf0-bdc3-4f84-bb6e-222b9aafd78c
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73151041"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73151041"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-15T11:29:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-15T09:29:44Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTUsIDIwMjJAMTE6MjkgICAgIEVOVFJZIERBVEU6IE1BUiAxNSwgMjAyMkAwOToyOTo0NCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgogICAqKiogU0VDVVJFIE1FU1NBR0lORyBIYXMgQURERU5EQSAqKioKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNS8yMDIyIDEyOjI4IFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBNeUhlYWx0aGVWZXQgQ29vcmRpbmF0b3JfVkFQb3J0bGFuZEhDUyAKU3ViamVjdDogIEdlbmVyYWw6dGVzdGluZyBzYXZlIGFzIElvVCAKCnNkZmFzZmF3ZXJmCgoKCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIAoKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAzLzE1LzIwMjIgMTI6MjkgUE0gRVQgCkZyb206ICBURVNUam9obnNvbiwgQlJJQU4gIEsgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6dGVzdGluZyBzYXZlIGFzIElvVCAKCmFzZGRmYXNmYXdmCgoKCgoKCgpHbyB0byB0aGUgbmV3IFZBIFBvcnRsYW5kIEhlYWx0aENhcmUgU3lzdGVtIEhvbWVwYWdlOiAKCmh0dHBzOi8vd3d3LnZhLmdvdi9wb3J0bGFuZC1oZWFsdGgtY2FyZS8KCgogCi9lcy8gQlJJQU4gSyBURVNUam9obnNvbiBCQQpTRUNVUkUgTUVTU0FHSU5HIEFETUlOSVNUUkFUT1IKU2lnbmVkOiAwMy8xNS8yMDIyIDA5OjI5CgowMy8xNS8yMDIyIEFEREVORFVNICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVECi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNS8yMDIyIDAxOjM5IFBNIEVUIApGcm9tOiAgVEVTVGpvaG5zb24sIEJSSUFOICBLIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOnRlc3Rpbmcgc2F2ZSBhcyBJb1QgCgp0ZXN0aW5nIHNhdmUvYWRkZW5kYSBpc3N1ZXMgCgoKCgoKCgpHbyB0byB0aGUgbmV3IFZBIFBvcnRsYW5kIEhlYWx0aENhcmUgU3lzdGVtIEhvbWVwYWdlOiAKCmh0dHBzOi8vd3d3LnZhLmdvdi9wb3J0bGFuZC1oZWFsdGgtY2FyZS8KCgogCi9lcy8gQlJJQU4gSyBURVNUam9obnNvbiBCQQpTRUNVUkUgTUVTU0FHSU5HIEFETUlOSVNUUkFUT1IKU2lnbmVkOiAwMy8xNS8yMDIyIDEwOjM5Cg=="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2022-03-15T11:29:00Z"
* context.related.reference = "#location-0"

Instance: 264d0fed-e323-41ff-8b47-4f012812c383
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73142883"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73142883"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-14T17:02:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-14T15:20:05Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTQsIDIwMjJAMTc6MjAgICAgIEVOVFJZIERBVEU6IE1BUiAxNCwgMjAyMkAxNToyMDowNSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgogICAqKiogU0VDVVJFIE1FU1NBR0lORyBIYXMgQURERU5EQSAqKioKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNC8yMDIyIDA0OjIxIFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBNeUhlYWx0aGVWZXQgQ29vcmRpbmF0b3JfVkFQb3J0bGFuZEhDUyAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIAoKc2RmdnNkZmdzZWRmZwoKCgoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNC8yMDIyIDA1OjA4IFBNIEVUIApGcm9tOiAgVEVTVGpvaG5zb24sIEJSSUFOICBLIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBHZW5lcmFsOnRlc3QgbWVzc2FnZSAKCmRzdm9qYWhzO2RvZmlqcwoKCgoKCgoKR28gdG8gdGhlIG5ldyBWQSBQb3J0bGFuZCBIZWFsdGhDYXJlIFN5c3RlbSBIb21lcGFnZTogCgpodHRwczovL3d3dy52YS5nb3YvcG9ydGxhbmQtaGVhbHRoLWNhcmUvCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDMvMTQvMjAyMiAwNjoxOSBQTSBFVCAKRnJvbTogIFRFU1Rqb2huc29uLCBCUklBTiAgSyAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbDp0ZXN0IG1lc3NhZ2UgCgp0ZXN0aW5nIHNhdmUgdG8gY3BycyBhZnRlciBmaXJzdCBzYXZlIHRvIGNwcnMgCgoKCgoKCgpHbyB0byB0aGUgbmV3IFZBIFBvcnRsYW5kIEhlYWx0aENhcmUgU3lzdGVtIEhvbWVwYWdlOiAKCmh0dHBzOi8vd3d3LnZhLmdvdi9wb3J0bGFuZC1oZWFsdGgtY2FyZS8KCgogCi9lcy8gQlJJQU4gSyBURVNUam9obnNvbiBCQQpTRUNVUkUgTUVTU0FHSU5HIEFETUlOSVNUUkFUT1IKU2lnbmVkOiAwMy8xNC8yMDIyIDE1OjIwCgowMy8xNC8yMDIyIEFEREVORFVNICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVECi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNC8yMDIyIDA2OjIyIFBNIEVUIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBNeUhlYWx0aGVWZXQgQ29vcmRpbmF0b3JfVkFQb3J0bGFuZEhDUyAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIAoKdGVzdGluZyBzYXZlIHRvIGNwcnMgCgoKCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIAoKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAzLzE0LzIwMjIgMDY6MjIgUE0gRVQgCkZyb206ICBURVNUam9obnNvbiwgQlJJQU4gIEsgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIEdlbmVyYWw6dGVzdCBtZXNzYWdlIAoKYXc7ZG9rY25hcztsa2RubWMnbGFzYwoKYXNkCgpjYXNkZnYKCmFzZAoKZnYKCmFkc2Z2CgoKCgoKCgoKCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6IAoKaHR0cHM6Ly93d3cudmEuZ292L3BvcnRsYW5kLWhlYWx0aC1jYXJlLwoKCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDAzLzE0LzIwMjIgMTU6MjIK"
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2022-03-14T17:02:00Z"
* context.related.reference = "#location-0"

Instance: 659216b2-6cb7-40a9-b86c-80ee05d477d0
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73075212"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.622989"
* contained[=].name.text = "TESTgarcia,ANNE R"
* contained[=].name.family = "TESTgarcia,ANNE R"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.622989"
* contained[=].name.text = "TESTgarcia,ANNE R"
* contained[=].name.family = "TESTgarcia,ANNE R"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73075212"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-09T14:35:12Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-09T11:35:13Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMDksIDIwMjJAMTQ6MzU6MTIgIEVOVFJZIERBVEU6IE1BUiAwOSwgMjAyMkAxMTozNToxMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RnYXJjaWEsQU5ORSBSICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8wOS8yMDIyIDAxOjUwIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBWYW5jb3V2ZXIgTWVudGFsIEhlYWx0aCBDbGluaWMgQWRtaW5fVkFQb3J0bGFuZEhDUyAKU3ViamVjdDogIFRyYWluaW5nIG1lc3NhZ2UgMSBmb3IgQW5uZSAKCnNhZGY7YUtPRFNERkpOO0FTS0xERgpBU0RGCkFTREZWCkFERlYKQURGRwoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8wOS8yMDIyIDAyOjI3IFBNIApGcm9tOiAgVEVTVGdhcmNpYSwgQU5ORSAgUiAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgVHJhaW5pbmcgbWVzc2FnZSAxIGZvciBBbm5lIAoKZGNkZmRkcwoKCgogCi9lcy8gQU5ORSBSIFRFU1RnYXJjaWEKClNpZ25lZDogMDMvMDkvMjAyMiAxMTozNQo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-03-09T14:35:12Z"
* context.related.reference = "#location-0"

Instance: f7896ac2-829f-4e88-9de0-dedf235e56e8
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 73005364"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.275151"
* contained[=].name.text = "TESTmiller,TAMI L"
* contained[=].name.family = "TESTmiller,TAMI L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.275151"
* contained[=].name.text = "TESTmiller,TAMI L"
* contained[=].name.family = "TESTmiller,TAMI L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.73005364"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-03-04T11:11:43Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-03-04T08:11:43Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMDQsIDIwMjJAMTE6MTE6NDMgIEVOVFJZIERBVEU6IE1BUiAwNCwgMjAyMkAwODoxMTo0MyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsVEFNSSBMICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8wNC8yMDIyIDEwOjAyIEFNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqKk11cmdvaXRpb19QcmltYXJ5Q2FyZV9WQVBvcnRsYW5kSENTX05vcnRoIENvYXN0IApTdWJqZWN0OiAgdHJhaW5pbmcgbWVzc2FnZSBmb3IgVGFtaSAtIDEgCgpzZGZhc2RmYXNkZnNkZmFzCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAzLzA0LzIwMjIgMTA6NTAgQU0gCkZyb206ICBURVNUbWlsbGVyLCBUQU1JICBMIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICB0cmFpbmluZyBtZXNzYWdlIGZvciBUYW1pIC0gMSAKCjpUZXN0CgoKCiAKL2VzLyBUQU1JIEwgVEVTVG1pbGxlcgpBRFZBTkNFRCBNRURJQ0FMIFNVUFBPUlQgQVNTSVNUQU5UClNpZ25lZDogMDMvMDQvMjAyMiAwODoxMQo="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-03-04T11:11:43Z"
* context.related.reference = "#location-0"

Instance: 7d9b7b60-45fe-4d85-8e3f-87e9dd7ebed4
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72818801"
Description: "GASTROENTEROLOGY SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.459239"
* contained[=].name.text = "TESTdavis,NICHOLAS A"
* contained[=].name.family = "TESTdavis,NICHOLAS A"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.459239"
* contained[=].name.text = "TESTdavis,NICHOLAS A"
* contained[=].name.family = "TESTdavis,NICHOLAS A"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72818801"
* status = #current
* type = $loinc#11506-3
* type.text = "GASTROENTEROLOGY SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-02-17T18:01:25Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-02-17T15:01:26Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogR0FTVFJPRU5URVJPTE9HWSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBHQVNUUk9FTlRFUk9MT0dZIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTcsIDIwMjJAMTg6MDE6MjUgIEVOVFJZIERBVEU6IEZFQiAxNywgMjAyMkAxNTowMToyNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxOSUNIT0xBUyBBICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xNy8yMDIyIDA1OjMzIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBHYXN0cm9lbnRlcm9sb2d5IENsaW5pY3NfVkFQb3J0bGFuZEhDU19ESFNNIApTdWJqZWN0OiAgdGVzdCBtZXNzZ2FlIGZvciB0cmFpbmluZyAyIAoKc2RmdnNkZgphc2RmCmFzZApmYXMKZGZhCnNkCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzE3LzIwMjIgMDU6NTUgUE0gCkZyb206ICBURVNUZGF2aXMsIE5JQ0hPTEFTICBBIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICB0ZXN0IG1lc3NnYWUgZm9yIHRyYWluaW5nIDIgCgpzb21lIHN0dWZmICAKbHNka2pmbGRza2ogIAoKCgogCi9lcy8gTklDSE9MQVMgQSBURVNUZGF2aXMKR0kgRmFjaWxpdGF0b3IKU2lnbmVkOiAwMi8xNy8yMDIyIDE1OjAxCg=="
* content.attachment.title = "GASTROENTEROLOGY SECURE MESSAGING"
* content.attachment.creation = "2022-02-17T18:01:25Z"
* context.related.reference = "#location-0"

Instance: 52ece8bd-a1da-49b0-91ed-d7805caf1536
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72809833"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.256509"
* contained[=].name.text = "TESTrodriguez,DEBRA M"
* contained[=].name.family = "TESTrodriguez,DEBRA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.256509"
* contained[=].name.text = "TESTrodriguez,DEBRA M"
* contained[=].name.family = "TESTrodriguez,DEBRA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72809833"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-02-17T13:02:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-02-17T10:07:37Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTcsIDIwMjJAMTM6MDIgICAgIEVOVFJZIERBVEU6IEZFQiAxNywgMjAyMkAxMDowNzozNyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ryb2RyaWd1ZXosREVCUkEgTSAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjoxMCBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgRW1wbG95bWVudCBTZXJ2aWNlc19WQVBvcnRsYW5kSENTX1ZvY2F0aW9uYWwgUmVoYWIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIElJIAoKU2VkIGF0IGJsYW5kaXQgZW5pbSwgbm9uIG1vbGVzdGllIGxlY3R1cy4gVXQgZWxpdCBkb2xvciwgdmFyaXVzIHNpdCBhbWV0IGxlbyAKY29uZGltZW50dW0sIHNjZWxlcmlzcXVlIGRpY3R1bSBlcmF0LiBWaXZhbXVzIGNvbmd1ZSBpbiBtYXNzYSBzb2xsaWNpdHVkaW4gCmZlcm1lbnR1bS4gVmVzdGlidWx1bSBub24gZXggaWQgbGVjdHVzIHBsYWNlcmF0IHVsdHJpY2VzIHNlZCB2ZWwgZG9sb3IuIEZ1c2NlIAp2b2x1dHBhdCBlcm9zIGV0IGxpZ3VsYSBtb2xlc3RpZSwgYWMgZWdlc3RhcyBhbnRlIHNvbGxpY2l0dWRpbi4gUHJhZXNlbnQgCnZlbmVuYXRpcyBpcHN1bSBuaWJoLCB2ZWwgZmFjaWxpc2lzIG9kaW8gZGlnbmlzc2ltIGFjLiBEb25lYyBkb2xvciBlbmltLCAKc3VzY2lwaXQgYXQgbWF1cmlzIHBvc3VlcmUsIGFsaXF1ZXQgdWx0cmljaWVzIGlwc3VtLiAKCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzE3LzIwMjIgMTI6NTcgUE0gCkZyb206ICBURVNUcm9kcmlndWV6LCBERUJSQSAgTSAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgVGVzdCBNZXNzYWdlIGZvciBUcmFpbmluZyBJSSAKCgp4eXoKCgpEZWJyYSBURVNUcm9kcmlndWV6IApWb2NhdGlvbmFsIFJlaGFiaWxpdGF0aW9uIFNwZWNpYWxpc3QgCgoKCiAKL2VzLyBERUJSQSBNIFRFU1Ryb2RyaWd1ZXoKVk9DQVRJT05BTCBSRUhBQiBTUEVDSUFMSVNUClNpZ25lZDogMDIvMTcvMjAyMiAxMDowNwo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-02-17T13:02:00Z"
* context.related.reference = "#location-0"

Instance: e93f06dd-b9fa-4d8e-97e5-ef7bd6ec8281
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72809323"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.259424"
* contained[=].name.text = "TESTmartinez,CHRISTIAN A"
* contained[=].name.family = "TESTmartinez,CHRISTIAN A"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.259424"
* contained[=].name.text = "TESTmartinez,CHRISTIAN A"
* contained[=].name.family = "TESTmartinez,CHRISTIAN A"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72809323"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-02-17T12:46:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-02-17T09:52:11Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTcsIDIwMjJAMTI6NDYgICAgIEVOVFJZIERBVEU6IEZFQiAxNywgMjAyMkAwOTo1MjoxMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixDSFJJU1RJQU4gQSAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjowOSBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgRW1wbG95bWVudCBTZXJ2aWNlc19WQVBvcnRsYW5kSENTX1ZvY2F0aW9uYWwgUmVoYWIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIDEgCgpBbGlxdWFtIGVnZXN0YXMgbWFzc2EgdmVsIGxhY3VzIG9ybmFyZSwgYWxpcXVldCBldWlzbW9kIG5pc2kgc29kYWxlcy4gRG9uZWMgCmltcGVyZGlldCBuaXNpIGV0IG5pc2wgbHVjdHVzLCBuZWMgc2NlbGVyaXNxdWUgbWF1cmlzIHZhcml1cy4gRXRpYW0gbW9sbGlzIAp2ZWxpdCBuaWJoLCB2aXRhZSBzYWdpdHRpcyBqdXN0byB2b2x1dHBhdCB1dC4gRXRpYW0gbGFvcmVldCBvcm5hcmUgbGliZXJvIGF0IAphdWN0b3IuIE51bGxhIHZlbCB0aW5jaWR1bnQgbmliaC4gTW9yYmkgdWx0cmljZXMgYXVndWUgYWMgZXJhdCBtYWxlc3VhZGEgCnNjZWxlcmlzcXVlLiBBbGlxdWFtIG1heGltdXMgbmliaCBuaWJoLiAgCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjo0MyBQTSAKRnJvbTogIFRFU1RtYXJ0aW5leiwgQ0hSSVNUSUFOICBBIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIDEgCgpUZXN0IG1lc3NhZ2UgCgoKCgpDaHJpc3RpYW4gVEVTVG1hcnRpbmV6IApWSEEgVm9jIFJlaGFiIFN1cGVydmlzb3IgCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzE3LzIwMjIgMTI6NDQgUE0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIEVtcGxveW1lbnQgU2VydmljZXNfVkFQb3J0bGFuZEhDU19Wb2NhdGlvbmFsIFJlaGFiIApTdWJqZWN0OiAgVGVzdCBNZXNzYWdlIGZvciBUcmFpbmluZyAxIAoKTEFMQUxBTEFMQUxBTEFMQUwKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjo0NCBQTSAKRnJvbTogIFRFU1RtYXJ0aW5leiwgQ0hSSVNUSUFOICBBIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIDEgCgoKdGVzdAoKCkNocmlzdGlhbiBURVNUbWFydGluZXogClZIQSBWb2MgUmVoYWIgU3VwZXJ2aXNvciAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjo0NCBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgRW1wbG95bWVudCBTZXJ2aWNlc19WQVBvcnRsYW5kSENTX1ZvY2F0aW9uYWwgUmVoYWIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIDEgCgpMQUxBTEFMQUxBTEFMQUxBTAoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xNy8yMDIyIDEyOjQ1IFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBFbXBsb3ltZW50IFNlcnZpY2VzX1ZBUG9ydGxhbmRIQ1NfVm9jYXRpb25hbCBSZWhhYiAKU3ViamVjdDogIFRlc3QgTWVzc2FnZSBmb3IgVHJhaW5pbmcgMSAKCkFTRERPS0ZKQVdTRUlPRkpBUztGSjsKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTcvMjAyMiAxMjo0NSBQTSAKRnJvbTogIFRFU1RtYXJ0aW5leiwgQ0hSSVNUSUFOICBBIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBUZXN0IE1lc3NhZ2UgZm9yIFRyYWluaW5nIDEgCgpmaW5hbGUKCgoKQ2hyaXN0aWFuIFRFU1RtYXJ0aW5leiAKVkhBIFZvYyBSZWhhYiBTdXBlcnZpc29yIAoKCgogCi9lcy8gQ0hSSVNUSUFOIEEgVEVTVG1hcnRpbmV6ClN1cGVydmlzb3IsIFRTRVMKU2lnbmVkOiAwMi8xNy8yMDIyIDA5OjUyCg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2022-02-17T12:46:00Z"
* context.related.reference = "#location-0"

Instance: 1f355acc-922b-4372-b39a-0a762f431219
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72570374"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.542109"
* contained[=].name.text = "TESTsmith,ROBYN D"
* contained[=].name.family = "TESTsmith,ROBYN D"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.542109"
* contained[=].name.text = "TESTsmith,ROBYN D"
* contained[=].name.family = "TESTsmith,ROBYN D"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72570374"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-02-01T10:44:31Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-02-01T07:44:32Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMDEsIDIwMjJAMTA6NDQ6MzEgIEVOVFJZIERBVEU6IEZFQiAwMSwgMjAyMkAwNzo0NDozMiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxST0JZTiBEICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDEvMzEvMjAyMiAwMjo1NiBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKipGb3ggVF9QcmltYXJ5Q2FyZV9WQVBvcnRsYW5kSENTX1NhbGVtVDYgClN1YmplY3Q6ICBUcmFpbmluZyBNZXNzYWdlIDEgZm9yIFJvYnluIAoKO2tkZidzbWRmLAoKb2Fza2Rmb3NwcGtkZidhc2RuIGFzZGZqO2Fpc2RmanYgICBzJ2RrdnYnWyBhZHNqZnZbbyBzZCBmZydbYXMgIGFzZGY7b2ljIHZzZDsgCmZnb3NkZjtvIHZqc28gIAoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8wMS8yMDIyIDEwOjM1IEFNIApGcm9tOiAgVEVTVHNtaXRoLCBST0JZTiAgRCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgVHJhaW5pbmcgTWVzc2FnZSAxIGZvciBSb2J5biAKCmdvdCB5b3VyIG1lc3NhZ2UgCgoKCiAKL2VzLyAuLi4gUm9ieW4gRCBURVNUc21pdGgsIE1TVywgTENTVwpQcmltYXJ5IENhcmUgU29jaWFsIFdvcmtlcgpTaWduZWQ6IDAyLzAxLzIwMjIgMDc6NDQK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2022-02-01T10:44:31Z"
* context.related.reference = "#location-0"

Instance: 6e2d21c7-1f4b-4c94-b2b7-f528944d8315
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72296402"
Description: "PHYSICAL MEDICINE REHAB SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.613275"
* contained[=].name.text = "TESTjohnson,MELISSA A"
* contained[=].name.family = "TESTjohnson,MELISSA A"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.613275"
* contained[=].name.text = "TESTjohnson,MELISSA A"
* contained[=].name.family = "TESTjohnson,MELISSA A"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72296402"
* status = #current
* type = $loinc#11506-3
* type.text = "PHYSICAL MEDICINE REHAB SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2022-01-11T13:20:34Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2022-01-11T10:20:34Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEhZU0lDQUwgTUVESUNJTkUgUkVIQUIgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQSFlTSUNBTCBNRURJQ0lORSBSRUhBQiBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMTEsIDIwMjJAMTM6MjA6MzQgIEVOVFJZIERBVEU6IEpBTiAxMSwgMjAyMkAxMDoyMDozNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLE1FTElTU0EgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMS8xMC8yMDIyIDAxOjEzIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBBY3RpdmUgTW92ZW1lbnRfVkFQb3J0bGFuZEhDU19STFRDIApTdWJqZWN0OiAgVHJhaW5pbmcgTWVzc2FnZSAxIGZvciBNZWxpc3NhIAoKTG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2NpbmcgZWxpdC4gCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAxLzExLzIwMjIgMDE6MTQgUE0gCkZyb206ICBURVNUam9obnNvbiwgTUVMSVNTQSAgQSAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgVHJhaW5pbmcgTWVzc2FnZSAxIGZvciBNZWxpc3NhIAoKZ2ggZmhzIGRmZ3NkZyBnZiAKCgoKIAovZXMvIE1FTElTU0EgQSBURVNUam9obnNvbgpQVEEsIEFDVElWRSBNT1ZFTUVOVCBUSEVSQVBJU1QKU2lnbmVkOiAwMS8xMS8yMDIyIDEwOjIwCg=="
* content.attachment.title = "PHYSICAL MEDICINE REHAB SECURE MESSAGING"
* content.attachment.creation = "2022-01-11T13:20:34Z"
* context.related.reference = "#location-0"

Instance: c4626fee-2c20-48c8-894a-1f64856120b6
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 72111779"
Description: "NEUROLOGY SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.168879"
* contained[=].name.text = "TESTwilliams,LISA G"
* contained[=].name.family = "TESTwilliams,LISA G"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.168879"
* contained[=].name.text = "TESTwilliams,LISA G"
* contained[=].name.family = "TESTwilliams,LISA G"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.72111779"
* status = #current
* type = $loinc#11506-3
* type.text = "NEUROLOGY SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-12-27T14:12:48Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-12-27T11:12:48Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTkVVUk9MT0dZIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBORVVST0xPR1kgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMjcsIDIwMjFAMTQ6MTI6NDggIEVOVFJZIERBVEU6IERFQyAyNywgMjAyMUAxMToxMjo0OCAgICAgIAogICAgICBBVVRIT1I6IFRFU1R3aWxsaWFtcyxMSVNBIEcgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTIvMjcvMjAyMSAwMTowMyBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgTmV1cm9sb2d5IENsaW5pY3NfUG9ydGxhbmRfQCAKU3ViamVjdDogIFRyYWluaW5nIE1zZyAzIGZvciBMaXNhIFRFU1R3aWxsaWFtcyAKCkxvcmVtIElwc3VtIGRvbG9yIHNpdCBhbWV0IAoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMi8yNy8yMDIxIDAyOjAzIFBNIApGcm9tOiAgVEVTVHdpbGxpYW1zLCBMSVNBICBHIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBUcmFpbmluZyBNc2cgMyBmb3IgTGlzYSBURVNUd2lsbGlhbXMgCgpEb25lCgoKCiAKL2VzLyBMSVNBIEcgVEVTVHdpbGxpYW1zLCBMQ1NXCgpTaWduZWQ6IDEyLzI3LzIwMjEgMTE6MTIK"
* content.attachment.title = "NEUROLOGY SECURE MESSAGING"
* content.attachment.creation = "2021-12-27T14:12:48Z"
* context.related.reference = "#location-0"

Instance: cee76d4b-9a3d-4afe-94fe-777c28b12713
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71862543"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71862543"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-12-07T16:22:05Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-12-07T13:22:51Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMDcsIDIwMjFAMTY6MjI6NTAgIEVOVFJZIERBVEU6IERFQyAwNywgMjAyMUAxMzoyMjo1MSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTIvMDcvMjAyMSAwNDowOCBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKkNhcmUgSW4gVGhlIENvbW11bml0eV9WQVBvcnRsYW5kSENTIApTdWJqZWN0OiAgZmdhc2Zhc2Rmc2FlZWYgCgpzZGZhZGZnc2ZkZ2hzZ2hzZGZnc2RmZwoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMi8wNy8yMDIxIDA0OjE4IFBNIApGcm9tOiAgVEVTVGpvaG5zb24sIEJSSUFOICBLIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBmZ2FzZmFzZGZzYWVlZiAKCmloamFzZGZsaWFrc2RoamY7YXNqCgoKCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6IApodHRwczovL3d3dy52YS5nb3YvcG9ydGxhbmQtaGVhbHRoLWNhcmUvCgoKCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDEyLzA3LzIwMjEgMTM6MjIK"
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2021-12-07T16:22:05Z"
* context.related.reference = "#location-0"

Instance: 60c71fe0-1c84-480e-b99a-7dab88b99c59
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71772303"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.128942"
* contained[=].name.text = "TESTbrown,KAITLIN Z"
* contained[=].name.family = "TESTbrown,KAITLIN Z"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.128942"
* contained[=].name.text = "TESTbrown,KAITLIN Z"
* contained[=].name.family = "TESTbrown,KAITLIN Z"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71772303"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-12-01T11:15:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-12-01T08:17:57Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMDEsIDIwMjFAMTE6MTUgICAgIEVOVFJZIERBVEU6IERFQyAwMSwgMjAyMUAwODoxNzo1NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ricm93bixLQUlUTElOIFogICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTIvMDEvMjAyMSAxMTowNSBBTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKipIYXdzX1dvbWVuJ3MgSGVhbHRoX1ZBUG9ydGxhbmRIQ1NfWWVsbG93IFRlYW0gClN1YmplY3Q6ICBBU0RGU0RSRiAKClNERkFTRVJGCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDEyLzAxLzIwMjEgMTE6MTUgQU0gCkZyb206ICBURVNUYnJvd24sIEtBSVRMSU4gIFouIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBBU0RGU0RSRiAKCmZrZGpmbGRmamZqCgoKCiAKL2VzLyBLQUlUTElOIFouIFRFU1Ricm93biBETlAsIFdIQ05QLCBBTlAKU3RhZmYgQXR0ZW5kaW5nIE51cnNlIFByYWN0aXRpb25lcgpTaWduZWQ6IDEyLzAxLzIwMjEgMDg6MTcK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2021-12-01T11:15:00Z"
* context.related.reference = "#location-0"

Instance: f42182e2-ebdd-430c-84d0-5a176fda3ba9
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71752791"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71752791"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-11-30T11:39:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-11-30T08:41:45Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMzAsIDIwMjFAMTE6MzkgICAgIEVOVFJZIERBVEU6IE5PViAzMCwgMjAyMUAwODo0MTo0NSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTEvMzAvMjAyMSAxMDozNyBBTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgVm9jYXRpb25hbCBSZWhhYi1FbXBsb3ltZW50IFNlcnZpY2VzX1ZBUG9ydGxhbmRIQ1MgClN1YmplY3Q6ICBUZXN0IFBhdGllbnQgTWVzc2FnZSBmb3IgVHJhaW5pbmcgKDMpIAoKTWFsZXN1YWRhIGZhbWVzIGFjIHR1cnBpcyBlZ2VzdGFzIG1hZWNlbmFzIHBoYXJldHJhIGNvbnZhbGxpcyBwb3N1ZXJlIG1vcmJpLiAKVmVzdGlidWx1bSBtYXR0aXMgdWxsYW1jb3JwZXIgdmVsaXQgc2VkIHVsbGFtY29ycGVyIG1vcmJpIHRpbmNpZHVudCBvcm5hcmUgCm1hc3NhLiBSaXN1cyBudWxsYW0gZWdldCBmZWxpcyBlZ2V0IG51bmMgbG9ib3J0aXMgbWF0dGlzLiBTZW0gbnVsbGEgcGhhcmV0cmEgCmRpYW0gc2l0IGFtZXQgbmlzbC4gCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDExLzMwLzIwMjEgMTE6MzggQU0gCkZyb206ICBURVNUam9obnNvbiwgQlJJQU4gIEsgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIFRlc3QgUGF0aWVudCBNZXNzYWdlIGZvciBUcmFpbmluZyAoMykgCgoKeGNnc2RnZHJhZwoKCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6IApodHRwczovL3d3dy52YS5nb3YvcG9ydGxhbmQtaGVhbHRoLWNhcmUvCgoKCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDExLzMwLzIwMjEgMDg6NDEK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2021-11-30T11:39:00Z"
* context.related.reference = "#location-0"

Instance: c89942ef-5040-45bd-a55f-223c1da66269
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71752249"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71752249"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-11-30T11:22:45Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-11-30T08:22:46Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMzAsIDIwMjFAMTE6MjI6NDUgIEVOVFJZIERBVEU6IE5PViAzMCwgMjAyMUAwODoyMjo0NiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTEvMzAvMjAyMSAxMToyMiBBTSAKRnJvbTogIFRFU1Rqb2huc29uLCBCUklBTiAgSyAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgR2VuZXJhbCBJbnF1aXJ5IAoKc2VmYWV0Z3NkZwoKCkdvIHRvIHRoZSBuZXcgVkEgUG9ydGxhbmQgSGVhbHRoQ2FyZSBTeXN0ZW0gSG9tZXBhZ2U6IApodHRwczovL3d3dy52YS5nb3YvcG9ydGxhbmQtaGVhbHRoLWNhcmUvCgoKCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDExLzMwLzIwMjEgMDg6MjIK"
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2021-11-30T11:22:45Z"
* context.related.reference = "#location-0"

Instance: fb1c87a0-31fc-45eb-8474-543ed6c3fb4c
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71665774"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71665774"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-11-22T15:46:59Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-11-22T12:47:00Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMjIsIDIwMjFAMTU6NDY6NTkgIEVOVFJZIERBVEU6IE5PViAyMiwgMjAyMUAxMjo0NyAgICAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTEvMjIvMjAyMSAwMzo0MiBQTSAKRnJvbTogIFRFU1Rqb2huc29uLCBCUklBTiAgSyAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgUmVwbHkgYW5kIFNhdmUgdG8gQ1BSUyAKCgppbGhnaXl0O2l1dDsKCgpHbyB0byB0aGUgbmV3IFZBIFBvcnRsYW5kIEhlYWx0aENhcmUgU3lzdGVtIEhvbWVwYWdlOiAKaHR0cHM6Ly93d3cudmEuZ292L3BvcnRsYW5kLWhlYWx0aC1jYXJlLwoKCgogCi9lcy8gQlJJQU4gSyBURVNUam9obnNvbiBCQQpTRUNVUkUgTUVTU0FHSU5HIEFETUlOSVNUUkFUT1IKU2lnbmVkOiAxMS8yMi8yMDIxIDEyOjQ3Cg=="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2021-11-22T15:46:59Z"
* context.related.reference = "#location-0"

Instance: d49a533a-e84f-49f8-bec4-bff73b01f699
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71325501"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.606591"
* contained[=].name.text = "TESTjones,FUHUA H"
* contained[=].name.family = "TESTjones,FUHUA H"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.606591"
* contained[=].name.text = "TESTjones,FUHUA H"
* contained[=].name.family = "TESTjones,FUHUA H"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71325501"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-10-28T13:22:37Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-10-28T10:22:38Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMjgsIDIwMjFAMTM6MjI6MzcgIEVOVFJZIERBVEU6IE9DVCAyOCwgMjAyMUAxMDoyMjozOCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxGVUhVQSBIICAgICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDEwLzI4LzIwMjEgMTE6MjkgQU0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogICoqR3VvX1ByaW1hcnkgQ2FyZV9WQVBvcnRsYW5kSENTX1ZhbmNvdXZlciAKU3ViamVjdDogIEZvciBEci4gVEVTVGpvbmVzIC0tIFRyYWluaW5nIE1TRyAxIAoKYXNkc2FkZgoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8yOC8yMDIxIDAxOjEyIFBNIApGcm9tOiAgVEVTVGpvbmVzLCBGVUhVQSAgSCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgRm9yIERyLiBURVNUam9uZXMgLS0gVHJhaW5pbmcgTVNHIDEgCgoKaGksIHRoYW5rIHlvdSBmb3IgCgoKRnVodWEgSG9sbHkgVEVTVGpvbmVzICAKTUQKCgoKIAovZXMvIEZVSFVBIEggVEVTVGpvbmVzIE1EIApQcmltYXJ5IGNhcmUgcGh5c2ljaWFuIApTaWduZWQ6IDEwLzI4LzIwMjEgMTA6MjIK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2021-10-28T13:22:37Z"
* context.related.reference = "#location-0"

Instance: da91b2b4-77c8-4a73-a486-391f6a16e816
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71322514"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.73612"
* contained[=].name.text = "TESTgarcia,DEXTER J"
* contained[=].name.family = "TESTgarcia,DEXTER J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.73612"
* contained[=].name.text = "TESTgarcia,DEXTER J"
* contained[=].name.family = "TESTgarcia,DEXTER J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71322514"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-10-28T11:52:28Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-10-28T08:52:29Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMjgsIDIwMjFAMTE6NTI6MjggIEVOVFJZIERBVEU6IE9DVCAyOCwgMjAyMUAwODo1MjoyOSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RnYXJjaWEsREVYVEVSIEogICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTAvMjgvMjAyMSAxMTozMSBBTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKipBc3VuY2lvbl9QcmltYXJ5IENhcmVfVkFQb3J0bGFuZEhDU19WYW5jb3V2ZXIgClN1YmplY3Q6ICBGb3IgRHIuIFRFU1RnYXJjaWEgLS0gVHJhaW5pbmcgTVNHIDEgCgpzZDt2b2lramFzZGljb2pTRAoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8yOC8yMDIxIDExOjQ2IEFNIApGcm9tOiAgVEVTVGdhcmNpYSwgREVYVEVSICBKIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBGb3IgRHIuIFRFU1RnYXJjaWEgLS0gVHJhaW5pbmcgTVNHIDEgCgpoZWxsbwoKCgogCi9lcy8gREVYVEVSIEogVEVTVGdhcmNpYQpQcmltYXJ5IENhcmUgUGh5c2ljaWFuLCBNRApTaWduZWQ6IDEwLzI4LzIwMjEgMDg6NTIK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2021-10-28T11:52:28Z"
* context.related.reference = "#location-0"

Instance: 5e30871b-d2ea-4e17-a37b-792f3ac428f6
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71304508"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.180012"
* contained[=].name.text = "TESTmiller,MELINDA"
* contained[=].name.family = "TESTmiller,MELINDA"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.180012"
* contained[=].name.text = "TESTmiller,MELINDA"
* contained[=].name.family = "TESTmiller,MELINDA"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71304508"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-10-27T12:27:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-10-27T09:29:22Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMjcsIDIwMjFAMTI6MjcgICAgIEVOVFJZIERBVEU6IE9DVCAyNywgMjAyMUAwOToyOToyMiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsTUVMSU5EQSAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTAvMjcvMjAyMSAxMjoxOSBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgVEVTVG1pbGxlciBNX1ZhbmNvdXZlciBNZW50YWwgSGVhbHRoIENsaW5pY18lIApTdWJqZWN0OiAgdGVzdGluZyBXTEMgRnVuY3Rpb24gCgpMb3JlbSBJcHN1bSAKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTAvMjcvMjAyMSAxMjoyNiBQTSAKRnJvbTogIFRFU1RtaWxsZXIsIE1FTElOREEgIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICB0ZXN0aW5nIFdMQyBGdW5jdGlvbiAKCm5qbmtqbmtuCgoKCiAKL2VzLyBNYWxpbmRhIFRFU1RtaWxsZXIsIFBoRApMaWNlbnNlZCBQc3ljaG9sb2dpc3QKU2lnbmVkOiAxMC8yNy8yMDIxIDA5OjI5Cg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2021-10-27T12:27:00Z"
* context.related.reference = "#location-0"

Instance: 26f32c84-dde0-4837-8353-fb6005799404
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 71140372"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.604969"
* contained[=].name.text = "TESTdavis,SCIERRA H"
* contained[=].name.family = "TESTdavis,SCIERRA H"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.604969"
* contained[=].name.text = "TESTdavis,SCIERRA H"
* contained[=].name.family = "TESTdavis,SCIERRA H"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.71140372"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-10-15T13:47:44Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-10-15T10:47:45Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBPQ1QgMTUsIDIwMjFAMTM6NDc6NDQgIEVOVFJZIERBVEU6IE9DVCAxNSwgMjAyMUAxMDo0Nzo0NSAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxTQ0lFUlJBIEggICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMC8xNS8yMDIxIDAxOjAyIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICAqKlN1bW1hciBBX1ByaW1hcnkgQ2FyZV9WQVBvcnRsYW5kSENTX1NhbGVtVDExIApTdWJqZWN0OiAgU00gVHJhaW5pbmcgTXNnIDEgZm9yIFNjaWVycmEgCgpmYXdmYXdlcmZhc2dmYWVyZmcKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTAvMTUvMjAyMSAwMTozNiBQTSAKRnJvbTogIFRFU1RkYXZpcywgU0NJRVJSQSAgSCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgU00gVHJhaW5pbmcgTXNnIDEgZm9yIFNjaWVycmEgCgpIZWxsbwoKCgpTY2llcnJhIFRFU1RkYXZpcyAKUk4sIEJTTi1CQyBTYWxlbSBDQk9DIAoKCgogCi9lcy8gU0NJRVJSQSBIIFRFU1RkYXZpcwpSTiwgQlNOClNpZ25lZDogMTAvMTUvMjAyMSAxMDo0Nwo="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2021-10-15T13:47:44Z"
* context.related.reference = "#location-0"

Instance: 3ce3187f-5596-4dce-aba9-efeb0b760bf4
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 70937773"
Description: "MHD - NON-VISIT NOTE"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2099"
* contained[=].name.text = "TESTbrown,ERICK H"
* contained[=].name.family = "TESTbrown,ERICK H"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2099"
* contained[=].name.text = "TESTbrown,ERICK H"
* contained[=].name.family = "TESTbrown,ERICK H"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648GF"
* contained[=].name = "HILLSBORO VA CLINIC"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.70937773"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-09-30T14:53:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-09-30T14:58:48Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUhEIC0gTk9OLVZJU0lUIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIE9VVFBBVElFTlQgTk9URSAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMzAsIDIwMjFAMTQ6NTMgICAgIEVOVFJZIERBVEU6IFNFUCAzMCwgMjAyMUAxNDo1Mzo0OCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ricm93bixFUklDSyBIICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKSGVyZSdzIHRoZSB0ZW1wbGF0ZSBJIHVzZSB0byByZXBvcnQgdGhlIENvbm5vcnMgc2NvcmVzLgoKClJFU1VMVFMgT0YgQ0FBUlMtU0VMRi1SRVBPUlQ6IExPTkcgVkVSU0lPTgogClNjYWxlICAgQ2x1c3RlciAgICAgICAgICAgICAgICAgVC1TY29yZQogCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMwICAgIDQwICAgIDUwICAgIDYwICAgIDcwICAgIDgwICAgIDkwCiAKQSAgSW5hdHRuL01lbSAgICAgICAgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKQiAgSHlwcmN0dnR5L1JzdGxzcyAgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKQyAgSW1wbHN2dHkvTGFiaWxpdHkgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKRCAgUHJvYnMgdyBTZWxmIENvbmNwdCAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKRSAgRFNNLUlWIEluYXR0ZW50aXZlICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKRiAgRFNNLUlWIEh5cHJjdHYtSW1wbHN2ICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKRyAgRFNNLUlWIEFESEQgU3ggVG90ICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKSCAgQURIRCBJbmRleCAgICAgICAgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKIApJbmNvbnNpc3RlbmN5IGluZGV4IHRvdGFsIHNjb3JlOiAgICAgICAgWFggICg8IDgpCiAKQ29tbWVudDoKICAgICAgICBbc3VtbWFyeSBzdGF0ZW1lbnQgcmUgd2hldGhlciBpdCBsb29rcyBsaWtlIGhlL3NoZSBoYXMgdGhlIGR4IGFuZCB0aGUgCnR5cGUuXQoKCgoKSSB0aGVuIHVzZSB0aGUgZGVsZXRlIGtleSBsaWtlIHRoaXM6CgoKClNjYWxlICAgQ2x1c3RlciAgICAgICAgICAgICAgICAgVC1TY29yZQogCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMwICAgIDQwICAgIDUwICAgIDYwICAgIDcwICAgIDgwICAgIDkwCiAKQSAgSW5hdHRuL01lbSAgICAgICAgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjg3CkIgIEh5cHJjdHZ0eS9Sc3Rsc3MgICAgICAgICAgICAgKioqKioqKioqKioqKioqKioqKio2NQpDICBJbXBsc3Z0eS9MYWJpbGl0eSAgICAgICAgICAgICoqKioqKioqKioqKioqKioqKioqKioqKioqNzUKRCAgUHJvYnMgdyBTZWxmIENvbmNwdCAgICAgICAgICAqKioqKioqKioqKioqKioqKio2MQpFICBEU00tSVYgSW5hdHRlbnRpdmUgICAgICAgICAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio4NApGICBEU00tSVYgSHlwcmN0di1JbXBsc3YgICAgICAgICoqKioqKioqKioqKioqKioqKioqKioqNzEKRyAgRFNNLUlWIEFESEQgU3ggVG90ICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqODAKSCAgQURIRCBJbmRleCAgICAgICAgICAgICAgICAgICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjg2CgpldGMuIAogCi9lcy8gRVJJQ0sgSCBURVNUYnJvd24sIE1EClN0YWZmIFBzeWNoaWF0cmlzdApTaWduZWQ6IDA5LzMwLzIwMjEgMTQ6NTgK"
* content.attachment.title = "MHD - NON-VISIT NOTE"
* content.attachment.creation = "2021-09-30T14:53:00Z"
* context.related.reference = "#location-0"

Instance: a574dd51-894e-460a-a3b8-d1e369f3e614
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 70869767"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.596007"
* contained[=].name.text = "TESTrodriguez,NATHAN G"
* contained[=].name.family = "TESTrodriguez,NATHAN G"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.596007"
* contained[=].name.text = "TESTrodriguez,NATHAN G"
* contained[=].name.family = "TESTrodriguez,NATHAN G"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.70869767"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-09-27T12:20:01Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-09-27T09:20:02Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMjcsIDIwMjFAMTI6MjA6MDEgIEVOVFJZIERBVEU6IFNFUCAyNywgMjAyMUAwOToyMDowMiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ryb2RyaWd1ZXosTkFUSEFOIEcgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA5LzI3LzIwMjEgMTE6NDcgQU0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIFpaX1ZIQVBPUl9CUklBTiAKU3ViamVjdDogIFRlc3QgTWVzc2FnZSBmb3IgVHJhaW5pbmcgMiAKCkxvcmVtIGlwc3VtIGRvbG9yIHNpdCBhbWV0LCBjb25zZWN0ZXR1ciBhZGlwaXNjaW5nIGVsaXQuIE1hZWNlbmFzIGxvYm9ydGlzIHF1YW0gCmFjIHRlbXB1cyBwbGFjZXJhdC4gTnVuYyB2ZXN0aWJ1bHVtIG1vbGxpcyBudW5jLCBldCBzb2RhbGVzIGR1aSB1bHRyaWNpZXMgcXVpcy4gClZlc3RpYnVsdW0gbm9uIGFsaXF1YW0gcXVhbSwgdmVsIGludGVyZHVtIGRvbG9yLiBOdWxsYSBjb25kaW1lbnR1bSBwb3N1ZXJlIGFyY3UgCm5lYyBibGFuZGl0LiBNb3JiaSBhdCBzZW0gcXVpcyBhbnRlIGltcGVyZGlldCBhY2N1bXNhbiBhYyBlZ2V0IGFyY3UuIEFlbmVhbiAKcXVpcyBlbmltIG5pYmguIE5hbSBwb3J0dGl0b3IgZmVsaXMgYXQgZXggdml2ZXJyYSwgaWQgdGVtcG9yIGVyb3MgdmVuZW5hdGlzLiAKRG9uZWMgc2VtcGVyIHR1cnBpcyBtYXVyaXMsIGEgY29tbW9kbyBuaXNsIHBvcnRhIGF0LiBOdWxsYSBpZCB0dXJwaXMgdG9ydG9yLiAKU3VzcGVuZGlzc2UgZXUgZmVsaXMgZmV1Z2lhdCwgbGFvcmVldCBzZW0gbmVjLCBmZXVnaWF0IGV4LiAKCkFsaXF1YW0gaW1wZXJkaWV0IGFsaXF1YW0gbWFnbmEgc2l0IGFtZXQgbGFjaW5pYS4gQWxpcXVhbSBlcmF0IHZvbHV0cGF0LiBQcm9pbiAKaWQgaXBzdW0gdmFyaXVzLCBwbGFjZXJhdCB0dXJwaXMgc2VkLCBhY2N1bXNhbiBsaWd1bGEuIFByYWVzZW50IGV0IGZpbmlidXMgCmZlbGlzLiBOdW5jIGV1IGRpZ25pc3NpbSBsb3JlbS4gUGhhc2VsbHVzIHV0IGRpYW0gbmlzbC4gRG9uZWMgdXQgZXJvcyBhYyB1cm5hIAppYWN1bGlzIHRlbXBvci4gU2VkIHNpdCBhbWV0IHNjZWxlcmlzcXVlIHB1cnVzLiBQcmFlc2VudCBtb2xsaXMgZmFjaWxpc2lzIGVsaXQsIAphYyBtYWxlc3VhZGEgbGVvIGNvbnNlY3RldHVyIHV0LiBMb3JlbSBpcHN1bSBkb2xvciBzaXQgYW1ldCwgY29uc2VjdGV0dXIgCmFkaXBpc2NpbmcgZWxpdC4gSW4gaGFjIGhhYml0YXNzZSBwbGF0ZWEgZGljdHVtc3QuIEFsaXF1YW0gc2VtIHNhcGllbiwgZGFwaWJ1cyAKcGhhcmV0cmEgdG9ydG9yIHV0LCBsYW9yZWV0IGRhcGlidXMgZXguIFZpdmFtdXMgbW9sZXN0aWUgZXVpc21vZCB1cm5hIGFjIApjb252YWxsaXMuIEluIGRhcGlidXMgZXJhdCBldCBsdWN0dXMgZmV1Z2lhdC4gTWFlY2VuYXMgYXQgc2FwaWVuIGVmZmljaXR1ciwgCnZlc3RpYnVsdW0gZXJvcyBhLCBmaW5pYnVzIG9yY2kuIEZ1c2NlIGF0IHBvcnR0aXRvciB0b3J0b3IsIHF1aXMgdGVtcG9yIGRpYW0uIAoKRnVzY2UgcHVsdmluYXIgb3JjaSBuZWMgbG9yZW0gaW50ZXJkdW0gdnVscHV0YXRlLiBDdXJhYml0dXIgYWxpcXVhbSB1bHRyaWNlcyAKc2FwaWVuLCBxdWlzIGZhY2lsaXNpcyBsb3JlbSBwZWxsZW50ZXNxdWUgdmVsLiBOdWxsYW0gbWFsZXN1YWRhIGFyY3UgdXQgCmZyaW5naWxsYSBldWlzbW9kLiBDcmFzIHNlZCBxdWFtIG5lcXVlLiBNYXVyaXMgdmVuZW5hdGlzIHRpbmNpZHVudCBlcmF0IGFjIAplZ2VzdGFzLiBOdWxsYSBsYWN1cyBtaSwgbGFjaW5pYSBhIHBlbGxlbnRlc3F1ZSBxdWlzLCBmYWNpbGlzaXMgZGFwaWJ1cyBudW5jLiAKRXRpYW0gbGFvcmVldCBtYXNzYSBpZCBtYWduYSB0aW5jaWR1bnQsIHNlZCB2dWxwdXRhdGUgdmVsaXQgc29sbGljaXR1ZGluLiBEdWlzIApzY2VsZXJpc3F1ZSwgbWFnbmEgZXUgcmhvbmN1cyBzb2RhbGVzLCBtYXNzYSBuaWJoIHVsdHJpY2VzIGRpYW0sIGV1IGRpY3R1bSAKdGVsbHVzIHR1cnBpcyB1dCBtYWduYS4gUGhhc2VsbHVzIGF1Y3RvciBtYWduYSB1cm5hLCBhIGZhdWNpYnVzIGVzdCBtb2xlc3RpZSAKdml0YWUuIE9yY2kgdmFyaXVzIG5hdG9xdWUgcGVuYXRpYnVzIGV0IG1hZ25pcyBkaXMgcGFydHVyaWVudCBtb250ZXMsIG5hc2NldHVyIApyaWRpY3VsdXMgbXVzLiBEdWlzIHV0IGN1cnN1cyBudWxsYS4gCgoKRmx1IFNob3QgSW5mbzogaHR0cHM6Ly93d3cucG9ydGxhbmQudmEuZ292L25ld3MvZmx1c2hvdHMuYXNwIApDb3ZpZC0xOSBJbmZvOiBodHRwOi8vdGlueS5jYy8xdDZ4a3ogCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA5LzI3LzIwMjEgMTI6MTggUE0gCkZyb206ICBURVNUcm9kcmlndWV6LCBOQVRIQU4gIEcgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIFRlc3QgTWVzc2FnZSBmb3IgVHJhaW5pbmcgMiAKCmprZmQKCgoKIAovZXMvIE5BVEhBTiBHIFRFU1Ryb2RyaWd1ZXoKSEVBTFRIIFRFQ0hOSUNJQU4KU2lnbmVkOiAwOS8yNy8yMDIxIDA5OjIwCg=="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2021-09-27T12:20:01Z"
* context.related.reference = "#location-0"

Instance: b56bb1d8-8400-41c2-917f-808e31c831ad
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 70712968"
Description: "GERIATRIC MEDICINE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.594707"
* contained[=].name.text = "TESTmartinez,MCKENNA R"
* contained[=].name.family = "TESTmartinez,MCKENNA R"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.594707"
* contained[=].name.text = "TESTmartinez,MCKENNA R"
* contained[=].name.family = "TESTmartinez,MCKENNA R"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.70712968"
* status = #current
* type = $loinc#11506-3
* type.text = "GERIATRIC MEDICINE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-09-15T13:58:04Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-09-15T10:58:04Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogR0VSSUFUUklDIE1FRElDSU5FIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBHRVJJQVRSSUMgTUVESUNJTkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMTUsIDIwMjFAMTM6NTg6MDQgIEVOVFJZIERBVEU6IFNFUCAxNSwgMjAyMUAxMDo1ODowNCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixNQ0tFTk5BIFIgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDA5LzE1LzIwMjEgMDE6MzYgUE0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApUbzogIFBhbGxpYXRpdmUgQ2FyZV9WQVBvcnRsYW5kSENTX0RIU00gClN1YmplY3Q6ICB0ZXN0IG1lc3NhZ2UgZm9yIE1jS2VubmEgMSAKCmFzZGZbb2Fpc2RqZltvYWlzZGpmW09TRkkKCgpGbHUgU2hvdCBJbmZvOiBodHRwczovL3d3dy5wb3J0bGFuZC52YS5nb3YvbmV3cy9mbHVzaG90cy5hc3AgCkNvdmlkLTE5IEluZm86IGh0dHA6Ly90aW55LmNjLzF0NnhreiAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDkvMTUvMjAyMSAwMTo1MiBQTSAKRnJvbTogIFRFU1RtYXJ0aW5leiwgTUNLRU5OQSAgUiAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgdGVzdCBtZXNzYWdlIGZvciBNY0tlbm5hIDEgCgpoc29mYXNoamtmYQoKCgpNY0tlbm5hIFRFU1RtYXJ0aW5leiAKUENDVCBTVyBGZWxsb3cgCgoKCiAKL2VzLyBNQ0tFTk5BIFIgVEVTVG1hcnRpbmV6LCBNU1cKUENDVCBTVyBGZWxsb3cKU2lnbmVkOiAwOS8xNS8yMDIxIDEwOjU4Cg=="
* content.attachment.title = "GERIATRIC MEDICINE SECURE MESSAGING"
* content.attachment.creation = "2021-09-15T13:58:04Z"
* context.related.reference = "#location-0"

Instance: 31699637-62e1-4a92-878e-3c37ac7b732e
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 70562005"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.600088"
* contained[=].name.text = "TESTsmith,ROSEANN F"
* contained[=].name.family = "TESTsmith,ROSEANN F"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.600088"
* contained[=].name.text = "TESTsmith,ROSEANN F"
* contained[=].name.family = "TESTsmith,ROSEANN F"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.70562005"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2021-09-03T12:32:57Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2021-09-03T09:32:57Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBTRVAgMDMsIDIwMjFAMTI6MzI6NTcgIEVOVFJZIERBVEU6IFNFUCAwMywgMjAyMUAwOTozMjo1NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RzbWl0aCxST1NFQU5OIEYgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOS8wMy8yMDIxIDEyOjA3IFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKVG86ICBQQyBNZW50YWwgSGVhbHRoX1dlc3QgTGlubl9WQVBPUkhDU18lIApTdWJqZWN0OiAgVHJhaW5pbmcgTXNnIC0gVEVTVHNtaXRoIC0gMSAKCmxvcmVtIGlwc3VtIAoKCkZsdSBTaG90IEluZm86IGh0dHBzOi8vd3d3LnBvcnRsYW5kLnZhLmdvdi9uZXdzL2ZsdXNob3RzLmFzcCAKQ292aWQtMTkgSW5mbzogaHR0cDovL3RpbnkuY2MvMXQ2eGt6IAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwOS8wMy8yMDIxIDEyOjIzIFBNIApGcm9tOiAgVEVTVHNtaXRoLCBST1NFQU5OICBGIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClN1YmplY3Q6ICBUcmFpbmluZyBNc2cgLSBURVNUc21pdGggLSAxIAoKYXNrbGRqZgoKCgogCi9lcy8gUm9zZWFubiBGIFRFU1RzbWl0aCBQc3kuRC4KU3RhZmYgUHN5Y2hvbG9naXN0ClNpZ25lZDogMDkvMDMvMjAyMSAwOTozMgo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2021-09-03T12:32:57Z"
* context.related.reference = "#location-0"

Instance: 3ce3cc14-00ee-4783-b27c-d50639cecb37
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 62846416"
Description: "DISCHARGE INSTRUCTIONS - MEDICINE MULTIDISCIPLINARY"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.62846416"
* status = #current
* type = $loinc#11506-3
* type.text = "INTERNAL MEDICINE DISCHARGE NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2020-02-20T10:55:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2020-02-20T11:07:38Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogRElTQ0hBUkdFIElOU1RSVUNUSU9OUyAtIE1FRElDSU5FIE1VTFRJRElTQ0lQTElOQVJZClNUQU5EQVJEIFRJVExFOiBJTlRFUk5BTCBNRURJQ0lORSBESVNDSEFSR0UgTk9URSAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMjAsIDIwMjBAMTA6NTUgICAgIEVOVFJZIERBVEU6IEZFQiAyMCwgMjAyMEAxMDo1NTo0NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gCgogICAgICAgWU9VIFdFUkUgSU4gVEhFIEhPU1BJVEFMIEZPUiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KI0NPUEQgRVhBQ0VSQkFUSU9OOiBZb3UgaGF2ZSBjaHJvbmljIG9ic3RydWN0aXZlIHB1bG1vbmFyeSBkaXNlYXNlIChDT1BEKSwKYSBwZXJtYW5lbnQgbHVuZyBjb25kaXRpb24gdGhhdCBjYW4gbWFrZSBpdCBoYXJkIHRvIGVtcHR5IHRoZSBhaXIgb3V0IG9mCnRoZSBsdW5ncy4gSXQgY2FuIGxlYWQgdG8gc2hvcnRuZXNzIG9mIGJyZWF0aCBhbmQgYSBmZWVsaW5nIG9mIGJlaW5nCnRpcmVkLiBTb21ldGltZXMgdGhlIGJyZWF0aGluZyB0cm91YmxlcyBpbiBDT1BEIGNhbiBnZXQgd29yc2Ugb3ZlciBhIHNob3J0CnBlcmlvZCBvZiB0aW1lLCBmcm9tIGp1c3QgYSBmZXcgaG91cnMgdXAgdG8gYSB3ZWVrIG9yIHR3by4gIFdlIGNhbGwgdGhpcwphbiBleGFjZXJiYXRpb24sIG9yIGZsYXJlIHVwLiBPZnRlbiB0aGlzIGlzIGZyb20gYW4gaW5mZWN0aW9uIGluIHRoZQpicmVhdGhpbmcgdHViZXMsIGJ1dCBzb21ldGltZXMgd2UgZG9uJ3Qga25vdyB3aHkgaXQgaGFwcGVucy4gCgpZb3UgYXJlIGJlaW5nIHNlbnQgaG9tZSB3aXRoIHRoZSBmb2xsb3dpbmcgdG8gdHJlYXQgdGhlIGZsYXJlIHVwIGFuZCBoZWxwCmtlZXAgeW91ciBsdW5ncyBhcyBoZWFsdGh5IGFzIHBvc3NpYmxlIGluIHRoZSBmdXR1cmU6CgorIFB1bG1vbmFyeSBSZWhhYmlsaXRhdGlvbiwgYSBwcm9ncmFtIHdpdGggZXhlcmNpc2UgYW5kIGVkdWNhdGlvbiB0byAKICBoZWxwIGltcHJvdmUgeW91ciBsdW5nIGhlYWx0aCAtIHlvdSB3aWxsIHJlY2VpdmUgYSBzZXBhcmF0ZSBjYWxsIHRvIAogIHBsYW4gd2hlbiBhbmQgd2hlcmUgdGhpcyBwcm9ncmFtIHdpbGwgaGFwcGVuLgorT3h5Z2VuCitJbmhhbGVkIGJyZWF0aGluZyB0cmVhdG1lbnRzIHRvIG9wZW4gdXAgeW91ciBicmVhdGhpbmcgdHViZXMKCkl0IGlzIGltcG9ydGFudCBmb3IgeW91IHRvIHRha2UgeW91ciBDT1BEIG1lZGljYXRpb25zIGFzIHByZXNjcmliZWQgdG8KcHJldmVudCBtb3JlIGZsYXJlIHVwcyBhbmQgdG8gaGVscCB5b3UgYnJlYXRoZSBhcyBiZXN0IGFzIHlvdSBjYW4gZXZlcnkKZGF5LiAgTW9zdCBpbXBvcnRhbnRseSwgaWYgeW91IHNtb2tlLCB0aGUgYmVzdCB0aGluZyB5b3UgY2FuIGRvIGZvciB5b3VyCmx1bmcgZGlzZWFzZSBpcyB0byBzdG9wIHNtb2tpbmcuICBMZXQgeW91ciBwcm92aWRlciBrbm93IGlmIHlvdSBhcmUKaW50ZXJlc3RlZCBpbiBxdWl0dGluZyBzbW9raW5nIGJlY2F1c2UgdGhlIFZBIGhhcyBtYW55IHdheXMgd2UgY2FuIGhlbHAKeW91LiBZb3Ugc2hvdWxkIGFsc28gZ2V0IHlvdXIgZmx1IHZhY2NpbmF0aW9uIGV2ZXJ5IGZhbGwgYW5kIHRhbGsgdG8geW91cgpwcmltYXJ5IGNhcmUgcHJvdmlkZXIgYWJvdXQgdGhlIHBuZXVtb25pYSB2YWNjaW5hdGlvbi4KCiAKCiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gCgogRGF0ZSBvZiBhZG1pc3Npb246IEZFQiAyMCwyMDIwIDA3OjQ0IAogRGF0ZSBvZiBkaXNjaGFyZ2U6IEZlYiAyMCwyMDIwIAoKIFlvdXIgSG9zcGl0YWwgQ2FyZSBUZWFtOgoKCiAgICAgICAgQXR0ZW5kaW5nIFBoeXNpY2lhbjogIFRFU1Rqb25lcyxMSVNBIE0KTm8gUmVzaWRlbnQgUGh5c2ljaWFuIEFzc2lnbmVkLgoKCllvdXIgaG9zcGl0YWwgd2FyZCBhbmQgY29udGFjdCBwaG9uZSBudW1iZXI6IAogNTAzLTIyMC04MjYyIG9yIDEtODAwLTk0OS0xMDA0IDVDLCBleHRlbnNpb24gNTYxMDUgCgpJZiB5b3UgaGF2ZSB1cmdlbnQgcXVlc3Rpb25zIGFib3V0IHlvdXIgaG9zcGl0YWwgc3RheSB0aGF0IG5lZWQgdG8gYmUKYW5zd2VyZWQgaW4gdGhlIG5leHQgMS0yIGJ1c2luZXNzIGRheXMsIHBsZWFzZSBjYWxsIHRoZSBudW1iZXIgYWJvdmUgdG8KcmVhY2ggYSBtZW1iZXIgb2YgeW91ciBob3NwaXRhbCBjYXJlIHRlYW0gZm9yIGhlbHAuIEFmdGVyIDIgYnVzaW5lc3MgZGF5cywKb3IgZm9yIHF1ZXN0aW9ucyBub3QgcmVsYXRlZCB0byB0aGlzIGhvc3BpdGFsIHN0YXksIHlvdXIgcHJpbWFyeSBjYXJlIHRlYW0KY2FuIGJlIGNvbnRhY3RlZCBhdCB0aGUgbnVtYmVyIGxpc3RlZCBpbiB0aGUgIllvdXIgRm9sbG93LVVwIENhcmUgUGxhbiIKc2VjdGlvbiBvZiB0aGlzIG5vdGUuCgpJZiB5b3UgaGF2ZSBhbnkgb2YgdGhlc2Ugc3ltcHRvbXMgcGxlYXNlIGNhbGwgdXMgb3IgZ28gdG8gdGhlIEVtZXJnZW5jeQpEZXBhcnRtZW50OgogIDEuIFlvdSBoYXZlIGEgdGVtcGVyYXR1cmUgZ3JlYXRlciB0aGFuIDEwMS41IGRlZ3JlZXMgRgogIDIuIFlvdXIgc3ltcHRvbXMgd29yc2VuIG9yIGRvIG5vdCBpbXByb3ZlCiAgMy4gWW91IGV4cGVyaWVuY2UgY2hlc3QgcGFpbiBvciBzaG9ydG5lc3Mgb2YgYnJlYXRoCgogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gCgogICAgICAgICAgICAgWU9VUiBGT0xMT1ctVVAgQ0FSRSBQTEFOIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKIAojUEVORElORyBMQUIgVEVTVFM6CllvdSBoYXZlIG5vIHN0dWRpZXMgdGhhdCBhcmUgcGVuZGluZyBmcm9tIHRoaXMgaG9zcGl0YWwgdmlzaXQuCgogCiNMQUJTIFRPIEJFIENPTVBMRVRFRCBBRlRFUiBESVNDSEFSR0UKICBZb3UgZG8gbm90IG5lZWQgYW55IGxhYnMgdG8gYmUgZG9uZSBhZnRlciB0aGlzIGhvc3BpdGFsIHZpc2l0LgoKIAojSU1BR0lORyBBTkQgT1RIRVIgU1RVRElFUyBUTyBCRSBDT01QTEVURUQgQUZURVIgRElTQ0hBUkdFOgpZb3UgZG8gbm90IG5lZWQgYW55IGltYWdpbmcgb3Igb3RoZXIgc3R1ZGllcyB0byBiZSBkb25lIGFmdGVyIHRoaXMKaG9zcGl0YWwgdmlzaXQuCgogCiNGT0xMT1cgVVAgQVBQT0lOVE1FTlRTOgpZb3Ugd2lsbCByZWNlaXZlIGEgZm9sbG93IHVwIGNhbGwgaW4gMS0zIGRheXMgZnJvbSBhIG51cnNlIHRvIGNoZWNrIG9uIGhvdwp5b3UgYXJlIGRvaW5nLiAgWW91IG1heSBhbHNvIG5lZWQgb3RoZXIgZm9sbG93IHVwIGNhcmUgYXBwb2ludG1lbnRzLiBUaGVzZQp3aWxsIGJlIGxpc3RlZCBiZWxvdzoKCitGT0xMT1cgVVAgQ0FSRSBXSVRIIFlPVVIgUFJJTUFSWSBDQVJFIFRFQU06CiAgICBZb3UgbWF5IHJlYWNoIHlvdXIgUHJpbWFyeSBDYXJlIFRlYW0gYnkgY2FsbGluZyAxLTgwMC05NDktMTAwNAoKICAgIFlvdSB3aWxsIG5lZWQgYW4gYXBwb2ludG1lbnQgd2l0aCB5b3VyIFByaW1hcnkgQ2FyZSBUZWFtIGluIDEtMiBtb250aHMKICAgIHRvIERyIFByaW1hcnkgQ2FyZSAKCiAgICBUaGlzIG1heSBiZSBhIHBob25lIG9yIGluIGNsaW5pYyB2aXNpdC4gWW91ciBQcmltYXJ5IENhcmUgVGVhbSB3aWxsCiAgICBhcnJhbmdlIHRoaXMgd2l0aCB5b3UuIElmIHlvdSBoYXZlIG5vdCBoZWFyZCBmcm9tIHlvdXIgUHJpbWFyeSBDYXJlCiAgICBUZWFtIGluIG9uZSB3ZWVrLCBjYWxsIHRoZW0gYXQgdGhlIG51bWJlciBsaXN0ZWQgYWJvdmUuCgorSE9TUElUQUwgU1BFQ0lBTFRZIENPTlNVTFRTOgogIFlvdSBkbyBub3QgbmVlZCB0byBmb2xsb3cgdXAgd2l0aCBhbnkgc3BlY2lhbGlzdCBmb3IgdGhpcyBob3NwaXRhbCBzdGF5CgogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gCgogICAgICAgICBIT1cgVE8gVEFLRSBDQVJFIE9GIFlPVVJTRUxGIEFUIEhPTUUgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiNESUVUOgpMb3cgU29kaXVtIChzZWUgaGFuZG91dCkKSGVhcnQgSGVhbHRoeSBEaWV0IChzZWUgaGFuZG91dCkKCiAKI1lPVVIgQUNUSVZJVFkgTEVWRUw6CllvdSBtYXkgYmUgYSBsaXR0bGUgdGlyZWQgd2hlbiB5b3UgZmlyc3QgZ2V0IGhvbWUuIFNsb3dseSBpbmNyZWFzZSB5b3VyCmFjdGl2aXR5IGxldmVsIGJhY2sgdG8gd2hhdCB5b3UgZGlkIGJlZm9yZSB5b3UgZ290IHNpY2suIFRoaXMgaW5jbHVkZXMKd2Fsa2luZywgY2xpbWJpbmcgc3RhaXJzLCBhbmQgZXhlcmNpc2luZy4KCiAKCiAKCiAKSG9tZSBPeHlnZW46CgogWW91IGFyZSBnb2luZyBob21lIHdpdGggYSBwcmVzY3JpcHRpb24gZm9yIG94eWdlbi4gIFlvdSBhcmUgdG8gdXNlOiAKCiAyIGxpdGVycyBwZXIgbWludXRlIHdoZW4gcmVzdGluZyAKCiAzIGxpdGVycyBwZXIgbWludXRlIHdpdGggYWN0aXZpdHkgCgogMiBsaXRlcnMgcGVyIG1pbnV0ZSB3aGVuIHNsZWVwaW5nIAoKIE90aGVyOiAKCiBJZiBuZWVkZWQsIGEgcG9ydGFibGUgb3h5Z2VuIHRhbmsgd2lsbCBiZSBnaXZlbiB0byB5b3UgZm9yIHRoZSB0cmlwIGhvbWUuCgogUGxlYXNlIHJlYWQgdGhlIHNhZmV0eSBpbmZvcm1hdGlvbiBpbiB0aGUgIkhhbmRib29rIGZvciBPeHlnZW4gVGhlcmFweSIuIAoKIFRoZSBveHlnZW4gdmVuZG9yIHdpbGwgdmlzaXQgeW91IGF0IGhvbWUgdG8gZ2l2ZSB5b3UgdGhlIGVxdWlwbWVudCAKIHlvdSBuZWVkLgoKIAojU1VQUE9SVCBXRSBPUkRFUkVEIEZPUiBZT1UgQVQgSE9NRToKSG9tZSBIZWFsdGgKWW91IHNob3VsZCBiZSBjb250YWN0ZWQgYnkgdGhlIFZBIG9yIHRoZSBjb21tdW5pdHkgYWdlbmN5IHdobyB3aWxsIGJlCnByb3ZpZGluZyB5b3VyIGNhcmUgaW4gdGhlIG5leHQgd2Vlay4gVGhleSB3aWxsIHNjaGVkdWxlIGEgZmlyc3QgaW4gaG9tZQptZWV0aW5nIHdpdGggeW91IGF0IHRoYXQgdGltZS4gSWYgeW91IGhhdmUgbm90IGhlYXJkIGZyb20gdGhlIFZBIG9yIHRoZQpjb21tdW5pdHkgYWdlbmN5IGluIHRoZSBuZXh0IHdlZWssIHBsZWFzZSBjYWxsIDUwMy0yMjAtODI2MiBleHRlbnNpb24KMzE3Mzkgb3IgMS04MDAtOTQ5LTEwMDQgZXh0ZW5zaW9uIDMxNzM5IGZvciBoZWxwLgoKIAojVkVURVJBTlMgQ1JJU0lTIExJTkU6IERlYWxpbmcgd2l0aCBpbGxuZXNzIGNhbiBiZSBhIGRpZmZpY3VsdCBleHBlcmllbmNlLgpZb3UgYXJlIG5vdCBhbG9uZS4gSWYgeW91IGFyZSBpbiBlbW90aW9uYWwgZGlzdHJlc3Mgb3IgaGF2aW5nIHRob3VnaHRzIG9mCmhhcm1pbmcgeW91cnNlbGYsIHlvdSBzaG91bGQ6IAoKICAgICAxLiBDb21lIHRvIHRoZSBQb3J0bGFuZCBWQSBFbWVyZ2VuY3kgRGVwYXJ0bWVudCwgb3IgCiAgICAgMi4gQ2FsbCA5MTEsIG9yIAogICAgIDMuIENhbGwgdGhlIFZldGVyYW5zIENyaXNpcyBMaW5lIGF0IDgwMC0yNzMtODI1NSAoVEFMSyk7IAogICAgICAgIHJlbWVtYmVyIHRvIHByZXNzIDEgYXMgYSBWZXRlcmFuLCBvciBTZW5kIGEgdGV4dCBtZXNzYWdlIAogICAgICAgIHRvIDgzODI1NQoKIAoKIAoKIAoKIAoKI0FEVkFOQ0VEIENBUkUgUExBTk5JTkc6CldoZW4geW91IGFyZSBzZXJpb3VzbHkgaWxsLCBpdCBpcyB2ZXJ5IGltcG9ydGFudCB0byBtYWtlIHN1cmUgeW91ciBsb3ZlZApvbmVzIGFuZCBkb2N0b3JzIGtub3cgd2hhdCBraW5kcyBvZiBtZWRpY2FsIHRyZWF0bWVudCB5b3Ugd2FudCB3aGVuIHlvdQphcHByb2FjaCB0aGUgZW5kIG9mIHlvdXIgbGlmZS4gIFBoeXNpY2lhbiBPcmRlcnMgZm9yIExpZmUtU3VzdGFpbmluZwpUcmVhdG1lbnQgKFBPTFNUKSBjYW4gaGVscCBkbyBqdXN0IHRoYXQuIAoKUE9MU1QgaXMgYSBmb3JtIHRoYXQgY2xlYXJseSBzdGF0ZXMgd2hhdCBraW5kcyBvZiBtZWRpY2FsIHRyZWF0bWVudApwYXRpZW50cyB3YW50IHRvd2FyZCB0aGUgZW5kIG9mIHRoZWlyIGxpdmVzLgpXZSBjb21wbGV0ZWQgYSBQT0xTVCBmb3IgeW91IGR1cmluZyB0aGlzIGFkbWlzc2lvbi4gSXQgaXMgc2Nhbm5lZCBpbnRvCnlvdXIgaGVhbHRoIHJlY29yZC4gSWYgeW91IHdhbnQgdG8gbWFrZSBjaGFuZ2VzIHRvIGl0IGluIHRoZSBmdXR1cmUsIHlvdXIKcHJpbWFyeSBjYXJlIHRlYW0gY2FuIGhlbHAgeW91LgoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaGlzIGRpc2NoYXJnZSBwbGFuIHdhcyBkZXZlbG9wZWQgYnkgeW91ciBIb3NwaXRhbCBDYXJlIFRlYW0sIGFuZCB0aGUKc3VwZXJ2aXNpbmcgcGh5c2ljaWFuIGFncmVlcyB3aXRoIHRoZSBwbGFuIGFzIG91dGxpbmVkIGluIHRoaXMgbm90ZS4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKL2VzLyBMSVNBIE0gVEVTVGpvbmVzLCBNLkQuClN0YWZmIFBoeXNpY2lhbgpTaWduZWQ6IDAyLzIwLzIwMjAgMTE6MDcK"
* content.attachment.title = "DISCHARGE INSTRUCTIONS - MEDICINE MULTIDISCIPLINARY"
* content.attachment.creation = "2020-02-20T10:55:00Z"
* context.related.reference = "#location-0"

Instance: 769bb304-123b-4c8e-86ad-3a0bbeff81b1
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 62765863"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.468546"
* contained[=].name.text = "TESTjohnson,ELAINE B"
* contained[=].name.family = "TESTjohnson,ELAINE B"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.468546"
* contained[=].name.text = "TESTjohnson,ELAINE B"
* contained[=].name.family = "TESTjohnson,ELAINE B"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.62765863"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2020-02-13T16:31:53Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2020-02-13T13:31:54Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTMsIDIwMjBAMTY6MzE6NTMgIEVOVFJZIERBVEU6IEZFQiAxMywgMjAyMEAxMzozMTo1NCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEVMQUlORSBCICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTMvMjAyMCAwMzo1OSBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgUE9SX1JFU0VBUkNIX1ZPSUNFLVN0dWR5X1JFUyAKU3ViamVjdDogIHRyYWluaW5nIAoKCmJsYWggYmJsYWggCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKVEVTVCBNSyAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMTMvMjAyMCAwNDoyNyBQTSAKRnJvbTogIFRFU1Rqb2huc29uLCBFTEFJTkUgIEIgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUICBQQVRJRU5UUiAKU3ViamVjdDogIHRyYWluaW5nIAoKVGhhbmtzIHNvIG11Y2ghIAoKCgpFbGFpbmUgVEVTVGpvaG5zb24gClNlbmlvciBSZXNlYXJjaCBBc3Npc3RhbnQgCgoKCiAKL2VzLyBFTEFJTkUgQiBURVNUam9obnNvbgpTUiBSRVNFQVJDSCBBU1NJU1RBTlQKU2lnbmVkOiAwMi8xMy8yMDIwIDEzOjMxCg=="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2020-02-13T16:31:53Z"
* context.related.reference = "#location-0"

Instance: 4a504fe9-4add-43e3-812e-a618a11be6ee
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 62660553"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.62660553"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2020-02-06T15:02:14Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2020-02-06T12:02:15Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMDYsIDIwMjBAMTU6MDI6MTQgIEVOVFJZIERBVEU6IEZFQiAwNiwgMjAyMEAxMjowMjoxNSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMDYvMjAyMCAwMTozNyBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAgUEFUSUVOVFIgClRvOiAgKk15SGVhbHRoZVZldC9TZWN1cmVNZXNzYWdpbmcgUXVlc3Rpb25zX1BvcnRsYW5kXyQgClN1YmplY3Q6ICBZb3UgQ29tcGxldGUgTWUhIAoKVGhpcyBpcyB0aGUgd2F5LiAKCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKVEVTVCBNSyAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMDYvMjAyMCAwMzowMiBQTSAKRnJvbTogIFRFU1Rqb2huc29uLCBCUklBTiAgSyAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgIFBBVElFTlRSIApTdWJqZWN0OiAgWW91IENvbXBsZXRlIE1lISAKCnNkZmdzZGZnCgoKCkJyaWFuIEsuIFRFU1Rqb2huc29uIApTZWN1cmUgTWVzc2FnaW5nIEFkbWluaXN0cmF0b3IgCgoKCiAKL2VzLyBCUklBTiBLIFRFU1Rqb2huc29uIEJBClNFQ1VSRSBNRVNTQUdJTkcgQURNSU5JU1RSQVRPUgpTaWduZWQ6IDAyLzA2LzIwMjAgMTI6MDIK"
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2020-02-06T15:02:14Z"
* context.related.reference = "#location-0"

Instance: b841b93b-4e5a-416a-9915-0eca4538e6fe
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 62506844"
Description: "PC - FOLLOW UP"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.62506844"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2020-01-27T14:55:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2020-01-27T14:59:51Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBGT0xMT1cgVVAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgT1VUUEFUSUVOVCBOT1RFICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMjcsIDIwMjBAMTQ6NTUgICAgIEVOVFJZIERBVEU6IEpBTiAyNywgMjAyMEAxNDo1NTo0NiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKICAgKioqIFBDIC0gRk9MTE9XIFVQIEhhcyBBRERFTkRBICoqKgoKQ0M6CgpTVUJKRUNUSVZFOiBNSFZaWlZJU05UV0VOVFksVEVTVCBQQVRJRU5UUiBpcyBhIDE5IFlPTUFMRSBoZXJlIGZvcgoKTWVkaWNhdGlvbnMgcmVjb25jaWxlZCBieSByZXZpZXcgb2YgYWN0aXZlIG1lZCBncmlkIGJ5IHBhdGllbnQKTUVESUNBVElPTlM6CkFjdGl2ZSBPdXRwYXRpZW50IE1lZGljYXRpb25zIChpbmNsdWRpbmcgU3VwcGxpZXMpOgogCiAKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ck1FRCBSRUM6IEFjdGl2ZSwgcmVtb3RlLCBub24tVkEsIGV4cGlyZWQsIGRpc2NvbnRpbnVlZCwgcGVuZGluZyBtZWRzIHJldmlld2VkCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgoKUGF0aWVudCBBUEhJRCBtZWRpY2F0aW9uIHJldmlldyBncmVhdGVyIHRoYW4gMyBkYXlzIG9sZDsgRGF0YSBtYXkgbm8gbG9uZ2VyIGJlIAphY2N1cmF0ZTsgY2Fubm90IGJlIGVudGVyZWQgaW50byBDUFJTIGF0IHRoaXMgdGltZS4KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpQZW5kaW5nIHByZXNjcmlwdGlvbnMgd3JpdHRlbiB3aXRoaW4gbGFzdCA3IGRheXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ck5vIG5ldyBwZW5kaW5nIG1lZGljYXRpb25zIGZvdW5kIG92ZXIgbGFzdCA3IGRheXMuCgpBY3RpdmUgYW5kIFJlY2VudGx5IEV4cGlyZWQgT3V0cGF0aWVudCBNZWRpY2F0aW9ucyAoZXhjbHVkaW5nIFN1cHBsaWVzKToKIAogICAgIEFjdGl2ZSBPdXRwYXRpZW50IE1lZGljYXRpb25zICAgICAgICAgICAgICAgICAgICAgICAgICBTdGF0dXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoxKSAgIEFNTE9ESVBJTkUgQkVTWUxBVEUgNU1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggICBBQ1RJVkUgKFMpCiAgICAgICBFVkVSWSBEQVkgRk9SIEJMT09EIFBSRVNTVVJFCjIpICAgQU1PWElDSUxMSU4gMjUwTUcgQ0FQIFRBS0UgT05FIENBUFNVTEUgQlkgTU9VVEggVEhSRUUgIEFDVElWRQogICAgICAgVElNRVMgQSBEQVkKMykgICBBU1BJUklOIDMyNU1HIFRBQiBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgREFZICAgSE9MRAogICAgICAgQVMgRElSRUNURUQKNCkgICBBVE9SVkFTVEFUSU4gMTBNRyBUQUIgKEdSRUVOU1RPTkUgQlJBTkQpIFRBS0UgT05FICAgICAgQUNUSVZFIChTKQogICAgICAgVEFCTEVUIEVWRVJZIERBWSBIQVMKNSkgICBNRVRGT1JNSU4gSENMIDUwME1HIDI0SFIgU0EgVEFCIFRBS0UgVFdPIFRBQkxFVFMgQlkgICAgSE9MRAogICAgICAgTU9VVEggV0lUSCBZT1VSIEVWRU5JTkcgTUVBTAogCiAgICAgSW5hY3RpdmUgT3V0cGF0aWVudCBNZWRpY2F0aW9ucyAgICAgICAgICAgICAgICAgICAgICAgIFN0YXR1cwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CjEpICAgRkxVT1hFVElORSBIQ0wgMjBNRyBDQVAgVEFLRSBPTkUgQ0FQU1VMRSBCWSBNT1VUSCAgICAgIEVYUElSRUQKICAgICAgIEVWRVJZIE1PUk5JTkcKIAogICAgIEFjdGl2ZSBOb24tVkEgTWVkaWNhdGlvbnMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTdGF0dXMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoxKSAgIE5vbi1WQSBBU1BJUklOIDMyNU1HIFRBQiAzMjVNRyBNT1VUSCBGT1VSIFRJTUVTIEEgREFZICBBQ1RJVkUKMikgICBOb24tVkEgSE9SU0UgQ0hFU1ROVVQgQ0FQL1RBQiAgTU9VVEggVFdJQ0UgQSBEQVkgICAgICAgQUNUSVZFCiAKOCBUb3RhbCBNZWRpY2F0aW9ucwoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClBlbmRpbmcgcHJlc2NyaXB0aW9ucyB3cml0dGVuIHdpdGhpbiBsYXN0IDcgZGF5cwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KTm8gbmV3IHBlbmRpbmcgbWVkaWNhdGlvbnMgZm91bmQgb3ZlciBsYXN0IDcgZGF5cy4KCgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KUmVtb3RlIFZBIFBoYXJtYWN5IG1lZGljYXRpb24vYWxsZXJneSBpbmZvcm1hdGlvbgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KSERSTSAtIFJlbW90ZSBBY3RpdmUgTWVkcwoKTm8gQWN0aXZlIFJlbW90ZSBNZWRpY2F0aW9ucyBmb3IgdGhpcyBwYXRpZW50CgpSQVJUIC0gUmVtb3RlIEFEUgoKRkFDSUxJVFkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFMTEVSR1kvQURSCi0tLS0tLS0tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLQozNjNeQU5DSE9SQUdFIFZBIE1FRElDQUwgQ0VOVEVSXjQ2MyAgICAgVEVUQU5VUyBUT1hPSUQKNjg3XkpPTkFUSEFOIE0uIFdBSU5XUklHSFQgVkFNQ142ODcgICAgIFBFTklDSUxMSU4KClZpdGFscyBwZXIgbnVyc2UncyBlbnRyeToKVGVtcGVyYXR1cmU6IDk4LjggRiBbMzcuMSBDXSAoMDEvMDgvMjAyMCAxNDoyNykKUHVsc2U6IDY3ICgwMS8wOC8yMDIwIDE0OjI3KQpSZXNwaXJhdGlvbjogMTIgKDAxLzA4LzIwMjAgMTQ6MjcpCkJsb29kIHByZXNzdXJlOiAxMjUvODAgKDAxLzA4LzIwMjAgMTQ6MjcpCldlaWdodDogMjU1IGxiIFsxMTUuOSBrZ10gKDAxLzA4LzIwMjAgMTQ6MjcpClBhaW46IDAgKDAxLzA4LzIwMjAgMTQ6MjcpCk8yOjEwMCAoMDEvMDgvMjAyMCAxNDoyNykKQk1JOiAzNC43ICgwMS8wOC8yMDIwIDE0OjI3KQoKCgpBUFBFQVJBTkNFOiAgV0VMTCBBUFBFQVJJTkcsIElOIE5BRApIRUVOVDogIEFUL05DLCBQRUVSTEEsIEVPTUkKTkVDSzogIE5PIE5PREVTIE9SIE1BU1NFUwpMVU5HUzogIENUQSBCSUxBVEVSQUxMWQpDT1I6ICBSUlIsIE5PIE1SRwpBQkRPTUVOOiBOTyBNQVNTRVMgSU4gQUxMIDQgUVVBRFJBTlRTLCBOTyBIU00KRVhUOiAgTk8gQy9DL0UsIERQIDIrIEJJTEFULCBTRU5TQVRJT04gSU4gVEFDVApHVToKCkxhYnM6CgpjaG9sZXN0ZXJvbCAgICAgICBObyBDSE9MRVNURVJPTCBpbiB0aGUgbGFzdCAxWSBoZGwgCmhkbCAgICAgICAgICAgICAgICAgICBObyBIREwgaW4gdGhlIGxhc3QgMVkgCmxkbCBjYWxjICAgICAgICAgIE5vIExETC1DSE9MIENBTEMgaW4gdGhlIGxhc3QgMVkgCnRyaWdzICAgICAgICAgICAgIE5vIFRSSUdMWUNFUklERVMgaW4gdGhlIGxhc3QgMVkgCgogCk5vIENCQyBpbiB0aGUgcGFzdCAxWQogCk5vIEJBU0lDIE1FVEFCT0xJQyBQQU5FTCBpbiB0aGUgcGFzdCAxWQoKTm8gSEVNT0dMT0JJTiBBMUMgaW4gdGhlIGxhc3QgMVkKTm8gTUlDUk9BTEJVTUlOL0NSRUFUSU5JTkUgUkFUSU8gaW4gdGhlIGxhc3QgMVkKTm8gVUEgRElQU1RJQ0sgT05MWSBpbiB0aGUgcGFzdCAxWQpObyBWaXRhbWluIEQgdmFsdWUgUFZBTUMgWCAxIHllYXIuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBTQSAgICAgICAgICAgICAgIE5vIFBST1NUQVRJQyBTUEVDSUZJQyBBTlRJR0VOIGluIHRoZSBsYXN0IDFZCnN0b29sIGNhcmRzICAgICAgIE5vIEdVQUlBQyBHQVNUUklDIGluIHRoZSBsYXN0IDFZCgpObyBFS0cgb24gZmlsZSBpbiB0aGUgdGltZSBwZXJpb2QKTm8gRUtHIG9uIGZpbGUgZm9yIHRoZSBsYXN0IDM2NSBkYXlzLgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAxLzA4LzIwMjAgMTI6MzgKICBObyBkYXRhIGF2YWlsYWJsZQpObyBFY2hvY2FyZGlvZ3JhbSBvbiBmaWxlIGluIHRoZSB0aW1lIHBlcmlvZAoKSU1QUkVTU0lPTjogIE1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSIGlzIGEgMTkgWU9NQUxFIGhlcmUgZm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFTU0VTU01FTlQvUExBTgoxLgoyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClRFQU0gSU5TVFJVQ1RJT05TCjEuIEZvbGxvdy11cDogICBfX18gbW9udGhzIG9yIHBybgoKMi4gSW5zdHJ1Y3Rpb25zL1JlcXVlc3RzCiAgICAgICAgTkNNOiAgICAgICAgICAgIG5vbmUKICAgICAgICBMUE46ICAgICAgICAgICAgbm9uZQogICAgICAgIEZhY2lsaXRhdG9yOiAgICBub25lCiAgICAgICAgTVNXOiAgICAgICAgICAgIG5vbmUKClRoZSBwYXRpZW50J3MgbWVkaWNhdGlvbiBwcm9maWxlIHdhcyByZXZpZXdlZCBhbmQgdXBkYXRlZDsgdGhlIHBhdGllbnQgCndhcyBnaXZlbiBhIGhhcmQgY29weSBvZiB0aGUgdXBkYXRlZCBpbmZvcm1hdGlvbiB0b2RheSBwcmlvciB0byBkZXBhcnR1cmUuCgpFZHVjYXRpb24gYW5kIGNvdW5zZWxpbmcgcHJvdmlkZWQgb24gcGVydGluZW50IGFzcGVjdHMgb2YgCmN1cnJlbnQgbWVkaWNhbCBwcm9ibGVtcy4gUXVlc3Rpb25zIGFuc3dlcmVkLgoKCgoKCgoKCkNMSU5JQ0FMIFJFTUlOREVSIEFDVElWSVRZCiAgKkRNIEExQyBBbm51YWw6CgogICAgIFBhdGllbnRzIHdpdGggYW4gSGdCIEExQyA+OS4wIHNob3VsZCBiZSByZS10ZXN0ZWQuIAogCiAgICBMYXN0IDUgQTFDIFJlc3VsdHMgCgogICAgQ29sbGVjdGlvbiBEVCAgICAgIFNwZWMgIEhHQiBBMUMKICAgIDA5LzE2LzIwMTUgMDc6NTQgICBCTE9PRCAgNC41IAogCiAKICAgIExhc3QgNSBMREwgUmVzdWx0cyAKCiAgICAgIE5vIGRhdGEgYXZhaWxhYmxlIGZvciBMREwtQ0hPTCBESVJFQ1Q7IExETC1DSE9MIENBTEMKICAgIEhlbW9nbG9iaW4gQTFDIG9yZGVyZWQgYXQgdGhpcyB2aXNpdC4KCiAgKkNWRCBvciBETSBMaXBpZCBBbm51YWw6CiAgICBPcmRlciBsaXBpZCBwcm9maWxlLgoKICBNZWRpY2F0aW9uIFJlY29uY2lsaWF0aW9uOgogCgogICAgUmV2aWV3ZWQgbWVkaWNhdGlvbnMgbGlzdGVkIGluIEhlYWx0aCBQcm9tb3Rpb24gbm90ZS9teSBub3RlIG9idGFpbmVkCiAgICBkdXJpbmcgcGF0aWVudCBpbnRlcnZpZXcuCgogICAgTWVkaWNhdGlvbiBsaXN0IHJldmlld2VkIGFuZCBubyBkaXNjcmVwYW5jaWVzIGlkZW50aWZpZWQuCiAKL2VzLyBMSVNBIE0gVEVTVGpvbmVzLCBNLkQuClN0YWZmIFBoeXNpY2lhbgpTaWduZWQ6IDAxLzI3LzIwMjAgMTQ6NTkKCjAxLzI3LzIwMjAgQURERU5EVU0gICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQKQ0xJTklDQUwgUkVNSU5ERVIgQUNUSVZJVFkKICBQbmV1bW9jb2NjYWwgUENWMTMgKFByZXZuYXIxMyk6CiAgICAqKiBTZWUgb3JkZXJzLgogCi9lcy8gTElTQSBNIFRFU1Rqb25lcywgTS5ELgpTdGFmZiBQaHlzaWNpYW4KU2lnbmVkOiAwMS8yNy8yMDIwIDE1OjE2Cg=="
* content.attachment.title = "PC - FOLLOW UP"
* content.attachment.creation = "2020-01-27T14:55:00Z"
* context.related.reference = "#location-0"

Instance: bd86c366-236b-46b1-b13e-60bcad250c65
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 62507477"
Description: "PC - NEW"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.7194"
* contained[=].name.text = "TESTjones,LISA M"
* contained[=].name.family = "TESTjones,LISA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.62507477"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE OUTPATIENT NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2020-01-27T15:14:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2020-01-27T15:19:19Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEMgLSBORVcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgT1VUUEFUSUVOVCBOT1RFICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMjcsIDIwMjBAMTU6MTQgICAgIEVOVFJZIERBVEU6IEpBTiAyNywgMjAyMEAxNToxNDo1MyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxMSVNBIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKQ0M6CgoKUHJvYmxlbXM6CgpEb2N0b3JzL091dHNpZGUgcmVjb3JkczoKClN1cmdpY2FsIGFkbWlzc2lvbnM6CgpNZWRpY2FsIGFkbWlzc2lvbnM6CgpXb21lbidzIEhlYWx0aDogZ3hweGF4LCBicmVhc3QgaGlzdG9yeSwgcGFwIGhpc3RvcnksIGZhbWlseSAKcGxhbm5pbmcvY29udHJhY2VwdGlvbiBwbGFuLCBib25lIGhlYWx0aAoKTWVkaWNhdGlvbnM6CgpBbGxlcmdpZXMgdG8gbWVkczoKClNvY2lhbCBoaXN0b3J5OgoKVG9iYWNjbywgZXRvaCwgcmVjIGRydWdzOgoKRmFtaWx5IGh4OgoKTWlsaXRhcnkgaHg6ICAgVGltZSBwZXJpb2Q6ICAgICAgICAgICAgIEJyYW5jaDogSm9iOiAgICAgICAgICAgIExvY2F0aW9uczoKICAgICAgICBJbG5lc3NlcyB3aGlsZSBpbjogICAgICAgICAgICAgIFBUU0Q6IApBbnkgZXhwZXJpZW5jZXMgZm9yIHdoaWNoIHdvdWxkIGxpa2UgY291bnNlbGluZzoKd2l0bmVzc2VkIGRlYXRoIG9yIGNvbWJhdDoKCk1lbnRhbCBIZWFsdGg6CgoKClJvczogbm8gc2VpenVyZSwgbG9jLCBoZWFkYWNoZXMsIHZpc3VhbCBwcm9ibGVtcwogICAgIG5vIGhlYXJpbmcgcHJvYmxlbXMKICAgICBubyBwcm9ibGVtcyB3aXRoIHRlZXRoIG9yIGd1bXMKICAgICAgICBwdWxtb25hcnk6CiAgICAgICAgaHRuIG9yIG11cm11cnM6CiAgICAgbm8gZGlmZmljdWx0eSBzd2FsbG93aW5nLCBubyBzdG9tYWNoIHByb2JsZW1zLCBubyBjb25zdGlwYXRpb24gb3IgCmRpYXJyaGVhLCAKbm8gYmxvb2QgaW4gc3Rvb2wgb3Igb24gdG9pbGV0IHBhcGVyCiAgICAgbm8gdXJpbmFyeSBmcmVxdWVuY3ksIHVyZ2VuY3ksIGRpZmZpY3VsdHkgc3RhcnRpbmcgb3Igc3RvcHBpbmcgc3RyZWFtCiAgICAgbm8gbXVzY2xlIHByb2JsZW1zLCBubyBuZXcgam9pbnQgcHJvYmxlbXMKICAgICBubyBza2luIG9yIG5ldXJvbG9naWFsIHByb2JsZW1zCgoKClNVQkpFQ1RJVkU6IE1IVlpaVklTTlRXRU5UWSxURVNUIFBBVElFTlRSIGlzIGEgMTkgWU9NQUxFIGhlcmUgZm9yCgoKTUVESUNBVElPTlM6CkFjdGl2ZSBPdXRwYXRpZW50IE1lZGljYXRpb25zIChpbmNsdWRpbmcgU3VwcGxpZXMpOgogCiAgICAgQWN0aXZlIE91dHBhdGllbnQgTWVkaWNhdGlvbnMgICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXR1cwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CjEpICAgQU1MT0RJUElORSBCRVNZTEFURSA1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCAgIEFDVElWRSAoUykKICAgICAgIEVWRVJZIERBWSBGT1IgQkxPT0QgUFJFU1NVUkUKMikgICBBTU9YSUNJTExJTiAyNTBNRyBDQVAgVEFLRSBPTkUgQ0FQU1VMRSBCWSBNT1VUSCBUSFJFRSAgQUNUSVZFCiAgICAgICBUSU1FUyBBIERBWQozKSAgIEFTUElSSU4gMzI1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBFVkVSWSBEQVkgICBIT0xECiAgICAgICBBUyBESVJFQ1RFRAo0KSAgIEFUT1JWQVNUQVRJTiAxME1HIFRBQiAoR1JFRU5TVE9ORSBCUkFORCkgVEFLRSBPTkUgICAgICBBQ1RJVkUgKFMpCiAgICAgICBUQUJMRVQgRVZFUlkgREFZIEhBUwo1KSAgIE1FVEZPUk1JTiBIQ0wgNTAwTUcgMjRIUiBTQSBUQUIgVEFLRSBUV08gVEFCTEVUUyBCWSAgICBIT0xECiAgICAgICBNT1VUSCBXSVRIIFlPVVIgRVZFTklORyBNRUFMCiAKICAgICBQZW5kaW5nIE91dHBhdGllbnQgTWVkaWNhdGlvbnMgICAgICAgICAgICAgICAgICAgICAgICAgU3RhdHVzCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KMSkgICBBTUxPRElQSU5FIEJFU1lMQVRFIDVNRyBUQUIgVEFLRSBPTkUgVEFCTEVUIEJZIE1PVVRIICAgUEVORElORwogICAgICAgRVZFUlkgREFZIEZPUiBCTE9PRCBQUkVTU1VSRQoyKSAgIEFTUElSSU4gMzI1TUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSBNT1VUSCBFVkVSWSBEQVkgICBQRU5ESU5HCiAgICAgICBBUyBESVJFQ1RFRAozKSAgIEFUT1JWQVNUQVRJTiBDQUxDSVVNIDgwTUcgVEFCIFRBS0UgT05FIFRBQkxFVCBCWSAgICAgICBQRU5ESU5HCiAgICAgICBNT1VUSCBFVkVSWSBFVkVOSU5HIFRPIExPV0VSIENIT0xFU1RFUk9MICpBVk9JRAogICAgICAgR1JBUEVGUlVJVCBQUk9EVUNUUyBXSVRIIFRISVMgTUVESUNJTkUKNCkgICBNRVRGT1JNSU4gSENMIDUwME1HIDI0SFIgU0EgVEFCIFRBS0UgVFdPIFRBQkxFVFMgQlkgICAgUEVORElORwogICAgICAgTU9VVEggV0lUSCBZT1VSIEVWRU5JTkcgTUVBTAogCiAgICAgQWN0aXZlIE5vbi1WQSBNZWRpY2F0aW9ucyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXR1cwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CjEpICAgTm9uLVZBIE1VTFRJVklUQU1JTiBDQVAvVEFCIDEgQ0FQL1RBQiBNT1VUSCBFVkVSWSBEQVkgIEFDVElWRQogCjEwIFRvdGFsIE1lZGljYXRpb25zCgpBTExFUkdJRVM6CiAgUEVOSUNJTExJTiwgTElTSU5PUFJJTCwgU1VMRkEgRFJVR1MsIEVHR1MsIE1BQUxPWCBBTlRBQ0lELCBBREhFU0lWRSBUQVBFCiAgVEVUUkFDWUNMSU5FLCBQUkFaT1NJTgoKUEhZU0lDQUwgRVhBTToKQlAxMjUvODAgKDAxLzA4LzIwMjAgMTQ6MjcpICBQNjcgKDAxLzA4LzIwMjAgMTQ6MjcpICBSUjEyICgwMS8wOC8yMDIwIDE0OjI3KSAKVDk4LjggRiBbMzcuMSBDXSAoMDEvMDgvMjAyMCAxNDoyNykgCldUMjU1IGxiIFsxMTUuOSBrZ10gKDAxLzA4LzIwMjAgMTQ6MjcpICBCT0RZIE1BU1MgSU5ERVgKSkFOIDA4LCAyMDIwQDE0OjI3OjQxICAgMzQuNwoKQVBQRUFSQU5DRTogIFdFTEwgQVBQRUFSSU5HLCBJTiBOQUQKSEVFTlQ6ICBBVC9OQywgUEVFUkxBLCBFT01JCk5FQ0s6ICBOTyBOT0RFUyBPUiBNQVNTRVMKTFVOR1M6ICBDVEEgQklMQVRFUkFMTFkKQ09SOiAgUlJSLCBOTyBNUkcKQUJET01FTjogTk8gTUFTU0VTIElOIEFMTCA0IFFVQURSQU5UUywgTk8gSFNNCkVYVDogIE5PIEMvQy9FLCBEUCAyKyBCSUxBVCwgU0VOU0FUSU9OIElOIFRBQ1QKR1U6CgpMYWJzOgoKY2hvbGVzdGVyb2wgICAgICAgTm8gQ0hPTEVTVEVST0wgaW4gdGhlIGxhc3QgMVkgCmhkbCAgICAgICAgICAgICAgIE5vIEhETCBpbiB0aGUgbGFzdCAxWSAKbGRsIGNhbGMgICAgICAgICAgTm8gTERMLUNIT0wgQ0FMQyBpbiB0aGUgbGFzdCAxWSAKdHJpZ3MgICAgICAgICAgICAgTm8gVFJJR0xZQ0VSSURFUyBpbiB0aGUgbGFzdCAxWSAKZmVycml0aW4gICAgICAgICAgTm8gRkVSUklUSU4gaW4gdGhlIGxhc3QgMVkgCkhDVCAgICAgICAgICAgICAgIE5vIEhDVCBpbiB0aGUgbGFzdCAxWSAKSGVtb2dsb2JpbiAgICAgICAgVGhlIE9CSkVDVCBMQUItSEdCQTFDIHdhcyBOT1QgZm91bmQuLi5Db250YWN0IElSTS4gClBTQSAgICAgICAgICAgICAgIE5vIFBST1NUQVRJQyBTUEVDSUZJQyBBTlRJR0VOIGluIHRoZSBsYXN0IDFZCnN0b29sIGNhcmRzICAgICAgIE5vIEdVQUlBQyBHQVNUUklDIGluIHRoZSBsYXN0IDFZCgpObyBDQkMgaW4gdGhlIHBhc3QgMVkKCkJBU0lDIE1FVEFCT0xJQyBQQU5FTCAgIDAxLzIyLzIwMjAgMTI6MTEKICAgICBHTFVDT1NFICAgICAgICAgICAyNTUgSAogICAgIFVSRUEgTklUUk9HRU4gICAgIDE5IAogICAgIENSRUFUSU5JTkUgICAgICAgIDAuOCAKICAgICBTT0RJVU0gICAgICAgICAgICAxMjggTAogICAgIFBPVEFTU0lVTSAgICAgICAgIDQuMSAKICAgICBDSExPUklERSAgICAgICAgICA5NSAKICAgICBDTzIgICAgICAgICAgICAgICAyMSAKICAgICBDQUxDSVVNICAgICAgICAgICA4LjkgCiAgICAgQU5JT04gR0FQICAgICAgICAgMTYgCiAgICAgRUdGUiAgICAgICAgICAgICAgOTYgTm8gR1VBSUFDIEdBU1RSSUMgaW4gdGhlIGxhc3QgMVlObyBIRU1PR0xPQklOIEExQyBpbiAKdGhlIGxhc3QgMVlObyBaWkhFUEFUSVRJUyBBIEFOVElCT0RZIFRPVEFMIGluIHRoZSBsYXN0IDFZTm8gSEVQQVRJVElTIEIgClNVUkZBQ0UgQU5USUdFTiBpbiB0aGUgbGFzdCAxWVRoZSBPQkpFQ1QgTEFCLSB3YXMgTk9UIGZvdW5kLi4uQ29udGFjdCBJUk0uCkhFUCBDIEFCVGhlIE9CSkVDVCAgd2FzIE5PVCBmb3VuZC4uLkNvbnRhY3QgSVJNLkxBQi1MSVZFUiAKUFJPRklMRVRoZSBPQkpFQ1QgIHdhcyBOT1QgZm91bmQuLi5Db250YWN0IElSTS5MQUItTUEvQ1IgUkFUSU9UaGUgT0JKRUNUICB3YXMgCk5PVCBmb3VuZC4uLkNvbnRhY3QgSVJNLkxBQi1VUklOQUxZU0lTVGhlIE9CSkVDVCAgd2FzIE5PVCBmb3VuZC4uLkNvbnRhY3QgSVJNLgoKCgpJTVBSRVNTSU9OOiAgTUhWWlpWSVNOVFdFTlRZLFRFU1QgUEFUSUVOVFIgaXMgYSAxOSBZT01BTEUgaGVyZSBmb3IKClBST0JMRU1TOgoKTm8gRnV0dXJlIEFwcG9pbnRtZW50cyBTY2hlZHVsZWQKCgogCi9lcy8gTElTQSBNIFRFU1Rqb25lcywgTS5ELgpTdGFmZiBQaHlzaWNpYW4KU2lnbmVkOiAwMS8yNy8yMDIwIDE1OjE5Cg=="
* content.attachment.title = "PC - NEW"
* content.attachment.creation = "2020-01-27T15:14:00Z"
* context.related.reference = "#location-0"

Instance: c5468304-6d01-48a7-ac50-db7f5d6a5ffd
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "CR Note: 58196324"
Description: "CARDIOLOGY - E-CONSULT"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.58196324"
* status = #current
* type = $loinc#11488-4
* type.text = "CONSULT"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-03-16T05:48:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-03-16T06:15:25Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogQ0FSRElPTE9HWSAtIEUtQ09OU1VMVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBDT05TVUxUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTYsIDIwMTlAMDU6NDggICAgIEVOVFJZIERBVEU6IE1BUiAxNiwgMjAxOUAwNTo0OToxMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKClRISVMgSVMgQSBURVNUCiAKL2VzLyBEQVZJRCBNLiBURVNUam9obnNvbiBNRApDSElFRiBIRUFMVEggSU5GT1JNQVRJQ1MgT0ZGSUNFUi9BVFRFTkRJTkcgUFNZQ0hJQVRSSVNUClNpZ25lZDogMDMvMTYvMjAxOSAwNjoxNQo="
* content.attachment.title = "CARDIOLOGY - E-CONSULT"
* content.attachment.creation = "2019-03-16T05:48:00Z"
* context.related.reference = "#location-0"

Instance: c886306b-0725-4036-a0e0-ab4e7807bdef
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 58172027"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.37481"
* contained[=].name.text = "TESTwilliams,CAROL A"
* contained[=].name.family = "TESTwilliams,CAROL A"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.37481"
* contained[=].name.text = "TESTwilliams,CAROL A"
* contained[=].name.family = "TESTwilliams,CAROL A"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.58172027"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-03-14T16:16:29Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-03-14T14:16:03Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBNQVIgMTQsIDIwMTlAMTY6MTY6MjkgIEVOVFJZIERBVEU6IE1BUiAxNCwgMjAxOUAxNDoxNjozMCAgICAgIAogICAgICBBVVRIT1I6IFRFU1R3aWxsaWFtcyxDQVJPTCBBICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAzLzE0LzIwMTkgMDU6MDYgUE0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClRvOiAgKk15SGVhbHRoZVZldC1TZWN1cmVNZXNzYWdpbmcgUXVlc3Rpb25zX1BvcnRsYW5kXyQgClN1YmplY3Q6ICBmb3IgY2Fyb2wgCgpzRGNzZGZzZGYKCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKU2lnbmF0dXJlIFRpdGxlIAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMy8xNC8yMDE5IDA1OjE0IFBNIApGcm9tOiAgVEVTVHdpbGxpYW1zLCBDQVJPTCAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClN1YmplY3Q6ICBmb3IgY2Fyb2wgCgoKb2ssIHdpbGwgZG8gCgoKQ2Fyb2wgVEVTVHdpbGxpYW1zIApNSFYgU3BlY2lhbGlzdCAKCgoKIAovZXMvIENBUk9MIEEuIFRFU1R3aWxsaWFtcwpNSFYgU3BlY2lhbGlzdApTaWduZWQ6IDAzLzE0LzIwMTkgMTQ6MTYK"
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2019-03-14T16:16:29Z"
* context.related.reference = "#location-0"

Instance: c18edad7-8cd2-4dcb-9060-2b2e555a6704
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57965074"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.53839"
* contained[=].name.text = "TESTbrown,DENISE N"
* contained[=].name.family = "TESTbrown,DENISE N"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.53839"
* contained[=].name.text = "TESTbrown,DENISE N"
* contained[=].name.family = "TESTbrown,DENISE N"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57965074"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-28T11:00:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-28T08:01:26Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMjgsIDIwMTlAMTE6MDAgICAgIEVOVFJZIERBVEU6IEZFQiAyOCwgMjAxOUAwODowMToyNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ricm93bixERU5JU0UgTiAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMjgvMjAxOSAxMDo1OSBBTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKVG86ICAqKlRFU1Ricm93biBEX1ByaW1hcnkgQ2FyZV9TYWxlbSAKU3ViamVjdDogIExlYXZlIGZvciBEci4gVEVTVGJyb3duO1Rlc3RpbmcgU2F2ZSBBcyBXTEMgCgpzZGFzdmFzZGZ2YXNkCnZhcwpkZnZhc2R2CgoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgoKIAovZXMvIERlbmlzZSBOIFRFU1Ricm93bgpNRApTaWduZWQ6IDAyLzI4LzIwMTkgMDg6MDEK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2019-02-28T11:00:00Z"
* context.related.reference = "#location-0"

Instance: b003c050-9121-493b-8288-af01aaa5d89d
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57891264"
Description: "SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.196951"
* contained[=].name.text = "TESTjohnson,BRIAN K"
* contained[=].name.family = "TESTjohnson,BRIAN K"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57891264"
* status = #current
* type = $loinc#11506-3
* type.text = "MHV DIALOG NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-22T10:51:21Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-22T07:51:21Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNSFYgRElBTE9HIE5PVEUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMjIsIDIwMTlAMTA6NTE6MjEgIEVOVFJZIERBVEU6IEZFQiAyMiwgMjAxOUAwNzo1MToyMSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLEJSSUFOIEsgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDIvMjIvMjAxOSAxMDo1MCBBTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKVG86ICAqTXlIZWFsdGhlVmV0L1NlY3VyZU1lc3NhZ2luZ1F1ZXN0aW9uc19Qb3J0bGFuZF8kIApTdWJqZWN0OiAgdGVzdGluZyBzYXZlIHRvIGNwcnMgCgoKZGRnc2RmZwoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgoKIAovZXMvIEJSSUFOIEsgVEVTVGpvaG5zb24gQkEKU0VDVVJFIE1FU1NBR0lORyBBRE1JTklTVFJBVE9SClNpZ25lZDogMDIvMjIvMjAxOSAwNzo1MQo="
* content.attachment.title = "SECURE MESSAGING"
* content.attachment.creation = "2019-02-22T10:51:21Z"
* context.related.reference = "#location-0"

Instance: 65359b91-825e-4246-92dc-9dd4ce1d65f0
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57839739"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.241432"
* contained[=].name.text = "TESTjones,WENDY J"
* contained[=].name.family = "TESTjones,WENDY J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.241432"
* contained[=].name.text = "TESTjones,WENDY J"
* contained[=].name.family = "TESTjones,WENDY J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57839739"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-19T14:24:56Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-19T11:24:57Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTksIDIwMTlAMTQ6MjQ6NTYgIEVOVFJZIERBVEU6IEZFQiAxOSwgMjAxOUAxMToyNDo1NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxXRU5EWSBKICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xOS8yMDE5IDAxOjIxIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIFRFU1Rqb25lcyBXX01IIE51cnNlIFByYWNpdGl0aW9uZXJfVkFQT1JIQ1MgClN1YmplY3Q6ICBNU0cjMSBGb3IgVG9kYXkncyBUcmFpbmluZyAgCgp6Y1NmYWVyZ3NzcmdzcgpnCgoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgoKIAovZXMvIFdFTkRZIEogVEVTVGpvbmVzClBzeWNoaWF0cmljIE1lbnRhbCBIZWFsdGggTnVyc2UgUHJhY3RpdGlvbmVyClNpZ25lZDogMDIvMTkvMjAxOSAxMToyNAo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2019-02-19T14:24:56Z"
* context.related.reference = "#location-0"

Instance: f99c9373-a577-42ac-bce1-e7cd66fdf75f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57837655"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.241432"
* contained[=].name.text = "TESTjones,WENDY J"
* contained[=].name.family = "TESTjones,WENDY J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.241432"
* contained[=].name.text = "TESTjones,WENDY J"
* contained[=].name.family = "TESTjones,WENDY J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57837655"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-19T13:27:48Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-19T10:27:48Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTksIDIwMTlAMTM6Mjc6NDggIEVOVFJZIERBVEU6IEZFQiAxOSwgMjAxOUAxMDoyNzo0OCAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb25lcyxXRU5EWSBKICAgICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xOS8yMDE5IDAxOjIxIFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIFRFU1Rqb25lcyBXX01IIE51cnNlIFByYWNpdGl0aW9uZXJfVkFQT1JIQ1MgClN1YmplY3Q6ICBNU0cjMiBGb3IgVG9kYXkncyBUcmFpbmluZyAgCgpzZGN2c2FkZmFzZmdhZWZnYWVkZmdhZGVoZwoKClByZWRlZmluZWQgU2lnbmF0dXJlIE5hbWUgIApTaWduYXR1cmUgVGl0bGUgCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAyLzE5LzIwMTkgMDE6MjUgUE0gCkZyb206ICBURVNUam9uZXMsIFdFTkRZIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIE1TRyMyIEZvciBUb2RheSdzIFRyYWluaW5nICAKClRoYW5rIHlvdSAKCgoKIAovZXMvIFdFTkRZIEogVEVTVGpvbmVzClBzeWNoaWF0cmljIE1lbnRhbCBIZWFsdGggTnVyc2UgUHJhY3RpdGlvbmVyClNpZ25lZDogMDIvMTkvMjAxOSAxMDoyNwo="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2019-02-19T13:27:48Z"
* context.related.reference = "#location-0"

Instance: 0e705a54-669c-443c-a14a-40bd94414ef7
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57736928"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57736928"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-11T12:05:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-11T09:51:36Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTEsIDIwMTlAMTI6NTAgICAgIEVOVFJZIERBVEU6IEZFQiAxMSwgMjAxOUAwOTo1MTozNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEyOjQ3IFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIFRFU1Rqb2huc29uIERfUHN5Y2hpYXRyaXN0IF9Qb3J0bGFuZF8lIApTdWJqZWN0OiAgdGVzdCAKCgp0ZXN0CgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKU2lnbmF0dXJlIFRpdGxlIAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEyOjUwIFBNIApGcm9tOiAgVEVTVGpvaG5zb24sIERBVklEIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIHRlc3QgCgoKdGVzdAoKCkRhdmlkIE1vcnJpc29uIFRFU1Rqb2huc29uIE1EIApDaGllZiBIZWFsdGggSW5mb3JtYXRpb24gT2ZmaWNlciAKCgoKIAovZXMvIERBVklEIE0uIFRFU1Rqb2huc29uIE1ECkNISUVGIEhFQUxUSCBJTkZPUk1BVElDUyBPRkZJQ0VSL0FUVEVORElORyBQU1lDSElBVFJJU1QKU2lnbmVkOiAwMi8xMS8yMDE5IDA5OjUxCg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2019-02-11T12:05:00Z"
* context.related.reference = "#location-0"

Instance: 532382c6-656e-4eb3-aa0d-7b19b906257d
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57733207"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57733207"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-11T10:27:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-11T07:28:25Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTEsIDIwMTlAMTA6MjcgICAgIEVOVFJZIERBVEU6IEZFQiAxMSwgMjAxOUAwNzoyODoyNSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEwOjIwIEFNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIFRFU1Rqb2huc29uIERfUHN5Y2hpYXRyaXN0IF9Qb3J0bGFuZF8lIApTdWJqZWN0OiAgdGVzdCBvZiBpbmNyZW1lbnRzIG9mIHRpbWUgCgp0ZXN0IG9mIGluY3JlbWVudHMgb2YgdGltZSAKCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKU2lnbmF0dXJlIFRpdGxlIAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEwOjI3IEFNIApGcm9tOiAgVEVTVGpvaG5zb24sIERBVklEIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIHRlc3Qgb2YgaW5jcmVtZW50cyBvZiB0aW1lIAoKdGVzdCBvZiBpbmNyZW1lbnRzIG9mIHRpbWUgCgoKCkRhdmlkIE1vcnJpc29uIFRFU1Rqb2huc29uIE1EIApDaGllZiBIZWFsdGggSW5mb3JtYXRpb24gT2ZmaWNlciAKCgoKIAovZXMvIERBVklEIE0uIFRFU1Rqb2huc29uIE1ECkNISUVGIEhFQUxUSCBJTkZPUk1BVElDUyBPRkZJQ0VSL0FUVEVORElORyBQU1lDSElBVFJJU1QKU2lnbmVkOiAwMi8xMS8yMDE5IDA3OjI4Cg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2019-02-11T10:27:00Z"
* context.related.reference = "#location-0"

Instance: e92ced42-d056-4052-a6a8-36be57c2542f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57733182"
Description: "MENTAL HEALTH SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57733182"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-02-11T10:23:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-02-11T07:25:25Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUVOVEFMIEhFQUxUSCBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBGRUIgMTEsIDIwMTlAMTA6MjMgICAgIEVOVFJZIERBVEU6IEZFQiAxMSwgMjAxOUAwNzoyNToyNSAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEwOjE5IEFNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIFRFU1Rqb2huc29uIERfUHN5Y2hpYXRyaXN0IF9Qb3J0bGFuZF8lIApTdWJqZWN0OiAgdGVzdCBvZiB3b3JrbG9hZCBjcmVkaXQgCgp0ZXN0IG9mIHdvcmtsb2FkIGNyZWRpdCAKCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKU2lnbmF0dXJlIFRpdGxlIAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAwMi8xMS8yMDE5IDEwOjIzIEFNIApGcm9tOiAgVEVTVGpvaG5zb24sIERBVklEIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIHRlc3Qgb2Ygd29ya2xvYWQgY3JlZGl0IAoKCnRlc3Qgb2YgV0xDIAoKCkRhdmlkIE1vcnJpc29uIFRFU1Rqb2huc29uIE1EIApDaGllZiBIZWFsdGggSW5mb3JtYXRpb24gT2ZmaWNlciAKCgoKIAovZXMvIERBVklEIE0uIFRFU1Rqb2huc29uIE1ECkNISUVGIEhFQUxUSCBJTkZPUk1BVElDUyBPRkZJQ0VSL0FUVEVORElORyBQU1lDSElBVFJJU1QKU2lnbmVkOiAwMi8xMS8yMDE5IDA3OjI1Cg=="
* content.attachment.title = "MENTAL HEALTH SECURE MESSAGING"
* content.attachment.creation = "2019-02-11T10:23:00Z"
* context.related.reference = "#location-0"

Instance: 59510827-3ba1-4978-a8c7-3aa15f82e754
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57444648"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.398902"
* contained[=].name.text = "TESTgarcia,RITA E"
* contained[=].name.family = "TESTgarcia,RITA E"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.398902"
* contained[=].name.text = "TESTgarcia,RITA E"
* contained[=].name.family = "TESTgarcia,RITA E"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57444648"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-01-18T17:44:32Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-01-18T14:44:33Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMTgsIDIwMTlAMTc6NDQ6MzIgIEVOVFJZIERBVEU6IEpBTiAxOCwgMjAxOUAxNDo0NDozMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RnYXJjaWEsUklUQSBFICAgICAgICAgRVhQIENPU0lHTkVSOiAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgIFVSR0VOQ1k6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUQVRVUzogQ09NUExFVEVEICAgICAgICAgICAgICAgICAgICAgCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDEvMTgvMjAxOSAwNToxOCBQTSAKRnJvbTogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKVG86ICAqKkdyZWVuVGVhbV9Xb21lbidzIEhlYWx0aF9Qb3J0bGFuZF9XTVMgClN1YmplY3Q6ICBGb3IgUml0YSAxIAoKRmhzaGFoZGJzaHNoZWVoCgoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDEvMTgvMjAxOSAwNTozNiBQTSAKRnJvbTogIFRFU1RnYXJjaWEsIFJJVEEgClRvOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApTdWJqZWN0OiAgRm9yIFJpdGEgMSAKCjExMTExMQoKCgogCi9lcy8gUklUQSBFIFRFU1RnYXJjaWEKbHBuClNpZ25lZDogMDEvMTgvMjAxOSAxNDo0NAo="
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2019-01-18T17:44:32Z"
* context.related.reference = "#location-0"

Instance: 337c7341-5add-48af-a595-293dc0dafb7f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 57322962"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.229129"
* contained[=].name.text = "TESTmiller,CHRISTINA M"
* contained[=].name.family = "TESTmiller,CHRISTINA M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.229129"
* contained[=].name.text = "TESTmiller,CHRISTINA M"
* contained[=].name.family = "TESTmiller,CHRISTINA M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.57322962"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2019-01-10T14:45:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2019-01-10T11:48:06Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBKQU4gMTAsIDIwMTlAMTQ6NDUgICAgIEVOVFJZIERBVEU6IEpBTiAxMCwgMjAxOUAxMTo0ODowNiAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtaWxsZXIsQ0hSSVNUSU5BIE0gIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDAxLzEwLzIwMTkgMDI6MTMgUE0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClRvOiAgKipNZWxjaG9yIEdfUHJpbWFyeSBDYXJlX1dlc3QgTGlubiAKU3ViamVjdDogIEZvciBDaHJpc3RpbmEgZm9yIHRyYWluaW5nIDEgCgoKeGN2emRmZ3pkZmJ2emRmYmR6eAoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMDEvMTAvMjAxOSAwMjo0MiBQTSAKRnJvbTogIFRFU1RtaWxsZXIsIENIUklTVElOQSAKVG86ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClN1YmplY3Q6ICBGb3IgQ2hyaXN0aW5hIGZvciB0cmFpbmluZyAxIAoKaGJmZiA7IHJqbiAgZWhyZyBpdSB2IAoKCgogCi9lcy8gQ0hSSVNUSU5BIE0gVEVTVG1pbGxlciwgTVMsIFJECkRpZXRpdGlhbgpTaWduZWQ6IDAxLzEwLzIwMTkgMTE6NDgK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2019-01-10T14:45:00Z"
* context.related.reference = "#location-0"

Instance: eed9e5af-7d0a-4668-a74c-fa1e09f135f2
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "CR Note: 56889160"
Description: "ANESTHESIA - E-CONSULT"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.56889160"
* status = #current
* type = $loinc#11488-4
* type.text = "ANESTHESIOLOGY CONSULT"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2018-12-05T11:37:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2018-12-05T11:37:36Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogQU5FU1RIRVNJQSAtIEUtQ09OU1VMVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBBTkVTVEhFU0lPTE9HWSBDT05TVUxUICAgICAgICAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBERUMgMDUsIDIwMThAMTE6MzcgICAgIEVOVFJZIERBVEU6IERFQyAwNSwgMjAxOEAxMTozNzoyNyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCnRlc3QKIAovZXMvIERBVklEIE0uIFRFU1Rqb2huc29uIE1ECkNISUVGIEhFQUxUSCBJTkZPUk1BVElDUyBPRkZJQ0VSL0FUVEVORElORyBQU1lDSElBVFJJU1QKU2lnbmVkOiAxMi8wNS8yMDE4IDExOjM3Cg=="
* content.attachment.title = "ANESTHESIA - E-CONSULT"
* content.attachment.creation = "2018-12-05T11:37:00Z"
* context.related.reference = "#location-0"

Instance: 709364bd-737e-4c9f-bf64-db47a7ffb630
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 56802894"
Description: "SLEEP MEDICINE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387721"
* contained[=].name.text = "TESTdavis,RONALD L"
* contained[=].name.family = "TESTdavis,RONALD L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387721"
* contained[=].name.text = "TESTdavis,RONALD L"
* contained[=].name.family = "TESTdavis,RONALD L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.56802894"
* status = #current
* type = $loinc#11506-3
* type.text = "SLEEP MEDICINE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2018-11-29T10:53:28Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2018-11-29T07:53:28Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogU0xFRVAgTUVESUNJTkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBTTEVFUCBNRURJQ0lORSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMjksIDIwMThAMTA6NTM6MjggIEVOVFJZIERBVEU6IE5PViAyOSwgMjAxOEAwNzo1MzoyOCAgICAgIAogICAgICBBVVRIT1I6IFRFU1RkYXZpcyxST05BTEQgTCAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDExLzI5LzIwMTggMTA6MjQgQU0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClRvOiAgU2xlZXAgQ2xpbmljc19Qb3J0bGFuZCBWQU1DX0AgClN1YmplY3Q6ICB0cmFpbmluZyBtc2cgMSBmb3IgUm9iZXJ0IAoKZGZ2YWZ2YXZkdmFzdmFzZGZ2c2RmCgoKUHJlZGVmaW5lZCBTaWduYXR1cmUgTmFtZSAgClNpZ25hdHVyZSBUaXRsZSAKCgotLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIApTZW50OiAgMTEvMjkvMjAxOCAxMDo0OSBBTSAKRnJvbTogIFRFU1RkYXZpcywgUk9OQUxEIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIHRyYWluaW5nIG1zZyAxIGZvciBSb2JlcnQgCgprYXNnZmRragoKCgogCi9lcy8gUk9OQUxEIEwgVEVTVGRhdmlzClJvbmFsZCBURVNUZGF2aXMKU2lnbmVkOiAxMS8yOS8yMDE4IDA3OjUzCg=="
* content.attachment.title = "SLEEP MEDICINE SECURE MESSAGING"
* content.attachment.creation = "2018-11-29T10:53:28Z"
* context.related.reference = "#location-0"

Instance: 002e0239-eaeb-4acf-bb4d-8b16de793371
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 56480539"
Description: "PASTORAL CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387998"
* contained[=].name.text = "TESTrodriguez,GREGORY J"
* contained[=].name.family = "TESTrodriguez,GREGORY J"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.387998"
* contained[=].name.text = "TESTrodriguez,GREGORY J"
* contained[=].name.family = "TESTrodriguez,GREGORY J"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.56480539"
* status = #current
* type = $loinc#11506-3
* type.text = "PASTORAL CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2018-11-02T15:23:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2018-11-02T13:23:52Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUEFTVE9SQUwgQ0FSRSBTRUNVUkUgTUVTU0FHSU5HICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQQVNUT1JBTCBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMDIsIDIwMThAMTU6MjMgICAgIEVOVFJZIERBVEU6IE5PViAwMiwgMjAxOEAxMzoyMzo1MiAgICAgIAogICAgICBBVVRIT1I6IFRFU1Ryb2RyaWd1ZXosR1JFR09SWSBKICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMS8wMi8yMDE4IDAzOjU0IFBNIApGcm9tOiAgTUhWWlpWSVNOVFdFTlRZLCBURVNUIApUbzogIENoYXBsYWluX1NlcnZpY2VfUG9ydGxhbmQgVkFNQ19AIApTdWJqZWN0OiAgVHJhaW5pbmcgTWVzc2FnZTEgZm9yIEdyZWdvcnkgVEVTVHJvZHJpZ3VleiAKCnNkY3pzdnpkZnpkZnZ6ZGZiemZ2ei56ZApjenZ6ZGZ2IGR2IHpkZmYgIAoKClByZWRlZmluZWQgU2lnbmF0dXJlIE5hbWUgIApTaWduYXR1cmUgVGl0bGUgCgoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDExLzAyLzIwMTggMDQ6MTUgUE0gCkZyb206ICBURVNUcm9kcmlndWV6LCBHUkVHT1JZIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIFRyYWluaW5nIE1lc3NhZ2UxIGZvciBHcmVnb3J5IFRFU1Ryb2RyaWd1ZXogCgo7bDtma2dqc2RmbGpnbGZramdoc2xmamhzbGZramdiaAoKc2ZrZ2pzZGZsa2ptCgoKCkdyZWdvcnkgSi4gVEVTVHJvZHJpZ3VleiAKU3RhZmYgQ2hhcGxhaW4gCgoKCiAKL2VzLyBHcmVnb3J5IEouIFRFU1Ryb2RyaWd1ZXosIE1EaXYsIENDQwpTdGFmZiBDaGFwbGFpbgpTaWduZWQ6IDExLzAyLzIwMTggMTM6MjMK"
* content.attachment.title = "PASTORAL CARE SECURE MESSAGING"
* content.attachment.creation = "2018-11-02T15:23:00Z"
* context.related.reference = "#location-0"

Instance: 5374036b-8ab3-440d-81fe-f4350d7d6735
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 56473902"
Description: "PRIMARY CARE SECURE MESSAGING"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.401437"
* contained[=].name.text = "TESTmartinez,TAMI L"
* contained[=].name.family = "TESTmartinez,TAMI L"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.401437"
* contained[=].name.text = "TESTmartinez,TAMI L"
* contained[=].name.family = "TESTmartinez,TAMI L"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.56473902"
* status = #current
* type = $loinc#11506-3
* type.text = "PRIMARY CARE SECURE MESSAGING"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2018-11-02T11:30:46Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2018-11-02T09:30:47Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogUFJJTUFSWSBDQVJFIFNFQ1VSRSBNRVNTQUdJTkcgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBQUklNQVJZIENBUkUgU0VDVVJFIE1FU1NBR0lORyAgICAgICAgICAgICAgICAgICAKREFURSBPRiBOT1RFOiBOT1YgMDIsIDIwMThAMTE6MzA6NDYgIEVOVFJZIERBVEU6IE5PViAwMiwgMjAxOEAwOTozMDo0NyAgICAgIAogICAgICBBVVRIT1I6IFRFU1RtYXJ0aW5leixUQU1JIEwgICAgICAgIEVYUCBDT1NJR05FUjogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICBVUkdFTkNZOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVEFUVVM6IENPTVBMRVRFRCAgICAgICAgICAgICAgICAgICAgIAoKLS0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKU2VudDogIDExLzAyLzIwMTggMTI6MDYgUE0gCkZyb206ICBNSFZaWlZJU05UV0VOVFksIFRFU1QgClRvOiAgKipTYW1zb24gTF9QcmltYXJ5IENhcmVfSGlsbHNib3JvIApTdWJqZWN0OiAgVHJhaW5pbmcgTWVzc2FnZTEgZm9yIFRhbWkgLSBMZWF2ZSBmb3IgVGFtaSAKCnNkc2Rmc3NkdnNkdnMKZHYKenNkdnpzZHZ6c3YKCgpQcmVkZWZpbmVkIFNpZ25hdHVyZSBOYW1lICAKU2lnbmF0dXJlIFRpdGxlIAoKCi0tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gClNlbnQ6ICAxMS8wMi8yMDE4IDEyOjIxIFBNIApGcm9tOiAgVEVTVG1hcnRpbmV6LCBUQU1JIApUbzogIE1IVlpaVklTTlRXRU5UWSwgVEVTVCAKU3ViamVjdDogIFRyYWluaW5nIE1lc3NhZ2UxIGZvciBUYW1pIC0gTGVhdmUgZm9yIFRhbWkgCgpoc2hka2RobGxzZXVoCgoKCiAKL2VzLyBUQU1JIEwgVEVTVG1hcnRpbmV6CkFkdmFuY2UgTWVkaWNhbCBTdXBwb3J0IEFzc2lzdGFudApTaWduZWQ6IDExLzAyLzIwMTggMDk6MzAK"
* content.attachment.title = "PRIMARY CARE SECURE MESSAGING"
* content.attachment.creation = "2018-11-02T11:30:46Z"
* context.related.reference = "#location-0"

Instance: d91d38b3-7d42-4c84-bd6e-58d85023f61f
InstanceOf: VA.MHV.PHR.note
Usage: #example
Title: "PN Note: 54683701"
Description: "MHD - INPAT - ADMIT NOTE"
* contained[0].resourceType = "Practitioner"
* contained[=].id = "author-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Practitioner"
* contained[=].id = "approvedBy-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "AuthorTO.2926"
* contained[=].name.text = "TESTjohnson,DAVID M"
* contained[=].name.family = "TESTjohnson,DAVID M"
* contained[+].resourceType = "Location"
* contained[=].id = "location-0"
* contained[=].meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"
* contained[=].identifier.use = #usual
* contained[=].identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained[=].identifier.value = "LocationTO.648"
* contained[=].name = "PORTLAND VA MEDICAL CENTER"
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].value = "NoteTO.54683701"
* status = #current
* type = $loinc#11506-3
* type.text = "MENTAL HEALTH ADMISSION EVALUATION NOTE"
* category = $us-core-documentreference-category#clinical-note
* subject = Reference(Patient/ex-MHV-patient-0)
* date = "2018-06-22T09:29:00Z"
* author.reference = "#author-0"
* authenticator.extension.url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen"
* authenticator.extension.valueDateTime = "2018-06-22T09:35:49Z"
* authenticator.reference = "#approvedBy-0"
* content.attachment.contentType = #text/plain
* content.attachment.data = "CiBMT0NBTCBUSVRMRTogTUhEIC0gSU5QQVQgLSBBRE1JVCBOT1RFICAgICAgICAgICAgICAgICAgICAgICAgICAgClNUQU5EQVJEIFRJVExFOiBNRU5UQUwgSEVBTFRIIEFETUlTU0lPTiBFVkFMVUFUSU9OIE5PVEUgICAgICAgICAKREFURSBPRiBOT1RFOiBKVU4gMjIsIDIwMThAMDk6MjkgICAgIEVOVFJZIERBVEU6IEpVTiAyMiwgMjAxOEAwOTozMjoyMyAgICAgIAogICAgICBBVVRIT1I6IFRFU1Rqb2huc29uLERBVklEIE0gICAgICBFWFAgQ09TSUdORVI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgVVJHRU5DWTogICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTOiBDT01QTEVURUQgICAgICAgICAgICAgICAgICAgICAKCk5hbWU6IFRFU1QgUEFUSUVOVFIgTUhWWlpWSVNOVFdFTlRZCkFkZHJlc3M6IFBPIEJPWCAxMDM0IFBWQU1DClBPUlRMQU5ELCBPUiAgOTcyMzkKVGVsZXBob25lIE51bWJlcjogKDU1NSk1NTUtNTU1NQpBZ2U6IDE3CkVsaWdpYmlsaXR5OiBIVU1BTklUQVJJQU4gRU1FUkdFTkNZCgpOT0s6IAoKICAgICBObyBuZXh0LW9mLWtpbiBsaXN0ZWQgZm9yIHRoaXMgcGF0aWVudC4KCgoKQ0hJRUYgQ09NUExBSU5UOiAKSSdtIHN1aWNpZGFsCgoKUEFUSUVOVCBHT0FMIEZPUiBBRE1JU1NJT046IAp0cmVhdCBkZXByZXNzaW9uCgoKSElTVE9SWSBPRiBQUkVTRU5UIElMTE5FU1M6IAoKClBTWUNISUFUUklDIEhJU1RPUlk6IApQcmV2aW91cyBEaWFnbm9zZXM6CgoKUHN5Y2hpYXRyaWMgaG9zcGl0YWxpemF0aW9uczogCgoKSGlzdG9yeSBvZiBTdWljaWRhbCBCZWhhdmlvcnMvQXR0ZW1wdHM6CiAKSGlzdG9yeSBvZiBWaW9sZW5jZSAobGlmZXRpbWU7IGluY2x1ZGUgZGV0YWlscyBvZiByaXNrIGFuZCBldmVudHMgb2YgbGFzdCA2IAptb250aHMpOgogCk1lZGljYXRpb24gaGlzdG9yeToKIApUaGVyYXB5IGhpc3Rvcnk6IAoKCkN1cnJlbnQgbWVudGFsIGhlYWx0aCBwcm92aWRlcnM6IAoKUkVWSUVXIE9GIFNZU1RFTVM6IAoKClBNSDogCgoKCkFMTEVSR0lFUzogCiAgUEVOSUNJTExJTiwgTElTSU5PUFJJTCwgU1VMRkEgRFJVR1MsIEVHR1MsIE1BQUxPWCBBTlRBQ0lELCBBREhFU0lWRSBUQVBFCiAgVEVUUkFDWUNMSU5FCgpPVVRQQVRJRU5UIE1FRElDQVRJT05TOiAKTUFHTkVTSVVNIEhZRFJPWElERSBTVVNQCiAgIFRBS0UgMSBUQUJMRVNQT09ORlVMICg9MTUgTUwpIEJZIE1PVVRIIEVWRVJZIERBWSAKQUxPSC9NR09IL1NJTVRIIFhUUkEgU1RSRU5HVEggU1VTUAogICBUQUtFIDEgVEVBU1BPT05GVUwgKD01IE1MKSBCWSBNT1VUSCBFVkVSWSBFVkVOSU5HIApBQ0VUQU1JTk9QSEVOIDMyNU1HIFRBQgogICBUQUtFIE9ORSBUQUJMRVQgQlkgTU9VVEggRVZFUlkgREFZIEFTIE5FRURFRCBETyBOT1QgVEFLRSBNT1JFIFRIQU4gCkFTUElSSU4gODFNRyBFQyBUQUIKICAgVEFLRSBPTkUgVEFCTEVUIEJZIE1PVVRIIEVWRVJZIERBWSAKCgpTVUJTVEFOQ0UgVVNFOiAKQWxjb2hvbAogQ3VycmVudCB1c2U6IFllcwogTGFzdCBkcmluazogCiBMb25nZXN0IHNvYmVyIHBlcmlvZDogCiBIaXN0b3J5IG9mIERUJ3MgLyBTWjogCkRydWcgdXNlOiBObyAKSHggb2Ygc3Vic3RhbmNlIHVzZSB0eDogClRvYmFjY286IApDYWZmZWluZTogCgpTT0NJQUwgSElTVE9SWToKTGl2aW5nIHNpdHVhdGlvbjogCk1hcml0YWwgU3RhdHVzOiAKQ2hpbGRyZW46IApTdXBwb3J0IHN5c3RlbTogCkZpbmFuY2VzIC8gZW1wbG95bWVudDogCkxlZ2FsIGlzc3VlczogCgpERVZFTE9QTUVOVEFMIEhJU1RPUlk6ClBoeXNpY2FsL1NleHVhbCBBYnVzZTogCgoKRWR1Y2F0aW9uOiAKCk1JTElUQVJZIFNFUlZJQ0UgSElTVE9SWTogCiBCcmFuY2ggb2Ygc2VydmljZTogCiBKb2IgaW4gc2VydmljZTogCiBFdmVyIGluIGNvbWJhdDogCiBNU1QvdHJhdW1hOgogWWVhcnMgc2VydmVkOiAKIFR5cGUgb2YgRGlzY2hhcmdlOiAKIFNlcnZpY2UgY29ubmVjdGVkOiAKCkZBTUlMWSBQU1lDSElBVFJJQyBISVNUT1JZOiAKIFBzeWNoaWF0cmljIGNvbmRpdGlvbnM6CgogU3VpY2lkZTogCgogU3Vic3RhbmNlIGFidXNlOgoKCgpNU0U6CkdlbmVyYWwgYXBwZWFyYW5jZTogCkJlaGF2aW9yIGFuZCBwc3ljaG9tb3RvciBhY3Rpdml0eTogCkxhbmd1YWdlIGFuZCBzcGVlY2g6IApUaG91Z2h0IHByb2Nlc3M6IApUaG91Z2h0IENvbnRlbnQ6IApNb29kOiAKQWZmZWN0OiAKSnVkZ21lbnQ6IApJbnNpZ2h0OiAKQ29nbml0aW9uOiAKT3JpZW50YXRpb246IApBdHRlbnRpb24gYW5kIGNvbmNlbnRyYXRpb246IApSZWdpc3RyYXRpb24gYW5kIFJlY2FsbDogCkFic3RyYWN0aW9uOiAKCgpQSFlTSUNBTCBFWEFNOgoKVklUQUxTOgpUZW1wZXJhdHVyZTogMTAxLjMgRiBbMzguNSBDXSAoMDEvMTMvMjAxNiAwNjoxMikKUHVsc2U6IDEyMCAoMDEvMTMvMjAxNiAwNjoxMikKUmVzcGlyYXRpb246IDIyICgwMS8xMy8yMDE2IDA2OjEyKQpCbG9vZCBwcmVzc3VyZTogMTQwLzgwICgwNi8yMi8yMDE4IDA4OjQ5KQpXZWlnaHQ6IDE2NSBsYiBbNzUuMCBrZ10gKDAxLzEzLzIwMTYgMDY6MTIpClBhaW46IDYgKDAxLzEzLzIwMTYgMDY6MTIpCk8yOjk5ICgwMS8xMy8yMDE2IDA2OjEyKQoKR2VuOiBjb25nZW5pYWwsIHBsZWFzYW50LCBpbiBOQUQKSEVFTlQ6IFBFUlJMLCBFT01JLCBub24taWN0ZXJpYywgb3JvcGhhcnlueCBjbGVhciwgbm8gbHltcGhhZGVub3BhdGh5LCB0aHlyb2lkIApub24tcGFscGFibGUKTHVuZ3M6IGNsZWFyIHRvIGF1c2N1bHRhdGlvbiBiaWxhdGVyYWxseQpDVjogcnJyIG5vIG0vci9nLgpBYmQ6IG9iZXNlLCBOQlMsIHNvZnQgbnQuIG5vIG1hc3Nlcywgbm8gaHNtIApFeHQ6IHdhcm0sICsycHVsc2VzIGJpbGF0LCBubyBjL2MvZSwgbm8gYXJlYXMgb2YgcmFzaCBvciBpbmZlY3Rpb24gbm90ZWQKTmV1cm86Ci1DTjogCi1TdHJlbmd0aDogNS81IHN0cmVuZ3RoIGluIFVFL0xFIGJpbGF0ZXJhbGx5LiBUb25lOiBub3JtYWwuIAotUmVmbGV4ZXM6ICsyIGR0cnMgaW4gYmljZXBzLCBicmFjaGlvLCBwYXRlbGxhciwgYWNoaWxsZXMuIG5vIGFua2xlIGNsb251cyAKYmlsYXQuCi1DZXJlYmVsbGFyL2Nvb3JkaW5hdGlvbjogRmluZ2VyIHRvIG5vc2U6IHNtb290aCwgbm8gcGFzc3BvaW50aW5nOyBSYXBpZCAKYWx0ZXJuYXRpbmcgbW92ZW1lbnRzOiAKbm9ybWFsIHJhdGUgCi1TZW5zYXRpb246IExUOiBub3JtYWwgb24gaGFuZHMsIGZvcmVhcm0sIGZlZXQsIGFuZCBzaGlucwotR2FpdDogQ2FzdWFsOiBub3JtYWw7IEhlZWw6IG5vcm1hbDsgVG9lOiBub3JtYWw7IFRhbmRlbTogbm9ybWFsIFJob21iZXJnOiAKbmVnYXRpdmUuCgoKTEFCUzoKTGFzdCAyNCBob3VyczoKCiAgICAgMjQgSE9VUiBMQUJTCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCiAgICAgTm8gcmVzdWx0cyBmb3IgdGhpcyBwYXRpZW50IGluIHRoZSBsYXN0IDI0IGhvdXJzCgoKCkVLRy9JTUFHSU5HIFJFU1VMVFM6CiAKCkZPUk1VTEFUSU9OOgoKClZFVEVSQU4nUyBTVFJFTkdUSFM6CgoKRFNNIDUgRElBR05PU0VTOiAKCgpQUk9CTEVNIExJU1QgRk9SIENVUlJFTlQgQURNSVNTSU9OOgoKCklOSVRJQUwgVFJFQVRNRU5UIFBMQU46CjEuIEFkbWl0IHRvIDVDIFZBLiAKICAgICAgICBUZWFtOiAKICAgICAgICBSZXNpZGVudDogCiAgICAgICAgQXR0ZW5kaW5nOiAKCjIgIFN0YXR1cy9SaXNrIEFzc2Vzc21lbnQgU3VtbWFyeS1TZWUgY29tcGxldGVkIFN1aWNpZGUgUmlzayBBc3Nlc3NtZW50IG5vdGUuIAoKMy4gTWVkaWNhdGlvbnM6IAoKCjQuIExhYnMgb3JkZXJlZDogCgogCgoKNS4gT3RoZXIgaW50ZXJ2ZW50aW9uczogCgoKNi4gQ29udGFjdHMgKGZhbWlseSwgcHJvdmlkZXJzKTogCgogCjcuIEZ1dHVyZSBhcHBvaW50bWVudHM6IApGdXR1cmUgQXBwb2ludG1lbnRzOgpObyBmdXR1cmUgYXBwb2ludG1lbnRzIG9uIGZpbGUKCkkgaGF2ZSBkaXNjdXNzZWQgdGhlIFZldGVyYW4ncyBjYXJlIHdpdGggbXkgc3VwZXJ2aXNpbmcgcHJhY3RpdGlvbmVyLCBEci4gLCBhbmQgCkRyLiAgYWdyZWVzIHdpdGggbXkgYXNzZXNzbWVudCBhbmQgcGxhbi4KIAovZXMvIERBVklEIE0uIFRFU1Rqb2huc29uIE1ECkNISUVGIEhFQUxUSCBJTkZPUk1BVElDUyBPRkZJQ0VSL0FUVEVORElORyBQU1lDSElBVFJJU1QKU2lnbmVkOiAwNi8yMi8yMDE4IDA5OjM1CgpSZWNlaXB0IEFja25vd2xlZGdlZCBCeToKMDYvMjIvMjAxOCAwOTozOCAgICAgICAgL2VzLyBFVEhBTiBURVNUbWlsbGVyLCBNRCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBTWUNISUFUUlkgUkVTSURFTlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCg=="
* content.attachment.title = "MHD - INPAT - ADMIT NOTE"
* content.attachment.creation = "2018-06-22T09:29:00Z"
* context.related.reference = "#location-0"