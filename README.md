Implementation Guide defining structureDefinition profiles, examples, and testing for how MyHealtheVet publishes the PHR using FHIR as an API.

This is not part of the continuous build to keep visibility low.

The [latest build publication](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/) using Github 'pages'

## Version History

The notes below for each release. Archive of [released packages](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/tree/main/packages)

### TBD

TBD

- Note
  - Moved to FMM 4 as there is no outstanding questions with KBS, all questions have been resolved.

### 0.2.10

2023-12-22

- include CSV for the VF_ concept maps
- Vital-Signs
  - PAIN is not a us-core vital-sign, and now uses valueInteger as there is no useful units of measure for a score 0-10
  - added examples with component.code of qualifiers
    - .bodySite, .method, extension bodyPosition, and extension deviceCode -- are populated based on ConceptMap for each element, using string search (VUID in the ConceptMap is not at the code level)
  - recognize some ucum (SI unit) codes that KBS doesn't recognize - seems VIA sends us SI.
  - noted that there can be an empty .value[x], where there then should be a .dataAbsentReason
- Allergies
  - add Vista FileMan elements to mapping (proposed)
  - add note on API side that the .reaction.manifestation.coding may be SNOMED-CT
- Conditions
  - added Vista FileMan elements to mapping (proposed)
  - add link to user requirements
- Immunizations - moved to FMM 4
- Notes - moved to FMM 3

### 0.2.9

2023-12-15

- Vitals
  - do not bring Blood Sugar, Cholesterol, and INR into vital-signs. These are lab results in Vista.
  - added Pulse-OX
    - confirmed by experimentation that VIA does not send us supplemental o2 concentration or flow rate
  - added recommendation for UCUM conversion from KBS advise
  - added recommendation for qualifier conversion from KBS advise: bodySite, bodyPosition, method, and device
- Added ConceptMap for Drug and Lab UCUM code and display conversions give KBS provided translation tables
- Added ConceptMap for VF_VitalCodes, VF_VitalsDevice, VF_VitalsLaterality, VF_VitalsMethod, VF_VitalsPosition, VF_VitalsPosition, VF_VitalsSite, VF_VitalsUnits
- Immunizations - moved to FMM 3

### 0.2.8

2023-11-30

- add link to [business requirements github documentation](https://github.com/department-of-veterans-affairs/va.gov-team/tree/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records)
- Notes
  - Detailed Vista cross-reference and questions for KBS
  - add extension on `DocumentReference.authenticator` to carry when the signature happened
  - clarify that in a Discharge Summary, the .author is what the previous MHV would display as Discharge Physician, and that what was previously the Admitting Physician was extracted out of the text body from `ATTENDING:`
  - Hide 'Allergy and Immunology Notes' as they are not CS, PS or DS
  - Added examples with unsigned note, and when that note gets signed
  - clarify some cross-references to FileMan
- Immunization
  - need example of immunization without an order (was entered, I need the via xml)
- Vitals
  - Pulse-OX was entered, need via xml so can confirm map
  - Noticed on the Vista UX a "CVP" (Central Venous Pressure), is this needed in the FHIR model?
  - Need to add Blood Sugar, Cholesterol, and INR as required by business. Examples have been entered, need them from VIA

### 0.2.7

2023-11-15

- Immunization
  - do not map site or lot as VIA does not give us values even if Vista has them
  - do not mandate .recorded as it is not always provided
  - mandate vaccineCode.text
  - define profile for contained resources
  - require performer.function be populated for administered provider
  - do not map site, lotNumber, manufacture, administrator, and orderedBy as VIA does not pass these to us
  - confirmed that contraindicated should be ignored
  - confirmed that VIA simply stops telling us about Immunizations that have been removed, so will need to use wipe-and-replace strategy.
  - add 8 more examples
- vitals
  - do not include the note as there is no place this could come from
  - add the units of measure display `.unit`
- allergies
  - some examples didn't have the VUID system clearly indicated
- notes
  - add mapping to Vista fileman
  - add old mapping representing eVault/PHR -- note no less elements at this point
  - add links to various Vivian tables
  - identify various elements that are unknown where they come from for experimentation to determine.
  - include source code review for potential deviations or improvements

### 0.2.6

2023-10-20

This is mostly cleanup of documentation:

- Allergies
  - no technical changes, just documentation of changes in 0.2.5
  - moved maturity up to 4 to indicate now in production
  - clarify the rule around interpreting the `status` value of `F` as active, and `E` as entered-in-error
  - clarify that drugClass is not to be mapped
  - removed a mapping concern that was decided in 0.2.5, clarify that we are putting observed vs historic in an extension
- Immunization
  - changed the look of the references to Vista file and field (added a dash rather than just a period)
  - force contained Location, and change examples to that (was using location.display)
  - force contained performed.actor
- Vitals
  - changed the look of the references to Vista file and field (added a dash rather than just a period)
- Condition
  - populate .recorder not .asserter
  - TODO questions with KBS
- labs
  - moved mapping concerns to one place
- Imaging
  - removed xml transform as it is not part of the documentation
  - note that it is known that many CPT codes are used in the mock data that are no longer allowed and thus errors are thrown in the IG Build QA. There is efforts to get CPT to include deprecated codes to recognize historic data.
- Notes
  - clarify the PN is loinc 11506-3 (narrative missed the -3)
  - TODO questions with KBS -
    - why are we pulling Discharge Summary from the ADT feed, especially since that feed does not have id that would enable de-duplication on notes feed updates from the of that Discharge Summary.
    - KBS has a table that could be used to get code given most standard titles. This might be a good future improvement.
- convert date - clarified this is decided to use the date conversion algorithm that MHV has used for a long time. This is notionally the same as Lighthouse is using.

### 0.2.5

2023-10-06

- maturity declared for each profile
  - There is now a maturity definition, and each profile has a maturity number relative to that definition
- Allergies
  - when possible (especially Allergy) will populate the name of the Organization from the - MHV FACILITY_INFO table {FACILITY_INFO.NAME}
  - add guidance on Allergy query to recommend searching for those entries not entered-in-error
- Vital Signs
  - remove from concept map some types of vital-signs that do not exist in vista and don't have good loinc
  - made explicit examples from the vitals Bundle as full exposed examples (keeping bundle too)
- Radiology Imaging Reports
  - made explicit examples from the imaging Bundle as full exposed examples (keeping bundle too)
  - researching CPT errors that may be simply caused by the Validator not knowing about deprecated codes
- start [archiving previous package](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/tree/main/packages) in a version folder starting with 0.2.4
- production validation or not:
  - asked [on hapi zulip chat](https://chat.fhir.org/#narrow/stream/179167-hapi/topic/validation.20performance.20impact)

### 0.2.4

2023-09-22

- Allergies
  - do not put observationTime into onsetDateTime, but rather recordedDate
  - do not populate verificationStatus with informationSourceCategory
    - do set verificationStatus to entered-in-error if the status is `E`
  - put the informationSourceCategory into extension[observedHistoric].valueCode
  - set clinicalStatus to `active` when not entered-in-error
    - must remove it when changing to entered-in-error
- Immunization
  - do NOT populate primarySource (previously were setting this to false),
    - add extension on primarySource so that can indicate Data-Absent-Reason of unknown (given that us-core requires this be populated)
  - do not preserve contraindicated

### 0.2.3

2023-08-31

- add link to this readme.md from the index.html
- changed patient-0 to us-core so that it does have some profile. This example is not intended to express typical or even possible. It is informative only.
- allergy - add old maps with details into eVault PHR element, and FileMan element (guess)
- allergy - do not populate .code.coding with drugClass, as this data is not appropriate in FHIR. the concepts recorded are too broad to be actionable like FHIR would present them. Thus it may appear the patient is allergic to a whole class of drugs. (Jay)
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

