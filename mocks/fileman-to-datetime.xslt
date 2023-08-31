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
    <!-- presumes timezone of UTC (Z), which should actually be based on the Location -->
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:transform>