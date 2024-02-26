Instance:   ex-MHV-practitioner
InstanceOf: MHVpractitioner
Title: "Example Practitioner"
Description:      "holding typical values"
Usage: #inline
* name.family = "Practitioner"
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
    <name>KHAN,MUAZZAM</name>
</author>
*/
Instance: ex-MHV-practitioner-37569
InstanceOf: MHVpractitioner
Title: "Example Practitoner 37569"
Description: "Muazzam Khan"
Usage: #inline
* name.text = "KHAN,MUAZZAM"
* name.family = "KHAN"
* name.given = "MUAZZAM"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.37569"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<author>
    <id>36556</id>
    <name>AHMED,MARUF</name>
</author>
*/
Instance: ex-MHV-practitioner-36556
InstanceOf: MHVpractitioner
Title: "Example Practitoner 36556"
Description: "Maruf Ahmed"
Usage: #inline
* name.text = "AHMED,MARUF"
* name.family = "MARUF"
* name.given = "AHMED"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.37556"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>110</id>
    <name>MANGAS,PHYLLIS A</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-110
InstanceOf: MHVpractitioner
Title: "Example Practitoner 110"
Description: "Phyllis Mangas"
Usage: #inline
* name.text = "MANGAS,PHYLLIS A"
* name.family = "MANGAS"
* name.given[+] = "PHYLLIS"
* name.given[+] = "A"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.110"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/* 
<observer>
    <id>4262</id>
    <name>PATIL,SARASWATI</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-4262
InstanceOf: MHVpractitioner
Title: "Example Practitoner 4262"
Description: "Phyllis Mangas"
Usage: #inline
* name.text = "PATIL,SARASWATI"
* name.family = "PATIL"
* name.given[+] = "SARASWATI"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.4262"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>6051</id>
    <name>BASHIR,CHOWDRY MUJAHID</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-6051
InstanceOf: MHVpractitioner
Title: "Example Practitoner 6051"
Description: "Phyllis Mangas"
Usage: #inline
* name.text = "BASHIR,CHOWDRY MUJAHID"
* name.family = "BASHIR"
* name.given[+] = "CHOWDRY"
* name.given[+] = "MUJAHID"
* identifier[TOid].use = #usual
* identifier[TOid].value = "AuthorTO.6051"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"

/*
<observer>
    <id>22572</id>
    <name>FELKLEY,KENNETH E</name>
    <signature/>
</observer>
*/
Instance: ex-MHV-practitioner-22572
InstanceOf: MHVpractitioner
Title: "Example Practitoner 22572"
Description: "Phyllis Mangas"
Usage: #inline
* name.text = "FELKLEY,KENNETH E"
* name.family = "FELKLEY"
* name.given[+] = "KENNETH"
* name.given[+] = "E"
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
                  <family>HALL</family>
               </name>
            </author>
*/
Instance: ex-MHV-practitioner-14934-VA552
InstanceOf: Practitioner
Title: "Example Practitoner 14934-VA552"
Description: "Lisa A Hall"
Usage: #inline
* name.family = "HALL"
* name.given[+] = "LISA"
* name.given[+] = "A"
* identifier[+].value = "14934-VA552"
* identifier[=].system = "http://va.gov/systems/99VA4"


/*  from HDR Lab

            <author>
               <identifier>
                  <identity>59845-VA660</identity>
               </identifier>
               <idSourceTable>99VA4</idSourceTable>
               <name>
                  <given>LISA</given>
                  <middle>V</middle>
                  <family>HALL</family>
               </name>
            </author>
*/
Instance: ex-MHV-practitioner-59845-VA660
InstanceOf: Practitioner
Title: "Example Practitoner 59845-VA660"
Description: "Lisa A Hall"
Usage: #inline
* name.family = "HALL"
* name.given[+] = "LISA"
* name.given[+] = "V"
* identifier[+].value = "59845-VA660"
* identifier[=].system = "http://va.gov/systems/99VA4"

Instance: ex-MHV-practitioner-37524
InstanceOf: VA.MHV.PHR.practitioner
Title: "Example Practitioner 37524"
Description: "MARCUS OPURUM,MAUREEN N"
Usage: #inline
* identifier[TOid].use = #usual
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349.4.984"
* identifier[TOid].value = "AuthorTO.37524"
* name.text = "MARCUS OPURUM,MAUREEN N"
* name.family = "MARCUS OPURUM,MAUREEN N"
