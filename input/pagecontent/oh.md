This page includes an analysis of the Oracle Health (OH) FHIR support of the same health concepts delivered here from Vista. This section is based on sample data, Oracle Health FHIR documentation, and discussions with Oracle Health contacts.

The following tables have the following columns:

- MHV PHR -- this represents what the MHV Legacy extracts and preserves for BlueButton. The element names in the MHV database are given.
- MHV FHIR -- this represents that which is specified in this Implementation Guide
- va.gov UI -- this represents the portion of the MHV FHIR that is extracted for use in the UI. This is determined by code inspection at a given time.
- FHIR us-core -- this is indicating the specification in FHIR us-core. This is a set of requirements defined in the USA as core. Both MHV FHIR and Oracle Health follow this specification, so it should be seen as 'the gold standard'.
- OH FHIR -- this is representing the FHIR population from Oracle Health (OH). This is based on the Oracle Health FHIR documentation, experimentation with B1930, and conversations with OH experts assigned to help us.
- Note -- general notes, usually about OH

Where notes are more complex, especially those that would not fit nicely into the tables, there are sub sections with notes

### General

This section contains any generalizable observations and concerns.

| concept | Delta Impact | Vista/FHIR | OH |
|------|--------|-------|------|
| DateTime | High | local date/time, with attempt at proper timezone of where recorded | always UTC, no timezone
| References | High | Many resource references to contained resources | Most references are real. Thus will need to add _include to searches to get these in the same Bundle, or retrieve each individually.
| identifier | low | links to vista identifiers | does not link to vista identifier (on Import, all data are imported against a single Encounter created for the import act)
| station indication | medium | All data are identifiable back to Vista location | One database, no VISN separation. Would tend to need to navigate thru the referenced Encounter
| Encounter | medium | None | Encounter is very important to all data.
| codes | medium | tend to be enough to use code.text, sometimes a code, sometimes a code from a formal codeSystem | may have a code.text, but likely need to look to code.coding.display. 
{: .grid}

#### De-Duplication

With Vista data, we preserve any source (Vista) id values in the Resource.identifier.

With OH, they do not preserve the source (Vista) id values. They do however create an Encounter resource that stands for the data import act. Thus all data that was imported from Vista, will have the same Encounter. (Would like to get an example of this)

### AllergyIntolerance

| MHV PHR | MHV FHIR | va.gov UI | FHIR us-core | OH FHIR | Note |
|---------|----------|-----------|--------------|---------|------|
|  | id | id | id | id | 
|  | identifier |  |  |  | no identifier in examples
|  | clinicalStatus is active |  | clinicalStatus | clinicalStatus may be active | 
|  | verificationStatus may be entered-in-error |  | verificationStatus | verificationStatus | use confirmed/unconfirmed rather than observedHistoric?
|  |  |  |  | type | 
| Allergy Type | category (medication, food, environment) | category |  | category | 
|  |  |  |  | criticality | 
| Allergen | code.text | name | code | code | "has code.text and coding. Use code.text if it exists, else one of the coding (not clear the best logic)."no known medication allergies". See note 1
|  |  | patient | patient | patient | 
|  |  |  |  | encounter | 
|  |  |  |  | onset[x] | 
| Date Entered | recordedDate | date |  | recordedDate | 
|  |  |  |  | recorder | 
|  | recorder.extension[alternate-reference] | location |  |  | 
|  |  |  |  | asserter | 
| Comments | note.text | notes |  | notes | no example
|  | note.time |  |  |  | no example
| Reactions | reaction.manifestation.text | reaction | reaction.manifestation | reaction.manifestation.text | 
|  | reaction.manifestation.code |  |  | reaction.manifestation.code | no example
|  |  |  |  | reaction.severity | 
| Observed/Historic | extension[observedHistoric] | observedOrReported |  | NA | see verificationStatus?
{: .grid}

Note 1: OH example
```json
"code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "735971005",
              "display": "Fish (substance)"
            }
          ],
          "text": "Fish"
        },
```

### Immunization

| MHV PHR | MHV FHIR | va.gov UI | FHIR us-core | OH FHIR | Note
|---------|----------|-----------|--------------|---------|------|
|  | id  | id | id | id  | 
|  | identifier(TOid) |  |  | identifier(ceuuid) | 
| | status (completed, entered-in-error) |  | status | status | 
|  |  |  | statusReason | statusReason | 
| Immunization | vaccineCode.text | name | vaccineCode | vaccineCode.text | see note 1
|  | vaccineCode.coding (cpt) |  |  | vaccineCode.coding (cvx, ndc) | 
|  | patient |  | patient | patient | 
|  |  |  |  | encounter | 
| Event Date and Time | occurenceDateTime | date | occurence[x] | occurenceDateTime | 
| Date Entered | recorded |  |  |  | 
|  | primarySource (unknown) |  | primarySource | primarySource | 
|  |  |  |  | reportOrigin | 
|  | location | location |  | location | Confirmed from OH that the location is preferable to navigating thru the encounter to the encounter location.
|  |  |  |  | manufacture | 
|  |  |  |  | lotNumber | 
|  |  |  |  | expirationDate | 
|  |  |  |  | site | 
|  |  |  |  | route | 
|  |  |  |  | doseQuantity | 
|  | performer (provider, org) |  |  | performer | 
| Remarks | note.text | notes |  | note | 
| Reaction | reaction.detail.reference | reaction |  |  | 
| Series | protocolApplied.series |  |  | protocolApplied (cerner codes) | may be different. See note 2
|  | protocolApplied.doseNumberString |  |  | protocolApplied.doseNumberString | 
| Contraindicated |  |  |  |  | 
|  |  |  |  | protocolApplied.targetDisease | 
{: .grid}


Note 1: OH example
```json
"vaccineCode": {
          "coding": [
            {
              "system": "https://fhir.cerner.com/d45741b3-8335-463d-ab16-8c5f0bcf78ed/codeSet/72",
              "code": "4145940",
              "display": "tetanus, diphtheria, acellular pertussis",
              "userSelected": true
            },
            {
              "system": "http://hl7.org/fhir/sid/cvx",
              "code": "115",
              "display": "tetanus toxoid, reduced diphtheria toxoid, and acellular pertussis vaccine, adsorbed",
              "userSelected": false
            }
          ],
          "text": "tetanus, diphtheria, acellular pertussis"
        }
```

Note 2: OH example
```json
"protocolApplied": [
          {
            "targetDisease": [
              {
                "coding": [
                  {
                    "system": "https://fhir.cerner.com/d45741b3-8335-463d-ab16-8c5f0bcf78ed/codeSet/4003106",
                    "code": "42348063",
                    "display": "TD/TDAP",
                    "userSelected": true
                  }
                ],
                "text": "TD/TDAP"
              }
            ],
            "doseNumberString": "Unknown"
          }
        ]
```

### DocumentReference (Notes)

| Vista | MHV FHIR | va.gov UI | FHIR us-core | OH FHIR | Note
|---------|----------|-----------|--------------|---------|------|
|  | id  | id | id | id  | 
| id | identifier (vista id for this note) |  | identifier |  | 
| status | status |  | status | status | 
| document type | type |  | type | type | 
| standard title | type.text (standard title) |  |  |  | 
| type (PN, DS, CR) | type.coding | type.coding.display</br>type.coding.code |  |  | 
| `clinical-note` | category |  | category | category | will have `clinical-note`
| patient | subject |  | subject | subject | 
| timestamp | date |  | date | date | 
| author/dictator | author | author.name.text | author | author | 
| signed by | authenticator | authenticator.name.text |  | authenticator | 
| release date/time | authenticator.extension[when] |  |  |  | 
|  | custodian |  |  | custodian | 
|  | description |  |  |  | 
|  | content (1..1) |  | content (1..*) | content (1..*) | Note Cerner often has many formats of the document including CDA, PDF, and Text
| `text/plain` | content.attachment.contentType (text/plain) |  | content.attachment.contentType | content.attachment.contentType (pdf, text, richtext, rtf, html, xml, xhtml) | 
| report text | content.attachment.data | content.attachment.data | content.attachment.data |  | 
|  |  |  | content.attachment.url | content.attachment.url | must retrieve document stream
| name | content.attachment.title |  |  | content.attachment.title | 
| reference date/time | content.attachment.creation |  |  | content.attachment.creation | 
|  |  |  | content.format | content.format | 
|  | context.encounter |  | context.encounter | context.encounter | 
| episode begin/end | context.period |  | context.period | context.period | 
| visit location | context.related (Location) | context.related (Location) |  | context.related | 
{: .grid}

#### Notes on Vista

- Consultation Note (11488-4)
- Progress note (11506-3)
- Discharge Summary (18842-5)

may have a CPT code

#### Notes on VA.Gov handling

- don't assume code has display
- don't assume .text is populated
- don't assume resources are contained
- don't assume attachment.data
- attachment must be retrieved from URL
- don't assume text
- not going to find attending in text body
- no authenticator when"
- Search is limited to codes
  - PHYSICIAN_PROCEDURE_NOTE = '11506-3' # Physician procedure note
  - DISCHARGE_SUMMARY = '18842-5' # Discharge summary
  - CONSULT_RESULT = '11488-4' # Consultation note
  - Should be using category clinical-note

#### Notes on OH

- don't often use contained for resources
- unclear if $docref operation might be useful

### Vitals


| Vista | MHV FHIR | va.gov UI | FHIR us-core | OH FHIR | Note
|---------|----------|-----------|--------------|---------|------|
|  | id | id |  | id
|  |  |  |  | extensions
| type.id | identifier |  |  | identifier
|  | status |  | status | status
|  | category (vital-signs) |  | category | category</br>(laboratory, social history, vital-signs) | Need to search on vital-signs.
| type.name | code | name | code | code
| patient | subject (Patient) |  | subject | subject (Patient)
|  |  |  |  | encounter
| timestamp | effectiveDateTime | date | effective[x] | effectiveDateTime
|  |  |  |  | issued
| recorder + observer | performer | performer |  | performer
| location | performer.extension[site] | location |  | 
| value1 / units | value[x] | measurement | value[x] | value[x]
|  |  |  | dataAbsentReason | dataAbsentReason
|  |  |  |  | interpretation
|  |  | notes |  | note
|  |  |  |  | referenceRange
|  |  |  |  | hasMember
| x | component.code | x | component.code | component.code
| value1 / units | component.value[x] | systolic/diastolic | component.value[x] | component.value[x]
|  |  |  | component.dataAbsentReason | component.dataAbsentReason
{: .grid}

#### Notes on va.gov

- search for only 
  -  BLOOD_PRESSURE = '85354-9' # Blood Pressure
  -  BREATHING_RATE = '9279-1' # Breathing Rate
  -  HEART_RATE = '8867-4' # Heart Rate
  -  HEIGHT = '8302-2' # Height
  -  TEMPERATURE = '8310-5' # Temperature
  -  WEIGHT = '29463-7' # Weight
-  should search on vital-signs category

### Conditions

| Vista | MHV FHIR | va.gov UI | FHIR us-core | OH FHIR | Note
|---------|----------|-----------|--------------|---------|------|
|  | id |  | id | id | 
|  |  |  | extension[assertedDate] |  | 
| id | identifier |  |  |  | 
| status | clinicalStatus | active | clinicalStatus | clinicalStatus | 
| verified | verificationStatus |  | verificationStatus | verificationStatus | 
| `problem-list-item` | category (problem-list-item) |  | category (problem-list-item, health-concern) | category (problem-list-item, encounter-diagnosis, health-concern) | includes more than just problems
|  |  |  | severity | severity | 
| type.name | code.text | name | code.text | code.text | 
| icd | code.coding (icd) | clinicalTerm | code.coding (sct) | code.coding (sct, icd) | 
| patient | subject (Patient) |  | subject (Patient) | subject (Patient) | 
| onsetDate | onsetDateTime |  | onset[x] | onsetDateTime | 
| abatementDateTime | abatementDateTime |  | abatement[x] | abatementDateTime | 
| timestamp | recordedDate | recordedDate | recordedDate | recordedDate | 
| observer | recorder (Practitioner) |  |  | recorder (Practitioner) | 
| facility | recorder.extension[location] | facility |  |  | 
|  |  | provider |  | asserter (Patient, Practitioner) | Told by OH that asserter is no longer returned
| comments | note | comments |  | note | 
{: .grid}

### DocumentReference

### DiagnosticReport
