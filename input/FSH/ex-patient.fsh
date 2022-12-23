
Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
//* identifier = urn:uuid:2.16.840.1.113883.4.349#MVI // MVI ICN VALUE WITH CHECKSUM>
// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
// wiki - https://en.wikipedia.org/wiki/John_Jacob_Jingleheimer_Schmidt
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"

Instance: ex-patient-1
InstanceOf: Patient
Title: "Example from PatientTO"
Description: """
This example is derived off of an example PatientTO

- Guess at where these go

`
<patientTO>
    <name>MTPZEROTWO,DAYTSHR</name>
    <patientName>MTPZEROTWO,DAYTSHR</patientName>
    <mpiPid>1013699147</mpiPid>
    <mpiChecksum>368567</mpiChecksum>
    <localPid>552164786</localPid>
    <confidentiality>
        <tag>0</tag>
    </confidentiality>
    <patientFlags>
        <count>0</count>
    </patientFlags>
</patientTO>
`
"""
Usage: #example
* name[+].use = #usual
* name[=].family = "DAYTSHR"
* name[=].given = "MTPZEROTWO"
* identifier[+].use = #official
// Not sure what .type to use
* identifier[=].type.text = "mpiPID"
* identifier[=].value = "1013699147"
* identifier[+].use = #secondary
* identifier[=].type.text = "localPID"
* identifier[=].value = "552164786"
* meta.security[+].display = "0"
// Not sure what to do with patientFlags