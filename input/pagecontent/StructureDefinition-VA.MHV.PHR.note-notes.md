
- The mock data I have
  - [mock example 1](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/notes.xml)
  - [mock example 2](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/note2.xml)
  - [mock discharge](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/discharge.xml)
- maps to [NoteTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VIA - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-via-to-mhv-fhir-phr-noteto)
- [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- [Vivian TIU Document](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1.html)
- [va.gov team requirements for notes](https://github.com/department-of-veterans-affairs/va.gov-team/blob/master/products/health-care/digital-health-modernization/mhv-to-va.gov/medical-records/data-domains/notes/notes-brief.md)
  - Note that this also asks about the usefulness of the ADT feed Discharge Summary from the DS that comes from the notes feed.
  - This also notes many additional kinds of notes. It does indicate MVP will stick to what MHV currently presents.
- based on US-Core for Clinical Notes
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.note` to indicate the intent to be compliant with this profile
- `type` (PN, DS, CR, A).
  - `DS` - LOINC#18842-5 \"Discharge summary\"
  - `PN` - LOINC#11506-3 \"Progress note\"
  - `CR` - Consult Results -- TODO
    - us-core LOINC#11488-4 \"Consultation Note\"
  - anything else is ignored
    - Note mock data has `A` Adverse React/Allergy
  - [Vivian Document type definitions](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjE=.html) - 289 types of documents -- should we support any of these?
    - note that this says that Discharge Summary is "DCS" not "DS". Progress Notes is "PN"
      - Note that PN has a [list of 20 sub titles](https://vivian.worldvista.org/vivian-data/8925_1/8925.1-3.html)
- titles: preserve both `localTitle` and `standardTitle`. Do not try to convert to a code
- dates: VIA gives us timestamp and procTimestamp
  - There is a third `signatureTimestamp` in the VIA xml schema, but this does not seem to be populated by VIA
  - `timestamp` will go into the DocumentReference.date
  - `procTimestamp` will go into an extension on DocumentReference.authenticator
- delete / entered-in-error
  - We don't see notes until they are signed (most entered-in-error will be caught prior to this signature)
  - Notes that are already signed have a workflow that can be used to delete them. First there is an annex that is added indicating the note needs to be deleted, and that is signed. Then within 24-48 hours the note is deleted.
  - We could detect this annex, but that would only work if we refreshed that patient during the 24-48 hours.
  - KBS: asking how often this happens. Is it important for the timeframe we have left with vista?
- When a document is amended, the text body is as it was before and has additional text at the bottom
  - "You may not VIEW this UNSIGNED addendum."
  - Once the addendum is signed, then the text body also has the addendum text

#### Business Rules

- do not convert any NoteTO.status that is not `completed` or `COMPLETED` or `AMENDED`.
- do not convert any NoteTO that is not signed
- do not convert any NoteTO.type other than `PN`, `DS`, and `CR`
- if the standard title contains the string `C & P `, then this note is held for 30 days past the signature date/time
  - Compensation and Pension
  - Many sub-titles but all have "C & P EXAMINATION CONSULT" (e.g. PODIATRY C & P EXAMINATION CONSULT)
- all other notes, labs, and conditions are held for 36 hours past the signature date/time

#### Mapping Concerns

- ADT feed discharge summary do not have an `id` so it is not clear how we would keep from duplicating
  - discharge summary in the notes feed do have an `id`
  - why do we need to watch the discharge feed? What does it give us that we don't get with the notes?
  - could we just de-duplicate only based on timestamp? If so, does that do anything useful?
- is `standardTitle` or `type` used to differentiate between various note types?
  - note that KBS has a cross-walk from standard titles to loinc.
  - what other `type` values might we see?
- `status` might be derived from `NoteTO.status`, but at this point I presume we are only told about completed notes ("COMPLETE", "COMPLETED" and "AMENDED"), we have a business rule to ignore all others, and I don't know what other `NoteTO.status` values might happen
  - according to [Vivian TIU Status](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjY=.html) there is a purged, deleted, retracted, and inactive.
  - should we use .docStatus to represent final(completed) vs amended?
- should we use Binary and .url? Today I am recommending using .data.
- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them. It seems that VIA might not be populating them.
  - serviceCategory
  - cosigner
  - hasAddendum
  - isAddendum
  - originalNoteID
  - hasImages
  - itemId
  - consultId
  - surgicalProcId
  - prfId
  - parentId

##### source-code review

2023-11-14

- does cover all the elements mapped
- add Profile
- set lastUpdated?
- consistent id handling
- should we convert "A" records? are there other types of notes?
- using wrong LOINC code for "PN"
- setSubject looks different than allergy
- date/time needs to use the right date/time logic
- author needs to be a contained resource, as is now using display text
- authenticator needs to be a contained resource, as is now using display text
- add authenticator[when] extension
- content. is decodeHTMLEncodedCharacters needed?
- is AdmitTimestamp and DischargeTimestamp handled properly relative to TZ?
- location needs to be a contained resource, 
- debugging statements for any element in the schema that is not handled?
- C&P hold check?  what is this? Is this doing anything?
- should we not process those that are not signed? Seems MHV/evault did ignore non signed.
- Are there other business rules in the MHV/evault that we need to replicate?
- seems to be a business rule on hold date?
- old code looks at status for "COMPLETE", "COMPLETED" and "AMENDED" --> completed, else not completed boolean is set.

- also put timestamp into content.attachment.creation


#### Questions to KBS

##### delete

- when a signed note is deleted.. is it deleted, or marked as entered-in-error or some status? 
- We should test to make sure we understand how VIA behaves
- How often is this done?

##### Other topics

What other types of notes should we look to support eventually (business rules restrict us today)?

##### Discharge Summary

How should we handle Discharge Summary that we get in ADT feed, but which has no id value?
- **current plan** is to not extract Discharge Summary from ADT feed for FHIR.

Admitting physician. this was historically extracted out of the discharge summary text body ("ATTENDING: ")
- discussion on if this should be done in the backend, but then where would it go? We would need to create an Encounter just to hold this.
- could be done in va.gov client side easy -- **current plan**
- but also strange to call attending the admitting

#### Note type

- Need a code for "CR" for Consult Results. aka "C&P Exam Note"
  - us-core LOINC#11488-4 \"Consultation Note\"
- KBS analysis - TIU Local and Standard Title.xlsx - for the following three document types, there are many local titles and standard titles.
  - CONSULT - 174,399 sub document types
  - PROGRESS NOTE - 2,208 sub document types
  - DISCHARGE SUMMARY - 1,647 sub document types
