
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
  - anything else should be logged as not yet understood
  - [Vivian Document type definitions](https://vivian.worldvista.org/dox/Global_XlRJVSg4OTI1LjE=.html) - 289 types of documents -- should we support any of these?
    - note that this says that Discharge Summary is "DCS" not "DS". Progress Notes is "PN"
      - Note that PN has a [list of 20 sub titles](https://vivian.worldvista.org/vivian-data/8925_1/8925.1-3.html)
  - "A" records seem to come thru (Allergy & Immunology Adverse Event Note). Not clear we kept these in the past.
  - eVault/PHR doesn't seem to look at the type, so that leads me to believe that VIA is filtering out to only DS and PN.
- This also includes the (NoteTO) received on the 'Admission and Discharge' feed which holds a Discharge Summary without an id.
- **Business Rule**: do not convert any NoteTO.status that is not `completed` or `COMPLETED`.
  - This concept of not converting is legacy PHR handling. With FHIR we are persisting, so need to find if the previous note was recorded, and change that one to the new status.
  - Thus the UI needs to handle the status, and not show anything but `current`
- **Business Rule**: do not convert any NoteTO.type of `A`

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
- some schema elements found in VIA_v4.0.7_uat.wsdl are not mapped here because I can't tell what is in them. Most of them likely have a place to go in the FHIR model, but I need to know more about them.
  - serviceCategory
  - cosigner
  - hasAddendum
  - isAddendum
  - originalNoteID
  - hasImages
  - itemId
  - signatureTimestamp
  - consultId
  - surgicalProcId
  - prfId
  - parentId
  - procTimestamp
- unclear which date we are getting in VIA as timestamp
- unclear where localTitle comes from
- unclear where VIA gets approvedBy, presumed signed by because the VIA structure includes a signature block.

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
- content. is decodeHTMLEncodedCharacters needed?
- is AdmitTimestamp and DischargeTimestamp handled properly relative to TZ?
- location needs to be a contained resource, 
- debugging statements for any element in the schema that is not handled?
- C&P hold check?  what is this? Is this doing anything?
- should we not process those that are not signed? Seems MHV/evault did ignore non signed.
- Are there other business rules in the MHV/evault that we need to replicate?
- seems to be a business rule on hold date?
- old code looks at status for "COMPLETE", "COMPLETED" and "AMENDED" --> completed, else not completed boolean is set.

