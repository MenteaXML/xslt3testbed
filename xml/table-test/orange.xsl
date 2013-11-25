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

<xsl:function name="x3tb:orange-table" as="attribute()*">
  <xsl:param name="context" as="element()" />

  <xsl:attribute name="background-color" select="'orange'" />
</xsl:function>

<xsl:template match="table[@style eq 'orange']">
  <xsl:next-match>
    <xsl:with-param
        name="table-functions"
        as="map(xs:string, function(element()) as attribute()*)"
        select="map {
                  'table' := x3tb:orange-table#1
                }"
        tunnel="yes" />
  </xsl:next-match>
</xsl:template>

</xsl:stylesheet>
