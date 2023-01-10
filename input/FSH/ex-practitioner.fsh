Instance:   ex-MHV-practitioner
InstanceOf: MHVpractitioner
Title: "Example Practitioner"
Description:      "holding typical values"
* name.family = "Practitioner"
* name.given = "Prancy"
* identifier[+].use = #official
* identifier[=].type.text = "npiPID"
* identifier[=].value = "10130425697"
* identifier[=].system = "http://example.org/npi"

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
Usage: #example
* name.text = "KHAN,MUAZZAM"
* name.family = "KHAN"
* name.given = "MUAZZAM"
* identifier[+].use = #usual
* identifier[=].value = "37569"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"

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
Usage: #example
* name.text = "AHMED,MARUF"
* name.family = "MARUF"
* name.given = "AHMED"
* identifier[+].use = #usual
* identifier[=].value = "36556"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"

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
Usage: #example
* name.text = "MANGAS,PHYLLIS A"
* name.family = "MANGAS"
* name.given[+] = "PHYLLIS"
* name.given[+] = "A"
* identifier[+].use = #usual
* identifier[=].value = "110"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"

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
Usage: #example
* name.text = "PATIL,SARASWATI"
* name.family = "PATIL"
* name.given[+] = "SARASWATI"
* identifier[+].use = #usual
* identifier[=].value = "4262"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"

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
Usage: #example
* name.text = "BASHIR,CHOWDRY MUJAHID"
* name.family = "BASHIR"
* name.given[+] = "CHOWDRY"
* name.given[+] = "MUJAHID"
* identifier[+].use = #usual
* identifier[=].value = "6051"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"

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
Usage: #example
* name.text = "FELKLEY,KENNETH E"
* name.family = "FELKLEY"
* name.given[+] = "KENNETH"
* name.given[+] = "E"
* identifier[+].use = #usual
* identifier[=].value = "22572"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"
