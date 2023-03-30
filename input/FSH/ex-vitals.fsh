

Instance:   ex-MHV-vitals-1
InstanceOf: VA.MHV.PHR.vitals
Usage: #example
Title: "Example 1 of an MHV vital-sign"
Description: """
Example from a mock VitalSignTO
"""
/*
<vitalSignTO>
    <type>
        <id>6003810</id>
        <category/>
        <name>BLOOD PRESSURE</name>
    </type>
    <value1>126/70</value1>
    <low>100/60</low>
    <high>210/110</high>
    <timestamp>3040924.111754</timestamp>
    <location>
        <id>2938</id>
        <name>PCT_O PATIL (F/U)</name>
    </location>
    <units>mm[Hg]</units>
</vitalSignTO>

*/
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* identifier[TOid].value = "VitalSignTO.6003810" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "BLOOD PRESSURE"
* code.coding = LOINC#85354-9 "Blood pressure panel with all children optional"
* subject = Reference(ex-MHV-patient-2)
* effectiveDateTime = 2004-09-24T11:17:54Z
* component[+].code = LOINC#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 126 'mm[Hg]'
* component[+].code = LOINC#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 70 'mm[Hg]'

