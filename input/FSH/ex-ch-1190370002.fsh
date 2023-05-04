
///////////////////////////////////////////////////  1190370002  ////////////////////////////////////////


Instance:   ex-MHV-chSpecimen-1190370002
InstanceOf: VA.MHV.PHR.chSpecimen
Usage: #inline
* status = #available
* type.coding[+].code = #PLAS
* type.coding[=].display = "Plasma"
* type.coding[=].system = "http://va.gov/systems/HL70070"
* type.coding[+].code = #73
* type.coding[=].display = "PLASMA"
* type.coding[=].system = "http://va.gov/systems/99VA61"
* type.coding[=].version = "5.2"
* type.text = "PLASMA"
* collection.collectedDateTime = 2019-02-06T11:13:48-05:00


Instance: ex-MHV-chPanel-1190370002a
InstanceOf: VA.MHV.PHR.chPanel
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.coding[+].code = #82830.0000
* code.text = "Carbon Dioxide Content"
* code.coding[=].system = "http://va.gov/systems/99VA64"
* code.coding[+].code = #179
* code.coding[=].display = "CO2"
* code.coding[=].system = "http://va.gov/systems/99VA60"
* status = #final
* subject = Reference(Patient/ex-MHV-patient-942104)
* hasMember = Reference(ex-MHV-chTest-1190370002a)

Instance: ex-MHV-chTest-1190370002a
InstanceOf: VA.MHV.PHR.chTest 
Usage: #inline
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* interpretation.text = "L"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* status = #final
* code.coding[+].code = #2028-9
* code.text = "CARBON DIOXIDE:SCNC:PT:SER/PLAS:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.64"
* code.coding[+].code = #4662085
* code.coding[=].system = "http://va.gov/systems/99VA95.3"
* code.coding[=].version = "2.64"
* code.text = "CO2"
* referenceRange.text = "22-32"
* valueQuantity.value = 21
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-660)
* subject = Reference(Patient/ex-MHV-patient-942104)





Instance: ex-MHV-chReport-1190370002
InstanceOf: VA.MHV.PHR.chReport 
Title: "Example 1190370002 of an MHV chReport"
Usage: #example
Description: """
Example from a mock labTestPromises (1190370002)
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[Rid].value = "1190370002" 
* identifier[Rid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[Rid].use = #usual
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "CH"
* subject = Reference(Patient/ex-MHV-patient-942104)
* effectiveDateTime = 2019-02-06T11:14:52-05:00
* issued = 2019-02-06T11:14:52-05:00

* conclusion = """
Lisa's Test 10/29/20
"""
* performer[+] = Reference(Organization/ex-MHV-organization-979)
* performer[+] = Reference(Organization/ex-MHV-organization-660)
* performer[+] = Reference(Practitioner/ex-MHV-practitioner-59845-VA660)

* contained[+] = ex-MHV-chPanel-1190370002a
* result[+] = Reference(ex-MHV-chPanel-1190370002a)
* contained[+] = ex-MHV-chTest-1190370002a
* result[+] = Reference(ex-MHV-chTest-1190370002a)
* category[1].coding.code = #4548-4
* category[=].text = "HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL:MFR:PT:BLD:QN:"
* category[=].coding.system = LOINC
* category[=].coding.version = "2.68"

* contained[+] = ex-MHV-chSpecimen-1190370002
* specimen[+] = Reference(ex-MHV-chSpecimen-1190370002)
* meta.lastUpdated = 2019-02-06T11:14:53-05:00

