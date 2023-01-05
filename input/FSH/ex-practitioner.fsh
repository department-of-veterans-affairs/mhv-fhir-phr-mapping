Instance:   ex-practitioner
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
Instance: ex-practitioner-37569
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
Instance: ex-practitioner-36556
InstanceOf: MHVpractitioner
Title: "Example Practitoner 36556"
Description: "Muazzam Khan"
Usage: #example
* name.text = "AHMED,MARUF"
* name.family = "MARUF"
* name.given = "AHMED"
* identifier[+].use = #usual
* identifier[=].value = "36556"
* identifier[=].system = "https://johnmoehrke.github.io/MHV-PHR/Vista/111/AuthorTO.id"
