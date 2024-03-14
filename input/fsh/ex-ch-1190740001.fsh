
///////////////////////////////////////////////////  1190740001  ////////////////////////////////////////


Instance:   ex-MHV-chSpecimen-1190740001
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
* collection.collectedDateTime = 2019-03-15T16:58:06-05:00


Instance: ex-MHV-chOrder-1190740001a
InstanceOf: VA.MHV.PHR.chOrder
Usage: #inline
* category[us-core] = SCT#108252007 "Laboratory procedure"
* code.coding[+].code = #84140.0000
* code.text = "Potassium"
* code.coding[=].system = "http://va.gov/systems/99VA64"
* code.coding[+].code = #177
* code.coding[=].display = "POTASSIUM"
* code.coding[=].system = "http://va.gov/systems/99VA60"
* status = #unknown
* intent = #order
* subject = Reference(Patient/ex-MHV-patient-942104)
* performer[+] = Reference(Organization/ex-MHV-organization-660)
* requester[+] = Reference(Practitioner/ex-MHV-practitioner-59845-VA660)

Instance: ex-MHV-chTest-1190740001a
InstanceOf: VA.MHV.PHR.chTest 
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* status = #final
* code.coding[+].code = #2823-3
* code.text = "POTASSIUM:SCNC:PT:SER/PLAS:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.64"
* code.coding[+].code = #4670505
* code.coding[=].system = "http://va.gov/systems/99VA95.3"
* code.coding[=].version = "2.64"
* code.text = "POTASSIUM"
* referenceRange.text = "3.8-5.2"
* valueQuantity.value = 4.1
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-660)
* subject = Reference(Patient/ex-MHV-patient-942104)
* basedOn = Reference(ex-MHV-chOrder-1190740001a)
* specimen = Reference(ex-MHV-chSpecimen-1190740001)



Instance: ex-MHV-chReport-1190740001
InstanceOf: VA.MHV.PHR.chReport 
Title: "Example 1190740001 of an MHV chReport"
Usage: #example
Description: """
Example from a mock labTestPromises (1190740001)
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[Rid].value = "1190740001" 
* identifier[Rid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[Rid].use = #usual
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "CH"
* subject = Reference(Patient/ex-MHV-patient-942104)
* effectiveDateTime = 2019-03-15T16:59:35-05:00
* issued = 2019-03-15T16:59:35-05:00
* extension[note][+].valueString = "Lisa's 3/15 test"
* contained[+] = ex-MHV-organization-979
* contained[+] = ex-MHV-practitioner-59845-VA660
* contained[+] = ex-MHV-organization-660
* performer[+] = Reference(Organization/ex-MHV-organization-979)

* contained[+] = ex-MHV-chOrder-1190740001a
* basedOn[+] = Reference(ex-MHV-chOrder-1190740001a)
* contained[+] = ex-MHV-chTest-1190740001a
* result[+] = Reference(ex-MHV-chTest-1190740001a)
* category[1].coding.code = #2823-3
* category[=].text = "POTASSIUM:SCNC:PT:SER/PLAS:QN:"
* category[=].coding.system = LOINC
* category[=].coding.version = "2.64"

* contained[+] = ex-MHV-chSpecimen-1190740001
* specimen[+] = Reference(ex-MHV-chSpecimen-1190740001)
* effectiveDateTime = 2019-03-15T16:58:06-05:00

