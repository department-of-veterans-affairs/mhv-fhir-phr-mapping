
- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/immunization.xml) 
- maps to [ImmunizationTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [ImmunizationTO](StructureDefinition-VA.MHV.PHR.immunization-mappings.html#mappings-for-vdif-to-mhv-phr-immunizationto)
- Derived off of US-Core Immunization
  - US-Core already requires: `status`, `vaccineCode`, `patient`, `occurance[x]`, `primarySource`
- must have `identifier` as cross reference to original source
- must be indicated this data are not official record (`primarySource`=false)
- any reaction is recorded as a contained `Observation`

##### Mapping Concerns

- The given mock example aligns with both VIA_v4.0.7_uat.wsdl and mockey-mdws3-service.wsdl. The VIA schema has more elements. The mapping is only for elements that were in both and for which I had an example. Better mapping can be done if specific schema can be identifed, and more rich mock example.
- reaction appears to be a controlled vocabulary (e.g. FEVER), or is it a number (1-11 - convertReactionCode())?
- contraindicated -- appears to be a number (e.g. 0). No idea what the values might be or what they might mean
- id - presuming this is a persisted identifier we can cross-reference with
- series - this appears to be a controlled vocabulary (e.g. COMPLETE). What are the possible values and what do they mean?
- encounter - should we convert these to instances of FHIR Encounter? Didn't do that because it is not clear how to convert the elements properly
- could have function that converts a defined set of ImmunizationTO.name values to proper codes. This might be an advanced feature.
- presuming our publication is not `primarySource`

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
