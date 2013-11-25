<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:attribute-set name="inside-table" />
<xsl:attribute-set name="table" />
<xsl:attribute-set name="tbody" />
<xsl:attribute-set name="col" />
<xsl:attribute-set name="td" />
<xsl:attribute-set name="tfoot" />
<xsl:attribute-set name="th" />
<xsl:attribute-set name="thead" />
<xsl:attribute-set name="tr" />
<xsl:attribute-set name="tr" />

<xsl:attribute-set name="fo:table-and-caption" />
<xsl:attribute-set name="fo:table-column" />
<xsl:attribute-set name="fo:table-header" />
<xsl:attribute-set name="fo:table-footer" />
<xsl:attribute-set name="fo:table-body" />
<xsl:attribute-set name="fo:table-cell" />
<xsl:attribute-set name="fo:table" />

<xsl:template match="table">
  <xsl:param name="table-attributes"
             as="attribute()*"
             tunnel="yes" />

  <fo:table xsl:use-attribute-sets="table fo:table">
    <xsl:sequence select="$table-attributes" />
    <xsl:apply-templates />
  </fo:table>
</xsl:template>

<xsl:template match="col">
  <fo:table-column xsl:use-attribute-sets="col fo:table-column">
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
  <fo:table-header xsl:use-attribute-sets="thead fo:table-header">
    <xsl:apply-templates />
  </fo:table-header>
</xsl:template>

<xsl:template match="tfoot">
  <fo:table-footer xsl:use-attribute-sets="tfoot fo:table-footer">
    <xsl:apply-templates />
  </fo:table-footer>
</xsl:template>

<xsl:template match="tbody">
  <fo:table-body xsl:use-attribute-sets="tbody fo:table-body">
    <xsl:apply-templates />
  </fo:table-body>
</xsl:template>

<xsl:template match="th">
  <fo:table-cell xsl:use-attribute-sets="th fo:table-cell"
                 text-align="{(@align, 'from-table-column()')[1]}">
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

<xsl:template match="td">
  <fo:table-cell xsl:use-attribute-sets="td fo:table-cell"
                 text-align="{(@align, 'from-table-column()')[1]}">
    <fo:block>
      <xsl:apply-templates />
    </fo:block>
  </fo:table-cell>
</xsl:template>

</xsl:stylesheet>
