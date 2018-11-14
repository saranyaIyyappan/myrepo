

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<meta name="theme-color" content="#f3b642"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- header -->
<!--//tags -->


 
  
<title><tiles:insertAttribute name="title" ignore="true" /></title> 
</head>
<body class="nav-md">

			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="body"/>
			<tiles:insertAttribute name="footer" />


	
</body>
</html>