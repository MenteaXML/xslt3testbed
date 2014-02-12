<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:x3tb="https://github.com/MenteaXML/xslt3testbed"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map x3tb xs">

<xsl:variable
    name="default-table-functions"
    as="map(xs:string, function(element()) as attribute()*)"
    select="map {
              'table' :=
                 function($c as element()) as attribute()*
                    {()},
              'tbody' :=
                 function($c as element()) as attribute()*
                    {()},
              'col' :=
                 function($c as element()) as attribute()*
                    {()},
              'thead' :=
                 function($c as element()) as attribute()*
                    {()},
              'tfoot' :=
                 function($c as element()) as attribute()*
                    {()},
              'tbody' :=
                 function($c as element()) as attribute()*
                    {()},
              'tr' :=
                 function($c as element()) as attribute()*
                    {()},
              'th' :=
                 function($c as element()) as attribute()*
                    {()},
              'td' :=
                 function($c as element()) as attribute()*
                    {()}
         }"/>
  
<xsl:function name="x3tb:attribute" as="attribute()*">
  <xsl:param name="name" as="xs:string" />
  <xsl:param name="value" as="xs:string" />
    
  <xsl:attribute name="{$name}" select="$value" />
</xsl:function>

<xsl:template match="table">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*)*)" />

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

<xsl:template match="@align">
  <xsl:attribute name="text-align" select="." />
</xsl:template>

<xsl:template match="@span[. eq '1']" />

<xsl:template match="@span">
  <xsl:attribute name="number-columns-repeated" select="." />
</xsl:template>

<xsl:template match="thead">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table-header>
    <xsl:sequence select="$use-table-functions('thead')(.)" />
    <xsl:apply-templates />
  </fo:table-header>
</xsl:template>

<xsl:template match="tfoot">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table-footer>
    <xsl:sequence select="$use-table-functions('tfoot')(.)" />
    <xsl:apply-templates />
  </fo:table-footer>
</xsl:template>

<xsl:template match="tbody">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table-body>
    <xsl:sequence select="$use-table-functions('tbody')(.)" />
    <xsl:apply-templates />
  </fo:table-body>
</xsl:template>

<xsl:template match="th">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table-cell text-align="{(@align, 'from-table-column()')[1]}">
    <xsl:sequence select="$use-table-functions('th')(.)" />
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

<xsl:template match="td">
  <xsl:param
      name="table-functions"
      as="map(xs:string, function(*))?"
      tunnel="yes" />

  <xsl:variable
      name="use-table-functions"
      select="map:new(($default-table-functions, $table-functions))"
      as="map(xs:string, function(*))" />

  <fo:table-cell text-align="{(@align, 'from-table-column()')[1]}">
    <xsl:sequence select="$use-table-functions('td')(.)" />
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

</xsl:stylesheet>
