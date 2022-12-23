This is the Intro for the VA.MHV.immunization Profile

The My Immunizations will have a User Interface similar to

Simple UI that is similar to current MyHealtheVet

![Simple Immunization UI](Immunization.svg "Simple Immunization UI")

<div style="clear: left"/>

The mapping between the FHIR Immunization resource and the above User Interface can be found on the [Mappings for MyHealtheVet mapping to FHIR/PGHD (MHV-UI)](StructureDefinition-VA.MHV.immunization-mappings.html#mappings-for-myhealthevet-mapping-to-fhirpghd-mhv-ui)

#### Policy and Design Considerations

Where MyHealtheVet can determine that the new immunization being entered already exists, in either PGHD, Vista, and Cerner, the user should be warned that they are creating duplicate information. Some logic should be determined on if there should be a hard rule forbidding this duplicate entry, or if there should be a linkage to the medical record so that other applications can detect that this is a duplicate. This link is possible in FHIR, but has not been included here.

### Profile
