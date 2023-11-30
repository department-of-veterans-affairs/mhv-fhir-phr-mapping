
- The mock data I have
  - [mock example 1](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/notes.xml)
  - [mock example 2](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/note2.xml)
  - [mock discharge](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/discharge.xml)
- maps to [NoteTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VIA - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-via-to-mhv-fhir-phr-noteto)
- [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- [Vivian TIU Document](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1.html)
- based on US-Core for Clinical Notes
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.note` to indicate the intent to be compliant with this profile
- `type` seems to hold an enum (PN, DS).
  - `DS` - LOINC#18842-5 \"Discharge summary\"
  - `PN` - LOINC#11506-3 \"Progress Note\"
  - `CR` - Consult Results -- TODO
  - anything else should be logged as not yet understood
    - Note mock data has `A` Adverse React/Allergy
  - [Vivian Document type definitions](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjE=.html) - 289 types of documents -- should we support any of these?
    - note that this says that Discharge Summary is "DCS" not "DS". Progress Notes is "PN"
      - Note that PN has a [list of 20 sub titles](https://vivian.worldvista.org/vivian-data/8925_1/8925.1-3.html)
- This also includes the (NoteTO) received on the 'Admission and Discharge' feed which holds a Discharge Summary without an id.
- **Business Rule**: do not convert any NoteTO.status that is not `completed` or `COMPLETED`.
  - This concept of not converting is legacy PHR handling. With FHIR we are persisting, so need to find if the previous note was recorded, and change that one to the new status.
  - Thus the UI needs to handle the status, and not show anything but `current`
- **Business Rule**: do not convert any NoteTO.type other than `PN`, `DS`, and `CR`

#### Mapping Concerns

- ADT feed discharge summary do not have an `id` so it is not clear how we would keep from duplicating
  - discharge summary in the notes feed do have an `id`
  - why do we need to watch the discharge feed? What does it give us that we don't get with the notes?
  - could we just de-duplicate only based on timestamp? If so, does that do anything useful?
- is `standardTitle` or `type` used to differentiate between various note types?
  - note that KBS has a cross-walk from standard titles to loinc.
- `status` might be derived from `NoteTO.status`, but at this point I presume we are only told about completed notes ("COMPLETE", "COMPLETED" and "AMENDED"), we have a business rule to ignore all others, and I don't know what other `NoteTO.status` values might happen
  - according to [Vivian TIU Status](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjY=.html) there is a purged, deleted, retracted, and inactive.- what other `type` values might we see?
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
- unclear which date we are getting in VIA as timestamp and procTimestamp
  - procTimestamp
    - this seems to be the first signature timestamp. Not updated for amendments or co-signatures.
    - 1304 Release Date/Time
    - 1305 Verification Date/Time
    - 1501 Signature Date/Time
  - timestamp
    - aligns with text "DATE OF NOTE: " value
    - 1301 Reference Date/Time
    - Not 1201 Entry Date/time, as this is a bit later than given
  - do not seem to get signatureTimestamp
- unclear where localTitle comes from
- unclear where VIA gets approvedBy, presumed signed by because the VIA structure includes a signature block.
  - does not appear that VIA populates these elements
- delete / entered-in-error
  - We can't seem to delete a note once it has been signed
  - We don't see notes until they are signed
  - So, unless there is some way to delete a signed note, then we don't need to even do wipe-and-replace
    - KBS: Figure out if there is a way to delete a note after it has been signed.

##### code review

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

#### Questions to KBS

2023-11-21

We are not told about notes until they have gotten their first signature. I think this must be some Released milestone ?

When a document is amended, the text body is as it was before and has additional text at the bottom

> You may not VIEW this UNSIGNED addendum.

Once the addendum is signed, then the text body also has the addendum text

So it seems we will get updates once a note goes into released.

##### delete

We were unable to figure out how to delete or mark as entered-in-error a previously released note. If we don’t have any way to do this, then we won’t need to use any method to support this kind of a workflow. Meaning we don’t need to use wipe-and-replace, which could get expensive with notes. Is there a way to delete a note once it has been approved?

Notes that are already signed have a workflow that can be used to delete them. First there is an annex that is added indicating the note needs to be deleted, and that is signed. Then within 24-48 hours the note is deleted. 
- We could detect this annex, but that would only work if we refreshed that patient during the 24-48 hours.
- asking how often this happens. Is it important for the timeframe we have left with vista?

##### Dates

We receive two dates in the XML schema from VIA. There is a third `signatureTimestamp` in the VIA xml schema, but this does not seem to be populated by VIA

- `timestamp`
  - This seems to align with what is in the body of the note as “DATE OF NOTE: “
  - likely 1301 “Reference Date/Time”
  - might be 1201 “Entry Date/Time”, but we find in the text body a “ENTRY DATE”. And this time often is later than we are given in timestamp
- `procTimestamp`
  - This seems to correlate to the first signature. The value we get does not change if the note is counter signed or amendments signed.
  - Likely 1304 “Release Date/Time”
  - not 1305 Verification Date/Time, or 1501 Signature Date/Time, as these are often found the note body and not the same as procTimestamp given.

I think the `timestamp` seems most logical to put into the DocumentReference.date

MHV also preserve the `procTimestamp` historically. I think we should define an extension on the DocumentReference.authenticator element for dateTime signed.

##### Local title

MHV has preserved and used a VIA xml schema element `localTitle`.

The VIA xml schema does also have `standardTitle` xml schema element.  I presume this is 8925 VHA Enterprise Standard Title

Often both elements are populated and are slightly different.

I can’t find a Vista Fileman element from which `localTitle` comes.  Any idea?

##### Author

We receive a VIA xml schema element `author`. I presume this is the 1202 – Author/Dictator? I don't see an alternative, but want confirmation

We receive a VIA xml schema element `authenticator`. I presume this is 1502 - Signed By?

##### Other topics

What other types of notes should we look to support?

##### Discharge Summary

How should we handle Discharge Summary that we get in ADT feed, but which has no id value?

Admitting physician. this was historically extracted out of the discharge summary text body ("ATTENDING: ")
- discussion on if this should be done in the backend, but then where would it go? We would need to create an Encounter just to hold this.
- could be done in va.gov client side easy
- but also strange to call attending the admitting

#### Note type

- "CR" for Consult Results. aka "C&P Exam Note"
