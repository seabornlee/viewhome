<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:variable name="start"><xsl:value-of select="//input[@name='start']/@value"/></xsl:variable>
	<xsl:variable name="count"><xsl:value-of select="//input[@name='count']/@value"/></xsl:variable>
	<xsl:variable name="total"><xsl:value-of select="//input[@name='total']/@value"/></xsl:variable>
	<xsl:variable name="currentPage"><xsl:value-of select="floor($start div $count)+1"/></xsl:variable>
	<xsl:variable name="totalPage"><xsl:value-of select="floor(($total - 1) div $count)+1"/></xsl:variable>
	<xsl:variable name="nextStart"><xsl:value-of select="($currentPage * $count) + 1"/></xsl:variable>
	<xsl:variable name="preStart"><xsl:value-of select="$nextStart - $count - $count"/></xsl:variable>

	<xsl:template match="/">
		<html>
			<head>							
				<link rel="stylesheet"  href="/cssjs/jquery.mobile-1.2.0.css" />
				
				<script src="/cssjs/jquery.js"></script>
				<script src="/cssjs/jquery.cookie.js"></script>
				
				<script src="/view/mobileBridge.js"></script>
				<script src="/cssjs/jquery.mobile-1.2.0.js"></script><script src="/view/js/cherry.js"></script>
			</head>
			<body>
				<div id="list" data-role="page" class="type-home">
					<div data-role="content" align="center">
						<ul data-role="listview" data-inset="true">
							<li data-role="list-divider"></li>
							<xsl:apply-templates select="//viewentry" />
							<xsl:if test="count(//viewentry)=0">
								<li><a>无内容</a></li>
							</xsl:if>
							<li data-role="list-divider"></li>
						</ul>
					</div><!-- /content -->
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="viewentry">
		<li href="">
			<a href="/view/digi/forms/DFMessage/dfmsg_{substring-before(substring-after(//url/text(), '_'), '.nsf')}.nsf/taskByDateDownDoneView/{@unid}?opendocument?login" data-icon="arrow-r" data-iconpos="right">
				<h3><xsl:value-of select="entrydata[2]/."/></h3>
				<p>
					时间:<font color="#0080FF"><xsl:value-of select="entrydata[1]/."/></font>
				</p>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>