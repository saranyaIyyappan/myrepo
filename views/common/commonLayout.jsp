<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>

</head>
      		<tiles:insertAttribute name="header" />

      	<div class="container">
        <div class="col-md-3"><tiles:insertAttribute name="leftbar" /></div>
        <div class="col-md-offset-1 col-md-8 col-sm-offset-0 col-sm-12"><tiles:insertAttribute name="body"/></div>
        </div>
      		<div class="clear-fix"></div><br clear="all">
      		<div style="clear:both"><tiles:insertAttribute name="footer" /></div>
</html>
