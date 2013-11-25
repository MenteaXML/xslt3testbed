<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

<!-- Rely on imports to import main stylesheet. -->
<xsl:import href="red-blue.xsl" />

<xsl:template match="table[@style eq 'orange']">
  <xsl:next-match>
    <xsl:with-param
        name="table-attributes"
        as="attribute()*"
        tunnel="yes">
      <xsl:attribute name="background-color" select="'orange'" />
    </xsl:with-param>
  </xsl:next-match>
</xsl:template>

</xsl:stylesheet>
