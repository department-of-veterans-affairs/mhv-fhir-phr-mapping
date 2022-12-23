The MyHealtheVet Oxygen Saturation - aka Pulse OX 

**Epic** MyHealtheVet will support Oxygen Saturation measurements in the PGHD (FHIR) repository

## Use-Case

### View all measurements currently in PGHD

**Given** that Oxygen Saturation measurements may be automatically recorded by Internet connected Oxygen Saturation measurement devices that are Veteran authorized 

**When** the Veteran needs to confirm that the measurements taken are available in PGHD

**Then** the MyHealtheVet will provide a user interface that displays the current measurements,

**And** these current measurements shall be sorted by date/time

**And** these current measurements shall be paged in pages of N size

#### User Interface prototype

will have a User Interface similar to

![](BloodOxygenSatList.svg)

<div style="clear: left"/>

Where:

* This will display the measurements recorded in the PGHD database (status of preliminary and final)
  * query based only on LOINC code of 59408-5 (unclear that adding both codes has any value)
  * `GET [base]/Observation?subject=[patient]&code=59408-5[&_count=1000][&date=...]`
  * may use `_count` to limit the count to the size of the output desired
  * may use `date` to limit the boundary of time of the output desired
* For each oxygen saturation value found in PGHD (for a **Given** page size)
* Display the date/time sorted data
  * Date
  * Time
  * Percentage Oxygen Saturation
* has-member other Observations related to this entry
  * When a Pulse/Heart-Rate is associated with the Oxygen Saturation measurement, it will be displayed.
  * When a Respiration-Rate is associated with the Oxygen Saturation measurement, it will be displayed.

#### possible additional columns

* VCM equivalent UI shows the "source", which I think is the application (e.g. Get Care, Mobile Kidney, MyHealtheVet)
* Unclear if others are populating any element that might identify the device used (samples given in May 2021 do not show anything else)

### Graph all measurements currently in PGHD

**Given** that there are measurement shown in table form

**When** the user requests to see a graphic view

**Then** MyHealtheVet will show the data time-plotted

**And** normal range of 90%-99% indicated for visual relationship

### Mark a specified entry as deleted

**Given** that the Oxygen Saturation measurements will often be automatically entered upon use of a Oxygen Saturation device

**When** the device is used by someone other than the Veteran a spurious measurement will be recorded into PGHD

**And** the Veteran desires to not have that incorrect/inaccurate value associated with their medical measurements in PGHD

**Then** MyHealtheVet will provide a way for the user to select an entry from the list of measurements displayed

**And** MyHealtheVet will use the PGHD DELETE verb to indicate to PGHD that the entry should be marked as deleted

Note, that PGHD does not fully delete entries that are marked as deleted, but does make them unavailable for normal queries so the result will be that the measurement will no longer be in the list in MyHealtheVet or Virtual Care Manager

### Add manually entered Oxygen Saturation measurement

**Given** that some Veterans will not have measurement devices that are capable of automatically recording, or unwilling to authorize the measurement device, or do not have technology sufficient to support automatical recording from an Oxygen Saturation measurement device

**When** the Veteran takes a measurement

**And** the Veteran desires to enter the measurement

**Then** the MyHealtheVet will provide a user interface that enables the manual entry of the Oxygen Saturation measurement

#### User Interface 

* Date/time, not to be a future 
* Date/time, not to be too far in the past
* Percentage of Oxygen Saturation to one decimal place (e.g. 95.2%)
* Normal ranges for Oxygen Saturation are 90%-99%, so outside this range should cause a User Interface challenge to the user to confirm the value entered.
* Percentage of Oxygen Saturation not to be greater than 100%
* Percentage of Oxygen Saturation not to be less than 50% value defined by clinical review 
* comment

## Heart-Rate Considerations

Note that the Veteran may have a pulse that is associated with the Oxygen Saturation entry. This may be optionally recorded as a related  [Heart Rate](StructureDefinition-VA.MHV.heartRate.html) Observation. Similar to the Blood-Pressure use of a related Heart-Rate measurement.

Note, when a [Heart Rate](StructureDefinition-VA.MHV.heartRate.html) associated with a Oxygen Saturation Measurement is deleted or updated; the relationship between the Oxygen Saturation Measurement and that Heart Rate must be confirmed or eliminated. 

## Respiration-Rate Considerations

Note that the Veteran may have a respiration rate that is associated with the Oxygen Saturation entry. This may be optionally recorded as a related  [Respiration Rate](StructureDefinition-VA.MHV.respirationRate.html) Observation. Similar to the Blood-Pressure use of a related Heart-Rate measurement.

Note, when a [Respiration Rate](StructureDefinition-VA.MHV.respirationRate.html) associated with a Oxygen Saturation Measurement is deleted or updated; the relationship between the Oxygen Saturation Measurement and that Respiration Rate must be confirmed or eliminated. 

## Edit is not proposed

Edit is not proposed as a User-Story as it presents too many concerns for revisions. The use-case need to change a measurement can be satisfied by deleting the current and adding a replacement with the proper values.



## Search PGHD

Because Blood Oxygen Saturation are recorded by various applications with either of two LOINC codes, MHV will query PGHD asking for Observations with either of the two codes. Because this is a logical "OR", then results will also include Observations with both codes. MHV further requests inclusion of other Observations linked by a hasMember relationship, which would be related heart rate at the time the blood pressure was taken.

The following is a example, hitting the test PGHD service, about a test patient. 
```
https://veteran.apps-staging.va.gov/smart-pgd-fhir/v2/Observation?patient.identifier=urn:uuid:2.16.840.1.113883.4.349|1012853550V207686&code=http://loinc.org|59408-5,http://loinc.org|2708-6&_include=Observation:has-member&_sort=-date&_count=100&_pretty=true&_format=json 
```
Breakdown of query parameters
- patient.identifier -- this takes the patient ICN, and the server will find appropriate entries for that patient
- code - searching for Observations with either of these codes (OR relationship)
  - [LOINC 59408-5](https://loinc.org/59408-5/) - Oxygen saturation in Arterial blood by Pulse oximetry
  - [LOINC 2708-6](https://loinc.org/2708-6/) - Oxygen saturation in Arterial blood
- _include -- also return anything that the Observation.hasMember points at
  - this should return any heart rate that is associated with the Blood Oxygen Saturation observations being returned
- _sort -- ask that the results be sorted by date
- _count -- ask that no more than 100 be returned in each page
- _pretty -- ask that the results be pretty printed (normal json has no unnecessary whitespace)
- _format -- ask for json encoding

Results will be limited to 100 Blood Oxygen Saturation Observations, which might be larger than 100 as there would be associated heart rate observations.

The next page is retrieved using the FHIR [paging](http://hl7.org/fhir/http.html#paging) mechanism.

The User Experience should NOT be aware of pages at the FHIR API level.


### Profile

