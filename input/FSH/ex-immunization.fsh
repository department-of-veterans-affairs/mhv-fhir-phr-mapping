

Instance:   ex-MHV-immunization-0
InstanceOf: VA.MHV.PHR.immunization
Title: "Example of an MHV immunization R4 to flu, no note, no reaction"
Description:      "holding typical values"
Usage: #example
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode = http://hl7.org/fhir/sid/cvx#111
* patient = Reference(Patient/ex-patient)
* occurrenceDateTime = 2020-12-25T23:50:50-05:00
* recorded = 2020-12-25T23:50:50-05:00
* primarySource = false
* identifier[+].value = "HI" 


// TODO need more Immunization examples

Instance:   ex-MHV-immunization-1
InstanceOf: VA.MHV.PHR.immunization
Title: "Example of an MHV immunization from a ImmunizationTO"
Usage: #example
Description:      """
Example from a sample ImmunizationTO

`
<immunizationTO>
    <administeredDate>3220808.111528</administeredDate>
    <comments>test</comments>
    <contraindicated>0</contraindicated>
    <encounter>
        <location>
            <name>23 HOUR OBSERVATION</name>
        </location>
        <visitId>6433274</visitId>
        <facility>
            <sitecode>552</sitecode>
            <name>DAYTON</name>
        </facility>
    </encounter>
    <id>124684</id>
    <name>COVID-19 (MODERNA), MRNA, LNP-S, PF, 100 MCG/0.5ML DOSE OR 50 MCG/0.25ML DOSE</name>
    <series>COMPLETE</series>
</immunizationTO>
`
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode.text = "COVID-19 (MODERNA), MRNA, LNP-S, PF, 100 MCG/0.5ML DOSE OR 50 MCG/0.25ML DOSE"
* patient = Reference(Patient/ex-patient-1)
* occurrenceDateTime = 2022-08-08T11:15:28Z
* recorded = 2022-08-08T11:15:28Z
* primarySource = false
* identifier[+].value = "124684" 
* identifier[=].use = #usual
* note[0].text = "test"
// TODO figure out why these three fail
//* location.display = "DAYTON"
//* encounter.identifier.value = "6433274"
//* protocolApplied.series = "COMPLETE"


Instance:   ex-MHV-immunization-2
InstanceOf: VA.MHV.PHR.immunization
Title: "Example of an MHV immunization from a ImmunizationTO"
Usage: #example
Description:      """
Example from a sample ImmunizationTO

`
<immunizationTO>
    <administeredDate>3220805.165638</administeredDate>
    <comments>test comment</comments>
    <contraindicated>0</contraindicated>
    <cptCode>
        <id>90688</id>
        <name>IIV4 VACCINE SPLT 0.5 ML IM</name>
    </cptCode>
    <encounter>
        <location>
            <name>ADTP BURNETT</name>
        </location>
        <visitId>6433261</visitId>
        <facility>
            <sitecode>552</sitecode>
            <name>DAYTON</name>
        </facility>
    </encounter>
    <id>124685</id>
    <name>INFLUENZA, INJECTABLE, QUADRIVALENT</name>
    <reaction>FEVER</reaction>
    <series>COMPLETE</series>
</immunizationTO>
`
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode.text = "INFLUENZA, INJECTABLE, QUADRIVALENT"
* patient = Reference(Patient/ex-patient-1)
* occurrenceDateTime = 2022-08-05T16:56:38Z
* recorded = 2022-08-05T16:56:38Z
* primarySource = false
* identifier[+].value = "124685" 
* identifier[=].use = #usual
* note.text = "test comment"
// TODO figure out why these three fail
//* location.display = "DAYTON"
//* encounter.identifier.value = "6433261"
//* protocolApplied.series = "COMPLETE"
* reaction.detail = Reference(in-reaction-2)
* contained[+] = in-reaction-2

Instance: in-reaction-2
InstanceOf: Observation
Usage: #inline
* status = #final
* code = SCT#386661006
