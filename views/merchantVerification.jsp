<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Admin Dashboard" />
	<tiles:putAttribute name="body">
<!DOCTYPE HTML>
<html>
<head>
<title>Easy Admin Panel an Admin Panel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
</head> 
   
 <body class="sticky-header left-side-collapsed">
		<div class="main-content">
			<div class="header-section">
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<div class="menu-right">
            <div class="col-md-2 logo_agile">
			<a  href="index.html"><img src="${pageContext.request.contextPath}/resources/dashboard/images/LOGO.png"width="180px" height="60px"></a>
			</div>
            <div class="col-md-7">
    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class="active menu__item menu__item--current"><a class="menu__link" href="index.html">Merchant<span class="sr-only">(current)</span></a></li>
					<li class=" menu__item"><a class="menu__link" href="about.html"> Wallet Balance</a></li>
                    <li class=" menu__item"><a class="menu__link" href="about.html">Categories</a></li>
                      <li class=" menu__item"><a class="menu__link" href="about.html">Most popular</a></li>
				  </ul>
				</div>
</div>
				<div class="user-panel-top">  	
					<div class="profile_details">		
						<ul>
							<li class="dropdown profile_details_drop">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<div class="profile_img">	
										<span style="background:url(images/1.jpg) no-repeat center"> </span> 
										 <div class="user-name">
											<p>${loggedUser}<span>Consumer</span></p>
										 </div>
										 <i class="lnr lnr-chevron-down"></i>
										 <i class="lnr lnr-chevron-up"></i>
										<div class="clearfix"></div>	
									</div>	
								</a>
								<ul class="dropdown-menu drp-mnu">
									<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
									<li> <a href="#"><i class="fa fa-user"></i>Profile</a> </li> 
									<li> <a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-sign-out"></i> Logout</a> </li>
								</ul>
							</li>
							<div class="clearfix"> </div>
						</ul>
					</div>	
				</div>
			  </div>
			</div>
       
       
        <!--body wrapper start-->
        <div>
         <div class="right_col" role="main">
			<div class="row row-1" style="padding-top: 50px">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="row row-1" style="padding-top: 50px">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Merchant List</i></h3>
							<div class="col-md-12" style="padding-top: 20px" id="no-more-tables">
								<table id="merchant-list-datatable-id"
									class="col-md-12 table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<!-- <th>Card Category</th> -->
											<th>Merchant Name English</th>
											<th>Email Id</th>
											<th>Contact Name</th>
										</tr>
									</thead>

								</table>
							</div>
						</div>
					</div>

					<div class="pull-right grid-tools"
						style="padding-top: 30px; margin-right: 35px;padding-right: 100px;">
						<input type="hidden" name="merchantId" id="merchant_id">
						<button type="button" class="btn btn-success btn-sm"
							id="id-btn-merchant-verify" >
							<i class="fa fa-check"></i>
							Verify
						</button>

					</div>

				</div>
				</div>

				

			</div>
		</div>
		</div>
   
    <!--footer section start-->
			<footer>
			   <p>&copy 2015 Easy Admin Panel. All Rights Reserved | Design by <a href="" target="_blank"></a></p>
			</footer>
        <!--footer section end-->
        
<script src="${pageContext.request.contextPath}/resources/dashboard/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/merchantVerification.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/dashboard/js/scripts.js"></script> --%>
</body>
</html>
		</tiles:putAttribute>
</tiles:insertDefinition>