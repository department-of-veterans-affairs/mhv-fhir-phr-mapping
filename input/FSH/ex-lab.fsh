Instance:   ex-MHV-lab-0
InstanceOf: VA.MHV.lab
Title: "Example of an MHV lab observation"
Description:      "holding typical values"
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #final
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding = LOINC#2339-0 "Glucose [Mass/volume] in Blood"
* subject = Reference(Patient/ex-patient)
* effectiveDateTime = 2020-12-04T23:50:50-05:00
* valueQuantity = 99 'mg/dL' 
// no comments in this one as comments is only in DSTU2
* note.text = "a bit low, no indicated method, no indicated eating"
* identifier[+].value = "HI" 

