<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:x3tb="https://github.com/MenteaXML/xslt3testbed"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="x3tb xs">

<xsl:import href="../../xsl/jats-xslfo.xsl" />

<xsl:function name="x3tb:blue-tbody" as="attribute()*">
  <xsl:param name="context" as="element()" />

  <xsl:attribute name="color" select="'blue'" />
</xsl:function>

<xsl:template match="tbody">
  <xsl:next-match>
    <xsl:with-param
        name="table-functions"
        as="map(xs:string, function(element()) as attribute()*)"
        select="map {
                  'tbody' := x3tb:blue-tbody#1
                }"
        tunnel="yes" />
  </xsl:next-match>
</xsl:template>

</xsl:stylesheet>
