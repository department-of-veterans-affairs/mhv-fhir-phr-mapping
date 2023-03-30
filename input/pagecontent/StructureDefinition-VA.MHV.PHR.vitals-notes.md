
Simple (not fully functional) xslt from SOAP response with ImagingExamTO to FHIR Bundle with DocumentReference:
- uses a fixed Patient resource
- uses fixed system values for identifiers
- does not lookup location or practitioner resources, just uses the identifier

```xml
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
                    <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitals"/>
                </meta>

                <identifier>
                    <use value="usual"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>  <!-- TODO: system should be derived from Vista site -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="type/id" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <status value="final"/>

                <!-- code is added later, could use the ConceptMap() -->
                <category>
                    <coding>
                    <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                    <code value="vital-signs"/>
                    </coding>
                </category>
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

                <xsl:if test="boolean(comments)">
                  <note>
                    <text>
                        <xsl:attribute name="value">
                            <xsl:value-of select="comments" />
                        </xsl:attribute>        
                    </text>
                  </note>
                </xsl:if>
                <!-- Note the following will only record one, but could record both -->

                <xsl:if test="boolean(recorder)">
                <performer>
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

                   <xsl:choose>
<!-- blood pressure -->
                    <xsl:when test="type/name = 'BLOOD PRESSURE'">

                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="85354-9"/>
                                <display value="Blood pressure panel with all children optional"/>
                            </coding>
                        </code>
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
                                 <system value="http://lonc.org"/>
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
                              <system value="http://unitsofmeasure.org"/>
                              <code>
                                  <xsl:attribute name="value">
                                      <xsl:value-of select="units"/>
                                  </xsl:attribute>
                              </code>
                            </valueQuantity>
                         </component>
                     </xsl:when>
<!-- height -->
                     <xsl:when test="type/name = 'HEIGHT'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="8302-2"/>
                                <display value="Body height"/>
                            </coding>
                        </code>
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
<!-- weight -->
                     <xsl:when test="type/name = 'WEIGHT'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="29463-7"/>
                                <display value="Body weight"/>
                            </coding>
                        </code>
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
<!-- pulse -->
                     <xsl:when test="type/name = 'PULSE'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="8867-4"/>
                                <display value="Heart rate"/>
                            </coding>
                        </code>
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
<!-- pain -->
                     <xsl:when test="type/name = 'PAIN'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="72514-3"/>
                                <display value="Pain severity - 0-10 verbal numeric rating [Score] - Reported"/>
                            </coding>
                        </code>
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
<!-- respiration -->
                     <xsl:when test="type/name = 'RESPIRATION'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="9279-1"/>
                                <display value="Respiratory Rate"/>
                            </coding>
                        </code>
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
<!-- temperature -->
                     <xsl:when test="type/name = 'TEMPERATURE'">
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="8310-5"/>
                                <display value="Body temperature"/>
                            </coding>
                        </code>
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
<!-- otherwise -->
                     <xsl:otherwise>
                        <code>
                            <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="type/name" />
                            </xsl:attribute>
                            </text>
                        </code>
                        <valueString>
                            <xsl:value-of select="value1" />
                        </valueString>        
                      </xsl:otherwise>
                    </xsl:choose>

                </Observation>
            </resource>
            <request>
                <method value="POST"/>
                <url value="Observation"/>
            </request>
        </entry>  
        </xsl:if>
      </xsl:for-each>

      </Bundle>
    </xsl:template>
</xsl:transform>
```
