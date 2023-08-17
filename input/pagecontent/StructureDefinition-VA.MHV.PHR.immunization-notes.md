
- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/immunization.xml) 
- maps to [ImmunizationTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-vdif-to-mhv-phr-immunizationto)
- Derived off of US-Core Immunization
  - US-Core already requires: `status`, `vaccineCode`, `patient`, `occurance[x]`, `primarySource`
- should have `meta.profile` set to `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.immunization` to indicate the intent to be compliant with this profile
- must have `identifier` as cross reference to original source
- must be indicated this data are not official record (`primarySource`=false)
- any reaction is recorded as a contained `Observation`. This Observation is simply
  - status of final
  - code.text from ImmunizationTo.reaction
  - valueCodeableConcept of SNOMED#401515003 Known present
  - see [Immunization Reaction Profile of Observation](StructureDefinition-VA.MHV.PHR.immunizationReaction.html)

#### Mapping Concerns

- The given mock example aligns with both VIA_v4.0.7_uat.wsdl and mockey-mdws3-service.wsdl. The VIA schema has more elements. The mapping is only for elements that were in both and for which I had an example. Better mapping can be done if specific schema can be identified, and more rich mock example.
- `id` - presuming this is a persisted identifier we can cross-reference with
- Updates must be supported somehow. Fixing the status at completed will only work if data never changes.
- `series` - this appears to be a controlled vocabulary (e.g. COMPLETE). What are the possible values and what do they mean?
- could have function that converts a defined set of `ImmunizationTO.name` values to proper codes. This might be an advanced feature.
- presuming our publication is not `primarySource`
  - Concern that this should be left blank, and a Data-absent-reason be used to fill compliance with us-core.
  - Given that the field is not used by UX, it does not matter what the value is
  - should change when US-Core 6+
- Not mapped due to lack of clarity on what the value is and if it will ever be populated
  - `contraindicated` -- appears to be a number (e.g. 0). No idea what the values might be or what they might mean
  - `shortName`
  - `encounterProvider`
  - `orderingProvider`

#### change 2023-07-20

- defined the specifics of the Contained Observation for the reaction

##### code inspection concerns

didn't find the following implemented
- recorded
- performer
- site
- lotNumber
- doseNumberString
- manufacture
- primarySource
- recorded
- should set the .meta.profile to the profile so that automatic validation can be done - JIRA

did find
- occurenceDateTime
- vaccineCode.text (name)
- vaccineCode.coding (ICD)
- location
- note.text
- identifier (OID+'.4.349', stationNumber + '.' + id) - JIRA
- status=completed
- patient
- reaction.detail
- occurrenceDateTime

should handle Organization and Location the same way everywhere.
- Should this be just .display, .identifier, contained .reference, or reference to a server managed resource?
- Looks like .location is implemented as a reference, logical id?

#### xsl transform

Simple (not fully functional) xslt from ImmunizationTO to FHIR Immunization:
- does not assign new id 
- missing date translation
- missing handling of reactions

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/immunizationTO">
  <Immunization xmlns="http://hl7.org/fhir">

  <id value="ex-MHV-immunization-1"/>

  <meta>
      <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.immunization"/>
  </meta>

<identifier>
    <use value="usual"/>
    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/ImmunizationTO.id"/>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="id" />
      </xsl:attribute>
    </value>
  </identifier>
  <status value="completed"/>
  <vaccineCode>
    <text>
      <xsl:attribute name="value">
        <xsl:value-of select="name" />
      </xsl:attribute>
    </text>
    <xsl:if test="cptCode">
      <coding>
      <system value="http://www.ama-assn.org/go/cpt"/>
      <code>
      <xsl:attribute name="value">
          <xsl:value-of select="cptCode/id" />
        </xsl:attribute>
      </code>
      <display>
        <xsl:attribute name="value">
          <xsl:value-of select="cptCode/name" />
        </xsl:attribute>
      </display>
      </coding>
    </xsl:if>

  </vaccineCode>
  <patient>
      <reference value="Patient/ex-MHV-patient-1"/>
  </patient>
  <occurenceDateTime>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="administeredDate" />
      </xsl:attribute>
    </value>
  </occurenceDateTime>
  <recorded>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="administeredDate" />
      </xsl:attribute>
    </value>
  </recorded>
  <primarySoruce value="false"/>
  <note>
    <text>
      <xsl:attribute name="value">
        <xsl:value-of select="comments" />
      </xsl:attribute>
    </text>
  </note>

</Immunization>
</xsl:template>
</xsl:stylesheet>
```
