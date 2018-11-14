<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Easy Admin Panel an Admin Panel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/resources/dashboard/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/dashboard/css/dashboard.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/dashboard/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dashboard/css/icon-font.min.css" type='text/css' />

</head> 
   
 <body class="sticky-header">
 <input type="hidden" id="app-context-path" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="app-session-out-time" value="${pageContext.session.maxInactiveInterval}"/>
    <section>
    <!-- left side start-->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
				<h1><a href="index.html">Easy <span>Admin</span></a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="index.html"><i class="lnr lnr-home"></i> </a>
			</div>

			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<!-- <ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="index.html"><i class="lnr lnr-power-switch"></i><span>Dashboard</span></a></li>
						<li class="menu-list">
							<a href="#"><i class="lnr lnr-cog"></i>
								<span>Components</span></a>
								<ul class="sub-menu-list">
									<li><a href="grids.html">Grids</a> </li>
									<li><a href="widgets.html">Widgets</a></li>
								</ul>
						</li>
					</ul> -->
				<!--sidebar nav end-->
			
			
				<!-- ----------------------------test------------- -->
				<ul class="nav nav-pills nav-stacked custom-nav">
				 <c:if test="${withOutSession==1}">
				<li><a href="${pageContext.request.contextPath}${home}"><i class="fa fa-home"></i> <span>Home</span></a></li> 
				<c:forEach items="${screenPermission}" var="menuMap">
					<c:if test="${menuMap.key != 'NoSubMenu'}">
						<li  class="menu-list"><a href="#"> 
										<span>${menuMap.key}</span>
										<i class="fa fa-angle-down pull-right"></i>					
						</a>
							<ul class="sub-menu-list">
								<c:forEach items="${menuMap.value}" var="subMenu">
									<li><a
										href="${pageContext.request.contextPath}${subMenu.url}"><i
											class="fa ${subMenu.cls}"></i> <span>${subMenu.screenName}</span></a>
									</li>
								</c:forEach>
							</ul></li>
					</c:if>
					<c:if test="${menuMap.key == 'NoSubMenu'}">
						<c:forEach items="${menuMap.value}" var="subMenu">
							<li><a
								href="${pageContext.request.contextPath}${subMenu.url}"><i
									class="fa ${subMenu.cls}"></i> <span>${subMenu.screenName}</span></a></li>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:if>
				</ul>
				
				<!-- -------------------test----------- -->
				
			</div>
		</div>
	
   </section>
  
   <script src="${pageContext.request.contextPath}/resources/dashboard/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/dashboard/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/dashboard/js/bootstrap.min.js"></script>
</body>
</html>