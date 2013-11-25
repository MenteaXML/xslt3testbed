<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

<xsl:variable
    name="default-table-functions"
    as="map(xs:string, function(element()) as attribute()*)"
    select="map {
              'table' :=
                 function($c as element()) as attribute()*
                    {()}(:,
              'tbody :=
                 function($c as element(tbody)) as attribute()*
                    {()},
              'col :=
                 function($c as element(col)) as attribute()*
                    {(},
              'thead :=
                 function($c as element(thead)) as attribute()*
                    {()},
              'tfoot :=
                 function($c as element(tfoot)) as attribute()*
                    {()},
              'tbody :=
                 function($c as element(tbody)) as attribute()*
                    {()},
              'tr :=
                 function($c as element(tr)) as attribute()*
                    {()},
              'th :=
                 function($c as element(th)) as attribute()*
                    {()},
              'td :=
                 function($c as element(td)) as attribute()*
                    {()}:)
         }"/>

<xsl:template match="table">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table>
    <xsl:sequence select="$use-table-functions('table')(.)" />
    <xsl:apply-templates />
  </fo:table>
</xsl:template>

<xsl:template match="col">
  <fo:table-column>
    <xsl:apply-templates select="@*" />
  </fo:table-column>
</xsl:template>

<xsl:template match="thead">
  <fo:table-header>
    <xsl:apply-templates />
  </fo:table-header>
</xsl:template>

<xsl:template match="tfoot">
  <fo:table-footer>
    <xsl:apply-templates />
  </fo:table-footer>
</xsl:template>

<xsl:template match="tbody">
  <fo:table-body>
    <xsl:apply-templates />
  </fo:table-body>
</xsl:template>

<xsl:template match="th">
  <fo:table-cell>
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

<xsl:template match="td">
  <fo:table-cell>
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

</xsl:stylesheet>
