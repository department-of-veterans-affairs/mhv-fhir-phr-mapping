
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
