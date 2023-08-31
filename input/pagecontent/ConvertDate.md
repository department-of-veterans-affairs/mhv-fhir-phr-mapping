There appears to be different formats of timestamps. First is Fileman Date, HL7 date time, and ClinicalProcedureTO.timestamp

For MVP we will focus on "Best Effort" translation into a [FHIR DateTime](http://hl7.org/fhir/R4/datatypes.html#dateTime) datatype. The specific problem that we have is that often the data comes to us without a TimeZone, and FHIR requires that a timezone is given if a time is given. Within the source Vista it is understood what timezone would be used. Yet even a given timezone for a given Vista is not sufficient given that some Vista servers span timezones.

> st6aid is the medical center divisions. under one VAMC you can have multiple divisions. kind of one to many relationship. THE PROBLEM THAT we encounter (most of the times) is that not all st6aids live under the same TZ to which their parent facilities are living. e.g. Nashville TN is in Central but Knoxville, TN is in Eastern. but Knoxville falls under Nashville. Thats why st2aid's TZ info is so vital.

- We will convert to Date
- If we are given a timezone, then we will include the time and timezone
- If we can't determine the timezone, then will not include the time

Future might be different
- We do have algorithm in MHV that is used in Appointments, but it is not clear that this fully supports all the timestamps outside of the scope of Appointments. So this would need to be made more robust. Including that this does not yet support fileman format, or proper HL7 v2 format
- We could implement time conversion as a service. Concern would be on how performant that is.

### Fileman Date

Input: Fileman Date

Return: FHIR DateTime

Given that the Fileman date is slightly different than HL7. The conversion is simple. The most important part is that the first three digits are the number of years since 1700.

See [FileMan date](http://www.vistapedia.com/index.php/Date_formats)

Here is XSLT

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >
<xsl:template name="fileman-to-datetime">
  <xsl:param name="fileman-date" />
  
  <!-- only handles 3 digit year based on 1700 -->
  <xsl:variable name="year" select="format-number(number(substring($fileman-date, 1, 3)) + 1700, '0000')" />
  <xsl:variable name="month" select="substring($fileman-date, 4, 2)" />
  <xsl:variable name="day" select="substring($fileman-date, 6, 2)" />

  <xsl:choose>
    <xsl:when test="not(string-length($fileman-date) > 8)">
      <xsl:value-of select="concat($year, '-', $month, '-', $day)" />
    </xsl:when> 
    <xsl:otherwise>
      <xsl:variable name="time">
      <xsl:value-of select="format-number(number(substring($fileman-date, 9, 2)), '00')" />
      <xsl:choose>
        <xsl:when test="string-length($fileman-date) > 10">
          <xsl:text>:</xsl:text>
          <xsl:value-of select="format-number(number(substring($fileman-date, 11, 2)), '00')" />
          <xsl:choose>
            <xsl:when test="string-length($fileman-date) > 12">
              <xsl:text>:</xsl:text>
              <xsl:value-of select="format-number(number(substring($fileman-date, 13, 2)), '00')" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>:00</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>:00:00</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="concat($year, '-', $month, '-', $day, 'T', $time, 'Z')" />
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:transform>
```

### HL7 timestamp

Chem-Hem literal timestamps are following HL7 and do include a timezone offset.

```xml
         <reportCompleteDate>
            <literal>20201029132952-0500</literal>
         </reportCompleteDate>
```

### clinicalProcedureTO timestamp

This seems to be formatted starting with three character month:

```xml
 <timestamp>DEC 2,1998@10:01:13</timestamp>
```

### other formats

Experience with the production system there are many other date/time formats we must consider. Consider that this does not include the above formats

```
	private static final MHVDateFormat FORMATS[] = {
		new MHVDateFormat("yyyyMMddHHmmss",false),
		new MHVDateFormat("yyyyMMddHHmm",false),
		new MHVDateFormat("yyyyMMddHHmmssZ", false),
		new MHVDateFormat("yyyyMMddHHmmZ", false),
		new MHVDateFormat("yyyyMMdd", true),
		new MHVDateFormat("MM/dd/yyyy", true),
		new MHVDateFormat("M/d/yyyy", true),
		new MHVDateFormat("MMddyyyy", true),
		new MHVDateFormat("M-d-yyyy", true),
		new MHVDateFormat("yyyy-MM-dd", true),
		new MHVDateFormat("MMM d yyyy", true),
		new MHVDateFormat("d MMM yyyy", true),
		new MHVDateFormat("MMM d, yyyy", true),
		new MHVDateFormat("MMM d,yyyy", true),
		new MHVDateFormat("MMMMM d yyyy", true),
		new MHVDateFormat("d MMMMM yyyy", true),
		new MHVDateFormat("dd-MMM-yyyy", true),
		new MHVDateFormat("SyyMMdd.HHmmss", false),
		new MHVDateFormat("yyyyMMdd.HHmmss", false),
		new MHVDateFormat("SyyMMdd.kkmmss", false),
		new MHVDateFormat("MMM d,yyyy@HH:mm:ss", false),
		new MHVDateFormat("MMM d,yyyy@HH:mm:ss", false),//MAR 8,2005@15:09:02 (EKG)
		new MHVDateFormat("dd MMM yyyy @ HHmm", false)//21 Jun 2012 @ 1200
	};
```

### when no timezone

TODO: Likely when there is no timezone, it was local time for that Vista.

- should just drop the time, keeping only the date.
- presume eastern time.
- lookup in a table what timezone that vista lives in.
