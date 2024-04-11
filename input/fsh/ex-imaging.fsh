
Instance: ex-MHV-imaging-0
InstanceOf: VA.MHV.PHR.imaging
Title: "Example 0 of a MHV Radiology (Imaging Exam)"
Usage: #example
Description: """
Derived from the a mock ImagingExamTO:
"""
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note
* subject =  Reference(Patient/ex-MHV-patient-0)
* identifier[TOid].value = "ImagingExamTO.6959075.8874-1" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* identifier[accessionNumber].value = "Accession.092404-1582" 
* identifier[accessionNumber].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[accessionNumber].use = #official
* identifier[casenum].value = "CaseNum.1582" 
* identifier[casenum].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[casenum].use = #secondary
* context.encounter.identifier.value = "5886199"
* custodian.identifier.value = "2267"
* content.attachment.title = "SPINE LUMBOSACRAL MIN 2 VIEWS"
* context.related.identifier.value = "12248947"
* date = 2004-09-24T11:25:00Z
* content.attachment.creation = 2004-09-24T11:25:00Z
* type.coding[LO] = LOINC#18748-4
* type.coding[CP] = CPT#72100 "RADIOLOGIC EXAMINATION, SPINE, LUMBOSACRAL; 2 OR 3 VIEWS"
* author[0].display = "TESTdavis,Joseph" 
* author[1].display = "DAYT29 TEST LAB"
* author[1].identifier.value = "989"
* content.attachment.contentType = #text/plain
* content.attachment.data = """
U1BJTkUgTFVNQk9TQUNSQUwgTUlOIDIgVklFV1MKICAgCkV4bSBEYXRlOiBTRVAgMjQsIDIwMDRAMTE6MjUKUmVxIFBoeXM6IFRFU1Rqb2huc29uLEpvaG4gTWljaGFlbCAgICAgICAgICAgICAgUGF0IExvYzogUENUX08gUEFUSUwgKEYvVSkgKFJlcSdnIExvYykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJbWcgTG9jOiBSQURJT0xPR1kKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTZXJ2aWNlOiBVbmtub3duCgogCgooQ2FzZSAxNTgyIENPTVBMRVRFKSBTUElORSBMVU1CT1NBQ1JBTCBNSU4gMiBWSUVXUyAgICAoUkFEICBEZXRhaWxlZCkgQ1BUOjcyMTAwCiAgICAgUHJvYyBNb2RpZmllcnMgOiBCSUxBVEVSQUwgRVhBTQoKICAgIENsaW5pY2FsIEhpc3Rvcnk6CiAgICAgIGhhdmluZyAzIHdlZWtzIG9mIGJhY2sgcGFpbnMgbmVlZCB0byByZS1ldmFsIGZvciBhcmhyaXRpcyBvciBhbnkgCiAgICAgIHdvcnNuZWluZyBkaXNjIHNwYWNlcyBldGMuIAoKICAgIFJlcG9ydCBTdGF0dXM6IFZlcmlmaWVkICAgICAgICAgICAgICAgICAgIERhdGUgUmVwb3J0ZWQ6IFNFUCAyNywgMjAwNAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGF0ZSBWZXJpZmllZDogU0VQIDI4LCAyMDA0CiAgICBWZXJpZmllciBFLVNpZzovRVMvUmljaGFyZCBELiBURVNUbWlsbGVyLCBNLkQuCgogICAgUmVwb3J0OgogICAgICBUaHJlZSB2aWV3cyBvZiB0aGUgbHVtYm9zYWNyYWwgc3BpbmUgYXJlIGNvbXBhcmVkIHdpdGggYSBwcmV2aW91cyAKICAgICAgZXhhbWluYXRpb24gb2YgOS8yMy8wMi4gIAogICAgICAgCiAgICAgIFRoZXJlIGhhcyBiZWVuIGEgcGFydGlhbCBjb2xsYXBzZSBvZiBMMiB3aGljaCBpcyBzaW1pbGFyIGluCiAgICAgIGFwcGVhcmFuY2UgYW5kIGRlZ3JlZSB0byB0aGUgcHJldmlvdXMgZXhhbWluYXRpb24gb2YgU2VwdGVtYmVyCiAgICAgIDIwMDIuICBUaGVyZSBpcyBhbHNvIGNvbGxhcHNlIG9mIHRoZSBib2R5IG9mIFQxMiB3aGljaCBhcHBhcmVudGx5CiAgICAgIGlzIG5ldyBzaW5jZSB0aGUgcHJldmlvdXMgZXhhbSBhbmQgdGhlIGNvbGxhcHNlIGhhcyBiZWVuCiAgICAgIGVzdGltYXRlZCBhYm92ZSA3NSB0byA4MCUgb2YgdGhlIGhlaWdodCBvZiB0aGUgdmVydGVicmFsIGJvZHkuICAKICAgICAgIAogICAgICBUaGVyZSBpcyBtaWxkIG1hcmdpbmFsIHNwdXJyaW5nIG9mIHRoZSB1cHBlciBhbnRlcmlvciBhc3BlY3Qgb2YKICAgICAgTDQuICBUaGVyZSBhcmUgYXJ0ZXJpb3NjbGVyb3RpYyBjYWxjaWZpY2F0aW9ucyBpbiB0aGUgYWJkb21pbmFsCiAgICAgIGFvcnRhIGFuZCBicmFuY2hlcy4gIAogICAgICAgCiAgICAgIFRoZSBpbnRlcnZlcnRlYnJhbCBkaXNjIHNwYWNlcyBhcmUgcHJlc2VydmVkLiAgCgogICAgSW1wcmVzc2lvbjoKICAgICAgMS4gIE9sZCBjb21wcmVzc2lvbiBmcmFjdHVyZSBvZiBMMiB3aXRoIGFudGVyaW9yIG1hcmdpbmFsCiAgICAgIHNwdXJyaW5nIGFuZCBhcHBhcmVudCBhbmt5bG9zaXMgTDEtTDIuICAKICAgICAgIAogICAgICAyLiAgQ29sbGFwc2Ugb3IgY29tcHJlc3Npb24gZnJhY3R1cmUgb2YgdGhlIGJvZHkgb2YgVDEyIHdoaWNoIGlzCiAgICAgIG5ldyBzaW5jZSB0aGUgcHJldmlvdXMgZXhhbWluYXRpb24gaW4gMjAwMiBhbmQgaW52b2x2ZXMgbG9zcyBvZgogICAgICBoZWlnaHQgb2YgdGhhdCB2ZXJ0ZWJyYWwgYm9keSBieSBhYm91dCA3MCUuICBBcnRlcmlvc2NsZXJvdGljCiAgICAgIGNhbGNpZmljYXRpb25zIG9mIHRoZSBhb3J0YS4gIAoKICAgIFByaW1hcnkgRGlhZ25vc3RpYyBDb2RlOiAKClByaW1hcnkgSW50ZXJwcmV0aW5nIFN0YWZmOgogIEpvc2VwaCBURVNUZGF2aXMsIFN0YWZmIFBoeXNpY2lhbgpWRVJJRklFRCBCWToKICBSaWNoYXJkIFRFU1RtaWxsZXIsIFJhZGlvbG9naXN0L0NoaWVmCgovR0VH
"""

/*
SPINE LUMBOSACRAL MIN 2 VIEWS
   
Exm Date: SEP 24, 2004@11:25
Req Phys: TESTjohnson,John Michael              Pat Loc: PCT_O PATIL (F/U) (Req'g Loc)
                                         Img Loc: RADIOLOGY
                                         Service: Unknown

 

(Case 1582 COMPLETE) SPINE LUMBOSACRAL MIN 2 VIEWS    (RAD  Detailed) CPT:72100
     Proc Modifiers : BILATERAL EXAM

    Clinical History:
      having 3 weeks of back pains need to re-eval for arhritis or any 
      worsneing disc spaces etc. 

    Report Status: Verified                   Date Reported: SEP 27, 2004
                                              Date Verified: SEP 28, 2004
    Verifier E-Sig:/ES/Richard D. TESTmiller, M.D.

    Report:
      Three views of the lumbosacral spine are compared with a previous 
      examination of 9/23/02.  
       
      There has been a partial collapse of L2 which is similar in
      appearance and degree to the previous examination of September
      2002.  There is also collapse of the body of T12 which apparently
      is new since the previous exam and the collapse has been
      estimated above 75 to 80% of the height of the vertebral body.  
       
      There is mild marginal spurring of the upper anterior aspect of
      L4.  There are arteriosclerotic calcifications in the abdominal
      aorta and branches.  
       
      The intervertebral disc spaces are preserved.  

    Impression:
      1.  Old compression fracture of L2 with anterior marginal
      spurring and apparent ankylosis L1-L2.  
       
      2.  Collapse or compression fracture of the body of T12 which is
      new since the previous examination in 2002 and involves loss of
      height of that vertebral body by about 70%.  Arteriosclerotic
      calcifications of the aorta.  

    Primary Diagnostic Code: 

Primary Interpreting Staff:
  Joseph TESTdavis, Staff Physician
VERIFIED BY:
  Richard TESTmiller, Radiologist/Chief

/GEG
*/