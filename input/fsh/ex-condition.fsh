
Instance:   ex-MHV-condition-1
InstanceOf: VA.MHV.PHR.condition
Title: "Example 1 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.487" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Hypertension (ICD-9-CM 401.9)"
* code.coding = ICD#401.9
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1995-09-27"


Instance:   ex-MHV-condition-deleted-1
InstanceOf: VA.MHV.PHR.condition
Title: "Example 1 of an MHV condition, deleted"
Usage: #example
Description:      """
Example from a mock ProblemTO

Example 1 of an MHV condition, with a different identifier, and marked as entered-in-error
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.4" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Hypertension (ICD-9-CM 401.9)"
* code.coding = ICD#401.9
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
//* clinicalStatus -- must be not populated if entered-in-error
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#entered-in-error
* recordedDate = "1995-09-27"


Instance:   ex-MHV-condition-2
InstanceOf: VA.MHV.PHR.condition
Title: "Example 2 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.488" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Anxiety Neuroses (ICD-9-CM 300.00)"
* code.coding = ICD#300.00
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1995-09-27"


Instance:   ex-MHV-condition-3
InstanceOf: VA.MHV.PHR.condition
Title: "Example 3 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.489" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Glaucoma (ICD-9-CM 365.9)"
* code.coding = ICD#365.9
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1995-09-27"


Instance:   ex-MHV-condition-4
InstanceOf: VA.MHV.PHR.condition
Title: "Example 4 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.37085" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "SCREENING FOR ALCOHOLISM (ICD-9-CM V79.1)"
* code.coding = ICD#V79.1
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1997-12-08"


Instance:   ex-MHV-condition-5
InstanceOf: VA.MHV.PHR.condition
Title: "Example 5 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.37086" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "SCREENING FOR OTHER SPECIFIED MENTAL DISORDERS AND DEVELOPMENTAL HANDICAPS (ICD-9-CM V79.8)"
* code.coding = ICD#V79.8
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed
* recordedDate = "1997-12-08"


Instance:   ex-MHV-condition-6
InstanceOf: VA.MHV.PHR.condition
Title: "Example 6 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.98034" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "ENDOCARDITIS NOS (ICD-9-CM 424.90)"
* code.coding = ICD#424.90
* contained[+] = ex-MHV-practitioner-110
* recorder = Reference(Practitioner/ex-MHV-practitioner-110)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2000-07-18"


Instance:   ex-MHV-condition-7
InstanceOf: VA.MHV.PHR.condition
Title: "Example 7 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.118499" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "COR ATHEROSCL UNSP TYP-VES (ICD-9-CM 414.00)"
* code.coding = ICD#414.00
* contained[+] = ex-MHV-practitioner-4262
* recorder = Reference(Practitioner/ex-MHV-practitioner-4262)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2001-03-22"


Instance:   ex-MHV-condition-8
InstanceOf: VA.MHV.PHR.condition
Title: "Example 8 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.128381" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Restless Legs (ICD-9-CM 333.99)"
* code.coding = ICD#333.99
* contained[+] = ex-MHV-practitioner-6051
* recorder = Reference(Practitioner/ex-MHV-practitioner-6051)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2001-07-06"


Instance:   ex-MHV-condition-9
InstanceOf: VA.MHV.PHR.condition
Title: "Example 9 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.229415" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Benign Prostatic Hypertrophy (ICD-9-CM 799.9)"
* code.coding = ICD#799.9
* contained[+] = ex-MHV-practitioner-4262
* recorder = Reference(Practitioner/ex-MHV-practitioner-4262)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2001-07-06"


Instance:   ex-MHV-condition-10
InstanceOf: VA.MHV.PHR.condition
Title: "Example 10 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.268463" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Hypertrophy (Benign) of Prostate without Urinary obstruction (ICD-9-CM 600.00)"
* code.coding = ICD#600.00
* contained[+] = ex-MHV-practitioner-4262
* recorder = Reference(Practitioner/ex-MHV-practitioner-4262)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2004-01-21"



Instance:   ex-MHV-condition-11
InstanceOf: VA.MHV.PHR.condition
Title: "Example 11 of an MHV condition"
Usage: #example
Description:      """
Example from a mock ProblemTO
"""
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subject = Reference(Patient/ex-MHV-patient-2)
* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* identifier[TOid].value = "ProblemTO.318630" 
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[TOid].use = #usual
* code.text = "Lumbago (ICD-9-CM 724.2)"
* code.coding = ICD#724.2
* contained[+] = ex-MHV-practitioner-22572
* recorder = Reference(Practitioner/ex-MHV-practitioner-22572)
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* recordedDate = "2004-09-24"



