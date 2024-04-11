Instance:   ex-MHV-practitioner
InstanceOf: MHVpractitioner
Title: "Example Practitioner"
Description:      "TESTpractitioner,Prancy"
Usage: #inline
* name.family = "TESTpractitioner"
* name.given = "Prancy"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.00000"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
/*
* identifier[NPI].use = #official
* identifier[NPI].type.text = "npiPID"
* identifier[NPI].value = "10130425697"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
*/

/*
<author>
    <id>37569</id>
    <name>TESTdavis,William</name>
</author>
*/
Instance: ex-MHV-practitioner-37569
InstanceOf: MHVpractitioner
Title: "Example Practitoner 37569"
Description: "TESTdavis,William"
Usage: #inline
* name.text = "TESTdavis,William"
* name.family = "TESTdavis"
* name.given = "William"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.37569"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<author>
    <id>36556</id>
    <name>TESTmiller,David</name>
</author>
*/
Instance: ex-MHV-practitioner-36556
InstanceOf: MHVpractitioner
Title: "Example Practitoner 36556"
Description: "TESTmiller,David"
Usage: #inline
* name.text = "TESTmiller,David"
* name.family = "TESTmiller"
* name.given = "David"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.37556"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>110</id>
    <name>TESTgarcia,Amelia S</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-110
InstanceOf: MHVpractitioner
Title: "Example Practitoner 110"
Description: "TESTgarcia,Amelia S"
Usage: #inline
* name.text = "TESTgarcia,Amelia S"
* name.family = "TESTgarcia"
* name.given[+] = "Amelia"
* name.given[+] = "S"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.110"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/* 
<observer>
    <id>4262</id>
    <name>TESTjones,Charlotte</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-4262
InstanceOf: MHVpractitioner
Title: "Example Practitoner 4262"
Description: "TESTjones,Charlotte"
Usage: #inline
* name.text = "TESTjones,Charlotte"
* name.family = "PATIL"
* name.given[+] = "SARASWATI"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.4262"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>6051</id>
    <name>TESTsmith,James Robert</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-6051
InstanceOf: MHVpractitioner
Title: "Example Practitoner 6051"
Description: "TESTsmith,James Robert"
Usage: #inline
* name.text = "TESTsmith,James Robert"
* name.family = "TESTsmith"
* name.given[+] = "James"
* name.given[+] = "Robert"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.6051"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>22572</id>
    <name>TESTjohnson,John Michael</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-22572
InstanceOf: MHVpractitioner
Title: "Example Practitoner 22572"
Description: "TESTjohnson,John Michael"
Usage: #inline
* name.text = "TESTjohnson,John Michael"
* name.family = "TESTjohnson"
* name.given[+] = "John"
* name.given[+] = "Michael"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.22572"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"


/*  from HDR Lab

            <author>
               <identifier>
                  <identity>14934-VA552</identity>
               </identifier>
               <idSourceTable>99VA4</idSourceTable>
               <name>
                  <given>LISA</given>
                  <middle>A</middle>
                  <family>TESTWILLIAMS</family>
               </name>
            </author>
*/
Instance: ex-MHV-practitioner-14934-VA552
InstanceOf: Practitioner
Title: "Example Practitoner 14934-VA552"
Description: "Lisa A TESTwilliams"
Usage: #inline
* name.family = "TESTwilliams"
* name.given[+] = "LISA"
* name.given[+] = "A"
* identifier[+].value = "14934-VA552"
* identifier[=].system = "http://va.gov/terminology/vistaDefinedTerms/4"


/*  from HDR Lab

            <author>
               <identifier>
                  <identity>59845-VA660</identity>
               </identifier>
               <idSourceTable>99VA4</idSourceTable>
               <name>
                  <given>LISA</given>
                  <middle>V</middle>
                  <family>TESTWILLIAMS</family>
               </name>
            </author>
*/
Instance: ex-MHV-practitioner-59845-VA660
InstanceOf: Practitioner
Title: "Example Practitoner 59845-VA660"
Description: "Lisa A TESTwilliams"
Usage: #inline
* name.family = "TESTWILLIAMS"
* name.given[+] = "LISA"
* name.given[+] = "V"
* identifier[+].value = "59845-VA660"
* identifier[=].system = "http://va.gov/terminology/vistaDefinedTerms/4"

Instance: ex-MHV-practitioner-37524
InstanceOf: VA.MHV.PHR.practitioner
Title: "Example Practitioner 37524"
Description: "TESTbrown,Olivia Emma"
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.984"
* identifier[TOid].value = "AuthorTO.37524"
* name.text = "TESTbrown,Olivia Emma"
* name.family = "TESTbrown,Olivia Emma"
