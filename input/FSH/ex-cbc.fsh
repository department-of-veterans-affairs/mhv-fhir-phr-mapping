




///////////////////////////////////////////////////  1110200002  ////////////////////////////////////////


Instance:   ex-MHV-cbcSpecimen-1
InstanceOf: VA.MHV.PHR.cbcSpecimen
Usage: #inline
/*
<specimen>
    <specimenSource>
        <code>SER</code>
        <displayText>Serum</displayText>
        <codingSystem>HL70070</codingSystem>
        <alternateCode>72</alternateCode>
        <alternateDisplayText>SERUM</alternateDisplayText>
        <alternateCodingSystem>99VA61</alternateCodingSystem>
        <alternateCodingSystemVersion>5.2</alternateCodingSystemVersion>
        <originalText>SERUM</originalText>
    </specimenSource>
    <specimenTakenDate>
        <literal>20210120163859-0500</literal>
    </specimenTakenDate>
</specimen>
*/
* status = #available
* type.coding[+].code = #SER
* type.coding[=].display = "Serum"
* type.coding[=].system = "http://example.org/HL70070"
* type.coding[+].code = #72
* type.coding[=].display = "SERUM"
* type.coding[=].system = "http://example.org/99VA61"
* type.coding[=].version = "5.2"
* type.text = "SERUM"
* collection.collectedDateTime = 2021-01-20T16:38:59-05:00


Instance: ex-MHV-cbcTest-1a
InstanceOf: VA.MHV.PHR.cbcTest 
Usage: #inline
/*  first labTest in the report
         <labTests>
            <orderedTestCode>
               <code>84140.0000</code>
               <displayText>Potassium</displayText>
               <codingSystem>99VA64</codingSystem>
               <alternateCode>177</alternateCode>
               <alternateDisplayText>POTASSIUM</alternateDisplayText>
               <alternateCodingSystem>99VA60</alternateCodingSystem>
            </orderedTestCode>
            <chemistryResults>
               <valueInterpretation>L</valueInterpretation>
               <observationStatus>F</observationStatus>
               <testIdentifier>
                  <code>2823-3</code>
                  <displayText>POTASSIUM:SCNC:PT:SER/PLAS:QN:</displayText>
                  <codingSystem>LN</codingSystem>
                  <codingSystemVersion>2.68</codingSystemVersion>
                  <alternateCode>4670505</alternateCode>
                  <alternateCodingSystem>99VA95.3</alternateCodingSystem>
                  <alternateCodingSystemVersion>2.68</alternateCodingSystemVersion>
                  <originalText>POTASSIUM</originalText>
               </testIdentifier>
               <referenceRange>3.6-5.1</referenceRange>
               <labCommentEvents>
                  <comments>Normal Range Prior to 8-22-02 was: 3.6 - 5.0 mEq/L.</comments>
               </labCommentEvents>
               <observationValue>3.5</observationValue>
               <observationUnits>
                  <code>mEq/L</code>
                  <displayText>mEq/L</displayText>
                  <codingSystem>L</codingSystem>
               </observationUnits>
               <performingOrganization>
                  <identifier>
                     <identity>552</identity>
                     <name>DAYTON, OH VAMC</name>
                     <assigningAuthority>USVHA</assigningAuthority>
                     <nameTypeCode>L</nameTypeCode>
                     <identityTypeCode>FI</identityTypeCode>
                     <nameRepresentation>A</nameRepresentation>
                     <stationNumber>552</stationNumber>
                  </identifier>
                  <address>
                     <line1>4100 W. THIRD STREET</line1>
                     <city>DAYTON</city>
                     <postalCode>45428</postalCode>
                     <country>USA</country>
                     <state>OH</state>
                  </address>
               </performingOrganization>
            </chemistryResults>
         </labTests>
*/
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[1].coding.code = #84140.0000
* category[=].coding.display = "Potassium"
* category[=].coding.system = "http://example.org/99VA64"
* category[+].coding.code = #177
* category[=].coding.display = "POTASSIUM"
* category[=].coding.system = "http://example.org/99VA60"
* interpretation.text = "L"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* status = #final
* code.coding[+].code = #2823-3
* code.text = "POTASSIUM:SCNC:PT:SER/PLAS:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.68"
* category[+].coding.code = #4670505
* category[=].coding.system = "http://example.org/99VA95.3"
* category[=].coding.version = "2.68"
* code.text = "POTASSIUM"
* referenceRange.text = "3.6-5.1"
* note.text = "Normal Range Prior to 8-22-02 was: 3.6 - 5.0 mEq/L."
* valueQuantity.value = 3.5
* valueQuantity.unit = "mEq/L"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-552)
* subject = Reference(Patient/ex-MHV-patient-27167)

Instance: ex-MHV-cbcTest-1b
InstanceOf: VA.MHV.PHR.cbcTest 
Usage: #inline
/* second labTest in the report
         <labTests>
            <orderedTestCode>
               <code>84295.0000</code>
               <displayText>Sodium</displayText>
               <codingSystem>99VA64</codingSystem>
               <alternateCode>176</alternateCode>
               <alternateDisplayText>SODIUM</alternateDisplayText>
               <alternateCodingSystem>99VA60</alternateCodingSystem>
            </orderedTestCode>
            <chemistryResults>
               <observationStatus>F</observationStatus>
               <testIdentifier>
                  <code>2951-2</code>
                  <displayText>SODIUM:SCNC:PT:SER/PLAS:QN:</displayText>
                  <codingSystem>LN</codingSystem>
                  <codingSystemVersion>2.68</codingSystemVersion>
                  <alternateCode>4671912</alternateCode>
                  <alternateCodingSystem>99VA95.3</alternateCodingSystem>
                  <alternateCodingSystemVersion>2.68</alternateCodingSystemVersion>
                  <originalText>SODIUM</originalText>
               </testIdentifier>
               <referenceRange>136-145</referenceRange>
               <observationValue>138</observationValue>
               <observationUnits>
                  <code>mEq/L</code>
                  <displayText>mEq/L</displayText>
                  <codingSystem>L</codingSystem>
               </observationUnits>
               <performingOrganization>
                  <identifier>
                     <identity>552</identity>
                     <name>DAYTON, OH VAMC</name>
                     <assigningAuthority>USVHA</assigningAuthority>
                     <nameTypeCode>L</nameTypeCode>
                     <identityTypeCode>FI</identityTypeCode>
                     <nameRepresentation>A</nameRepresentation>
                     <stationNumber>552</stationNumber>
                  </identifier>
                  <address>
                     <line1>4100 W. THIRD STREET</line1>
                     <city>DAYTON</city>
                     <postalCode>45428</postalCode>
                     <country>USA</country>
                     <state>OH</state>
                  </address>
               </performingOrganization>
            </chemistryResults>
         </labTests>

*/
* category[Laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[1].coding.code = #84295.0000
* category[=].coding.display = "Sodium"
* category[=].coding.system = "http://example.org/99VA64"
* category[+].coding.code = #176
* category[=].coding.display = "SODIUM"
* category[=].coding.system = "http://example.org/99VA60"
* interpretation.text = "L"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L
* status = #final
* code.coding[+].code = #2951-2
* code.text = "SODIUM:SCNC:PT:SER/PLAS:QN:"
* code.coding[=].system = LOINC
* code.coding[=].version = "2.68"
* category[+].coding.code = #4671912
* category[=].coding.system = "http://example.org/99VA95.3"
* category[=].coding.version = "2.68"
* referenceRange.text = "136-145"
* valueQuantity.value = 138.0
* valueQuantity.unit = "mEq/L"
* valueQuantity.system = UCUM
* performer = Reference(Organization/ex-MHV-organization-552)
* subject = Reference(Patient/ex-MHV-patient-27167)




Instance: ex-MHV-cbcReport-1
InstanceOf: VA.MHV.PHR.cbcReport 
Title: "Example 1 of an MHV cbcReport"
Usage: #example
Description: """
Example from a mock labTestPromises (1110200002)
"""
/*

      <labTestPromises>
         <recordIdentifier>
            <identity>1110200002</identity>
            <namespaceId>LR</namespaceId>
            <universalId>TEST.DAYTON.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordIdentifier>
         <patient>
            <identifier>
               <identity>27167</identity>
               <assigningFacility>989</assigningFacility>
               <assigningAuthority>USVHA</assigningAuthority>
            </identifier>
            <name>
               <given>TESTFIVE</given>
               <middle>L</middle>
               <family>MHVSYSTEST</family>
            </name>
         </patient>
         <reportCompleteDate>
            <literal>20210121132347-0500</literal>
         </reportCompleteDate>
         <labSubscript>CH</labSubscript>
         <labCommentEvents>
            <comments>Lisa's Test 1/20/2021 - Second lab</comments>
            <comments>Added Potassium test</comments>
         </labCommentEvents>
         <labTestRequest>
            <author>
               <identifier>
                  <identity>14934-VA552</identity>
               </identifier>
               <idSourceTable>99VA4</idSourceTable>
               <name>
                  <given>LISA</given>
                  <middle>A</middle>
                  <family>HALL</family>
               </name>
            </author>
            <orderingFacilityIdentifier>
               <identity>552</identity>
               <name>DAYTON, OH VAMC</name>
               <assigningAuthority>USVHA</assigningAuthority>
               <nameTypeCode>L</nameTypeCode>
               <identityTypeCode>FI</identityTypeCode>
               <nameRepresentation>A</nameRepresentation>
               <stationNumber>552</stationNumber>
            </orderingFacilityIdentifier>
         </labTestRequest>

...  Specimen and two labTest ...

         <recordSource>
            <namespaceId>989</namespaceId>
            <universalId>DAYT29.FO-BAYPINES.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordSource>
         <recordVersion>0</recordVersion>
         <recordUpdateTime>
            <literal>20210121132348-0500</literal>
         </recordUpdateTime>
      </labTestPromises>
*/
//* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[Rid].value = "1110200002" 
* identifier[Rid].system = "urn:oid:2.16.840.1.113883.4.349.4.989"
* identifier[Rid].use = #usual
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB
* code.text = "CH"
* code.coding[CBC] = LOINC#58410-2 "CBC panel - Blood by Automated count"
* subject = Reference(Patient/ex-MHV-patient-27167)
* effectiveDateTime = 2021-01-21T11:32:47-05:00
* issued = 2021-01-21T11:32:47-05:00
* conclusion = """
Lisa's Test 1/20/2021 - Second lab
Added Potassium test
"""
* performer[+] = Reference(Organization/ex-MHV-organization-552)
* performer[+] = Reference(Practitioner/ex-MHV-practitioner-14934-VA552)
* performer[+] = Reference(Organization/ex-MHV-organization-989)
* contained[+] = ex-MHV-cbcTest-1a
* result[+] = Reference(ex-MHV-cbcTest-1a)
* contained[+] = ex-MHV-cbcTest-1b
* result[+] = Reference(ex-MHV-cbcTest-1b)
* contained[+] = ex-MHV-cbcSpecimen-1
* specimen[+] = Reference(ex-MHV-cbcSpecimen-1)
* meta.lastUpdated = 2021-01-21T13:23:48-05:00

