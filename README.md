Implementation Guide defining structureDefinition profiles, examples, and testing for how MyHealtheVet publishes the PHR using FHIR as an API.

This is not part of the continuous build to keep visibility low. 

The [latest build publication](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/) using Github 'pages'

## Version History

### 0.2.3

- add link to this readme.md from the index.html
- changed patient-0 to us-core so that it does have some profile. This example is not intended to express typical or even possible. It is informative only.
- allergy - add old maps with details into eVault PHR element, and FileMan element (guess)
- allergy - do not populate .code.coding with drugClass, as this data is not appropriate in FHIR (Jay)
- condition - add old maps with details into eVault PHR element, and FileMan element (guess)
- conditions - algorithm for <icd> to determine if it is ICD-9 or ICD-10
- vitals - put location into extension on performer
- vitals - add old maps with details into eVault PHR element, and FileMan element (guess)
- vitals - express each example outside the bundle
- vitals - update the bundle to include location, and use conditional update similar to code
- immunizations - add old maps with only the elements eVault PHR preserved
  - added column to maps to show the eVault PHR element name and FileMan element (guess)
- (guess) note that the mapping to FileMan element is informed guessing
- removed MoehrkeResearch google analytics

### 0.2.2

- not using meta.lastUpdated for any mapping as HAPI overwrites it
- Organization, Location, and Practitioner will always be contained
- add old maps for allergies and immunizations
- better distinction of mhv-fhir-phr vs MHV-PHR in names of things
- Vitals, fixes in Vitals from KBS advise
- Vitals codes add VUID concept maps from KBS advise
- Vitals.code.coding as a VUID if 7 digits
- Vitals.component, leave this to us-core
- Vitals removed sample xslt as it was badly out of date
- Allergies.recorder.display should be populated
- Allergies.identifier has two system types depending on data given
- Change Notes for PN to Progress Notes from KBS advise
- Immunization.location use contained resource
- Note errors in the QA report are due to a known problem on HL7 side.

### 0.2.1

- change to contained for Organization, Location, and Practitioner
- clarify turning on HAPI resource validation
- add more detail on proper handling of source id

### 0.2.0

- Moved the repository and changed from a John project to a VA one. Which changed many things
- Changed the canonical URI

### Prior to 0.2.0

- this was managed on John Moehrke github as a non recognized project, all changes are reflected in github change tracking

