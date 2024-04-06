




///////////////////////////////////////////////////  1  ////////////////////////////////////////


Instance:   ex-MHV-specimen-1
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <id>6Y100</id>
    <name>FECES</name>
    <collectionDate>2950730</collectionDate>
    <accessionNum>PARAS 95 264</accessionNum>
</specimen>
*/
* status = #available
* type.text = "FECES"
* collection.collectedDateTime = 1995-07-30
* identifier[TOid].value = "LabSpecimenTO.6Y100" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* accessionIdentifier.value = "PARAS 95 264"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual

Instance: ex-MHV-labTest-1
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>NO OVA OR PARASITES FOUND</value>
    </result>
    <id>MI;7049269;1</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950803.144900</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049269;1"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "NO OVA OR PARASITES FOUND"
* effectiveDateTime = 1995-08-03T14:49:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)

Instance: ex-MHV-labReport-1
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 1 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR MICROBIOLOGY REPORT"
* code = LOINC#18725-2
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1995-08-03T14:49:00Z
* issued = 1995-08-03T14:49:00Z
* identifier[TOid].value = "LabReportTO.MI;7049269" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-labTest-1
* result[+] = Reference(ex-MHV-labTest-1)
* contained[+] = ex-MHV-specimen-1
* specimen[+] = Reference(ex-MHV-specimen-1)
* contained[+] = ex-MHV-organization-989
* performer[+] = Reference(Organization/ex-MHV-organization-989)
* performer[+].display = "TESTgarcia,Amelia S"
* presentedForm.contentType = #text/plain
* presentedForm.data = """
QWNjZXNzaW9uIFtVSURdOiBQQVJBUyA5NSAyNjQgW10gICAgICAgICAgICBSZWNlaXZlZDogQXVnIDAxLCAxOTk1QDExOjAyCkNvbGxlY3Rpb24gc2FtcGxlOiBTVE9PTCAgICAgICAgICAgICAgIENvbGxlY3Rpb24gZGF0ZTogSnVsIDMwLCAxOTk1ClNpdGUvU3BlY2ltZW46IEZFQ0VTClByb3ZpZGVyOiBURVNUZ2FyY2lhLEFtZWxpYSBTCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiogUEFSQVNJVE9MT0dZIEZJTkFMIFJFUE9SVCA9PiBBdWcgMDMsIDE5OTUgICBURUNIIENPREU6IDEwMDMKUGFyYXNpdG9sb2d5IFJlbWFyayhzKToKTk8gT1ZBIE9SIFBBUkFTSVRFUyBGT1VORA==
"""
/*
Accession [UID]: PARAS 95 264 []            Received: Aug 01, 1995@11:02
Collection sample: STOOL               Collection date: Jul 30, 1995
Site/Specimen: FECES
Provider: TESTgarcia,Amelia S
                                                        
* PARASITOLOGY FINAL REPORT => Aug 03, 1995   TECH CODE: 1003
Parasitology Remark(s):
NO OVA OR PARASITES FOUND
*/


//////////////////////////////////////////////////  2  ///////////////////////////////////


Instance:   ex-MHV-specimen-2
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <id>6Y100</id>
    <name>FECES</name>
    <collectionDate>2950729.07</collectionDate>
    <accessionNum>PARAS 95 263</accessionNum>
</specimen>
*/
* status = #available
* type.text = "FECES"
* collection.collectedDateTime = 1995-07-29T07:00:00Z
* identifier[TOid].value = "LabSpecimenTO.6Y100" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* accessionIdentifier.value = "PARAS 95 263"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual

Instance: ex-MHV-labTest-2
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>NO OVA OR PARASITES FOUND</value>
    </result>
    <id>MI;7049269.93;1</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950803.144900</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049269.93;1"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "NO OVA OR PARASITES FOUND"
* effectiveDateTime = 1995-08-03T14:49:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)

Instance: ex-MHV-labTest-3
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>MODERATE WBC'S SEEN</value>
    </result>
    <id>MI;7049269.93;2</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950803.144900</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049269.93;2"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "MODERATE WBC'S SEEN"
* effectiveDateTime = 1995-08-03T14:49:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)

Instance: ex-MHV-labTest-4
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>MODERATE YEAST</value>
    </result>
    <id>MI;7049269.93;3</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950803.144900</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049269.93;3"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "MODERATE YEAST"
* effectiveDateTime = 1995-08-03T14:49:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)



Instance: ex-MHV-labReport-2
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 2 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR MICROBIOLOGY REPORT"
* code.coding = LOINC#18725-2
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1995-08-03T14:49:00Z
* issued = 1995-08-03T14:49:00Z
* identifier[TOid].value = "LabReportTO.MI;7049269.93" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-labTest-2
* result[+] = Reference(ex-MHV-labTest-2)
* contained[+] = ex-MHV-labTest-3
* result[+] = Reference(ex-MHV-labTest-3)
* contained[+] = ex-MHV-labTest-4
* result[+] = Reference(ex-MHV-labTest-4)
* contained[+] = ex-MHV-specimen-2
* specimen[+] = Reference(ex-MHV-specimen-2)
* contained[+] = ex-MHV-organization-989
* performer[+] = Reference(Organization/ex-MHV-organization-989)
* performer[+].display = "TESTgarcia,Amelia S"
* presentedForm.contentType = #text/plain
* presentedForm.data = """
QWNjZXNzaW9uIFtVSURdOiBQQVJBUyA5NSAyNjMgW10gICAgICAgICAgICBSZWNlaXZlZDogQXVnIDAxLCAxOTk1QDExOjAyCkNvbGxlY3Rpb24gc2FtcGxlOiBTVE9PTCAgICAgICAgICAgICAgIENvbGxlY3Rpb24gZGF0ZTogSnVsIDI5LCAxOTk1IDA3OjAwClNpdGUvU3BlY2ltZW46IEZFQ0VTClByb3ZpZGVyOiBURVNUZ2FyY2lhLEFtZWxpYSBTCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiogUEFSQVNJVE9MT0dZIEZJTkFMIFJFUE9SVCA9PiBBdWcgMDMsIDE5OTUgICBURUNIIENPREU6IDEwMDMKUGFyYXNpdG9sb2d5IFJlbWFyayhzKToKTk8gT1ZBIE9SIFBBUkFTSVRFUyBGT1VORCAKTU9ERVJBVEUgV0JDJ1MgU0VFTiAKTU9ERVJBVEUgWUVBU1Q=
"""
/*
Accession [UID]: PARAS 95 263 []            Received: Aug 01, 1995@11:02
Collection sample: STOOL               Collection date: Jul 29, 1995 07:00
Site/Specimen: FECES
Provider: TESTgarcia,Amelia S
                                                        
* PARASITOLOGY FINAL REPORT => Aug 03, 1995   TECH CODE: 1003
Parasitology Remark(s):
NO OVA OR PARASITES FOUND 
MODERATE WBC'S SEEN 
MODERATE YEAST
*/

////////////////////////////////////////////////// 3 ///////////////////////////////////////



Instance:   ex-MHV-specimen-3
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <id>6Y100</id>
    <name>FECES</name>
    <collectionDate>2950728</collectionDate>
    <accessionNum>PARAS 95 262</accessionNum>
</specimen>
*/
* status = #available
* type.text = "FECES"
* collection.collectedDateTime = 1995-07-28
* identifier[TOid].value = "LabSpecimenTO.6Y100" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* accessionIdentifier.value = "PARAS 95 262"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual

Instance: ex-MHV-labTest-5
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>REJECTED=LEAKED</value>
    </result>
    <id>MI;7049271;1</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950801.110700</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049271;1"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "REJECTED=LEAKED"
* effectiveDateTime = 1995-08-01T11:07:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)

Instance: ex-MHV-labTest-6
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>MODERATE WBC'S SEEN</value>
    </result>
    <id>MI;7049271;2</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950801.110700</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049271;2"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "MODERATE WBC'S SEEN"
* effectiveDateTime = 1995-08-01T11:07:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)

Instance: ex-MHV-labTest-7
InstanceOf: VA.MHV.PHR.labTest 
Usage: #inline
/*
<labTestTO>
    <result>
        <value>MODERATE YEAST</value>
    </result>
    <id>MI;7049271;3</id>
    <name>Parasitology Remark(s)</name>
</labTestTO>
...
<labResultTO>
    <result>
        <timestamp>2950801.110700</timestamp>
        <labSiteId>989</labSiteId>
    </result>
</labResultTO>
*/
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text = "Parasitology Remark(s)"
* identifier[TOid].value = "LabTestTO.MI;7049271;3"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* valueString = "MODERATE YEAST"
* effectiveDateTime = 1995-08-01T11:07:00Z
* performer = Reference(Organization/ex-MHV-organization-989)
* subject = Reference(Patient/ex-MHV-patient-1)



Instance: ex-MHV-labReport-3
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 3 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR MICROBIOLOGY REPORT"
* code.coding = LOINC#18725-2
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1995-08-01T11:07:00Z
* issued = 1995-08-01T11:07:00Z
* identifier[TOid].value = "LabReportTO.MI;7049271" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-labTest-5
* result[+] = Reference(ex-MHV-labTest-5)
* contained[+] = ex-MHV-labTest-6
* result[+] = Reference(ex-MHV-labTest-6)
* contained[+] = ex-MHV-labTest-7
* result[+] = Reference(ex-MHV-labTest-7)
* contained[+] = ex-MHV-specimen-3
* specimen[+] = Reference(ex-MHV-specimen-3)
* contained[+] = ex-MHV-organization-989
* performer[+] = Reference(Organization/ex-MHV-organization-989)
* performer[+].display = "TESTgarcia,Amelia S"
* presentedForm.contentType = #text/plain
* presentedForm.data = """
QWNjZXNzaW9uIFtVSURdOiBQQVJBUyA5NSAyNjIgW10gICAgICAgICAgICBSZWNlaXZlZDogQXVnIDAxLCAxOTk1QDExOjAwCkNvbGxlY3Rpb24gc2FtcGxlOiBTVE9PTCAgICAgICAgICAgICAgIENvbGxlY3Rpb24gZGF0ZTogSnVsIDI4LCAxOTk1ClNpdGUvU3BlY2ltZW46IEZFQ0VTClByb3ZpZGVyOiBURVNUZ2FyY2lhLEFtZWxpYSBTCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiogUEFSQVNJVE9MT0dZIEZJTkFMIFJFUE9SVCA9PiBBdWcgMDEsIDE5OTUgICBURUNIIENPREU6IDQyMApQYXJhc2l0b2xvZ3kgUmVtYXJrKHMpOgpSRUpFQ1RFRD1MRUFLRUQ=
"""
/*
Accession [UID]: PARAS 95 262 []            Received: Aug 01, 1995@11:00
Collection sample: STOOL               Collection date: Jul 28, 1995
Site/Specimen: FECES
Provider: TESTgarcia,Amelia S
                                                        
* PARASITOLOGY FINAL REPORT => Aug 01, 1995   TECH CODE: 420
Parasitology Remark(s):
REJECTED=LEAKED
*/

//////////////////////////////////////////////////  4  //////////////////////////////////////////////


Instance:   ex-MHV-specimen-4
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <name>OLD HARDWARE LEFT FOOT X2</name>
    <collectionDate>3000809</collectionDate>
    <accessionNum>SP 00 1982</accessionNum>
</specimen>
*/
* status = #available
* type.text = "OLD HARDWARE LEFT FOOT X2"
* collection.collectedDateTime = 2000-08-09
* accessionIdentifier.value = "SP 00 1982"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual



Instance: ex-MHV-labReport-4
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 4 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR SURGICAL PATHOLOGY REPORT"
* code.coding = LOINC#11526-1
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 2000-08-10T15:56:00Z
* issued = 2000-08-10T15:56:00Z
* identifier[TOid].value = "LabReportTo.SP;6999190" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-specimen-4
* specimen[+] = Reference(ex-MHV-specimen-4)
* contained[+] = ex-MHV-organization-989
* performer = Reference(Organization/ex-MHV-organization-989)
* presentedForm.contentType = #text/plain
* presentedForm.data = """
RGF0ZSBTcGVjIHRha2VuOiBBdWcgMDksIDIwMDAgICAgICAgIFBhdGhvbG9naXN0OkF2YSBURVNUc21pdGggTUQKRGF0ZSBTcGVjIHJlYydkOiBBdWcgMDksIDIwMDAgMTY6MTQgIFJlc2lkZW50OiAKRGF0ZSAgY29tcGxldGVkOiBBdWcgMTAsIDIwMDAgICAgICAgIEFjY2Vzc2lvbiAjOiBTUCAwMCAxOTgyClN1Ym1pdHRlZCBieTogTUFSSyBURVNUam9obnNvbiBNRCAgICAgICAgICBQcmFjdGl0aW9uZXI6TUFSSyBURVNUam9obnNvbiBEUE0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTcGVjaW1lbjogCk9MRCBIQVJEV0FSRSBMRUZUIEZPT1QgWDIKQnJpZWYgQ2xpbmljYWwgSGlzdG9yeToKVGhpcyA3MSB5L28gd20gcHJlc2VudHMgd2l0aCBwYWluZnVsIGhhcmR3YXJlIEwgMXN0IG1ldGF0YXJzYWwgaGVhZC4gVGhlCnBpbnMgd2VyZSBpbnNlcnRlZCAzIHllYXJzIGFnbyBmb3IgYSBidW5pb24gcHJvY2VkdXJlLiBUaGUgQnVuaW9ucHJvY2VkdXJlCmlzIHdlbGwgaGVhbGVkIGFuZCBwdCBpcyBub3cgd2FudGluZyB0aGUgcGluIHJlbW92ZWQuIFdpbGwgcHJvYmFibHkgbmVlZAprLXdpcmUgZHJpdmVyIGFuZCBwb3dlciBmb3IgdGhpcyBjYXNlLgpQcmVvcGVyYXRpdmUgRGlhZ25vc2lzOgpQQUlORlVMIEhBUkRXQVJFIExFRlQgRklSU1QgTUVUQVRBUlNBTCAKUG9zdG9wZXJhdGl2ZSBEaWFnbm9zaXM6ClBBSU5GVUwgSEFSRFdBUkUgTEVGVCBGSVJTVCBNRVRBVEFSU0FMIApHcm9zcyBkZXNjcmlwdGlvbjoKUkVDRUlWRUQgVU5GSVhFRCBBTkQgTEFCRUxFRCAiT0xEIEhBUkRXQVJFIExFRlQgRk9PVCBYIDIiIENPTlNJU1RTIE9GIFRXTwoxLjcgQ00gQU5EIDIuNSBDTSBMT05HIDEgTU0gV0lERSBNRVRBTExJQyBQSU5TLgp8VEFCfHxOT1dSQVB8CkRJQUdOT1NJUzogSEFSRFdBUkUgKENMSU5JQ0FMTFkgRlJPTSBMRUZUIEZPT1Qp
"""
/*
Date Spec taken: Aug 09, 2000        Pathologist:Ava TESTsmith MD
Date Spec rec'd: Aug 09, 2000 16:14  Resident: 
Date  completed: Aug 10, 2000        Accession #: SP 00 1982
Submitted by: MARK TESTjohnson MD          Practitioner:MARK TESTjohnson DPM
-------------------------------------------------------------------------------
Specimen: 
OLD HARDWARE LEFT FOOT X2
Brief Clinical History:
This 71 y/o wm presents with painful hardware L 1st metatarsal head. The
pins were inserted 3 years ago for a bunion procedure. The Bunionprocedure
is well healed and pt is now wanting the pin removed. Will probably need
k-wire driver and power for this case.
Preoperative Diagnosis:
PAINFUL HARDWARE LEFT FIRST METATARSAL 
Postoperative Diagnosis:
PAINFUL HARDWARE LEFT FIRST METATARSAL 
Gross description:
RECEIVED UNFIXED AND LABELED "OLD HARDWARE LEFT FOOT X 2" CONSISTS OF TWO
1.7 CM AND 2.5 CM LONG 1 MM WIDE METALLIC PINS.
|TAB||NOWRAP|
DIAGNOSIS: HARDWARE (CLINICALLY FROM LEFT FOOT)
*/


//////////////////////////////////////////////////  5  //////////////////////////////////////////////


Instance:   ex-MHV-specimen-5
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <name>POLYPS (A) CECAL,        (B) PROXIMAL ASCENDING,        (C) RECTAL</name>
    <collectionDate>2990924</collectionDate>
    <accessionNum>SP 99 2207</accessionNum>
</specimen>
*/
* status = #available
* type.text = "POLYPS (A) CECAL,        (B) PROXIMAL ASCENDING,        (C) RECTAL"
* collection.collectedDateTime = 1999-09-24
* accessionIdentifier.value = "SP 99 2207"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual



Instance: ex-MHV-labReport-5
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 5 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR SURGICAL PATHOLOGY REPORT"
* code.coding = LOINC#11526-1
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1999-09-27T13:07:00Z
* issued = 1999-09-27T13:07:00Z
* identifier[TOid].value = "LabReportTO.SP;7009075" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-specimen-5
* specimen[+] = Reference(ex-MHV-specimen-5)
* contained[+] = ex-MHV-organization-989
* performer = Reference(Organization/ex-MHV-organization-989)
* presentedForm.contentType = #text/plain
* presentedForm.data = """
RGF0ZSBTcGVjIHRha2VuOiBTZXAgMjQsIDE5OTkgICAgICAgIFBhdGhvbG9naXN0OlRIT01BUyBURVNUd2lsbGlhbXMgTUQKRGF0ZSBTcGVjIHJlYydkOiBTZXAgMjQsIDE5OTkgMTM6NDYgIFJlc2lkZW50OiAKRGF0ZSAgY29tcGxldGVkOiBTZXAgMjcsIDE5OTkgICAgICAgIEFjY2Vzc2lvbiAjOiBTUCA5OSAyMjA3ClN1Ym1pdHRlZCBieTogRVZFTFlOIFRFU1Ricm93biBNRCAgICAgUHJhY3RpdGlvbmVyOkVWRUxZTiBURVNUYnJvd24KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTcGVjaW1lbjogClBPTFlQUyAoQSkgQ0VDQUwKICAgICAgIChCKSBQUk9YSU1BTCBBU0NFTkRJTkcKICAgICAgIChDKSBSRUNUQUwKQnJpZWYgQ2xpbmljYWwgSGlzdG9yeToKQ09MT04gUE9MWVBTIFBFUiBGTEVYIFNJRwpQcmVvcGVyYXRpdmUgRGlhZ25vc2lzOgpDT0xPTiBQT0xZUFMKT3BlcmF0aXZlIEZpbmRpbmdzOgp8VEFCfHxOT1dSQVB8CjEuIENFQ0FMIFBPTFlQUyBYIDIKMi4gQVNDRU5ESU5HIENPTE9OIFBPTFlQCjMuIFJFQ1RBTCBQT0xZUApQb3N0b3BlcmF0aXZlIERpYWdub3NpczoKU0FNRQpHcm9zcyBkZXNjcmlwdGlvbjoKfFRBQnx8Tk9XUkFQfApTUEVDSU1FTiAoQSkgTEFCRUxFRCBDRUNBTCBQT0xZUCBYIDIuICBSRUNFSVZFRCBJTiBGT1JNQUxJTiBJUyBPTkUgUEFMRQpHUkVZIFRJU1NVRSBGUkFHTUVOVCBNRUFTVVJJTkcgMC40IENNIElOIERJQU1FVEVSLiAgRU1CRURERUQgRU5USVJFTFkgSU4KT05FIEJMT0NLLgpTUEVDSU1FTiAoQikgTEFCRUxFRCBQUk9YSU1BTCBBU0NFTkRJTkcgQ09MT04uICBSRUNFSVZFRCBJTiBGT1JNQUxJTiBBUkUKVFdPIFBBTEUgQlJPV04gVElTU1VFIEZSQUdNRU5UUyBNRUFTVVJJTkcgMC4zIENNIElOIEFHR1JFR0FURS4gIEVNQkVEREVECkVOVElSRUxZIElOIE9ORSBCTE9DSy4KU1BFQ0lNRU4gKEMpIExBQkVMRUQgUkVDVEFMIFBPTFlQLiAgUkVDRUlWRUQgSU4gRk9STUFMSU4gQVJFIFRIUkVFIE1JTlVURQpUSVNTVUUgRlJBR01FTlRTIE1FQVNVUklORyAwLjMgQ00gSU4gQUdHUkVHQVRFLiAgRU1CRURERUQgRU5USVJFTFkKSU4gT05FIEJMT0NLLgpNaWNyb3Njb3BpYyBkZXNjcmlwdGlvbjogKERhdGUgU3BlYyB0YWtlbjogU2VwIDI0LCAxOTk5KQp8VEFCfHxCTEFOSygzKXwKfFRBQnx8Tk9XUkFQfApESUFHTk9TSVM6CkEpIENFQ0FMIFBPTFlQOiBIWVBFUlBMQVNUSUMgUE9MWVAuICAoU0VFIE5PVEUpCkIgJmFtcDsgQykKUFJPWElNQUwgQVNDRU5ESU5HIENPTE9OIEFORCBSRUNUQUwgUE9MWVBTOiBUVUJVTEFSIEFERU5PTUFTLiAoU0VFCk5PVEUpCiAKTk9URTogQ09BR1VMQVRJT04gQVJURUZBQ1QgQU5EIFBPT1IgVElTU1VFIFBSRVNFUlZBVElPTiBJUyBOT1RFRCBDQVVTSU5HCkRJRkZJQ1VMVFkgSU4gRVZBTFVBVElPTiBPRiBMRVNJT04uCkRSLiBURVNUYnJvd24gV0FTIE5PVElGSUVELg==
"""
/*
Date Spec taken: Sep 24, 1999        Pathologist:THOMAS TESTwilliams MD
Date Spec rec'd: Sep 24, 1999 13:46  Resident: 
Date  completed: Sep 27, 1999        Accession #: SP 99 2207
Submitted by: EVELYN TESTbrown MD     Practitioner:EVELYN TESTbrown
-------------------------------------------------------------------------------
Specimen: 
POLYPS (A) CECAL
       (B) PROXIMAL ASCENDING
       (C) RECTAL
Brief Clinical History:
COLON POLYPS PER FLEX SIG
Preoperative Diagnosis:
COLON POLYPS
Operative Findings:
|TAB||NOWRAP|
1. CECAL POLYPS X 2
2. ASCENDING COLON POLYP
3. RECTAL POLYP
Postoperative Diagnosis:
SAME
Gross description:
|TAB||NOWRAP|
SPECIMEN (A) LABELED CECAL POLYP X 2.  RECEIVED IN FORMALIN IS ONE PALE
GREY TISSUE FRAGMENT MEASURING 0.4 CM IN DIAMETER.  EMBEDDED ENTIRELY IN
ONE BLOCK.
SPECIMEN (B) LABELED PROXIMAL ASCENDING COLON.  RECEIVED IN FORMALIN ARE
TWO PALE BROWN TISSUE FRAGMENTS MEASURING 0.3 CM IN AGGREGATE.  EMBEDDED
ENTIRELY IN ONE BLOCK.
SPECIMEN (C) LABELED RECTAL POLYP.  RECEIVED IN FORMALIN ARE THREE MINUTE
TISSUE FRAGMENTS MEASURING 0.3 CM IN AGGREGATE.  EMBEDDED ENTIRELY
IN ONE BLOCK.
Microscopic description: (Date Spec taken: Sep 24, 1999)
|TAB||BLANK(3)|
|TAB||NOWRAP|
DIAGNOSIS:
A) CECAL POLYP: HYPERPLASTIC POLYP.  (SEE NOTE)
B &amp; C)
PROXIMAL ASCENDING COLON AND RECTAL POLYPS: TUBULAR ADENOMAS. (SEE
NOTE)
 
NOTE: COAGULATION ARTEFACT AND POOR TISSUE PRESERVATION IS NOTED CAUSING
DIFFICULTY IN EVALUATION OF LESION.
DR. TESTbrown WAS NOTIFIED.
*/

//////////////////////////////////////////////////  6  //////////////////////////////////////////////


Instance:   ex-MHV-specimen-6
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <name>POLYP @ 12CM</name>
    <collectionDate>2990809</collectionDate>
    <accessionNum>SP 99 1804</accessionNum>
</specimen>
*/
* status = #available
* type.text = "POLYP @ 12CM"
* collection.collectedDateTime = 1999-08-09
* accessionIdentifier.value = "SP 99 1804"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual



Instance: ex-MHV-labReport-6
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 6 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR SURGICAL PATHOLOGY REPORT"
* code.coding = LOINC#11526-1
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1999-08-11T16:09:00Z
* issued = 1999-08-11T16:09:00Z
* identifier[TOid].value = "LabReportTO.SP;7009190" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-specimen-6
* specimen[+] = Reference(ex-MHV-specimen-6)
* contained[+] = ex-MHV-organization-989
* performer = Reference(Organization/ex-MHV-organization-989)
* presentedForm.contentType = #text/plain
* presentedForm.data = """
RGF0ZSBTcGVjIHRha2VuOiBBdWcgMDksIDE5OTkgICAgICAgIFBhdGhvbG9naXN0OkF2YSBURVNUc21pdGggTUQKRGF0ZSBTcGVjIHJlYydkOiBBdWcgMTAsIDE5OTkgMTM6MjcgIFJlc2lkZW50OiAKRGF0ZSAgY29tcGxldGVkOiBBdWcgMTEsIDE5OTkgICAgICAgIEFjY2Vzc2lvbiAjOiBTUCA5OSAxODA0ClN1Ym1pdHRlZCBieTogS0FUSExFRU4gTUFSSUUgVEVTVGpvbmVzICBQcmFjdGl0aW9uZXI6S0FUSExFRU4gTUFSSUUgVEVTVGpvbmVzIE1ECi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3BlY2ltZW46IApQT0xZUCBAIDEyQ00KQnJpZWYgQ2xpbmljYWwgSGlzdG9yeToKNzAgWUVBUiBPTEQgTUFMRSBGT1IgU0NSRUVOSU5HIEVYQU0uICAKT3BlcmF0aXZlIEZpbmRpbmdzOgpTTU9PVEggQlJPQUQgQkFTRUQgUE9MWVAKUG9zdG9wZXJhdGl2ZSBEaWFnbm9zaXM6ClBST0JBQkxFIEJFTklHTiBQT0xZUApHcm9zcyBkZXNjcmlwdGlvbjoKUkVDRUlWRUQgSU4gRk9STUFMSU4gQU5EIExBQkVMRUQgIlBPTFlQIiAgQ09OU0lTVFMgT0YgVFdPIDEgTU0gRlJBR01FTlRTCk9GIFBJTksgVElTU1VFLiAgU1VCTUlUVEVEIElOIFRPVEFMIElOIE9ORSBCTE9DSy4KTWljcm9zY29waWMgZGVzY3JpcHRpb246IChEYXRlIFNwZWMgdGFrZW46IEF1ZyAwOSwgMTk5OSkKfFRBQnx8QkxBTksoMyl8CkRJQUdOT1NJUzoKUE9MWVAgQVQgMTIgQ00uIFRVQlVMQVIgQURFTk9NQS4=
"""
/*
Date Spec taken: Aug 09, 1999        Pathologist:Ava TESTsmith MD
Date Spec rec'd: Aug 10, 1999 13:27  Resident: 
Date  completed: Aug 11, 1999        Accession #: SP 99 1804
Submitted by: KATHLEEN MARIE TESTjones  Practitioner:KATHLEEN MARIE TESTjones MD
-------------------------------------------------------------------------------
Specimen: 
POLYP @ 12CM
Brief Clinical History:
70 YEAR OLD MALE FOR SCREENING EXAM.  
Operative Findings:
SMOOTH BROAD BASED POLYP
Postoperative Diagnosis:
PROBABLE BENIGN POLYP
Gross description:
RECEIVED IN FORMALIN AND LABELED "POLYP"  CONSISTS OF TWO 1 MM FRAGMENTS
OF PINK TISSUE.  SUBMITTED IN TOTAL IN ONE BLOCK.
Microscopic description: (Date Spec taken: Aug 09, 1999)
|TAB||BLANK(3)|
DIAGNOSIS:
POLYP AT 12 CM. TUBULAR ADENOMA.
*/


//////////////////////////////////////////////////  7  //////////////////////////////////////////////


Instance:   ex-MHV-specimen-7
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <name>(A) BONE FROM RIGHT FOOT, (B) BONE RIGHT FOOT</name>
    <collectionDate>2970908</collectionDate>
    <accessionNum>SP 97 2091</accessionNum>
</specimen>
*/
* status = #available
* type.text = "(A) BONE FROM RIGHT FOOT, (B) BONE RIGHT FOOT"
* collection.collectedDateTime = 1997-09-08
* accessionIdentifier.value = "SP 97 2091"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual



Instance: ex-MHV-labReport-7
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 7 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR SURGICAL PATHOLOGY REPORT"
* code.coding = LOINC#11526-1
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1997-09-09T13:13:00Z
* issued = 1997-09-09T13:13:00Z
* identifier[TOid].value = "LabReportTO.SP;7029091" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-specimen-7
* specimen[+] = Reference(ex-MHV-specimen-7)
* contained[+] = ex-MHV-organization-989
* performer = Reference(Organization/ex-MHV-organization-989)
* presentedForm.contentType = #text/plain
* presentedForm.data = """
RGF0ZSBTcGVjIHRha2VuOiBTZXAgMDgsIDE5OTcgICAgICAgIFBhdGhvbG9naXN0OlRIT01BUyBURVNUd2lsbGlhbXMgTUQKRGF0ZSBTcGVjIHJlYydkOiBTZXAgMDgsIDE5OTcgMTM6MDggIFJlc2lkZW50OiAKRGF0ZSAgY29tcGxldGVkOiBTZXAgMDksIDE5OTcgICAgICAgIEFjY2Vzc2lvbiAjOiBTUCA5NyAyMDkxClN1Ym1pdHRlZCBieTogREVCUkEgSyBURVNUc21pdGggTUQgICAgICAgUHJhY3RpdGlvbmVyOkRFQlJBIEsgVEVTVHNtaXRoCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3BlY2ltZW46IAooQSkgQk9ORSBGUk9NIFJJR0hUIEZPT1QKKEIpIEJPTkUgUklHSFQgRk9PVA==
"""
/*
Date Spec taken: Sep 08, 1997        Pathologist:THOMAS TESTwilliams MD
Date Spec rec'd: Sep 08, 1997 13:08  Resident: 
Date  completed: Sep 09, 1997        Accession #: SP 97 2091
Submitted by: DEBRA K TESTsmith MD       Practitioner:DEBRA K TESTsmith
-------------------------------------------------------------------------------
Specimen: 
(A) BONE FROM RIGHT FOOT
(B) BONE RIGHT FOOT
*/


//////////////////////////////////////////////////  8  //////////////////////////////////////////////


Instance:   ex-MHV-specimen-8
InstanceOf: VA.MHV.PHR.LabSpecimen
Usage: #inline
/*
<specimen>
    <name>BONE FRAGMENTS, LEFT FOOT</name>
    <collectionDate>2970512</collectionDate>
    <accessionNum>SP 97 1099</accessionNum>
</specimen>
*/
* status = #available
* type.text = "BONE FRAGMENTS, LEFT FOOT"
* collection.collectedDateTime = 1997-05-12
* accessionIdentifier.value = "SP 97 1099"
* accessionIdentifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* accessionIdentifier.use = #usual



Instance: ex-MHV-labReport-8
InstanceOf: VA.MHV.PHR.labReport 
Title: "Example 8 of an MHV labReport"
Usage: #example
Description: """
Example from a mock labReportTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "LR SURGICAL PATHOLOGY REPORT"
* code.coding = LOINC#11526-1
* subject = Reference(Patient/ex-MHV-patient-1)
* effectiveDateTime = 1997-05-14T09:54:00Z
* issued = 1997-05-14T09:54:00Z
* identifier[TOid].value = "LabReportTO.SP;7029487" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* contained[+] = ex-MHV-specimen-8
* specimen[+] = Reference(ex-MHV-specimen-8)
* contained[+] = ex-MHV-organization-989
* performer = Reference(Organization/ex-MHV-organization-989)
* presentedForm.contentType = #text/plain
* presentedForm.data = """
RGF0ZSBTcGVjIHRha2VuOiBNYXkgMTIsIDE5OTcgICAgICAgIFBhdGhvbG9naXN0OkF2YSBURVNUc21pdGggTUQKRGF0ZSBTcGVjIHJlYydkOiBNYXkgMTIsIDE5OTcgMTQ6MDAgIFJlc2lkZW50OiAKRGF0ZSAgY29tcGxldGVkOiBNYXkgMTMsIDE5OTcgICAgICAgIEFjY2Vzc2lvbiAjOiBTUCA5NyAxMDk5ClN1Ym1pdHRlZCBieTogREVCUkEgSyBURVNUc21pdGggTUQgICAgICAgUHJhY3RpdGlvbmVyOkRFQlJBIEsgVEVTVHNtaXRoCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU3BlY2ltZW46IApCT05FIEZSQUdNRU5UUywgTEVGVCBGT09U
"""
/*
Date Spec taken: May 12, 1997        Pathologist:Ava TESTsmith MD
Date Spec rec'd: May 12, 1997 14:00  Resident: 
Date  completed: May 13, 1997        Accession #: SP 97 1099
Submitted by: DEBRA K TESTsmith MD       Practitioner:DEBRA K TESTsmith
-------------------------------------------------------------------------------
Specimen: 
BONE FRAGMENTS, LEFT FOOT
*/
