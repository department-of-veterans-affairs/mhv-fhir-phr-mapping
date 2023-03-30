

Instance:   ex-MHV-vitals-1
InstanceOf: VA.MHV.PHR.vitalsBP
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
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = 2004-09-24T11:17:54Z
* component[systolic].code = LOINC#8480-6 "Systolic blood pressure"
* component[systolic].valueQuantity = 126 'mm[Hg]'
* component[systolic].valueQuantity.unit = "mmHg"
* component[diastolic].code = LOINC#8462-4 "Diastolic blood pressure"
* component[diastolic].valueQuantity = 70 'mm[Hg]'
* component[diastolic].valueQuantity.unit = "mmHg"

Instance:   ex-MHV-pain-1
InstanceOf: VA.MHV.PHR.vitalsPain
Title: "Example of a MHV pain R4 observation of 10"
Description:      "holding typical values"
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.coding = LOINC#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* valueQuantity.value = 10 
* note.text = "Oh, scream in pain"

Instance:   ex-MHV-heartRate-1
InstanceOf: VA.MHV.PHR.vitals
Title: "Example of an MHV heartRate R4 observation"
Description:      "Heart Rate holding typical values"
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.coding = LOINC#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* valueQuantity = 185 '/min' 
* note.text = "a bit fast"
