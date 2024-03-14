
///////////////////////////////////////////////////  1190530001  ////////////////////////////////////////


Instance:   ex-MHV-chSpecimen-1190530001
InstanceOf: VA.MHV.PHR.chSpecimen
Usage: #inline
* status = #available
* type.coding[+].code = #PLAS
* type.coding[=].display = "Plasma"
* type.coding[=].system = "http://terminology.hl7.org/CodeSystem/v2-0487"
* type.coding[+].code = #73
* type.coding[=].display = "PLASMA"
* type.coding[=].system = "http://va.gov/systems/99VA61"
* type.coding[=].version = "5.2"
* type.text = "PLASMA"
* collection.collectedDateTime = 2019-02-22T11:10:05-05:00


Instance: ex-MHV-chOrder-1190530001a
InstanceOf: VA.MHV.PHR.chOrder
Usage: #inline
* category[us-core] = SCT#108252007 "Laboratory procedure"
* code.coding[+].code = #82565.0000
* code.text = "Creatinine"
* code.coding[=].system = "http://va.gov/systems/99VA64"
* code.coding[+].code = #173
* code.coding[=].display = "CREATININE"
* code.coding[=].system = "http://va.gov/systems/99VA60"
* status = #unknown
* intent = #order
* subject = Reference(Patient/ex-MHV-patient-942104)
* performer[+] = Reference(Organization/ex-MHV-organization-660)
* requester[+] = Reference(Practitioner/ex-MHV-practitioner-59845-VA660)

Instance: ex-MHV-chTest-1190530001a
InstanceOf: VA.MHV.PHR.chTest 
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* interpretation.text = "H"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* status = #final
* code.coding[+].code = #2160-0
* code.text = "CREATININE:MCNC:PT:SER/PLAS:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.64"
* code.coding[+].code = #4663483
* code.coding[=].system = "http://va.gov/systems/99VA95.3"
* code.coding[=].version = "2.64"
* code.text = "CREATININE"
* referenceRange.text = "0.6-1.3"
* valueQuantity.value = 29
* valueQuantity.unit = "mg/dL"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-660)
* subject = Reference(Patient/ex-MHV-patient-942104)
* specimen = Reference(Specimen/ex-MHV-chSpecimen-1190530001)
* basedOn = Reference(ServiceRequest/ex-MHV-chOrder-1190530001a)




Instance: ex-MHV-chReport-1190530001
InstanceOf: VA.MHV.PHR.chReport 
Title: "Example 1190530001 of an MHV chReport"
Usage: #example
Description: """
Example from a mock labTestPromises (1190530001)
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[Rid].value = "1190530001" 
* identifier[Rid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[Rid].use = #usual
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "CH"
* subject = Reference(Patient/ex-MHV-patient-942104)
* effectiveDateTime = 2019-02-22T11:11:33-05:00
* issued = 2019-02-22T11:11:33-05:00
* extension[note][+].valueString = "Lisa's Test 2/22/19"
* contained[+] = ex-MHV-organization-979
* contained[+] = ex-MHV-practitioner-59845-VA660
* contained[+] = ex-MHV-organization-660
* performer[+] = Reference(Organization/ex-MHV-organization-979)

* contained[+] = ex-MHV-chOrder-1190530001a
* basedOn[+] = Reference(ex-MHV-chOrder-1190530001a)
* contained[+] = ex-MHV-chTest-1190530001a
* result[+] = Reference(ex-MHV-chTest-1190530001a)
* category[1].coding.code = #4548-4
* category[=].text = "HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL:MFR:PT:BLD:QN:"
* category[=].coding.system = LOINC
* category[=].coding.version = "2.68"

* contained[+] = ex-MHV-chSpecimen-1190530001
* specimen[+] = Reference(ex-MHV-chSpecimen-1190530001)
//* meta.lastUpdated = 2019-02-22T11:11:34-05:00

