Implementation Guide defining structureDefinition profiles, examples, and testing for how MyHealtheVet publishes the PHR using FHIR as an API.

The [latest formal publication](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/) using Github 'pages'

[CI build](https://build.fhir.org/ig/department-of-veterans-affairs/mhv-fhir-phr-mapping/branches/main/index.html) using HL7 CI build infrastructure

## Version History

The notes below for each release. Archive of [released packages](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/tree/main/packages)

### CI

- Add to Pathology profile that the DiagnosticReport.provider may also be the Pathologist as extracted from the text body
- correct example search that were using `#` for terms, when token type uses `|`
- ChemHen
  - Clarify that there would be three Organizations. (at least three)
    - DiagnosticReport.performer comes from the `recordSource` (aka stationNumber)
    - ServiceRequest.performer comes from the `labTestRequest/orderingFacility`
    - each Observation.performer comes from that `chemistryResult/performingOrganization`

### 0.3.7

- notes
  - added two new C & P notes
  - added caution note that the examples are notional and may not have timezones, and may have different Patient, Practitioner, and Location resources as all examples are hand converted and I don't always convert the elements that are not critical to the prime resource use.
- Move Radiology Report (aka imaging report) to DiagnosticReport to better align with OH
  - Independent use of DiagnosticReport
  - add ServiceRequest to DiagnosticReport for order
  - add table of VIA elements to legacy MHV, and FHIR
- Labs
  - Add list of most common labs for Chem-Hem, Microbiology, and Pathology. Data we need to see
  - Microbiology clarify the DiagnosticReport.performer. Especially in the examples which were using .display
  - Add clarification on searching MUST include category of Lab to get only Lab (and not Radiology Reports)
  - Add to ChemHem an alternative identifier type, given that realworld experience shows shortAccessionNumber formatted identifiers.
- adjust example titles to be consistent.
- removed the Bundle example as it doesn't add sufficient clarity at this point.

### 0.3.6

- notes
  - Notes backend will now populate .date with timestamp when it includes a time, but otherwise will use the signature timestamp.
  - May need to extract admit/discharge date from text body
- using "About" rather than "Downloads" as that page has more than just downloads.
  - added to this page the listing of all valueSet and codeSystem that are used
- allergy
  - make clear there is no onset value
- all
  - added business logic sections, specifically with hold detail
- Chem-Hem
  - category also needs `http://terminology.hl7.org/CodeSystem/v2-0074#CH`
  - DiagnosticReport.status is set to `final` if all Observations are final; and `preliminary` if any Observations are not final.
  - DiagnosticReport.status could be set to `entered-in-error` if `ORDER CANCELLED` or deleted
  - ServiceRequest.status is always `unknown` as we are creating a contained resource for this
  - clarify valueInterpretation is recorded in .text and converted robustly to coding of `L`, `LL`, `H`, `HH`, or `A`
  - make more clear the need to translate the ucum codes we get from Vista to formal codes
  - add list of most common chem-hem diagnostic reports
  - add more mock data covering realistic Chem-Hem labs
- Pathology
  - split from Microbiology
  - defined additional category for the kinds of pathology
  - added list of most common pathology diagnostic reports
- Microbiology
  - split from Pathology
  - defined additional category for microbiology
  - added list of most common microbiology reports
- Conditions
  - Moved to FMM 4 to represent being in phase 0 production
- UCUM
  - Removed the lab ConceptMap as it is easier to use the CSV
  - updated to the proper Vista Lab ucum translation CSV

### 0.3.5

- Better path links to FHIR, and US-Core
- Use KBS approved code system mapping from Vista `99VA` strings to a URI - [see Code Lookup](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/utility.html#code-lookup)
- DiagnosticReport
  - many changes to align with discussions with KBS
  - change pathology code from LOINC 60567-5 to 11526-1
  - change microbiology code from LOINC 79381-0 to 18725-2
  - Increment Chem-Hem to FMM 3 to recognize KBS is almost done
  - Increment Labs to FMM2 to indicate KBS is being consulted
  - Labs uses PresentedForm rather than notes

### 0.3.4

- All
  - Fixed the example of not entered-in-error, as they all had double negative in a non working form
- Chem-Hem (Not ready)
  - Added mapping markdown table
    - need Vista Fileman Field mapping yet.
  - Refine Chem-Hem
    - use ServiceRequest rather than an Observation with hasMembers
  - Still have KBS questions outstanding
- Vitals
  - remind to also refine search to just vital-signs, so as to not pull labs or other
- DocumentReference
  - clarify timestamp handling as sometimes it doesn't come with a time
  - remind to also refine search to just clinical-note category
- Conditions
  - Add notes to the conditions that have notes

### 0.3.3

- Conditions
  - Mapping defined
  - Added a narrative mapping table from Vista fields -> VIA ProblemTO -> MHV eVault -> FHIR Condition
  - Confirmed that when a problem is deleted on Vista, VIA stops sending it to us. So must handle.
  - Added examples of Conditions translated from VIA feed using defined mapping / profile
  - Noted some data just has YEAR with month and day as '00' to indicate none. This should be handled as just year specified.
- DocumentReference
  - clarify date/time vs just time
- Allergies
  - add MHV-PHR element names to the evaultPHR mapping
  - include an example of entered-in-error for completeness sake
- Immunizations
  - add MHV-PHR element names to the evaultPHR mapping
- Vitals
  - remove use of qualifiers from examples and profiles

### 0.3.2

2024-01-29

- vitals
  - moved to FMM 4 as the mapping is ready for implementation, with the exception of qualifiers which will be added later.
- notes
  - ready with new deleted processing model
  - identified implementation improvement on use of timestamp and DocumentReference.date
  - identified implementation improvement on use of current/historic identifier indexing
  - include backlog jira tickets
- immunization
  - ready with new deleted processing model
  - include backlog jira tickets
- conditions
  - identified the mapping concerns
  - these mapping concerns need to be experimentally tested by entering specific data at Vista and see what comes to us in VIA.
- Patient
  - The MHV patientId is placed into the .identifier, but the .identifier.system is the bare VA OID. This must not be used as that bare VA OID is used for the patient ICN. Thus we need an identified system. Working on getting an OID sub-node, else will define a system value in the IG.
  - include backlog jira ticket

### 0.3.1

2024-01-19

- incremental CI build is now available on build.fhir.org 
- [Some models to replace Wipe-and-Replace](https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/background.html#entered-in-error) as this will result in database filling with unnecessary history
  - **Index-Update-and-Delete** - indexes current, detects those not refreshed and deletes them
  - **Index-Update-and-Expunge** - indexes current, detects those not refreshed and marks them  `entered-in-error`
  - **Update-and-Expunge** - use new HAPI server (6.10.0) with parameter to not preserve history (history was not needed and problematic) - to detect those not refreshed and mark them
 `entered-in-error`
- Notes
  - now can have status of `current` or `entered-in-error`
    - API search must now make sure it is not searching on `entered-in-error`
  - Moved to FMM 4 as there is no outstanding questions with KBS, all questions have been resolved.
  - `timestamp` needs to go into `.content.attachment.creation` because sometimes it is just a date without time
  - if `timestamp` is missing the time (just a date) then populate `.date` with `procTimestamp`
  - Many new examples have been added
  - added an example of `entered-in-error`
- Immunization
  - now can have status of `completed` or `entered-in-error`
    - API search must now make sure it is not searching on `entered-in-error`
    - added an example of `entered-in-error`
- Condition
  - minor updates, still under review
  - now can have verificationStatus of `confirmed` or `unconfirmed` or `entered-in-error`
    - API search must now make sure it is not searching on `entered-in-error`
    - added an example of `entered-in-error`
- Vitals
  - minor updates, still under review
  - now can have status of `completed` or `entered-in-error`
    - API search must now make sure it is not searching on `entered-in-error`
    - added an example of `entered-in-error`
    - moved the qualifiers to outside MVP. These were not available in MHV phr, so they are not MVP. Handling them is still under discussion with KBS.
- Update concept maps from VF_ qualifiers from January 8, 2024
  - Note that KBS is [developing their own IG](https://j-p-systems.github.io/va.maps/index.html) that we could in the future dependOn so that we don't need to maintain replicated data such as this.
- Fix URI for ICD9 to `{{site.data.fhir.path}}sid/icd-9-cm` from `http://terminology.hl7.org/CodeSystem/icd9cm`
  - https://terminology.hl7.org/ICD.html
- Patient
  - clarified that the Patient is to be looked up by the MHV patientId (aka. jwt subjectId), and that it is best to use the returned Patient.id from that point on.
  - clarified that the Patient resource is minimally populated with some values from MHV patient.

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

