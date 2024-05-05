Instance: MHVcapabilities
InstanceOf: CapabilityStatement
Usage: #definition
* description = "CapabilityStatement prototype for MHV as a FHIR Server exposing PHR data"
* name = "MHV_PHR"
* title = "This indicates how MHV exposes PHR using FHIR"
* status = #active
* experimental = false
* date = "2023-08-23"
//* kind = #instance
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest
  * mode = #server
  * documentation = "MHV supports queries to PHR."
  * interaction.code = #search-system
  * security
    * cors = false
    * description = "Security is system level, PHR presumes MHV properly handles user (as patient) rights"
  * resource[+]
    * type = #AllergyIntolerance
    * supportedProfile[+] = Canonical(VA.MHV.PHR.allergyIntolerance)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Condition
    * supportedProfile[+] = Canonical(VA.MHV.PHR.condition)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Observation
    * supportedProfile[+] = Canonical(VA.MHV.PHR.vitals)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.vitalsBP)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.vitalsPain)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.vitalsOx)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Immunization
    * supportedProfile[+] = Canonical(VA.MHV.PHR.immunization)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #DocumentReference
    * supportedProfile[+] = Canonical(VA.MHV.PHR.documentReference)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.note)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.imaging)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.ecg)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #DiagnosticReport
    * supportedProfile[+] = Canonical(VA.MHV.PHR.diagnosticReport)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.chReport)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.SPlabReport)
    * supportedProfile[+] = Canonical(VA.MHV.PHR.MBlabReport)
    * documentation = "MHV [PHR use](index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read

  * resource[+]
    * type = #Patient
    * supportedProfile[+] = Canonical(VA.MHV.PHR.patient)
    * interaction[+].code = #search-type
    * interaction[+].code = #read

