<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gn-fn-dcat2="http://geonetwork-opensource.org/xsl/functions/profiles/dcat2"
                exclude-result-prefixes="#all">

  <!-- Function to get the inScheme URI based on the thesaurus key -->
  <xsl:function name="gn-fn-dcat2:getInSchemeURIByThesaurusId" as="xs:string">
    <xsl:param name="key"/>
    <xsl:variable name="inSchemeAuthorityBaseUrl" select="'http://publications.europa.eu/resource/authority/'"/>
    <xsl:variable name="inSchemeAuthBaseUrl" select="'http://vocab.belgif.be/auth/'"/>
    <xsl:variable name="inSchemeAdmsBaseUrl" select="'http://purl.org/adms/'"/>
    <xsl:variable name="inSchemeMdcatBaseUrl" select="'https://data.vlaanderen.be/id/conceptscheme/'"/>
    <xsl:variable name="inSchemeIanaBaseUrl" select="'https://www.iana.org/assignments/'"/>
    <xsl:variable name="inSchemeVLBaseUrl" select="'https://metadata.vlaanderen.be/id/'"/>
    <xsl:variable name="keyPrefix" select="'external.theme.'"/>
    <xsl:choose>
      <xsl:when test="$key = concat($keyPrefix,'publisher-type')">
        <xsl:value-of select="concat($inSchemeAdmsBaseUrl,'publishertype/1.0')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'datatheme')">
        <xsl:value-of select="concat($inSchemeAuthBaseUrl,'datatheme')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'frequency')">
        <xsl:value-of select="concat($inSchemeAuthorityBaseUrl,'frequency')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'language')">
        <xsl:value-of select="concat($inSchemeAuthorityBaseUrl,'language')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'resource-type')">
        <xsl:value-of select="concat($inSchemeAuthorityBaseUrl,'resource-type')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'file-type')">
        <xsl:value-of select="concat($inSchemeAuthorityBaseUrl,'file-type')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'media-types')">
        <xsl:value-of select="concat($inSchemeIanaBaseUrl,'media-types')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'status')">
        <xsl:value-of select="concat($inSchemeAdmsBaseUrl,'status/1.0')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix,'licence-type')">
        <xsl:value-of select="concat($inSchemeAdmsBaseUrl,'licencetype/1.0')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'access-right') or $key = concat($keyPrefix, 'access-right-service')">
        <xsl:value-of select="concat($inSchemeAuthorityBaseUrl,'access-right')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'levensfase')">
        <xsl:value-of select="concat($inSchemeMdcatBaseUrl,'levensfase')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'ontwikkelingstoestand')">
        <xsl:value-of select="concat($inSchemeMdcatBaseUrl,'ontwikkelingstoestand')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'GDI-Vlaanderen-trefwoorden')">
        <xsl:value-of select="concat($inSchemeVLBaseUrl,'GDI-Vlaanderen-Trefwoorden')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'magda-domain')">
        <xsl:value-of select="concat($inSchemeMdcatBaseUrl,'MAGDA-categorie')"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'inspire-theme')">
        <xsl:value-of select="'http://inspire.ec.europa.eu/theme'"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'gemet')">
        <xsl:value-of select="'http://www.eionet.europa.eu/gemet'"/>
      </xsl:when>
      <xsl:when test="$key = concat($keyPrefix, 'topic-category')">
        <xsl:value-of select="'http://inspire.ec.europa.eu/metadata-codelist/TopicCategory'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message select="concat('Thesaurus NIET gevonden met key = ',$key, '. Voeg deze toe in process-utility.xsl bestand.')"/>
        <xsl:value-of select="$key"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

</xsl:stylesheet>
