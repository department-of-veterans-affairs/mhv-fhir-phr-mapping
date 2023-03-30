/*
To support GetOrganization()
*/


Profile:        MHVorganization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
//Parent: Organization
Id:             VA.MHV.PHR.organization
Title:          "VA MHV PHR Organization"
Description:    """
A profile on the Organization resource for MHV PHR exposing Organization using FHIR API.

- based on US-Core for Organization
- used for Lab Site. In FHIR R4, the Lab site needs to go into .performer which can't take a Location. (TechnicalDebt)

Map to [VDIF labSiteID](StructureDefinition-VA.MHV.PHR.organization-mappings.html#mappings-for-vdif-to-mhv-phr-labsiteid)
"""
* identifier 1..
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
  TOid 1..*
* identifier[TOid].system 1..1
* identifier[TOid] ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[TOid].value ^short = "`LabSiteTO` | `.` | {LabSiteTO.id}"
* identifier[TOid].use = #usual

Mapping: Organization-Mapping
Source:	MHVorganization
Target: "labSiteId"
Title: "VDIF to MHV-PHR"
* -> "labSiteId" "MHV PHR FHIR API"
* identifier -> "{StationNbr} and {LabSiteTO.id}"
* name -> "Lab Site {number}"
* active -> "`true`"



/* 
 <labSiteId>989</labSiteId>
*/
Instance: ex-MHV-organization-989
InstanceOf: MHVorganization
Title: "Organization lab site 989"
Description: "This example derived off of a mock diagnostic report"
Usage: #example
* active = true
* name = "Lab Site 989"
* identifier[TOid].use = #usual
* identifier[TOid].value = "LabSiteTO.989"
* identifier[TOid].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234"
