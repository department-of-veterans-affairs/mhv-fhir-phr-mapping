
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
- `status` will be `current` for those we receive from VIA, those we no longer receive will be changed to `entered-in-error`
- `type` (PN, DS, CR, A).
  - `DS` - LOINC#18842-5 \"Discharge summary\"
  - `PN` - LOINC#11506-3 \"Progress note\"
  - `CR` - LOINC#11488-4 \"Consultation Note\"
  - anything else is ignored
    - Note mock data has `A` Adverse React/Allergy
  - [Vivian Document type definitions](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjE=.html) - 289 types of documents -- should we support any of these?
  - FYI" KBS analysis - TIU Local and Standard Title.xlsx - for the following three document types, there are many local titles and standard titles.
    - CONSULT - 174,399 sub document types
    - PROGRESS NOTE - 2,208 sub document types
    - DISCHARGE SUMMARY - 1,647 sub document types
- Historically MHV has also extracted Discharge Summary from the ADT feed, but this feed does not include the unique identifier for that Discharge Summary, thus it would present a de-duplication problem. **current plan** is to not extract Discharge Summary from ADT feed for FHIR. We will extract Discharge Summary from the notes feed. Unclear what Discharge Summary would be missing, and only in the ADT feed.
  - KBS Question asked on Leaf #88
- titles: preserve both `localTitle` and `standardTitle`. Do not try to convert to a code
- dates: VIA gives us timestamp and procTimestamp
  - There is a third `signatureTimestamp` in the VIA xml schema, but this does not seem to be populated by VIA
  - `timestamp` will go into the DocumentReference.content.attachment.creation (not expanded, so if just a date, then it is just a date)
  - `procTimestamp` will go into an extension on DocumentReference.authenticator
  - if `timestamp` has both date and time, then it will go into the DocumentReference.date
    - else `procTimestamp` will go into DocumentReference.date
- delete / entered-in-error
  - We don't see notes until they are signed (most entered-in-error will be caught prior to this signature)
  - Notes that are already signed have a workflow that can be used to delete them. First there is an annex that is added indicating the note needs to be deleted, and that is signed. Then within 24-48 hours the note is deleted.
  - We could detect this annex, but that would only work if we refreshed that patient during the 24-48 hours.
  - KBS: asking how often this happens. Is it important for the timeframe we have left with vista?
- When a document is amended, the text body is as it was before and has additional text at the bottom
  - "You may not VIEW this UNSIGNED addendum."
  - Once the addendum is signed, then the text body also has the addendum text
- Admitting physician. this was historically extracted out of the discharge summary text body ("ATTENDING: "). This WILL NOT be done for FHIR. The client can search the note body if this is still desirable.
- ADT feed discharge summary do not have an `id` so it is not clear how we would keep from duplicating
  - discharge summary in the notes feed do have an `id`
  - why do we need to watch the discharge feed? What does it give us that we don't get with the notes?
  - could we just de-duplicate only based on timestamp? If so, does that do anything useful?
- Using `attachment.data`. Note that Cerner uses `attachment.url` with a Binary.
- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them. It seems that VIA might not be populating them. serviceCategory, cosigner, hasAddendum, isAddendum, originalNoteID, hasImages, itemId, consultId, surgicalProcId, prfId, and parentId
- VIA does not tell us about signed notes that have been deleted or marked entered-in-error.
  - Thus we will be using [Index-Update-and-Delete](background.html#entered-in-error)

#### Business Rules

- Ignore any without a facility
- Ignore any without an id
- Ignore any NoteTO.status that is not `completed` or `COMPLETED` or `AMENDED`.
- Ignore any NoteTO that is not signed
- Ignore any NoteTO.type other than `PN`, `DS`, and `CR`
- if the standard title contains the string `C & P `, then this note is **held for 30 days past the signature date/time**
  - Compensation and Pension
  - Many sub-titles but all have "C & P EXAMINATION CONSULT" (e.g. PODIATRY C & P EXAMINATION CONSULT)
- all other notes, labs, and conditions are **held for 36 hours past the signature date/time**

#### Mapping Concerns

- discharge summary may have a `period`. The  `NoteTO/dischargeTimestamp` or `NoteTO/admitTimestamp` have not been seen in sample notes feed.
  - These values do exist in the discharge feed, but that feed does not include id values so we have no way to de-duplicate them. Further the discharge feed I have has no text body, so suspect these are not realistic.
  - The notes feed does have `DS` but does not populate the `NoteTO/dischargeTimestamp` or `NoteTO/admitTimestamp`, but does have well behaved TEXT elements with a DATE (no time) "DATE OF ADMISSION: {date}", and "DATE OF DISCHARGE: {date}" that could be used if the xml does not give them to us.
  - Note that there is a sample `PN` that has an embedded `DS` with the strings (id=62846416)
  - MHV-57063

