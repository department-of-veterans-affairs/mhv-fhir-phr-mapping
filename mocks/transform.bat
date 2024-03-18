REM java -jar c:\saxon\saxon-pe-11.5.jar -xsl:vitalsxslt.xslt -s:1013699421V762086_Vitals.xml -o:..\input\examples\vitals2.xml 
REM java -jar c:\saxon\saxon-pe-11.5.jar -xsl:vitalsxslt.xslt -s:vitals.xml -o:..\input\examples\vitals.xml 
REM java -jar c:\saxon\saxon-pe-11.5.jar -xsl:imagingxslt.xslt -s:radiology.xml -o:..\input\examples\images.xml 
REM java -jar c:\saxon\saxon-pe-11.5.jar -xsl:notes.xslt -s:notes3.xml -o:..\input\examples\notes3.xml 
REM java -jar c:\saxon\saxon-pe-11.5.jar -xsl:conditions.xslt -s:problems.xml -o:..\input\examples\problems.xml 
java -jar c:\saxon\saxon-pe-11.5.jar -xsl:conditions.xslt -s:problems2.xml -o:..\input\examples\problems2.xml 