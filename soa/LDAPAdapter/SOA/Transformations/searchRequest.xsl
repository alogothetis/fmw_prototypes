<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://platform.integration.oracle/blocks/adapter/fw/metadata/Search" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://xmlns.antonislogothetis.com/LdapAdapter/Example/Schema" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 tns oraxsl"
                xmlns:ns1="http://xmlns.antonislogothetis.com/soa/LDAPAdapter/LdapHandler"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/ldap/soa/LDAPAdapter/Search"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/LdapHandler.wsdl"/>
            <oracle-xsl-mapper:rootElement name="findUserRequest" namespace="http://xmlns.antonislogothetis.com/LdapAdapter/Example/Schema"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/Search.wsdl"/>
            <oracle-xsl-mapper:rootElement name="searchRequest" namespace="http://platform.integration.oracle/blocks/adapter/fw/metadata/Search"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [THU MAR 15 11:42:28 EET 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:searchRequest>
         <baseDN>
            <xsl:value-of select="'ou=users, dc=myApp, dc=myCom'"/>
         </baseDN>
         <searchFilter>
            <xsl:value-of select="concat (&quot;(&amp;(objectClass=inetOrgPerson)(objectClass=organizationalPerson)(objectClass=person)(objectClass=top)(uid=&quot;, /ns0:findUserRequest/ns0:userId, &quot;))&quot; )"/>
         </searchFilter>
      </tns:searchRequest>
   </xsl:template>
</xsl:stylesheet>
