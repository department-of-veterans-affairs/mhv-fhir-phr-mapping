Example from a mock PatientTO

Notes
- some elements could be converted into `codes` but doing minimal translation. 
- dropping age as not useful in persisted data, prefer dob
- dropping occupation - could be recorded as SDOH Observation
- dropping confidentiality flag - not sure the meaning - could be .meta.security
- dropping patientFlags - not sure the meaning
- dropping activeInsurance - could go into Account resource - could go in extension as text blob
- dropping currentMeansStatus
- dropping elegibilityCode

```xml
<patientTO>
    <religion>PROTESTANT, NO DENOMINATION</religion>
    <name>MHVLISAONE,ROBERT M</name>
    <ssn>666114838</ssn>
    <gender>M</gender>
    <dob>19620809</dob>
    <ethnicity>WHITE, NOT OF HISPANIC ORIGIN</ethnicity>
    <age>60</age>
    <maritalStatus>MARRIED</maritalStatus>
    <demographics>
        <demographicSetTO>
            <tag>989</tag>
            <addresses>
            <addressTO>
                <streetAddress1>55 NORTH MCDONALD DRIVE</streetAddress1>
                <city>WINCHESTER</city>
                <county>135</county>
                <state>INDIANA</state>
                <zipcode>47394</zipcode>
                <country>USA</country>
                <description>Home</description>
            </addressTO>
            <addressTO>
                <city>BOONE COUNTY</city>
                <state>KENTUCKY</state>
                <description>Place of Birth</description>
            </addressTO>
            <addressTO>
                <description>Temp</description>
            </addressTO>
            </addresses>
            <phones>
            <phoneNumTO>
                <areaCode>765</areaCode>
                <exchange>555</exchange>
                <number>6688</number>
                <description>Home</description>
            </phoneNumTO>
            </phones>
        </demographicSetTO>
    </demographics>
    <occupation>SHIPPING/RECEIVING</occupation>
    <employmentStatus>RETIRED</employmentStatus>
    <relationships>
        <count>5</count>
        <persons>
            <personTO>
            <name>ANTRAS,BETTY J</name>
            <demographics>
                <demographicSetTO>
                    <tag>NOK</tag>
                    <addresses>
                        <addressTO>
                        <streetAddress1>55 NORTH MCDONALD DRIVE</streetAddress1>
                        <city>WINCHESTER</city>
                        <state>INDIANA</state>
                        <zipcode>47394</zipcode>
                        </addressTO>
                    </addresses>
                    <phones>
                        <phoneNumTO>
                        <areaCode>765</areaCode>
                        <exchange>555</exchange>
                        <number>6688</number>
                        <description>Home</description>
                        </phoneNumTO>
                    </phones>
                </demographicSetTO>
            </demographics>
            <description>NOK (WIFE)</description>
            </personTO>
            <personTO>
            <name>ANTRAS,BETTY J</name>
            <demographics>
                <demographicSetTO>
                    <tag>Emergency Contact</tag>
                    <addresses>
                        <addressTO>
                        <streetAddress1>55 NORTH MCDONALD DRIVE</streetAddress1>
                        <city>WINCHESTER</city>
                        <state>INDIANA</state>
                        <zipcode>47394</zipcode>
                        </addressTO>
                    </addresses>
                    <phones>
                        <phoneNumTO>
                        <areaCode>765</areaCode>
                        <exchange>584</exchange>
                        <number>6688</number>
                        <description>Home</description>
                        </phoneNumTO>
                    </phones>
                </demographicSetTO>
            </demographics>
            <description>Emergency Contact (WIFE)</description>
            </personTO>
            <personTO>
            <demographics>
                <demographicSetTO>
                    <tag>VA Guardian</tag>
                    <addresses>
                        <addressTO/>
                    </addresses>
                </demographicSetTO>
            </demographics>
            <description>VA Guardian</description>
            </personTO>
            <personTO>
            <demographics>
                <demographicSetTO>
                    <tag>Civil Guardian</tag>
                    <addresses>
                        <addressTO/>
                    </addresses>
                </demographicSetTO>
            </demographics>
            <description>Civil Guardian</description>
            </personTO>
            <personTO>
            <name>UNION CITY MOLD</name>
            <description>Employer</description>
            </personTO>
        </persons>
    </relationships>
    <patientName>MHVLISAONE,ROBERT M</patientName>
    <mpiPid>1013025697</mpiPid>
    <mpiChecksum>197920</mpiChecksum>
    <localPid>49906</localPid>
    <confidentiality>
        <tag>0</tag>
    </confidentiality>
    <patientFlags>
        <count>0</count>
    </patientFlags>
    <activeInsurance>Pt Insur^Patient has active Insurance^
Company ID:                   1228
Company Name:                 MEDICARE (WNR)
Company Address:              WILL NOT REIMBURSE
                              BALTIMORE, MARYLAND 21207
Phone Number:                 1-800-784-2335
Coordination of Benefits:     PRIMARY insurer
Policy Name:                  448 - MEDICARE
Policy Reimbursable:          NO
Effective Date:               Feb 01, 1994
Expiration Date:              
Subscriber Relationship to Patient:     PATIENT
Subscriber Name:                        ANTRAS,JAMES R
Subscriber ID:                          722186267A
Pharmacy Coverage:            NO
Outpatient Coverage:          NO
Inpatient Coverage:           NO
Group Number:                 PART A
Patient Relationship to Subscriber:     PATIENT
Company ID:                   1228
Company Name:                 MEDICARE (WNR)
Company Address:              WILL NOT REIMBURSE
                              BALTIMORE, MARYLAND 21207
Phone Number:                 1-800-784-2335
Coordination of Benefits:     PRIMARY insurer
Policy Name:                  16076 - MEDICARE
Policy Reimbursable:          NO
Effective Date:               Feb 01, 1994
Expiration Date:              
Subscriber Relationship to Patient:     PATIENT
Subscriber Name:                        ANTRAS,JAMES R
Subscriber ID:                          722186267A
Pharmacy Coverage:            YES
Outpatient Coverage:          YES
Inpatient Coverage:           YES
Group Number:                 PART B
Patient Relationship to Subscriber:     PATIENT</activeInsurance>
    <currentMeansStatus>REQUIRED</currentMeansStatus>
    <eligibilityCode>NSC</eligibilityCode>
</patientTO>
```
