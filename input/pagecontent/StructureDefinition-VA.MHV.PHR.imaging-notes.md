
Simple (not fully functional) xslt from ImagingExamTO to FHIR DocumentReference:
- does not assign new id 
- missing date translation

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/imagingExamTO">
<DocumentReference xmlns="http://hl7.org/fhir">

  <id value="ex-MHV-imaging-1"/>

  <meta>
      <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.imaging"/>
  </meta>

  <identifier>
    <use value="usual"/>
    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/ImagingExam.id"/>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="id" />
      </xsl:attribute>
    </value>
  </identifier>
  <identifier>
    <use value="official"/>
    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/AccessionNumber"/>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="radiologyReportTO/accessionNumber" />
      </xsl:attribute>
    </value>
  </identifier>
    <identifier>
    <use value="secondary"/>
    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/Casenum"/>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="casenum" />
      </xsl:attribute>
    </value>
  </identifier>
  <status value="current"/>
  <docStatus value="final"/>
  <type>
    <coding>
      <system value="http://loinc.org"/>
      <code value="18748-4"/>
    </coding>

    <xsl:if test="type">
        <coding>
         <system value="http://www.ama-assn.org/go/cpt"/>
         <code>
         <xsl:attribute name="value">
            <xsl:value-of select="type/id" />
          </xsl:attribute>
         </code>
         <display>
          <xsl:attribute name="value">
            <xsl:value-of select="type/name" />
          </xsl:attribute>
         </display>
        </coding>
    </xsl:if>
  </type>
  <category>
      <coding>
      <system value="http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"/>
      <code value="clinical-note"/>
      </coding>
  </category>
  <subject>
      <reference value="Patient/ex-MHV-patient-0"/>
  </subject>
  <date>
    <value>
      <xsl:attribute name="value">
        <xsl:value-of select="timestamp" />
      </xsl:attribute>
    </value>
  </date>
  <author>
    <display>
      <xsl:attribute name="value">
        <xsl:value-of select="provider/name" />
      </xsl:attribute>
    </display>
  </author>
  <author>
    <identifier>
      <value>
          <xsl:attribute name="value">
            <xsl:value-of select="radiologyReportTO/facility/tag" />
          </xsl:attribute>
      </value>
    </identifier>
    <display>
      <xsl:attribute name="value">
        <xsl:value-of select="radiologyReportTO/facility/text" />
      </xsl:attribute>
    </display>
  </author>
  <custodian>
      <identifier>
          <value>
              <xsl:attribute name="value">
                <xsl:value-of select="imagingLocation/id" />
              </xsl:attribute>              
          </value>
      </identifier>
        <display>
          <value>
              <xsl:attribute name="value">
                <xsl:value-of select="imagingLocation/name" />
              </xsl:attribute>              
          </value>
        </display>
  </custodian>
  <description>
      <xsl:attribute name="value">
        <xsl:value-of select="interpretation" />
      </xsl:attribute>        
  </description>
  <content>
      <attachment>
        <contentType value="text/plain"/>          
        <data>
          <value>
              <xsl:attribute name="value">
                <xsl:value-of select="radiologyReportTO/text" />
              </xsl:attribute>              
          </value>            
        </data>
        <title>
              <xsl:attribute name="value">
                <xsl:value-of select="name" />
              </xsl:attribute>              
        </title>
        <creation>
          <value>
            <xsl:attribute name="value">
              <xsl:value-of select="radiologyReportTO/timestamp" />
            </xsl:attribute>
          </value>
        </creation>
    </attachment>
  </content>
  <context>
      <encounter>
          <identifier>
               <xsl:attribute name="value">
                <xsl:value-of select="encounterId" />
              </xsl:attribute>                
          </identifier>
      </encounter>
      <related>
          <identifier>
              <xsl:attribute name="value">
                <xsl:value-of select="order/id" />
              </xsl:attribute>                 
          </identifier>
          <display>
              <xsl:attribute name="value">
                <xsl:value-of select="order/type/name1" />
              </xsl:attribute>                 
          </display>
      </related>
  </context>


</DocumentReference>
</xsl:template>
</xsl:stylesheet>
```
