<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:x3tb="https://github.com/MenteaXML/xslt3testbed"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="x3tb xs">

<!-- Rely on imports to import main stylesheet. -->
<xsl:import href="red-blue.xsl" />

<xsl:template match="table[@style eq 'orange']">
  <xsl:next-match>
    <xsl:with-param
        name="table-functions"
        as="map(xs:string, function(element()) as attribute()*)"
        select="map {
                  'table' := function($context as element()) as attribute()* {
                               x3tb:attribute('background-color', 'orange')
                             }
                }"
        tunnel="yes" />
  </xsl:next-match>
</xsl:template>

</xsl:stylesheet>
