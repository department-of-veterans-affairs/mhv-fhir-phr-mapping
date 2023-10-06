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
    <id value="vitals"/>
    <type value="transaction"/>
    <timestamp>
        <xsl:attribute name="value">
            <xsl:value-of select="current-dateTime()"/>
        </xsl:attribute>
    </timestamp>
    <!-- TODO: should find a FHIR Patient given the PatientTO details GetPatient() -->
      <xsl:for-each select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/vitals/arrays/taggedVitalSignArray/vitals/vitalSignTO">
        <xsl:if test="boolean(type/id) and boolean(value1)">  <!-- ignore those that have no id or value1, which should just be the fractional BP -->
        <entry>
           <xsl:variable name="fullUrl" select="uuid:randomUUID()"/>
            <fullUrl>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('urn:uuid:', $fullUrl)"/>
                </xsl:attribute>
            </fullUrl>
            <resource>
                <Observation>
                <id>
                  <xsl:attribute name="value">
                    <xsl:value-of select="$fullUrl"/>                  
                  </xsl:attribute>
                </id>

                <meta>
                   <xsl:choose>
                    <xsl:when test="type/name = 'BLOOD PRESSURE'">
                        <profile value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsBP"/>
                    </xsl:when>
                    <xsl:when test="type/name = 'PAIN'">
                        <profile value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitalsPain"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <profile value="https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/StructureDefinition/VA.MHV.PHR.vitals"/>
                    </xsl:otherwise>
                    </xsl:choose>
                </meta>

                <xsl:if test="boolean(location)">
                <contained>
                    <Location>
                    <id value="location-0"/>
                    <identifier>
                        <use value="usual"/>
                        <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>  <!-- hack for station 989 -->
                        <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="concat('HospitalLocationTO.', location/id)" />
                        </xsl:attribute>
                        </value>
                    </identifier>
                    <name>
                        <xsl:attribute name="value">
                            <xsl:value-of select="location/name" />
                        </xsl:attribute>                 
                    </name>
                    </Location>
                </contained>
                </xsl:if>

<!-- The following two extensions are used to enable the conversion to FSH resources - see mock-images.fsh -->
<!--
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-title">
<valueString>
  <xsl:attribute name="value">
    <xsl:value-of select="type/name" />
  </xsl:attribute>
</valueString>
</extension>
<extension url="http://hl7.org/fhir/StructureDefinition/artifact-description">
<valueMarkdown>
  <xsl:attribute name="value">
      <xsl:value-of select="type/id" />
    </xsl:attribute>
</valueMarkdown>
</extension>
-->
                <identifier>
                    <use value="usual"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>  <!-- hack for station 989 -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('VitalSignTO.', type/id)" />
                    </xsl:attribute>
                    </value>
                </identifier>


                <status value="final"/>

                <category>
                    <coding>
                    <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                    <code value="vital-signs"/>
                    </coding>
                </category>

                <code>
                   <xsl:choose>
                   <!-- this is a subset of values known to be in initial data -->
                    <xsl:when test="type/name = 'BLOOD PRESSURE'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="85354-9"/>
                            <display value="Blood pressure panel with all children optional"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'HEIGHT'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="8302-2"/>
                            <display value="Body height"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'WEIGHT'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="29463-7"/>
                            <display value="Body weight"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'PULSE'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="8867-4"/>
                            <display value="Heart rate"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'PAIN'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="72514-3"/>
                            <display value="Pain severity - 0-10 verbal numeric rating [Score] - Reported"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'RESPIRATION'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="9279-1"/>
                            <display value="Respiratory Rate"/>
                        </coding>
                     </xsl:when>
                     <xsl:when test="type/name = 'TEMPERATURE'">
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="8310-5"/>
                            <display value="Body temperature"/>
                        </coding>
                     </xsl:when>
                    </xsl:choose>
                    <text>
                    <xsl:attribute name="value">
                        <xsl:value-of select="type/name" />
                    </xsl:attribute>
                    </text>
                </code>

                <subject>
                    <reference value="Patient/ex-MHV-patient-2"/>  <!-- TODO: patient should come from patient lookup -->
                </subject>

                <effectiveDateTime>
                  <xsl:attribute name="value">
                    <xsl:variable name="datetime">
                      <xsl:call-template name="fileman-to-datetime">
                        <xsl:with-param name="fileman-date" select="timestamp" />
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$datetime" /> 
                  </xsl:attribute>
                </effectiveDateTime>

                <xsl:if test="boolean(recorder)">
                <performer>
                    <type value="http://hl7.org/fhir/StructureDefinition/Practitioner" />
                    <identifier>
                        <value>
                            <xsl:attribute name="value">
                            <xsl:value-of select="recorder/id" /> 
                            </xsl:attribute>                
                        </value>
                    </identifier>
                    <display>
                        <xsl:attribute name="value">
                            <xsl:value-of select="recorder/name" />
                        </xsl:attribute>                 
                    </display>
                </performer>
                </xsl:if>
                <xsl:if test="boolean(observer)">
                <performer>
                    <type value="http://hl7.org/fhir/StructureDefinition/Practitioner" />
                    <identifier>
                        <value>
                            <xsl:attribute name="value">
                            <xsl:value-of select="observer/id" />
                            </xsl:attribute>                 
                        </value>
                    </identifier>
                    <display>
                        <xsl:attribute name="value">
                            <xsl:value-of select="observer/name" />
                        </xsl:attribute>                 
                    </display>
                </performer>
                </xsl:if>
                <xsl:if test="boolean(location)">
                    <performer>
                        <extension url="http://hl7.org/fhir/StructureDefinition/alternate-reference">
                        <valueReference>
                            <reference value="#location-0"/>
                        </valueReference>
                        </extension>
                        <display>
                            <xsl:attribute name="value">
                                <xsl:value-of select="location/name" />
                            </xsl:attribute>                 
                        </display>
                    </performer>
                </xsl:if>

                <xsl:choose>
                    <xsl:when test="type/name = 'BLOOD PRESSURE'">
                        <!-- no value[x] -->
                    </xsl:when>
                    <xsl:when test="
                     (type/name = 'HEIGHT') or
                     (type/name = 'WEIGHT') or
                     (type/name = 'PULSE') or
                     (type/name = 'RESPIRATION') or
                     (type/name = 'TEMPERATURE')
                     ">
                        <valueQuantity>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="value1"/>
                                </xsl:attribute>
                            </value>
                            <system value="http://unitsofmeasure.org"/>
                            <xsl:choose> <!-- some vista ucum units are not proper -->
                            <xsl:when test="units = 'in'">
                                <code value="[in_i]"/>
                            </xsl:when>
                            <xsl:when test="units = 'lb'">
                                <code value="[lb_av]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <code>
                                  <xsl:attribute name="value">
                                      <xsl:value-of select="units"/>
                                  </xsl:attribute>
                                </code>
                            </xsl:otherwise>
                            </xsl:choose>
                        </valueQuantity>
                    </xsl:when>
                    <xsl:when test="type/name = 'PAIN'">
                        <valueQuantity>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="value1"/>
                                </xsl:attribute>
                            </value>
                        </valueQuantity>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="units != ''">
                                <valueQuantity>
                                    <value>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="value1"/>
                                        </xsl:attribute>
                                    </value>
                                    <system value="http://unitsofmeasure.org"/>
                                    <code>
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="units"/>
                                        </xsl:attribute>
                                    </code>
                                </valueQuantity>   
                            </xsl:when>   
                            <xsl:otherwise>
                                <valueString>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="value1"/>
                                </xsl:attribute>
                                </valueString>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="boolean(comments)">
                  <note>
                    <text>
                        <xsl:attribute name="value">
                            <xsl:value-of select="comments" />
                        </xsl:attribute>        
                    </text>
                  </note>
                </xsl:if>

                <xsl:if test="type/name = 'BLOOD PRESSURE'">
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="8480-6"/>
                                <display value="Systolic blood pressure"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="substring-before(value1, '/')"/>
                                </xsl:attribute>
                            </value>
                            <unit value="mmHg"/>
                            <system value="http://unitsofmeasure.org"/>
                            <code>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="units"/>
                                </xsl:attribute>
                            </code>
                        </valueQuantity>
                    </component>
                    <component>
                        <code>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="8462-4"/>
                            <display value="Diastolic blood pressure"/>
                            </coding>
                        </code>
                        <valueQuantity>
                            <value>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="substring-after(value1, '/')"/>
                                </xsl:attribute>
                            </value>
                            <unit value="mmHg"/>
                            <system value="http://unitsofmeasure.org"/>
                            <code>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="units"/>
                                </xsl:attribute>
                            </code>
                        </valueQuantity>
                    </component>
                </xsl:if>

                </Observation>
            </resource>
            <request>
                <method value="PUT"/>
                <url>
                    <xsl:attribute name="value">
                        <xsl:value-of select="concat('Observation?urn:oid:2.16.840.1.113883.4.349.4.989|VitalSignTO.', type/id)" />
                    </xsl:attribute>
                </url>
            </request>
        </entry>  
        </xsl:if>
      </xsl:for-each>

      </Bundle>
    </xsl:template>
</xsl:transform>
