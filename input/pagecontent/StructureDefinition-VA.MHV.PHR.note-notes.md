
- The [mock example 1](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/notes.xml) and [mock example 2](https://github.com/department-of-veterans-affairs/mhv-fhir-phr-mapping/blob/main/mocks/note2.xml) 
- maps to [NoteTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- [Mapping from VIA - NoteTO](StructureDefinition-VA.MHV.PHR.note-mappings.html#mappings-for-via-to-mhv-fhir-phr-noteto)
- [Examples](StructureDefinition-VA.MHV.PHR.note-examples.html)
- based on US-Core for Clinical Notes
- should have `meta.profile` set to `https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.note` to indicate the intent to be compliant with this profile
- `type` seems to hold an enum (PN, DS).
  - `DS` - LOINC#18842-5 \"Discharge summary\"
  - `PN` - LOINC#11506 \"Progress Note\"
  - anything else should be logged as not yet understood
- This also includes the (NoteTO) received on the 'Admission and Discharge' feed which holds a Discharge Summary without an id.
- **Business Rule**: do not convert any NoteTO.status that is not `completed` or `COMPLETED`.
  - This concept of not converting is legacy PHR handling. With FHIR we are persisting, so need to find if the previous note was recorded, and change that one to the new status.
  - Thus the UI needs to handle the status, and not show anything but `current`
- **Business Rule**: do not convert any NoteTO.type of `A`

#### Mapping Concerns

- ADT feed discharge summary do not have an `id` so it is not clear how we would keep from duplicating
  - discharge summary in the notes feed do have an `id`
- is `standardTitle` or `type` used to differentiate between various note types?
- `status` might be derived from `NoteTO.status`, but at this point I presume we are only told about completed notes, we have a business rule to ignore all others, and I don't know what other `NoteTO.status` values might happen
- what other `type` values might we see?
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
  - subject
