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
    * description = "Security is system level, PGHD presumes MHV properly handles user (as patient) rights"
  * resource[+]
    * type = #AllergyIntolerance
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.allergyIntolerance"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Condition
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.condition"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Observation
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #Immunization
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.immunization"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #DocumentReference
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.documentReference"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.note"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.imaging"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.ecg"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
  * resource[+]
    * type = #DiagnosticReport
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.diagnosticReport"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.chReport"
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.labReport"
    * documentation = "MHV [PGHD use](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read

  * resource[+]
    * type = #Patient
    * supportedProfile[+] = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.patient"
    * interaction[+].code = #search-type
    * interaction[+].code = #read

