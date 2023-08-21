- The [mock example](https://github.com/JohnMoehrke/MHV-PHR/blob/main/mocks/vitals.xml) 
- maps to [VitalSignTO](https://github.com/department-of-veterans-affairs/mhv-np-via-wsclient/blob/development/src/main/resources/VIA_v4.0.7_uat.wsdl) schema.
- Mapping from [VitalSignTo](StructureDefinition-VA.MHV.PHR.vitals-mappings.html#mappings-for-vdif-to-mhv-phr-vitalsignto)
- based on US-Core for Vital-Signs Observation Resource
  - Blood-Pressure is based off of the Blood-Pressure profile
- should have `meta.profile` set to - JIRA
  - General Vital-Signs `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitals`
  - Pain `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitalsPain`
  - Blood-Pressure `https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitalsBP`
- `status` of `final`
- `category` code of `vital-signs`
- `code.text` the original `VitalSignTO.type.name`
  - `code` should be LOINC if available
    - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-ObservationTypeTOVsLoincCode.html)
- must have `identifier` as cross reference to original source
- `subject` is the patient
- Not preserving the VitalSignTO.low and .high as they are referenceRange
- value
  - Blood Pressure - no `.value[x]`, but has `.component`
    - Additional specifics for [BP Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsBP.html)
      - [Examples](StructureDefinition-VA.MHV.PHR.vitalsBP-examples.html)
  - Pain - `.valueQuantity`
    - Additional specifics for [Pain Vital-Signs](StructureDefinition-VA.MHV.PHR.vitalsPain.html)
      - [Examples](StructureDefinition-VA.MHV.PHR.vitalsPain-examples.html)
  - Those with units use `.valueQuantity` else `.valueString`
- value units
  - There is a units within the data, and it seems mostly to be the proper code from the proper code system UCUM
  - some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- populate `effectiveDateTime`, `performer`, and `note.text` as mapped 
- Most [examples are within a Bundle](Bundle-vitals.html), which does not exposed each vital sign.

#### Mapping Concerns

- Not clear how we learn of previously good vitals that should be changed and marked as entered-in-error
- There are examples, all of which have been converted into [FHIR resources](Bundle-vitals.html)
  - BLOOD PRESSURE (SYSTOLIC BLOOD PRESSURE, DIASTOLIC BLOOD PRESSURE) = 26 (26, 26)
  - HEIGHT = 12
  - WEIGHT = 20
  - PULSE = 20
  - PAIN = 16
  - RESPIRATION = 9
  - TEMPERATURE = 18
- do not have examples for -- **these are not required in the UX, so low priority**
  - ABDMONAL GIRTH
  - AUDIOMETRY
  - CENTRAL VENOUS PRESSURE
  - CIRCUMFERENCE%2FGIRTH
  - FETAL HEART TONES
  - FUNDAL HEIGHT
  - HEADCIRCUMFERENCE
  - HEARING
  - PULSE OXIMETRY
  - RESPIRATION
  - TONOMETRY
  - VISION CORRECTED
  - VISION UNCORRECTED
- mock example didn't include these elements, so I don't map
  - type.shortName, type.dataId, type.dataName, or type.dataType
  - value2
  - facility
  - location
  - qualifiers, qualifierItems
- code should be LOINC if available
  - [Concept Map from VitalSignTO.type.name to LOINC code](ConceptMap-ObservationTypeTOVsLoincCode.html)
  - note some of these codes are high confidence, many are not
- value units
  - There is a units within the data, and it seems mostly to be the proper code from the proper code system UCUM
  - some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)

#### code review

august 21, 2023

- identifier is not following the given pattern
- lines 214-229, seems to be prototype code that should be removed?
- lines 233-242, processing of identifier. I can't understand this code, but it does not seem to be putting the right pattern in.
- line 244, sets status final, will eventually need this to follow the status of updates
- lines 247-254, (category) is wrong. `vital-signs` is not a loinc code it is `http://terminology.hl7.org/CodeSystem/observation-category`
- lines 256-268, (code) is wrong. This code seems to be looking at the input name, but then just assuming it is loinc unless the name happens to be "X". I guess that this switch statement was going to implement the [mapping table](ConceptMap-ObservationTypeTOVsLoincCode.html) that I provide, but did not.
  - Note that this mapping table could be implemented as a FHIR ConceptMap, and thus be dynamically improved without changes to the code.
- line 270, This line seems to be consistent with allergy when the patient is new, but does not have the if statement tha allergy has.
- line 272-280, (effectiveDate), seems okay
- line 281-288, (recorder and observer), seems okay
- lines 289-295, (value), seems mostly okay for quantity, but should also handle string
  - some units are not proper formal UCUM, so I had to fix `lb` and `in` - [Utility UCUM](utility.html)
- lines 301-310, This is code to just throw a warning if we see data we did not have a map to. Should this code go to production, or be disablable in production? It might be useful to detect information we don't have a map for.
- line 312 has "DocumentReference" but surely this is wrong, I guess this should be "Observation"?

#### xsl transform

Simple (not fully functional) xslt from SOAP response with VitalSignTO to FHIR Bundle with Observation:

- uses a fixed Patient resource
- uses fixed site values for identifiers
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
                   <xsl:choose>
                    <xsl:when test="type/name = 'BLOOD PRESSURE'">
                        <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitalsBP"/>
                    </xsl:when>
                    <xsl:when test="type/name = 'PAIN'">
                        <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitalsPain"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.vitals"/>
                    </xsl:otherwise>
                    </xsl:choose>
                </meta>

                <identifier>
                    <use value="usual"/>
                    <system value="urn:oid:2.16.840.1.113883.4.349.4.989"/>  <!-- TODO: system should be derived from Vista site -->
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
