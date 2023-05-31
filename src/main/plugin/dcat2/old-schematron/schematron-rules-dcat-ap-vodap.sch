<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--

Schematron validation for DCAT-AP-VL - Flemish Government.

This script was written by GIM.

Source:
- DCAT-AP v1.1: https://joinup.ec.europa.eu/release/dcat-ap-v11
- Vlaamse Open Data Handleiding: https://overheid.vlaanderen.be/open-data-handleiding (bijlage 3)

-->
  <sch:title xmlns="http://www.w3.org/2001/XMLSchema">{$loc/strings/schematron.title}</sch:title>
  <sch:ns prefix="spdx" uri="http://spdx.org/rdf/terms#"/>
  <sch:ns prefix="owl" uri="http://www.w3.org/2002/07/owl#"/>
  <sch:ns prefix="adms" uri="http://www.w3.org/ns/adms#"/>
  <sch:ns prefix="locn" uri="http://www.w3.org/ns/locn#"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
  <sch:ns prefix="foaf" uri="http://xmlns.com/foaf/0.1/"/>
  <sch:ns prefix="dct" uri="http://purl.org/dc/terms/"/>
  <sch:ns prefix="vcard" uri="http://www.w3.org/2006/vcard/ns#"/>
  <sch:ns prefix="dcat" uri="http://www.w3.org/ns/dcat#"/>
  <sch:ns prefix="schema" uri="http://schema.org/"/>
  <sch:ns prefix="rdf" uri="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>
  <sch:ns prefix="skos" uri="http://www.w3.org/2004/02/skos/core#"/>
  <sch:ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
  <sch:ns prefix="gco" uri="undefined"/>
  <sch:ns prefix="dc" uri="http://purl.org/dc/elements/1.1/"/>
  <sch:ns prefix="geonet" uri="http://www.fao.org/geonetwork"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

  <sch:let name="isCorrectProfile" value="boolean(/*[starts-with(//dcat:CatalogRecord//dct:Standard/@rdf:about, 'https://data.vlaanderen.be/doc/applicatieprofiel/DCAT-AP-VL')])"/>

  <sch:pattern>
    <sch:title>41. dcat:contactPoint is a required property for Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noContactPoint" value="not(dcat:contactPoint)"/>
      <sch:assert test="$noContactPoint = false()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dcat:contactPoint.
      </sch:assert>
      <sch:report test="$noContactPoint = false()">The dcat:Dataset "<sch:value-of select="$id"/>" has a dcat:contactPoint "<sch:value-of select="dcat:contactPoint/*/@rdf:about/string()"/>".
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>44. dcat:distribution is a required property for Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="missingProperty" value="not(dcat:distribution )"/>
      <sch:assert test="$missingProperty = false()">WARNING: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dcat:distribution.
      </sch:assert>
      <sch:report test="$missingProperty = false()">The dcat:Dataset "<sch:value-of select="$id"/>" has a dcat:distribution with id  "<sch:value-of select="dcat:distribution/*/@rdf:about/string()"/>".</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>49. dct:publisher is a required property for Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noPublisher" value="not(dct:publisher)"/>
      <sch:assert test="$noPublisher = false()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dct:publisher.
      </sch:assert>
      <sch:assert test="$noPublisher = false()">The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:publisher.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>49. dct:publisher has maximum cardinality of 1 for Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="count" value="count(dct:publisher)"/>
      <sch:assert test="2 > $count">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" has more than one dct:publisher property.
      </sch:assert>
      <sch:report test="2 > $count">The dcat:Dataset "<sch:value-of select="$id"/>" has no more than one dct:publisher property.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>86. dct:license is a required property for Distribution.</sch:title>
    <sch:rule context="//dcat:Distribution[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noLicense" value="not(dct:license)"/>
      <sch:assert test="$noLicense = false()">ERROR: The dcat:Distribution "<sch:value-of select="$id"/>" does not have a dct:license.
      </sch:assert>
      <sch:report test="$noLicense = false()">The dcat:Distribution "<sch:value-of select="$id"/>" has a dct:license.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>86. dct:license has maximum cardinality of 1 for Distribution.</sch:title>
    <sch:rule context="//dcat:Distribution[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="countLicense" value="count(dct:license)"/>
      <sch:assert test="2 > $countLicense">ERROR: The dcat:Distribution "<sch:value-of select="$id"/>" has more than one dct:license property.
      </sch:assert>
      <sch:report test="2 > $countLicense">The dcat:Distribution "<sch:value-of select="$id"/>" has no more than one dct:license property.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>166. dct:LicenseDocument does not exist.</sch:title>
    <sch:rule context="/*[$isCorrectProfile]">
      <sch:let name="noCatalog" value="not(//dct:LicenseDocument)"/>
      <sch:assert test="$noCatalog = false()">ERROR: The mandatory class dct:LicenseDocument does not exist.
      </sch:assert>
      <sch:report test="$noCatalog = false()">The mandatory class dct:LicenseDocument exists.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>200. Mandatory dct:title for a dcat:Distribution</sch:title>
    <sch:rule context="//dcat:Distribution[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noTitle" value="not(dct:title)"/>
      <sch:assert test="$noTitle = false()">ERROR: The dcat:Distribution "<sch:value-of select="$id"/>" does not have a dct:title property.
      </sch:assert>
      <sch:report test="$noTitle = false()">The dcat:Distribution "<sch:value-of select="$id"/>" has a dct:title property with value  "<sch:value-of select="dct:title"/>".
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>201. dct:license is a required property for Catalog</sch:title>
    <sch:rule context="//dcat:Catalog[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noTitle" value="not(dct:license)"/>
      <sch:assert test="$noTitle = false()">ERROR: The dcat:Catalog "<sch:value-of select="$id"/>" does not have a dct:license property.
      </sch:assert>
      <sch:report test="$noTitle = false()">The dcat:Catalog "<sch:value-of select="$id"/>" has a dct:license property.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>202. dct:license is CC0</sch:title>
    <sch:rule context="//dcat:Catalog/dct:license[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="cc0" value="./@rdf:resource = 'https://data.vlaanderen.be/id/licentie/creative-commons-zero-verklaring/v1.0' or ./dct:LicenseDocument/@rdf:about = 'https://data.vlaanderen.be/id/licentie/creative-commons-zero-verklaring/v1.0'"/>
      <sch:assert test="$cc0 = true()">ERROR: The dcat:Catalog "<sch:value-of select="$id"/>" does not have a dct:license property with value 'https://data.vlaanderen.be/id/licentie/creative-commons-zero-verklaring/v1.0'.
      </sch:assert>
      <sch:report test="$cc0 = true()">The dcat:Catalog "<sch:value-of select="$id"/>" has a dct:license property with value 'https://data.vlaanderen.be/id/licentie/creative-commons-zero-verklaring/v1.0'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>203. dct:accessRights must be _:public</sch:title>
    <sch:rule context="//dcat:Dataset/dct:accessRights[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="public" value="*/@rdf:about = 'http://publications.europa.eu/resource/authority/access-right/PUBLIC' or ./@rdf:resource = 'http://publications.europa.eu/resource/authority/access-right/PUBLIC'"/>
      <sch:assert test="$public = true()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dct:accessRights property with value 'http://publications.europa.eu/resource/authority/access-right/PUBLIC'.
      </sch:assert>
      <sch:report test="$public = true()">The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:accessRights property with value 'http://publications.europa.eu/resource/authority/access-right/PUBLIC'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>204. dct:accessRights is required for dcat:Dataset</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="noTitle" value="not(dct:accessRights)"/>
      <sch:assert test="$noTitle = false()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dct:accessRights property.
      </sch:assert>
      <sch:report test="$noTitle = false()">The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:accessRights property.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>205. dct:title should have a language tag for dcat:Distribution</sch:title>
    <sch:rule context="//dcat:Distribution/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The dcat:Distribution '<sch:value-of select="$id"/>' does not have a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The dcat:Distribution '<sch:value-of select="$id"/>' has  a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>206. dct:title should have a language tag for dcat:Dataset</sch:title>
    <sch:rule context="//dcat:Dataset/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The dcat:Dataset '<sch:value-of select="$id"/>' does not have a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The dcat:Dataset '<sch:value-of select="$id"/>' has  a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>207. dct:description should have a language tag for dcat:Dataset</sch:title>
    <sch:rule context="//dcat:Dataset/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The dcat:Dataset '<sch:value-of select="$id"/>' does not have a language tag for its dct:description '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The dcat:Dataset '<sch:value-of select="$id"/>' has  a language tag for its dct:description '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>208. dct:description should have a language tag for dcat:Catalog</sch:title>
    <sch:rule context="//dcat:Catalog/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The dcat:Catalog '<sch:value-of select="$id"/>' does not have a language tag for its dct:description '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The dcat:Catalog '<sch:value-of select="$id"/>' has  a language tag for its dct:description '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>209. dct:title should have a language tag for dcat:Catalog</sch:title>
    <sch:rule context="//dcat:Catalog/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The dcat:Catalog '<sch:value-of select="$id"/>' does not have a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The dcat:Catalog '<sch:value-of select="$id"/>' has  a language tag for its dct:title '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>210. dct:title should have just one value per language tag for dcat:Catalog</sch:title>
    <sch:rule context="//dcat:Catalog/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:title[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:title (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Catalog ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>211. foaf:name should have a language tag for foaf:Agent</sch:title>
    <sch:rule context="//foaf:Agent/foaf:name[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="noTag" value="not(./@xml:lang)"/>
      <sch:assert test="$noTag = false()">ERROR: The foaf:Agent '<sch:value-of select="$id"/>' does not have a language tag for its foaf:name '<sch:value-of select="./string()"/>'.
      </sch:assert>
      <sch:report test="$noTag = false()">The foaf:Agent '<sch:value-of select="$id"/>' has a language tag for its foaf:name '<sch:value-of select="./string()"/>'.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>212. foaf:name should have a single value per language tag for foaf:Agent</sch:title>
    <sch:rule context="//foaf:Agent/foaf:name[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/foaf:name[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The foaf:name (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for foaf:Agent ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>213. dct:description should have a single value per language tag for dcat:Catalog</sch:title>
    <sch:rule context="//dcat:Catalog/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:description[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:description (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Catalog ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>214. dct:title should have a single value per language tag for dcat:Dataset</sch:title>
    <sch:rule context="//dcat:Dataset/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:title[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:title (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Dataset ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>215. dct:description should have a single value per language tag for dcat:Dataset</sch:title>
    <sch:rule context="//dcat:Dataset/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:description[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:description (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Dataset ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>216. dct:title should have a single value per language tag for dcat:Distribution</sch:title>
    <sch:rule context="//dcat:Distribution/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:title[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:title (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Distribution ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>217. dct:description should have a single value per language tag for dcat:Distribution</sch:title>
    <sch:rule context="//dcat:Distribution/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:description[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:description (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dcat:Distribution ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>218. dct:title should have a single value per language tag for dct:LicenseDocument</sch:title>
    <sch:rule context="//dct:LicenseDocument/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:title[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:title (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dct:LicenseDocument ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>219. dct:description should have a single value per language tag for dct:LicenseDocument</sch:title>
    <sch:rule context="//dct:LicenseDocument/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="lang" value="@xml:lang/string()"/>
      <sch:let name="count" value="count(parent::node()/dct:description[@xml:lang = $lang])"/>
      <sch:let name="messagePart1" value="concat('The dct:description (', ., ')')"/>
      <sch:let name="messagePart2" value="concat(' one value per language tag ',$lang,' for dct:LicenseDocument ',$id)"/>
      <sch:assert test="2 > $count"><sch:value-of select="$messagePart1"/> has more than <sch:value-of select="$messagePart2"/>.</sch:assert>
      <sch:report test="2 > $count"><sch:value-of select="$messagePart1"/> has just <sch:value-of select="$messagePart2"/>.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>230. dct:title should be a non-empty string for dcat:Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="emptyString" value="normalize-space(.)=''"/>
      <sch:assert test="$emptyString = false()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:title that is an empty string.
      </sch:assert>
      <sch:report test="$emptyString = false()">The dcat:Dataset '<sch:value-of select="$id"/>' has a dct:title '<sch:value-of select="./string()"/>' which is a non-empty string.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>231. dct:title should be a non-empty string for dcat:Catalog.</sch:title>
    <sch:rule context="//dcat:Catalog/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="emptyString" value="normalize-space(.)=''"/>
      <sch:assert test="$emptyString = false()">ERROR: The dcat:Catalog "<sch:value-of select="$id"/>" has a dct:title that is an empty string.
      </sch:assert>
      <sch:report test="$emptyString = false()">The dcat:Catalog '<sch:value-of select="$id"/>' has a dct:title '<sch:value-of select="./string()"/>' which is a non-empty string.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>232. dct:title should be a non-empty string for dcat:Distribution.</sch:title>
    <sch:rule context="//dcat:Distribution/dct:title[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="emptyString" value="normalize-space(.)=''"/>
      <sch:assert test="$emptyString = false()">ERROR: The dcat:Distribution "<sch:value-of select="$id"/>" has a dct:title that is an empty string.
      </sch:assert>
      <sch:report test="$emptyString = false()">The dcat:Distribution '<sch:value-of select="$id"/>' has a dct:title '<sch:value-of select="./string()"/>' which is a non-empty string.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>220. dcat:accessURL has maximum cardinality of 1 for Distribution.</sch:title>
    <sch:rule context="//dcat:Distribution[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="count" value="count(dcat:accessURL)"/>
      <sch:assert test="2 > $count">ERROR: The dcat:Distribution "<sch:value-of select="$id"/>" has more than one dcat:accessURL property.
      </sch:assert>
      <sch:report test="2 > $count">The dcat:Distribution "<sch:value-of select="$id"/>" has no more than one dcat:accessURL property.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>233. dct:description should be a non-empty string for Catalog.</sch:title>
    <sch:rule context="//dcat:Catalog/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="emptyString" value="normalize-space(.)=''"/>
      <sch:assert test="$emptyString = false()">ERROR: The dcat:Catalog "<sch:value-of select="$id"/>" has a dct:description that is an empty string.
      </sch:assert>
      <sch:report test="$emptyString = false()">The dcat:Catalog '<sch:value-of select="$id"/>' has a dct:description '<sch:value-of select="./string()"/>' which is a non-empty string.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>234. dct:description should be a non-empty string for Dataset.</sch:title>
    <sch:rule context="//dcat:Dataset/dct:description[$isCorrectProfile]">
      <sch:let name="id" value="parent::node()/@rdf:about/string()"/>
      <sch:let name="emptyString" value="normalize-space(.)=''"/>
      <sch:assert test="$emptyString = false()">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:description that is an empty string.
      </sch:assert>
      <sch:report test="$emptyString = false()">The dcat:Dataset '<sch:value-of select="$id"/>' has a dct:description '<sch:value-of select="./string()"/>' which is a non-empty string.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>At least one theme from the data.gov.be vocabulary is required</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]|//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="dataThemes" value="count(dcat:theme[starts-with(skos:Concept/@rdf:about, 'http://vocab.belgif.be/auth/datatheme')])"/>
      <sch:assert test="$dataThemes > 0">ERROR: The <sch:value-of select="name()"/> "<sch:value-of select="$id"/>" doesn't have a data.gov.be theme</sch:assert>
      <sch:report test="$dataThemes > 0">The <sch:value-of select="name()"/> "<sch:value-of select="$id"/>" have a data.gov.be theme</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>At least one keyword is required.</sch:title>
    <sch:rule context="//dcat:Dataset[$isCorrectProfile]|//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasKeyword" value="count(dcat:keyword[normalize-space(.) != '']) > 0"/>
      <sch:assert test="$hasKeyword">ERROR: The <sch:value-of select="name()"/> "<sch:value-of select="$id"/>" doesn't have any keyword.</sch:assert>
      <sch:report test="$hasKeyword">The <sch:value-of select="name()"/> "<sch:value-of select="$id"/>" have at least one keyword.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>At least one of vcard:hasEmail or vcard:hasURL is a required for a contactpoint.</sch:title>
    <sch:rule context="//dcat:contactPoint[$isCorrectProfile]">
      <sch:let name="id" value="*/@rdf:about/string()"/>
      <sch:let name="hasEmail" value="*/vcard:hasEmail"/>
      <sch:let name="hasUrl" value="*/vcard:hasURL"/>
      <sch:assert test="$hasEmail or $hasUrl">ERROR: The vcard:Organization with URI "<sch:value-of select="$id"/>" does not have a vcard:hasEmail or a vcard:hasURL property.
      </sch:assert>
      <sch:report test="$hasEmail or $hasUrl">The vcard:Organization with URI "<sch:value-of select="$id"/>" has a vcard:hasEmail or a vcard:hasURL property.
      </sch:report>
    </sch:rule>
  </sch:pattern>

  <!-- dcat:DataService -->
  <sch:pattern>
    <sch:title>dcat:endpointURL is required for dcat:DataService</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasEndpointUrl" value="count(dcat:endpointURL[normalize-space(@rdf:resource) != '']) > 0"/>
      <sch:assert test="$hasEndpointUrl">ERROR: The dcat:DataService "<sch:value-of select="$id"/>" doesn't have a dcat:endpointURL.</sch:assert>
      <sch:report test="$hasEndpointUrl">The dcat:DataService "<sch:value-of select="$id"/>" have a dcat:endpointURL.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>dcat:endpointDescription is required for dcat:DataService</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasEndpointDescription" value="count(dcat:endpointDescription[normalize-space(@rdf:resource) != '']) > 0"/>
      <sch:assert test="$hasEndpointDescription">ERROR: The dcat:DataService "<sch:value-of select="$id"/>" doesn't have a dcat:endpointDescription.</sch:assert>
      <sch:report test="$hasEndpointDescription">The dcat:DataService "<sch:value-of select="$id"/>" have a dcat:endpointDescription.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>dct:accessRights is required for dcat:DataService</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasAccessRights" value="count(dct:accessRights) > 0 and (normalize-space(dct:accessRights/skos:Concept/@rdf:about) != '' or count(dct:accessRights/dct:RightsStatement) > 0)"/>
      <sch:assert test="$hasAccessRights = true()">ERROR: The dcat:DataService "<sch:value-of select="$id"/>" does not have a dct:accessRights property.</sch:assert>
      <sch:report test="$hasAccessRights = true()">The dcat:DataService "<sch:value-of select="$id"/>" has a dct:accessRights property.</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>dct:license is required for dcat:DataService</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="license" value="dct:license/dct:LicenseDocument|dct:license/@rdf:resource"/>
      <sch:assert test="$license">ERROR: The dcat:DataService "<sch:value-of select="$id"/>" doesn't have a dct:license</sch:assert>
      <sch:report test="$license">The dcat:DataService "<sch:value-of select="$id"/>" have a dct:license</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>dcat:contactPoint is a required property for dcat:DataService.</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasContactPoint" value="count(dcat:contactPoint) > 0"/>
      <sch:assert test="$hasContactPoint">ERROR: The dcat:DataService "<sch:value-of select="$id"/>" does not have a dcat:contactPoint.</sch:assert>
      <sch:report test="$hasContactPoint">The dcat:DataService "<sch:value-of select="$id"/>" has a dcat:contactPoint "<sch:value-of select="dcat:contactPoint/*/@rdf:about/string()"/>".</sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>dct:publisher is a required property for dcat:DataService.</sch:title>
    <sch:rule context="//dcat:DataService[$isCorrectProfile]">
      <sch:let name="id" value="@rdf:about/string()"/>
      <sch:let name="hasPublisher" value="count(dct:publisher) > 0"/>
      <sch:assert test="$hasPublisher">ERROR: The dcat:Dataset "<sch:value-of select="$id"/>" does not have a dct:publisher.</sch:assert>
      <sch:assert test="$hasPublisher">The dcat:Dataset "<sch:value-of select="$id"/>" has a dct:publisher.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
