Instance: MHVcapabilities
InstanceOf: CapabilityStatement
Usage: #definition
* description = "CapabilityStatement prototype for MHV as a FHIR Server exposing PHR data"
* name = "MHV_PHR"
* title = "This indicates how MHV exposes PHR using FHIR"
* status = #active
* experimental = false
* date = "2022-12-22"
* kind = #instance
//* kind = #requirements
* implementation
  * description = "MyHealtheVet"
  * url = "https://www.myhealth.va.gov/"
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest
  * mode = #server
  * documentation = "MHV supports queries to PHR."
  * security
    * cors = false
    * description = "Security is system level, PGHD presumes MHV properly handles user (as patient) rights"
  * resource[+]
    * type = #Observation
    * supportedProfile[+] = "https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.lab"
    * documentation = "MHV [PGHD use](https://johnmoehrke.github.io/MHV-PHR/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "patient"
      * type = #token
    * searchParam[+]
      * name = "date"
      * type = #token
    * searchParam[+]
      * name = "category"
      * type = #token
    * searchParam[+]
      * name = "code"
      * type = #token
  * resource[+]
    * type = #Immunization
    * supportedProfile[+] = "https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.immunization"
    * documentation = "MHV [PGHD use](https://johnmoehrke.github.io/MHV-PHR/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "patient"
      * type = #token
    * searchParam[+]
      * name = "date"
      * type = #token
  * resource[+]
    * type = #DocumentReference
    * supportedProfile[+] = "https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.note"
    * documentation = "MHV [PGHD use](https://johnmoehrke.github.io/MHV-PHR/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "patient"
      * type = #token
    * searchParam[+]
      * name = "category"
      * type = #token
    * searchParam[+]
      * name = "type"
      * type = #token
    * searchParam[+]
      * name = "date"
      * type = #token
    * searchParam[+]
      * name = "period"
      * type = #token
  * resource[+]
    * type = #Condition
    * supportedProfile[+] = "https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.condition"
    * documentation = "MHV [PGHD use](https://johnmoehrke.github.io/MHV-PHR/index.html)"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "clinical-status"
      * type = #token
    * searchParam[+]
      * name = "patient"
      * type = #token
    * searchParam[+]
      * name = "category"
      * type = #token
    * searchParam[+]
      * name = "code"
      * type = #token
    * searchParam[+]
      * name = "recorded-date"
      * type = #token


  * resource[+]
    * type = #Organization
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token

  * resource[+]
    * type = #Location
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token

  * resource[+]
    * type = #Practitioner
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token

  * resource[+]
    * type = #Patient
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "identifier"
      * type = #token
  * interaction.code = #search-system
