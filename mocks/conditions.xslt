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
    <xsl:variable name="site" select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/problems/arrays/taggedProblemArray/tag"/>

    <id value="conditions"/>
    <type value="transaction"/>
    <timestamp>
        <xsl:attribute name="value">
            <xsl:value-of select="current-dateTime()"/>
        </xsl:attribute>
    </timestamp>

    <!-- TODO: should find a FHIR Patient given the PatientTO details GetPatient() -->
      <xsl:for-each select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/problems/arrays/taggedProblemArray/problems/problemTO">
        <entry>
           <xsl:variable name="fullUrl" select="uuid:randomUUID()"/>
            <fullUrl>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('urn:uuid:', $fullUrl)"/>
                </xsl:attribute>
            </fullUrl>
            <resource>
                <Condition>
                <id>
                  <xsl:attribute name="value">
                    <xsl:value-of select="$fullUrl"/>                  
                  </xsl:attribute>
                </id>

                <contained>
                    <Practitioner>
                        <id value="observer-0"/>
                        <meta>
                            <profile
                                    value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.practitioner"/>
                        </meta>
                        <identifier>
                            <use value="usual"/>
                            <system>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('urn:oid:2.16.840.1.113883.4.349.4.', $site)" />
                                </xsl:attribute>
                            </system>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('AuthorTO.',observer/id)" />
                                </xsl:attribute>
                            </value>
                        </identifier>
                        <name>
                            <text>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="observer/name" />
                                </xsl:attribute>     
                            </text>
                            <family>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="observer/name"/>
                                </xsl:attribute>     
                            </family>
                        </name>
                    </Practitioner>
                </contained>
                <contained>
                    <Location>
                    <id value="location-0"/>
                    <meta>
                        <profile
                                value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.location"/>
                    </meta>
                    <xsl:if test="boolean(facility/tag)">
                        <identifier>
                            <use value="usual"/>
                            <system>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('urn:oid:2.16.840.1.113883.4.349.4.', $site)"/>
                                </xsl:attribute>
                            </system>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="concat('LocationTO.',facility/tag)" />
                                </xsl:attribute>
                            </value>
                        </identifier>
                    </xsl:if>
                    <xsl:if test="boolean(facility/text)">
                        <name>
                            <xsl:attribute name="value">
                                <xsl:value-of select="facility/text"/>
                            </xsl:attribute>
                        </name>
                    </xsl:if>
                    </Location>
                </contained>

<!-- The following two extensions are used to enable the conversion to FSH resources - see mock-notes.fsh -->
<!-- -->
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-title">
    <valueString>
        <xsl:attribute name="value">
            <xsl:value-of select="concat('Condition: ',id)" />
        </xsl:attribute>
    </valueString>                
</extension>
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-description">
    <valueMarkdown>
        <xsl:attribute name="value">
            <xsl:value-of select="type/name" /> 
        </xsl:attribute>
    </valueMarkdown>
</extension>
 <!-- -->

                <identifier>
                    <use value="usual"/>
                    <system>
                        <xsl:attribute name="value">
                            <xsl:value-of select="concat('urn:oid:2.16.840.1.113883.4.349.4.', $site)"/>
                        </xsl:attribute>
                    </system>
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('ProblemTO.',id)" />
                    </xsl:attribute>
                    </value>
                </identifier>

                <clinicalStatus>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/condition-clinical"/>
                        <xsl:if test="status = 'ACTIVE'">
                            <code value="active"/>
                        </xsl:if>
                        <xsl:if test="status = 'INACTIVE'">
                            <code value="inactive"/>
                        </xsl:if>
                    </coding>
                </clinicalStatus>

                <xsl:if test="boolean(verified)">
                <verificationStatus>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/condition-ver-status"/>
                        <xsl:if test="verified = 'true'">
                            <code value="confirmed"/>
                        </xsl:if>
                        <xsl:if test="verified = 'false'">
                            <code value="unconfirmed"/>
                        </xsl:if>
                    </coding>
                </verificationStatus>
                </xsl:if>

                <category>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/condition-category"/>
                        <code value="problem-list-item"/>
                    </coding>
                </category>

                <code>
                    <xsl:if test="boolean(icd)">
                        <coding> <!-- here assume ICD-9, but sometimes it is ICD-10 -->
                            <system value="http://hl7.org/fhir/sid/icd-9-cm"/>
                            <code>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="icd" />
                                </xsl:attribute>  
                            </code>
                        </coding>
                    </xsl:if>
                    <text>
                        <xsl:attribute name="value">
                            <xsl:value-of select="type/name" />
                        </xsl:attribute>              
                    </text>
                </code>

                <subject>
                    <reference value="Patient/ex-MHV-patient-0"/>  <!-- TODO: patient should come from patient lookup -->
                </subject>

                <xsl:if test="boolean(onsetDate)">
                <onsetDateTime>
                  <xsl:attribute name="value">
                    <xsl:variable name="datetime">
                      <xsl:call-template name="fileman-to-datetime">
                        <xsl:with-param name="fileman-date" select="onsetDate" />
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$datetime" /> 
                  </xsl:attribute>
                </onsetDateTime>
                </xsl:if>

                <xsl:if test="boolean(resolvedDate)">
                <abatementDateTime>
                    <xsl:attribute name="value">
                      <xsl:variable name="datetime">
                        <xsl:call-template name="fileman-to-datetime">
                          <xsl:with-param name="fileman-date" select="resolvedDate" />
                        </xsl:call-template>
                      </xsl:variable>
                      <xsl:value-of select="$datetime" /> 
                    </xsl:attribute>
                </abatementDateTime>
                </xsl:if>
  
                <recordedDate>
                    <xsl:attribute name="value">
                        <xsl:variable name="datetime">
                        <xsl:call-template name="fileman-to-datetime">
                            <xsl:with-param name="fileman-date" select="timestamp" />
                        </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of select="$datetime" /> 
                    </xsl:attribute>
                </recordedDate>
  
                <recorder>
                    <extension url="http://hl7.org/fhir/StructureDefinition/alternate-reference">
                    <valueReference>
                        <reference value="#location-0"/>
                    </valueReference>
                    </extension>
                    <reference value="#observer-0"/>
                </recorder>

                 <xsl:for-each select="comments/notes/noteTO">
                    <note>
                        <authorString>
                            <xsl:attribute name="value">
                                <xsl:value-of select="author/name" />
                            </xsl:attribute>    
                        </authorString>
                        <time>
                            <xsl:attribute name="value">
                                <xsl:variable name="datetime">
                                <xsl:call-template name="fileman-to-datetime">
                                    <xsl:with-param name="fileman-date" select="timestamp" />
                                </xsl:call-template>
                                </xsl:variable>
                                <xsl:value-of select="$datetime" /> 
                            </xsl:attribute>                               
                        </time>
                        <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="text" />
                            </xsl:attribute>    
                        </text>
                    </note>
                </xsl:for-each>

                </Condition>
            </resource>
            <request>
                <method value="POST"/>
                <url value="Condition"/>
            </request>
        </entry>  
      </xsl:for-each>

      </Bundle>
    </xsl:template>
</xsl:transform>
