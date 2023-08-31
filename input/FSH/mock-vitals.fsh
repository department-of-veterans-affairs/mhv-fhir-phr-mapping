Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $loinc = http://loinc.org

Instance: 78a91da6-0c7e-4fe4-b78b-052f5068c0bc
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "6003810"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003810"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T11:17:54Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 126 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 70 'mm[Hg]' "mmHg"

Instance: bdd34c98-cfa0-445f-b1b2-390da2d6c239
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "6003543"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003543"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:42:17Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 158 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 75 'mm[Hg]' "mmHg"

Instance: 9096f46f-0ae8-411e-878b-5efb44048dd1
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "6003499"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003499"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 158 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 75 'mm[Hg]' "mmHg"

Instance: be6ae93b-c2ae-48b2-8ed2-5862025b1b09
InstanceOf: Observation
Title: "HEIGHT"
Description:  "6003503"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003503"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: a9982eb2-3c98-44f3-a398-744bb27df0dd
InstanceOf: Observation
Title: "PULSE"
Description:  "6003502"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003502"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 83 '/min'

Instance: 8f1f2881-69b5-4f1b-9212-fd182617d87c
InstanceOf: Observation
Title: "PAIN"
Description:  "6003505"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003505"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 5

Instance: 1707b5b6-0f14-488e-8430-17ecb5e8b72a
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "6003501"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003501"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 18 '/min'

Instance: fb01acff-1972-4645-8b88-f6a64680fc33
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "6003500"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003500"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 97.6 'F'

Instance: 612b5004-1fb0-4659-a182-132d74334fc0
InstanceOf: Observation
Title: "WEIGHT"
Description:  "6003504"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.6003504"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-09-24T10:32:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 151.4 '[lb_av]'

Instance: c7627437-d613-4246-8f6b-741c34eb8fb3
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "5335156"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335156"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 179 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 73 'mm[Hg]' "mmHg"

Instance: 64b9767e-98fa-46fe-a64e-2aa97eaf69e9
InstanceOf: Observation
Title: "HEIGHT"
Description:  "5335160"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335160"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: a358dcaf-58e1-4926-82c0-5c356431a000
InstanceOf: Observation
Title: "PULSE"
Description:  "5335159"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335159"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 60 '/min'

Instance: 325bc884-78d6-46ff-b99a-3034a4faf947
InstanceOf: Observation
Title: "PAIN"
Description:  "5335162"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335162"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: 89a43d5e-0443-4c7e-b640-1a202645248d
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "5335158"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335158"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 18 '/min'

Instance: 73753b1a-35c2-4183-af7c-bccde1ecaab2
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "5335157"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335157"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 98.7 'F'

Instance: b8fc1b85-502d-4632-9e0d-3fd67da46bb7
InstanceOf: Observation
Title: "WEIGHT"
Description:  "5335161"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.5335161"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2004-01-21T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 159 '[lb_av]'

Instance: cdfc002e-1a05-4bb6-be50-a4cca8ff976d
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "4871634"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871634"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 130 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 53 'mm[Hg]' "mmHg"

Instance: 05fc4a0c-87a4-4fbf-8be9-5e5d3f1ec8ac
InstanceOf: Observation
Title: "HEIGHT"
Description:  "4871638"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871638"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: 4f5e44cf-2414-47cf-a3d3-da7d9970628f
InstanceOf: Observation
Title: "PULSE"
Description:  "4871637"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871637"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '/min'

Instance: 2d86c0ed-e514-49e8-abd0-8b226701ccce
InstanceOf: Observation
Title: "PAIN"
Description:  "4871640"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871640"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: 66b8bd60-7541-496b-9da7-17939057f37d
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "4871636"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871636"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 18 '/min'

Instance: c4930b20-b9e7-43b7-8f6e-30a836bc8976
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "4871635"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871635"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 98.8 'F'

Instance: 21147631-75e4-42d3-bbed-ec3bbf51a8cc
InstanceOf: Observation
Title: "WEIGHT"
Description:  "4871639"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4871639"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-07-17T10:06:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 151 '[lb_av]'

Instance: db67d6b9-8dd6-4e27-99b2-8de417910f89
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "4479428"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479428"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T11:13:49Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 130 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 70 'mm[Hg]' "mmHg"

Instance: a619e822-1166-4fc3-a13f-4226c05484e6
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "4479415"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479415"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T11:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 130 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 70 'mm[Hg]' "mmHg"

Instance: 411b6ad9-9360-48bb-bce2-d7da3a5a7c26
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "4479142"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479142"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T10:08:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 148 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 65 'mm[Hg]' "mmHg"

Instance: 0ce761eb-d731-44f5-ae98-cfacac0dadb3
InstanceOf: Observation
Title: "PULSE"
Description:  "4479144"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479144"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T10:08:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 74 '/min'

Instance: b7109aa5-b3e9-43b7-9953-bccc5bd2beb4
InstanceOf: Observation
Title: "PAIN"
Description:  "4479146"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479146"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T10:08:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: 1724ffd2-624f-477b-b022-758185b6281c
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "4479143"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479143"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T10:08:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 97.4 'F'

Instance: 297d9da4-b745-450e-b3d7-62f03ed7c19e
InstanceOf: Observation
Title: "WEIGHT"
Description:  "4479145"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4479145"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2003-01-24T10:08:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 154 '[lb_av]'

Instance: 107a1e65-ac65-45c3-8a1e-df55dd448c31
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "4218362"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218362"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 133 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 59 'mm[Hg]' "mmHg"

Instance: 2118f36b-e373-4745-98da-7fb2982b80d6
InstanceOf: Observation
Title: "HEIGHT"
Description:  "4218366"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218366"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: 1ab78eef-3d60-4f95-9658-8617b35005db
InstanceOf: Observation
Title: "PULSE"
Description:  "4218365"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218365"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '/min'

Instance: 2f4f05ef-6b4e-4f37-b646-a76a22620956
InstanceOf: Observation
Title: "PAIN"
Description:  "4218368"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218368"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: b8373ed2-5a94-48aa-8100-c74a00d88d36
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "4218364"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218364"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 16 '/min'

Instance: d5ff8b7d-4bca-445f-90f2-4ac6ace7573f
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "4218363"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218363"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 97.9 'F'

Instance: d4b72b08-c369-4e42-ab08-1a12efd2d088
InstanceOf: Observation
Title: "WEIGHT"
Description:  "4218367"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.4218367"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-09-23T10:01:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 150.4 '[lb_av]'

Instance: 00c13a47-333e-4f69-a764-ebd7e609cfa7
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3867288"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867288"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 137 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 56 'mm[Hg]' "mmHg"

Instance: 2b735e97-3098-464e-ab5d-a8c2990b267c
InstanceOf: Observation
Title: "HEIGHT"
Description:  "3867292"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867292"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: fb568315-1354-4035-8483-7aff57d9723a
InstanceOf: Observation
Title: "PULSE"
Description:  "3867291"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867291"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 93 '/min'

Instance: e0410f27-b325-4f39-9818-71552c9fea81
InstanceOf: Observation
Title: "PAIN"
Description:  "3867294"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867294"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: c46287b1-0afb-4a8d-9f30-151d1e143ba1
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "3867290"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867290"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 18 '/min'

Instance: 4dc61cc6-7513-4aa7-9e0e-c353d728ab57
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "3867289"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867289"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 97.9 'F'

Instance: 6f55c134-6e4d-4de3-a347-f48463dba75a
InstanceOf: Observation
Title: "WEIGHT"
Description:  "3867293"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3867293"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2002-04-08T11:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 154.4 '[lb_av]'

Instance: 55de13b1-5154-4d66-81d4-e1460b90a6ec
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3615709"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615709"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T10:00:56Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 136 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 52 'mm[Hg]' "mmHg"

Instance: 56a05c4b-a92b-45da-8b6e-be1a40280f86
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3615695"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615695"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 136 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 52 'mm[Hg]' "mmHg"

Instance: cc30c504-0ed4-420a-9231-13a03fd74afc
InstanceOf: Observation
Title: "HEIGHT"
Description:  "3615699"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615699"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: 9134dac7-a374-4d65-9625-63160d95fbe4
InstanceOf: Observation
Title: "PULSE"
Description:  "3615698"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615698"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 74 '/min'

Instance: 5045d21b-2f20-4744-99e7-66007fec4c7a
InstanceOf: Observation
Title: "PAIN"
Description:  "3615701"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615701"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: 35e2c3a7-58f0-4871-a441-07f16965c195
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "3615697"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615697"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 18 '/min'

Instance: d662e10d-6d0d-4506-afb2-65705b4c8692
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "3615696"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615696"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 96.9 'F'

Instance: 41584f15-c647-45f4-8c46-6ad9547634be
InstanceOf: Observation
Title: "WEIGHT"
Description:  "3615700"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3615700"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-12-06T09:58:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 154 '[lb_av]'

Instance: 3191113f-b350-4ec6-bfbb-6ec6b2fb448c
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3303289"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303289"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 130 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 62 'mm[Hg]' "mmHg"

Instance: 9952c624-8f8e-4950-89bd-6e77525a0dc3
InstanceOf: Observation
Title: "PULSE"
Description:  "3303292"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303292"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* valueQuantity = 70 '/min'

Instance: 45817159-014d-49a6-acc4-0ed6e8409162
InstanceOf: Observation
Title: "PAIN"
Description:  "3303294"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303294"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* valueQuantity.value = 0

Instance: 04af358b-d5b1-4777-92ea-44be2e8dbfd8
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "3303291"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303291"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* valueQuantity = 18 '/min'

Instance: fc3fc402-ded7-47db-abc2-f4001f5fc2d2
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "3303290"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303290"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* valueQuantity = 87 'F'

Instance: 3edf5d65-eaf1-4c0f-8f37-2ecd99220d77
InstanceOf: Observation
Title: "WEIGHT"
Description:  "3303293"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303293"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:04:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* valueQuantity = 159 '[lb_av]'

Instance: 463ce2cc-4edd-4b42-9623-61c79e2695f5
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3303306"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2901"
* contained.name = "REHAB-SCI MD"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3303306"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-07-06T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "REHAB-SCI MD"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 130 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 62 'mm[Hg]' "mmHg"

Instance: 4a5a8b06-345e-444d-a2bd-dd22e4bc33ab
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3122806"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122806"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 148 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 69 'mm[Hg]' "mmHg"

Instance: ca335c3f-0a24-4a5d-afee-d6a49bc8c686
InstanceOf: Observation
Title: "HEIGHT"
Description:  "3122810"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122810"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 71 '[in_i]'

Instance: 79d7abef-906b-4f87-b6ec-75bc5811273e
InstanceOf: Observation
Title: "PULSE"
Description:  "3122809"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122809"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 78 '/min'

Instance: 83781361-bf52-4363-84ce-97ce6cd67118
InstanceOf: Observation
Title: "PAIN"
Description:  "3122812"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122812"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity.value = 0

Instance: bda8fb9b-c704-4477-884c-27656b463904
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "3122808"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122808"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 20 '/min'

Instance: a2b1d66d-6654-41f9-8891-35f03c9ed591
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "3122807"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122807"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 97.1 'F'

Instance: 918d8646-0bca-4991-8fff-4acc3f21a3ce
InstanceOf: Observation
Title: "WEIGHT"
Description:  "3122811"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2938"
* contained.name = "PCT_O PATIL (F/U)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3122811"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-03-22T10:26:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O PATIL (F/U)"
* valueQuantity = 155.4 '[lb_av]'

Instance: 5ef68231-b4d5-46b5-961e-1bb74ac07377
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "3011569"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1148"
* contained.name = "SLEEP F/U 2"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3011569"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-01-11T09:55:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "SLEEP F/U 2"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 149 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 72 'mm[Hg]' "mmHg"

Instance: f5fd3dee-f322-475c-a90a-532749a4fd00
InstanceOf: Observation
Title: "HEIGHT"
Description:  "3011571"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1148"
* contained.name = "SLEEP F/U 2"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3011571"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-01-11T09:55:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "SLEEP F/U 2"
* valueQuantity = 71 '[in_i]'

Instance: 5adf2d04-9b06-4cb7-97de-135551703727
InstanceOf: Observation
Title: "PULSE"
Description:  "3011570"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1148"
* contained.name = "SLEEP F/U 2"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3011570"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-01-11T09:55:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "SLEEP F/U 2"
* valueQuantity = 85 '/min'

Instance: ded3b233-a77f-4d68-a124-adb4b42d2689
InstanceOf: Observation
Title: "PAIN"
Description:  "3011573"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1148"
* contained.name = "SLEEP F/U 2"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3011573"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-01-11T09:55:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "SLEEP F/U 2"
* valueQuantity.value = 0

Instance: 1d55fb39-fbfc-4544-8993-48cdf165d9d2
InstanceOf: Observation
Title: "WEIGHT"
Description:  "3011572"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1148"
* contained.name = "SLEEP F/U 2"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.3011572"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2001-01-11T09:55:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "SLEEP F/U 2"
* valueQuantity = 152 '[lb_av]'

Instance: f1c6e800-072f-4bd7-b5cd-0fea6be94db6
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2982647"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982647"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 140 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 44 'mm[Hg]' "mmHg"

Instance: fafd1fc0-de66-48c3-97d4-fa6f4f5cc1ca
InstanceOf: Observation
Title: "HEIGHT"
Description:  "2982648"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982648"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 71 '[in_i]'

Instance: 784fef00-044d-4da6-9e77-07214741113f
InstanceOf: Observation
Title: "PULSE"
Description:  "2982646"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982646"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 90 '/min'

Instance: d0c0184d-572b-471b-9573-df45ed3b72e6
InstanceOf: Observation
Title: "PAIN"
Description:  "2982650"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982650"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity.value = 0

Instance: f5ff73ae-8ffd-4aac-a9ef-3a34cf767f6e
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2982645"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982645"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 97 'F'

Instance: 6ac14637-664c-4818-aca5-74045a6db75c
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2982649"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2982649"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-12-14T09:05:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 154 '[lb_av]'

Instance: 2de6a99e-2bd7-4f04-ad9c-d7c20007484b
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2870653"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870653"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 137 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 72 'mm[Hg]' "mmHg"

Instance: 540c9727-1228-4993-99ec-8e1e8031e334
InstanceOf: Observation
Title: "HEIGHT"
Description:  "2870654"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870654"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 71 '[in_i]'

Instance: 44229298-042c-4079-94ec-6ff392bf87a0
InstanceOf: Observation
Title: "PULSE"
Description:  "2870651"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870651"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 79 '/min'

Instance: 1b8bc2ff-17cb-4c61-b736-3e67d2f6b25c
InstanceOf: Observation
Title: "PAIN"
Description:  "2870656"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870656"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity.value = 0

Instance: 43be306c-c701-460d-88d0-096e65cc600d
InstanceOf: Observation
Title: "RESPIRATION"
Description:  "2870652"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870652"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#9279-1 "Respiratory Rate"
* code.text = "RESPIRATION"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 20 '/min'

Instance: 66d88064-3d01-4d27-829b-7093173947ed
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2870650"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870650"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 96.4 'F'

Instance: ed2d304d-71b1-443d-93b8-00d77e92f5e3
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2870655"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2870655"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-14T13:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 151.7 '[lb_av]'

Instance: 98c1540d-e714-4773-b124-93413019bced
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2866195"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.3318"
* contained.name = "GI APPALANENI"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2866195"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-11T13:29:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "GI APPALANENI"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 132 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 66 'mm[Hg]' "mmHg"

Instance: 2e7c9ebc-0d3f-4f41-9b85-5f1842daf4ba
InstanceOf: Observation
Title: "HEIGHT"
Description:  "2866197"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.3318"
* contained.name = "GI APPALANENI"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2866197"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-11T13:29:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "GI APPALANENI"
* valueQuantity = 71 '[in_i]'

Instance: 57eab6b2-2c38-4fd7-be94-5fd45d784ad7
InstanceOf: Observation
Title: "PULSE"
Description:  "2866196"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.3318"
* contained.name = "GI APPALANENI"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2866196"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-11T13:29:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "GI APPALANENI"
* valueQuantity = 87 '/min'

Instance: 86fd88b4-43ae-4fe8-b9f4-3fe0441a9bbb
InstanceOf: Observation
Title: "PAIN"
Description:  "2866199"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.3318"
* contained.name = "GI APPALANENI"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2866199"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-11T13:29:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "GI APPALANENI"
* valueQuantity.value = 0

Instance: 2cd4c842-1216-4788-b74d-0eb9c3b206d6
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2866198"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.3318"
* contained.name = "GI APPALANENI"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2866198"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-09-11T13:29:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "GI APPALANENI"
* valueQuantity = 154 '[lb_av]'

Instance: 12d69d4b-2cc2-4182-a723-769d90b28f2b
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2841123"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2841123"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-08-17T01:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 143 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 73 'mm[Hg]' "mmHg"

Instance: ad025303-4f56-4c40-a022-e58006f02ab8
InstanceOf: Observation
Title: "PULSE"
Description:  "2841122"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2841122"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-08-17T01:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 79 '/min'

Instance: 984bc2b8-713c-4012-8fe1-ee599bde4721
InstanceOf: Observation
Title: "PAIN"
Description:  "2841125"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2841125"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-08-17T01:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity.value = 0

Instance: f5c67f04-a23e-4149-b08a-7aedec145891
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2841121"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2841121"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-08-17T01:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 97.5 'F'

Instance: 8f23faaa-fb8b-4713-a389-2c46846204c8
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2841124"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.2171"
* contained.name = "ZZZHEMATOLOGY II"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2841124"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-08-17T01:00:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZHEMATOLOGY II"
* valueQuantity = 151 '[lb_av]'

Instance: 907bb077-d127-4775-b72c-075e1e2fa050
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2807285"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807285"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 120 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 67 'mm[Hg]' "mmHg"

Instance: e59516e9-9f8d-4277-8ba3-a0e4c3e14756
InstanceOf: Observation
Title: "HEIGHT"
Description:  "2807288"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807288"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8302-2 "Body height"
* code.text = "HEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 71 '[in_i]'

Instance: 7078ea83-bd93-49a7-8e23-a6a69e02ccc9
InstanceOf: Observation
Title: "PULSE"
Description:  "2807287"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807287"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 62 '/min'

Instance: b86afc52-60ff-4578-b863-d139e3ceaf3b
InstanceOf: Observation
Title: "PAIN"
Description:  "2807290"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807290"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity.value = 0

Instance: 8c6589a4-5324-4c6f-b4e3-ba41742e41b9
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2807286"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807286"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 97.3 'F'

Instance: 7efdbf21-6f33-4fa4-ba6a-3efd327efd1c
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2807289"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2807289"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-07-18T13:21:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 152.2 '[lb_av]'

Instance: f26e5076-0039-4156-a343-a63715c29897
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2699441"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2699441"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-04-05T09:51:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 139 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 63 'mm[Hg]' "mmHg"

Instance: 211531c7-7925-44cf-bc42-6d233b358e83
InstanceOf: Observation
Title: "PULSE"
Description:  "2699440"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2699440"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-04-05T09:51:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 83 '/min'

Instance: eb5a55bb-4513-4d08-9735-bd3453b14345
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2699439"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2699439"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-04-05T09:51:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 99.1 'F'

Instance: 414f0d52-5ebd-4288-b34c-63d0c890e047
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2699442"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2699442"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-04-05T09:51:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 156.6 '[lb_av]'

Instance: a50207db-04f8-464b-8b98-dba75c0b58b4
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2664241"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2664241"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-03-03T09:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 139 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 61 'mm[Hg]' "mmHg"

Instance: 5a523159-78d5-4395-b1e9-0afa702f36f8
InstanceOf: Observation
Title: "PULSE"
Description:  "2664240"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2664240"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-03-03T09:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 72 '/min'

Instance: cb9d1691-82b2-4411-be08-44c699fd231b
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2664239"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2664239"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-03-03T09:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 96.9 'F'

Instance: 86a90a4e-1bfb-416a-871e-cacca8a444d4
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2664242"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2664242"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "2000-03-03T09:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 157.4 '[lb_av]'

Instance: 98fc79c6-8308-4595-958a-15ff21395303
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2572846"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2572846"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-12-01T09:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 145 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 64 'mm[Hg]' "mmHg"

Instance: e82224c2-5218-418b-8e06-82f1766ca086
InstanceOf: Observation
Title: "PULSE"
Description:  "2572845"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2572845"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-12-01T09:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 85 '/min'

Instance: 5bdf84b6-d9b5-47e5-9380-81428e3614d9
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2572844"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2572844"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-12-01T09:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 97.2 'F'

Instance: f533a952-eaf7-45f6-8542-873fdbca1057
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2572847"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1921"
* contained.name = "PCT_G"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2572847"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-12-01T09:52:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_G"
* valueQuantity = 154.8 '[lb_av]'

Instance: 37f8165a-cc31-4c20-8adc-5e1615d6c872
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2449382"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1920"
* contained.name = "PCT_O"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2449382"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-08-09T13:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 122 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 71 'mm[Hg]' "mmHg"

Instance: 494958e1-e571-4821-a097-72ae10cca1c9
InstanceOf: Observation
Title: "PULSE"
Description:  "2449381"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1920"
* contained.name = "PCT_O"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2449381"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-08-09T13:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O"
* valueQuantity = 89 '/min'

Instance: f4a6730f-860e-4264-afc8-97aa9119957b
InstanceOf: Observation
Title: "PAIN"
Description:  "2449384"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1920"
* contained.name = "PCT_O"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2449384"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* code.text = "PAIN"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-08-09T13:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O"
* valueQuantity.value = 0

Instance: b0b8b707-0828-45cf-8a84-98d79619d1d4
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2449380"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1920"
* contained.name = "PCT_O"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2449380"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-08-09T13:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O"
* valueQuantity = 97.8 'F'

Instance: 016a0b75-f9ce-47af-8bd6-7a385dc909e8
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2449383"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1920"
* contained.name = "PCT_O"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2449383"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1999-08-09T13:13:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "PCT_O"
* valueQuantity = 150.4 '[lb_av]'

Instance: 3e120f03-fd5d-4ac3-a59b-b8f16e339cc7
InstanceOf: Observation
Title: "BLOOD PRESSURE"
Description:  "2200920"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2200920"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "BLOOD PRESSURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1998-12-02T08:37:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].valueQuantity = 170 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].valueQuantity = 68 'mm[Hg]' "mmHg"

Instance: 4ced9efa-3848-48dc-b377-e9fd07156d59
InstanceOf: Observation
Title: "PULSE"
Description:  "2200919"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2200919"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8867-4 "Heart rate"
* code.text = "PULSE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1998-12-02T08:37:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 80 '/min'

Instance: dd9ed752-bfe2-4c65-b2f2-79c3f0ce313c
InstanceOf: Observation
Title: "TEMPERATURE"
Description:  "2200918"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2200918"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#8310-5 "Body temperature"
* code.text = "TEMPERATURE"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1998-12-02T08:37:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 96.4 'F'

Instance: e7bd59ba-95c4-42f7-871d-9561a892b6f9
InstanceOf: Observation
Title: "WEIGHT"
Description:  "2200921"
Usage: #inline
* meta.profile = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"
* contained.resourceType = "Location"
* contained.id = "location-0"
* contained.identifier.use = #usual
* contained.identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* contained.identifier.value = "HospitalLocationTO.1439"
* contained.name = "ZZZPCT_G MANGAS P.(HYP)"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier.value = "VitalSignTO.2200921"
* status = #final
* category = $observation-category#vital-signs
* code = $loinc#29463-7 "Body weight"
* code.text = "WEIGHT"
* subject = Reference(Patient/ex-MHV-patient-2)
* effectiveDateTime = "1998-12-02T08:37:00Z"
* performer.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* performer.extension.valueReference = Reference(location-0)
* performer.display = "ZZZPCT_G MANGAS P.(HYP)"
* valueQuantity = 148 '[lb_av]'