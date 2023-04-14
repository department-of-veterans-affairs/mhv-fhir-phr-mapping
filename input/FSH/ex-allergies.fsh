
Instance:   ex-MHV-allergy-1
InstanceOf: VA.MHV.PHR.allergyIntolerance
Title: "Example 1 of an MHV allergy or intolerance"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* patient = Reference(Patient/ex-MHV-patient-89486)
* identifier[recordIdentifier].value = "53495" 
* identifier[recordIdentifier].system = "http://example.org/979_120.8"
* identifier[recordIdentifier].use = #usual
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* onsetDateTime = 2002-06-03T09:44:00Z
* code.text = "CONTRAST MEDIA, OTHER"
* category = #medication
* reaction[+].manifestation.text = "RESPIRATORY DISTRESS"
* reaction[=].manifestation.coding.code = #4637183
* note.text = "Updated using clean up process.  Changed reactant from IVP DYE (free text) to CONTRAST MEDIA, OTHER(file - PS(50.605,)"
* note.time = 2004-07-24T18:29:07Z
