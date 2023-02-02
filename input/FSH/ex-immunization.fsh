
Instance:   ex-MHV-immunization-1
InstanceOf: VA.MHV.PHR.immunization
Title: "Example 1 of an MHV immunization"
Usage: #example
Description:      """
Example from a mock ImmunizationTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode.text = "COVID-19 (MODERNA), MRNA, LNP-S, PF, 100 MCG/0.5ML DOSE OR 50 MCG/0.25ML DOSE"
* patient = Reference(Patient/ex-MHV-patient-1)
* occurrenceDateTime = 2022-08-08T11:15:28Z
* recorded = 2022-08-08T11:15:28Z
* primarySource = false
* identifier[TOid].value = "124684" 
* identifier[TOid].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/ImmunizationTO.id"
* identifier[TOid].use = #usual
* note[0].text = "test"
// TODO figure out why these three fail
//* location.display = "DAYTON"
//* encounter.identifier.value = "6433274"
//* protocolApplied.series = "COMPLETE"


Instance:   ex-MHV-immunization-2
InstanceOf: VA.MHV.PHR.immunization
Title: "Example 2 of an MHV immunization"
Usage: #example
Description:      """
Example from a mock ImmunizationTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #completed
* vaccineCode.text = "INFLUENZA, INJECTABLE, QUADRIVALENT"
* vaccineCode.coding[0] = CPT#90688 "IIV4 VACCINE SPLT 0.5 ML IM"
//* vaccineCode.coding[0].version = "2014"
* patient = Reference(Patient/ex-MHV-patient-1)
* occurrenceDateTime = 2022-08-05T16:56:38Z
* recorded = 2022-08-05T16:56:38Z
* primarySource = false
* identifier[TOid].value = "124685" 
* identifier[TOid].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/ImmunizationTO.id"
* identifier[TOid].use = #usual
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
