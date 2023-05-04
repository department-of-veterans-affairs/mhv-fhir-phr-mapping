Example from a mock chReport

```xml
      <labTestPromises>
         <recordIdentifier>
            <identity>1103030002</identity>
            <namespaceId>LR</namespaceId>
            <universalId>TEST.SALT-LAKE.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordIdentifier>
         <patient>
            <identifier>
               <identity>942104</identity>
               <assigningFacility>979</assigningFacility>
               <assigningAuthority>USVHA</assigningAuthority>
            </identifier>
            <name>
               <given>TESTFIVE</given>
               <middle>L</middle>
               <family>MHVSYSTEST</family>
            </name>
         </patient>
         <reportCompleteDate>
            <literal>20201029133246-0500</literal>
         </reportCompleteDate>
         <labSubscript>CH</labSubscript>
         <labCommentEvents>
            <comments>Lisa's Test 10/29/20</comments>
         </labCommentEvents>
         <labTestRequest>
            <author>
               <identifier>
                  <identity>59845-VA660</identity>
               </identifier>
               <idSourceTable>99VA4</idSourceTable>
               <name>
                  <given>LISA</given>
                  <middle>V</middle>
                  <family>HALL</family>
               </name>
            </author>
            <orderingFacilityIdentifier>
               <identity>660</identity>
               <name>VA SALT LAKE CITY HEALTH CARE SYSTEM (660)</name>
               <assigningAuthority>USVHA</assigningAuthority>
               <nameTypeCode>L</nameTypeCode>
               <identityTypeCode>FI</identityTypeCode>
               <nameRepresentation>A</nameRepresentation>
               <stationNumber>660</stationNumber>
            </orderingFacilityIdentifier>
         </labTestRequest>
         <specimen>
            <specimenSource>
               <code>BLD</code>
               <displayText>Whole blood</displayText>
               <codingSystem>HL70070</codingSystem>
               <alternateCode>70</alternateCode>
               <alternateDisplayText>BLOOD</alternateDisplayText>
               <alternateCodingSystem>99VA61</alternateCodingSystem>
               <alternateCodingSystemVersion>5.2</alternateCodingSystemVersion>
               <originalText>BLOOD</originalText>
            </specimenSource>
            <specimenTakenDate>
               <literal>20201029133003-0500</literal>
            </specimenTakenDate>
         </specimen>
         
		 
		 <labTests>
            <orderedTestCode>
               <code>85052.0000</code>
               <displayText>Glycohemoglobin A(1) C</displayText>
               <codingSystem>99VA64</codingSystem>
               <alternateCode>1893</alternateCode>
               <alternateDisplayText>A1C HEMOGLOBIN {Pnl}</alternateDisplayText>
               <alternateCodingSystem>99VA60</alternateCodingSystem>
            </orderedTestCode>
            <chemistryResults>
               <valueInterpretation>L</valueInterpretation>
               <observationStatus>F</observationStatus>
               <testIdentifier>
                  <code>4548-4</code>
                  <displayText>HEMOGLOBIN A1C/HEMOGLOBIN.TOTAL:MFR:PT:BLD:QN:</displayText>
                  <codingSystem>LN</codingSystem>
                  <codingSystemVersion>2.68</codingSystemVersion>
                  <alternateCode>4682837</alternateCode>
                  <alternateCodingSystem>99VA95.3</alternateCodingSystem>
                  <alternateCodingSystemVersion>2.68</alternateCodingSystemVersion>
                  <originalText>HEMOGLOBIN A1C</originalText>
               </testIdentifier>
               <referenceRange>4.4-6.0</referenceRange>
               <observationValue>3.9</observationValue>
               <observationUnits>
                  <code>%</code>
                  <displayText>%</displayText>
                  <codingSystem>L</codingSystem>
               </observationUnits>
               <performingOrganization>
                  <identifier>
                     <identity>660</identity>
                     <name>VA SALT LAKE CITY HEALTH CARE SYSTEM (660)</name>
                     <assigningAuthority>USVHA</assigningAuthority>
                     <nameTypeCode>L</nameTypeCode>
                     <identityTypeCode>FI</identityTypeCode>
                     <nameRepresentation>A</nameRepresentation>
                     <stationNumber>660</stationNumber>
                  </identifier>
                  <address>
                     <line1>500 FOOTHILL BLVD.</line1>
                     <city>SALT LAKE CITY</city>
                     <postalCode>84148</postalCode>
                     <country>USA</country>
                     <state>UT</state>
                  </address>
               </performingOrganization>
            </chemistryResults>
         </labTests>
		 
		 
         <recordSource>
            <namespaceId>979</namespaceId>
            <universalId>SLC10.FO-BAYPINES.MED.VA.GOV</universalId>
            <universalIdType>DNS</universalIdType>
         </recordSource>
         <recordVersion>0</recordVersion>
         <recordUpdateTime>
            <literal>20201029133246-0500</literal>
         </recordUpdateTime>
      </labTestPromises>

```
