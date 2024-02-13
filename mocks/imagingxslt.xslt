<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" 
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"  
xmlns:ns2="http://service.via.med.va.gov/"
xmlns:saxon="http://saxon.sf.net/" 
xmlns:uuid="java:java.util.UUID"
exclude-result-prefixes="soap ns2 uuid saxon"
>
<xsl:import href="fileman-to-datetime.xslt" />

    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">

    <Bundle xmlns="http://hl7.org/fhir">
    <id value="images"/>
    <type value="transaction"/>
    <timestamp>
        <xsl:attribute name="value">
            <xsl:value-of select="current-dateTime()"/>
        </xsl:attribute>
    </timestamp>
    <!-- TODO: should find a FHIR Patient given the PatientTO details GetPatient() -->
      <xsl:for-each select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/imagingExams/arrays/taggedImagingExamArray/imagingExams/imagingExamTO">
        <entry>
           <xsl:variable name="fullUrl" select="uuid:randomUUID()"/>
            <fullUrl>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('urn:uuid:', $fullUrl)"/>
                </xsl:attribute>
            </fullUrl>
            <resource>
                <DocumentReference>
                <id>
                  <xsl:attribute name="value">
                    <xsl:value-of select="$fullUrl"/>                  
                  </xsl:attribute>
                </id>

                <meta>
                    <profile value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.imaging"/>
                </meta>
<!-- The following two extensions are used to enable the conversion to FSH resources - see mock-images.fsh -->
<!--
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-title">
    <valueString>
        <xsl:attribute name="value">
            <xsl:value-of select="concat('Radiology: ',id)" />
        </xsl:attribute>
    </valueString>
</extension>
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-description">
    <valueMarkdown>
        <xsl:attribute name="value">
            <xsl:value-of select="name" /> 
        </xsl:attribute>
    </valueMarkdown>
</extension>
-->
                <identifier>
                    <use value="usual"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>   <!-- TODO: should be derived from Vista site, using 989 -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('ImagingExamTO.',id)" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <identifier>
                    <use value="official"/>
                    <type>
                        <coding>
                            <system value="http://terminology.hl7.org/CodeSystem/v2-0203"/>
                            <code value="ACSN"/>
                        </coding>
                    </type>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>  <!-- TODO: should be derived from Vista site, using 989 -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('Accession.', radiologyReportTO/accessionNumber)" />
                    </xsl:attribute>
                    </value>
                </identifier>
                    <identifier>
                    <use value="secondary"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>    <!-- TODO: should be derived from Vista site, using 989 -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('CaseNum.', casenum)" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <status value="current"/>
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
                    <reference value="Patient/ex-MHV-patient-0"/>  <!-- TODO: patient should come from patient lookup -->
                </subject>
                <date>
                  <xsl:attribute name="value">
                    <xsl:variable name="datetime">
                      <xsl:call-template name="fileman-to-datetime">
                        <xsl:with-param name="fileman-date" select="timestamp" />
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$datetime" /> 
                  </xsl:attribute>
                </date>
                <author>
                    <display>
                    <xsl:attribute name="value">
                        <xsl:value-of select="provider/name" /> <!-- TODO GetPractitioner() -->
                    </xsl:attribute>
                    </display>
                </author>
                <author>
                    <identifier>
                    <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="radiologyReportTO/facility/tag" /> <!-- TODO GetLocation() -->
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
                                <xsl:value-of select="imagingLocation/id" /> <!-- TODO GetLocation() -->
                            </xsl:attribute>              
                        </value>
                    </identifier>
                        <display>
                            <xsl:attribute name="value">
                                <xsl:value-of select="imagingLocation/name" />
                            </xsl:attribute>              
                        </display>
                </custodian>
                <xsl:if test="boolean(interpretation)">
                  <description>
                      <xsl:attribute name="value">
                          <xsl:value-of select="interpretation" />
                      </xsl:attribute>        
                  </description>
                </xsl:if>
                <content>
                    <attachment>
                        <contentType value="text/plain"/>      
                        <xsl:variable name="blob" select="radiologyReportTO/text"/>
                        <xsl:variable name="bblob" select="saxon:string-to-base64Binary($blob, 'UTF8')" /> 
                        <data>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$bblob" />
                            </xsl:attribute>
                        </data>

                        <title>
                            <xsl:attribute name="value">
                                <xsl:value-of select="name" />
                            </xsl:attribute>              
                        </title>

                        <creation>
                            <xsl:attribute name="value">
                            <xsl:variable name="datetime">
                              <xsl:call-template name="fileman-to-datetime">
                                <xsl:with-param name="fileman-date" select="timestamp" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:value-of select="$datetime" /> 
                            </xsl:attribute>
                        </creation>

                    </attachment>
                </content>
                <xsl:if test="boolean(encounterId) or boolean(order/id)">
                <context>
                  <xsl:if test="boolean(encounterId)">
                    <encounter>
                        <identifier>
                            <value>
                                <xsl:attribute name="value">
                                <xsl:value-of select="encounterId" /> 
                                </xsl:attribute>                
                            </value>
                        </identifier>
                    </encounter>
                  </xsl:if>
                  <xsl:if test="boolean(order/id)">
                    <related>
                        <identifier>
                            <value>
                                <xsl:attribute name="value">
                                <xsl:value-of select="order/id" />
                                </xsl:attribute>                 
                            </value>
                        </identifier>
                        <display>
                            <xsl:attribute name="value">
                                <xsl:value-of select="order/type/name1" />
                            </xsl:attribute>                 
                        </display>
                    </related>
                  </xsl:if>
                </context>
                  </xsl:if>

                </DocumentReference>
            </resource>
            <request>
                <method value="POST"/>
                <url value="DocumentReference"/>
            </request>
        </entry>  
      </xsl:for-each>

      </Bundle>
    </xsl:template>
</xsl:transform>
