<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile USCoreDocumentReferenceProfile
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:DocumentReference</sch:title>
    <sch:rule context="f:DocumentReference">
      <sch:assert test="count(f:masterIdentifier) &lt;= 0">masterIdentifier: maximum cardinality of 'masterIdentifier' is 0</sch:assert>
      <sch:assert test="count(f:docStatus) &lt;= 0">docStatus: maximum cardinality of 'docStatus' is 0</sch:assert>
      <sch:assert test="count(f:relatesTo) &lt;= 0">relatesTo: maximum cardinality of 'relatesTo' is 0</sch:assert>
      <sch:assert test="count(f:securityLabel) &lt;= 0">securityLabel: maximum cardinality of 'securityLabel' is 0</sch:assert>
      <sch:assert test="count(f:content) &lt;= 1">content: maximum cardinality of 'content' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:DocumentReference/f:content</sch:title>
    <sch:rule context="f:DocumentReference/f:content">
      <sch:assert test="count(f:format) &lt;= 0">format: maximum cardinality of 'format' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:DocumentReference/f:content/f:attachment</sch:title>
    <sch:rule context="f:DocumentReference/f:content/f:attachment">
      <sch:assert test="count(f:language) &lt;= 0">language: maximum cardinality of 'language' is 0</sch:assert>
      <sch:assert test="count(f:url) &lt;= 0">url: maximum cardinality of 'url' is 0</sch:assert>
      <sch:assert test="count(f:size) &lt;= 0">size: maximum cardinality of 'size' is 0</sch:assert>
      <sch:assert test="count(f:hash) &lt;= 0">hash: maximum cardinality of 'hash' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:DocumentReference/f:context</sch:title>
    <sch:rule context="f:DocumentReference/f:context">
      <sch:assert test="count(f:event) &lt;= 0">event: maximum cardinality of 'event' is 0</sch:assert>
      <sch:assert test="count(f:facilityType) &lt;= 0">facilityType: maximum cardinality of 'facilityType' is 0</sch:assert>
      <sch:assert test="count(f:practiceSetting) &lt;= 0">practiceSetting: maximum cardinality of 'practiceSetting' is 0</sch:assert>
      <sch:assert test="count(f:sourcePatientInfo) &lt;= 0">sourcePatientInfo: maximum cardinality of 'sourcePatientInfo' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
