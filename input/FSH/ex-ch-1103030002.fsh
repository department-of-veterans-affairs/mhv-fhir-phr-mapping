
///////////////////////////////////////////////////  1103030002  ////////////////////////////////////////


Instance:   ex-MHV-chSpecimen-1103030002
InstanceOf: VA.MHV.PHR.chSpecimen
Usage: #inline
* status = #available
* type.coding[+].code = #BLD
* type.coding[=].display = "Whole blood"
* type.coding[=].system = "http://terminology.hl7.org/CodeSystem/v2-0487"
* type.coding[+].code = #70
* type.coding[=].display = "BLOOD"
* type.coding[=].system = "http://va.gov/systems/99VA61"
* type.coding[=].version = "5.2"
* type.text = "BLOOD"
* collection.collectedDateTime = 2020-10-29T13:30:03-05:00


Instance: ex-MHV-chPanel-1103030002a
InstanceOf: VA.MHV.PHR.chPanel
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+].code = #85052.0000
* code.text = "Glycohemoglobin A(1) C"
* code.coding[=].system = "http://va.gov/systems/99VA64"
* code.coding[+].code = #1893
* code.coding[=].display = "A1C HEMOGLOBIN {Pnl}"
* code.coding[=].system = "http://va.gov/systems/99VA60"
* status = #final
* subject = Reference(Patient/ex-MHV-patient-942104)
* hasMember = Reference(ex-MHV-chTest-1103030002a)

Instance: ex-MHV-chTest-1103030002a
InstanceOf: VA.MHV.PHR.chTest 
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* interpretation.text = "L"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* status = #final
* code.coding[+].code = #4548-4
* code.text = "HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL:MFR:PT:BLD:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.68"
* code.coding[+].code = #4682837
* code.coding[=].system = "http://va.gov/systems/99VA95.3"
* code.coding[=].version = "2.68"
* code.text = "HEMOGLOBIN A1C"
* referenceRange.text = "4.4-6.0"
* valueQuantity.value = 3.9
* valueQuantity.unit = "%"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-660)
* subject = Reference(Patient/ex-MHV-patient-942104)





Instance: ex-MHV-chReport-1103030002
InstanceOf: VA.MHV.PHR.chReport 
Title: "Example 1103030002 of an MHV chReport"
Usage: #example
Description: """
Example from a mock labTestPromises (1103030002)
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[Rid].value = "1103030002" 
* identifier[Rid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[Rid].use = #usual
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "CH"
* subject = Reference(Patient/ex-MHV-patient-942104)
* effectiveDateTime = 2020-10-29T13:32:46-05:00
* issued = 2020-10-29T13:32:46-05:00

* conclusion = """
Lisa's Test 10/29/20
"""
* contained[+] = ex-MHV-organization-979
* contained[+] = ex-MHV-practitioner-59845-VA660
* contained[+] = ex-MHV-organization-660
* performer[+] = Reference(Organization/ex-MHV-organization-979)
* performer[+] = Reference(Organization/ex-MHV-organization-660)
* performer[+] = Reference(Practitioner/ex-MHV-practitioner-59845-VA660)

* contained[+] = ex-MHV-chPanel-1103030002a
* result[+] = Reference(ex-MHV-chPanel-1103030002a)
* contained[+] = ex-MHV-chTest-1103030002a
* result[+] = Reference(ex-MHV-chTest-1103030002a)
* category[1].coding.code = #4548-4
* category[=].text = "HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL:MFR:PT:BLD:QN:"
* category[=].coding.system = LOINC
* category[=].coding.version = "2.68"

* contained[+] = ex-MHV-chSpecimen-1103030002
* specimen[+] = Reference(ex-MHV-chSpecimen-1103030002)
//* meta.lastUpdated = 2020-10-29T13:32:46-05:00

