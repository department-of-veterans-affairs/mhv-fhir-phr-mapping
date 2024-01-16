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
    <id value="notes"/>
    <type value="transaction"/>
    <timestamp>
        <xsl:attribute name="value">
            <xsl:value-of select="current-dateTime()"/>
        </xsl:attribute>
    </timestamp>
    <!-- TODO: should find a FHIR Patient given the PatientTO details GetPatient() -->
      <xsl:for-each select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/notes/arrays/taggedNoteArray/notes/noteTO">
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
                    <profile value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.note"/>
                    <extension url="http://hl7.org/fhir/StructureDefinition/lastSourceSync">
                        <valueDateTime>
                            <xsl:attribute name="value">
                                <xsl:value-of select="current-dateTime()"/>
                            </xsl:attribute>
                        </valueDateTime>
                    </extension>                    
                </meta>
<!-- The following two extensions are used to enable the conversion to FSH resources - see mock-notes.fsh -->
<!-- -->
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-title">
    <xsl:choose>
        <!-- this is a subset of values known to be in initial data -->
        <xsl:when test="type = 'DS'">
            <valueString>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('DS Note: ',id)" />
                </xsl:attribute>
            </valueString>
        </xsl:when>
        <xsl:when test="type = 'PN'">
            <valueString>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('PN Note: ',id)" />
                </xsl:attribute>
            </valueString>
        </xsl:when>
        <xsl:when test="type = 'CR'">
            <valueString>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('CR Note: ',id)" />
                </xsl:attribute>
            </valueString>
        </xsl:when>
    </xsl:choose>                   
</extension>
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-description">
    <valueMarkdown>
        <xsl:attribute name="value">
            <xsl:value-of select="localTitle" /> 
        </xsl:attribute>
    </valueMarkdown>
</extension>
 <!-- -->
                <contained>
                    <Practitioner>
                        <id value="author-0"/>
                        <meta>
                            <profile
                                    value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"/>
                        </meta>
                        <identifier>
                            <use value="usual"/>
                            <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('AuthorTO.',author/id)" />
                                </xsl:attribute>
                            </value>
                        </identifier>
                        <name>
                            <text>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="author/name" />
                                </xsl:attribute>     
                            </text>
                            <family>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="author/name"/>
                                </xsl:attribute>     
                            </family>
                        </name>
                    </Practitioner>
                </contained>
                <xsl:if test="boolean(approvedBy)">
                <contained>
                    <Practitioner>
                        <id value="approvedBy-0"/>
                        <meta>
                            <profile
                                    value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"/>
                        </meta>
                        <identifier>
                            <use value="usual"/>
                            <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('AuthorTO.',approvedBy/id)" />
                                </xsl:attribute>
                            </value>
                        </identifier>
                        <name>
                            <text>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="approvedBy/name"/>
                                </xsl:attribute>     
                            </text>
                            <family>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="approvedBy/name"/>
                                </xsl:attribute>     
                            </family>
                        </name>
                    </Practitioner>
                </contained>
                </xsl:if>
                <contained>
                    <Location>
                    <id value="location-0"/>
                    <meta>
                        <profile
                                value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"/>
                    </meta>
                    <identifier>
                        <use value="usual"/>
                        <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>
                        <value>
                            <xsl:attribute name="value">
                                <xsl:value-of select="concat('LocationTO.',location/id)" />
                            </xsl:attribute>
                        </value>
                    </identifier>
                    <name>
                        <xsl:attribute name="value">
                            <xsl:value-of select="location/name"/>
                        </xsl:attribute>
                    </name>
                    </Location>
                </contained>

                <identifier>
                    <use value="usual"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>   <!-- TODO: should be derived from Vista site, using 989 -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('NoteTO.',id)" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <status value="current"/>
                <type>
                    <xsl:choose>
                    <!-- this is a subset of values known to be in initial data -->
                    <xsl:when test="type = 'DS'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="18842-5"/>
                        </coding>
                    </xsl:when>
                    <xsl:when test="type = 'PN'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="11506-3"/>
                        </coding>
                    </xsl:when>
                    <xsl:when test="type = 'CR'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="11488-4"/>
                        </coding>
                    </xsl:when>
                    </xsl:choose>                   
     
                    <xsl:if test="boolean(standardTitle)">
                        <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="standardTitle" />
                            </xsl:attribute>              
                        </text>
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
                    <reference value="#author-0"/>
                </author>
                <xsl:if test="boolean(approvedBy)">
                  <authenticator>
                    <xsl:if test="boolean(procTimestamp)">
                        <extension url="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/noteAuthenticatedWhen">
                        <valueDateTime>
                        <xsl:attribute name="value">
                            <xsl:variable name="datetime">
                                <xsl:call-template name="fileman-to-datetime">
                                <xsl:with-param name="fileman-date" select="procTimestamp" />
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:value-of select="$datetime" />       
                        </xsl:attribute>
                        </valueDateTime>
                       </extension>
                    </xsl:if>
                    <reference value="#approvedBy-0"/>
                  </authenticator>
                </xsl:if>
                <content>
                    <attachment>
                        <contentType value="text/plain"/>      
                        <xsl:variable name="blob" select="text"/>
                        <xsl:variable name="bblob" select="saxon:string-to-base64Binary($blob, 'UTF8')" /> 
                        <data>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$bblob" />
                            </xsl:attribute>
                        </data>

                        <title>
                            <xsl:attribute name="value">
                                <xsl:value-of select="localTitle" />
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
                <context>
                    <related>
                      <reference value="#location-0"/>
                    </related>
                  </context>
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
