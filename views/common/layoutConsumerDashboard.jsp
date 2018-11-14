

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<meta name="theme-color" content="#f3b642"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/dashboard/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/jquery.dataTables.min.css">
    <link rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/responsive.dataTables.min.css">
               <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css">
    <link href="${pageContext.request.contextPath}/resources/dashboard/build/css/custom.css" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css">
     <link href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-confirm.js"></script>
     <script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script> --%>
    
      <script src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/jquery.dataTables.min.js"></script>
   
    <script src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/dataTables.responsive.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/plugins/select2/select2.js"></script>
     <script src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css">
  	 <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<%-- <link href="${pageContext.request.contextPath}/resources/dashboard/css/bootstrap.min.css" rel='stylesheet' type='text/css' /> --%>
<link href="${pageContext.request.contextPath}/resources/dashboard/css/dashboard.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dashboard/css/icon-font.min.css" type='text/css' />
<link href="${pageContext.request.contextPath}/resources/dashboard/css/animate.css" rel="stylesheet" type="text/css" media="all">
<link href='//fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/dashboard/css/headerStyle.css" rel="stylesheet" type="text/css">


<title><tiles:insertAttribute name="title" ignore="true" /></title>


</head>
<body class="nav-md">

			<div class="col-md-3">
			<tiles:insertAttribute name="leftbar"/> 
			</div>
			<div class="col-md-12">
				 <tiles:insertAttribute name="body"/>
				</div>
</body>
</html>