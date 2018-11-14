<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Wallet</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Elite Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

		//
		
		
		//
</script>
<!--//tags -->
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/scrolling-nav.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/easy-responsive-tabs.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css">
<!-- //for bootstrap working -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/responsive.dataTables.min.css">
<style>
.dd-select {
	width: 30px;
}

.dd-selected-image {
	width: 30px;
	height: 30px;
}

.dd-option-image {
	width: 30px;
	height: 30px;
}

.dd-selected-text {
	height: 2px;
	/*width: 100px;*/
}
</style>
</head>

<body>
	<input type="hidden" id="app-context-path"
		value="${pageContext.request.contextPath}" />
	<input type="hidden" id="app-session-out-time"
		value="${pageContext.session.maxInactiveInterval}" />

	<!-- header main start -->
	<div class="container-fluid topbg">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-6 topph">
					<i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898 <span
						class="left"><i class="fa fa-envelope-o" aria-hidden="true"></i>
						<a href="mailto:info@example.com">info@example.com</a></span>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="right">
						<a class="fifty" href="#"><img
							src="${pageContext.request.contextPath}/resources/img/eng_1.png"
							width="15px" height="15px"> English</a> <a class="fifty"
							href="#"><img
							src="${pageContext.request.contextPath}/resources/img/arab_flag.png"
							width="18px" height="15px"> Arabic</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header main end -->

	<div class="">
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/GiftCard/user/home"><img
						src="/GiftCard/resources/giftCardHome/images/ANB LOGO.png"
						width="140px" height="60px"></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">


					<ul class="nav navbar-nav navbar-right">

						<li class=""><a class=""
							href="${pageContext.request.contextPath}/consumerCardBalanace/cardBalance">View
								Balance<span class="sr-only">(current)</span>
						</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Categories <span
								class="fa fa-caret-down"></span>
						</a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="agile_inner_drop_nav_info">
									<div class="col-sm-5 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">By Type</h4>
										<ul class="multi-column-dropdown" id="id_ul_group_category">

										</ul>
									</div>
									<div class="col-sm-6 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">Occassions</h4>
										<ul class="multi-column-dropdown"
											id="id_ul_occassions_category">

										</ul>
									</div>

									<div class="clearfix"></div>
								</div>
							</ul></li>
						<li class=" "><a class="nav-link js-scroll-trigger"
							href="#id_div_card_view_section">Most popular</a></li>
						<li class=""><a class="nav-link js-scroll-trigger"
							href="#id_div_card_view_section">Buy Wallet</a></li>

						<li class="dropdown"><a class="loginDropDown" href="#"
							id="id_btn_login_dropdown">Login <i id="id_icon_anchor_tag"></i>
						</a>
							<ul id="id_ul_for_consumer"
								class="dropdown-menu multi-column mystyle">
								<div class="col-sm-12">
									<ul class="multi-column-dropdown">
										<li><a
											href="${pageContext.request.contextPath}/consumer/consumerDashboardScreen">My
												Accounts</a></li>
										<li><a
											href="${pageContext.request.contextPath}/myCards/myCards">My
												Wallets</a></li>
										<li><a
											href="${pageContext.request.contextPath}/user/logout"
											id="id_btn_logout_consumer">Logout</a></li>
									</ul>
								</div>
							</ul></li>
						<li><a href="#"><i class="fa fa-2x fa-shopping-cart" id="id_Cart"></i>
							<lavel id="cart-badge" class="badge badge-warning"></lavel>
							</a>
                        </li>
						
						
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

	</div>










	<input type="hidden" id="id_hdn_loggeduser" value="${loggedUser}">

	<%-- <div class="header-bot">
		<div class="header-bot_inner_wthreeinfo_header_mid">

			<!-- header-bot -->
			<div class="col-md-2 logo_agile">
				<a href="${pageContext.request.contextPath}/user/home"><img 
					src="${pageContext.request.contextPath}/resources/giftCardHome/images/ANB LOGO.png" width="140px" height="60px"
					></a>
			</div>			
			<div class="col-md-6"></div>
			<!-- header-bot -->
			<div class="col-md-4 social-right agileits-social top_content">
						<ul class="social-nav model-3d-0 footer-social w3_agile_social">
						                                   <li class="share">follow us : </li>
															<li><a href="#" class="facebook">
																  <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="twitter"> 
																  <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="instagram">
																  <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="pinterest">
																  <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
														</ul>



		</div>
			<div class="clearfix"></div>
		</div>
	</div> --%>
	<!-- //header-bot -->
	<!-- banner -->
	<%-- 	<div class="ban-top header_bg">
		<div class="container" style="padding-left: 0px;">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
					<div class="">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav menu__list">
								<!-- <li class=" menu__item"><a class="" id="">&nbsp;</a></li> -->
								<!-- <li class=" menu__item"><a class="" id="">&nbsp;</a></li> -->
								
								 <c:if test="${empty loggedStatus}">
								<li class="menu__item"><a
									class="menu__link" href="${pageContext.request.contextPath}/merchant/merchantPageReturn">Merchant<span
										class="sr-only">(current)</span></a></li>
			</c:if>
				
								 <c:if test="${not empty loggedStatus}">
								<li class=" menu__item"><a class="" id="">&nbsp;</a></li> 
								<!-- <li class=" menu__item"><a class="" id="">&nbsp;</a></li> 
								<li class=" menu__item"><a class="" id="">&nbsp;</a></li>  -->
			</c:if>
								

								  <li class=" menu__item dropdown">
                    <a class="menu__link dropdown" href="" data-toggle="dropdown">Categories <i class='fa fa-caret-down'></i></a>
                    <ul id="id_ul_for_categories" class="dropdown-menu cls_ul_for_categories">
      <li><a href="${pageContext.request.contextPath}/consumer/consumerDashboardScreen">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/consumer/consumerDashboardScreen">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/user/logout" id="id_btn_logout_consumer">Logout</a></li>
    </ul>
                    
                    </li>
                    
                   <!--  <li class="menu__item dropdown"><a
									class="menu__link loginDropDown" id="id_btn_viewBalance_dropdown">View Balance
										<i id="id_icon_anchor_tag_balance"></i>
								</a> <ul id="id_ul_for_consumer"
										class="dropdown-menu cls_ul_for_consumer multi-column-dropdown" style="background-color: #0071ca;">
									<ul id="id_main_ul_for_balance" class="dropdown-menu multi-column mystyle"	style="background-color: #0071ca;">
										<div class="col-sm-12">
											<ul class="multi-column-dropdown" id="id_sub_ul_view_balance"  style="width:186px">
												
											</ul>
										</div>
									</ul></li> -->
									
									<li class="menu__item"><a
									class="menu__link" href="${pageContext.request.contextPath}/consumerCardBalanace/cardBalance">View Balance<span
										class="sr-only">(current)</span></a></li>
                    
								<li class=" menu__item dropdown"><a href="#"
									class="dropdown-toggle menu__link" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">Categories
										<span class="fa fa-caret-down"></span>
								</a>
									<ul class="dropdown-menu multi-column columns-3"
										style="background-color: #0071ca;">
										<div class="agile_inner_drop_nav_info">
											<div class="col-sm-5 multi-gd-img">
												<h4 style="color:white;font-weight:bold;">By Type</h4>
												<ul class="multi-column-dropdown" id="id_ul_group_category">
												<!-- 	<li><a href="mens.html">Clothing</a></li>
													<li><a href="mens.html">Wallets</a></li>
													<li><a href="mens.html">Footwear</a></li>
													<li><a href="mens.html">Watches</a></li>
													<li><a href="mens.html">Accessories</a></li>
													<li><a href="mens.html">Bags</a></li>
													<li><a href="mens.html">Caps & Hats</a></li> -->
												</ul>
											</div>
											<div class="col-sm-6 multi-gd-img">
											<h4  style="color:white;font-weight:bold;">Occassions</h4>
												<ul class="multi-column-dropdown" id="id_ul_occassions_category">
												    <!-- <li><a href="#id_div_card_view_section" class="category_class nav-link js-scroll-trigger">MYCLICK</a></li> --> 
													<!-- <li><a href="mens.html">Clothing</a></li>
													<li><a href="mens.html">Wallets</a></li>
													<li><a href="mens.html">Footwear</a></li>
													<li><a href="mens.html">Watches</a></li>
													<li><a href="mens.html">Accessories</a></li>
													<li><a href="mens.html">Bags</a></li>
													<li><a href="mens.html">Caps & Hats</a></li> -->
												</ul>
											</div>
										<!-- 	<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="mens.html">Clothing</a></li>
													<li><a href="mens.html">Wallets</a></li>
													<li><a href="mens.html">Footwear</a></li>
													<li><a href="mens.html">Watches</a></li>
													<li><a href="mens.html">Accessories</a></li>
													<li><a href="mens.html">Bags</a></li>
													<li><a href="mens.html">Caps & Hats</a></li>
												</ul>
											</div>
											<div class="col-sm-3 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="mens.html">Jewellery</a></li>
													<li><a href="mens.html">Sunglasses</a></li>
													<li><a href="mens.html">Perfumes</a></li>
													<li><a href="mens.html">Beauty</a></li>
													<li><a href="mens.html">Shirts</a></li>
													<li><a href="mens.html">Sunglasses</a></li>
													<li><a href="mens.html">Swimwear</a></li>
												</ul>
											</div> -->
											<div class="clearfix"></div>
										</div>
									</ul></li>
								<li class=" menu__item"><a class="menu__link nav-link js-scroll-trigger"
									href="#id_div_card_view_section">Most popular</a></li>
								<li class=" menu__item"><a class="menu__link nav-link js-scroll-trigger"
									href="#id_div_card_view_section">Buy Gift Card</a></li>

							<li class="menu__item dropdown"><a
									class="menu__link loginDropDown" id="id_btn_login_dropdown">Login
										<i id="id_icon_anchor_tag"></i>
								</a> <!-- <ul id="id_ul_for_consumer"
										class="dropdown-menu cls_ul_for_consumer multi-column-dropdown" style="background-color: #0071ca;"> -->
									<ul id="id_ul_for_consumer" class="dropdown-menu multi-column mystyle"	style="background-color: #0071ca;">
										<div class="col-sm-12">
											<ul class="multi-column-dropdown">
												<li><a
													href="${pageContext.request.contextPath}/consumer/consumerDashboardScreen">My Accounts</a></li>
												<li><a
													href="${pageContext.request.contextPath}/myCards/myCards">My Cards</a></li>
														
												<li><a
													href="${pageContext.request.contextPath}/consumerCardBalanace/myCardBalance">Card Balance</a></li>
														
												<li><a
													href="${pageContext.request.contextPath}/user/logout"
													id="id_btn_logout_consumer">Logout</a></li>
											</ul>
										</div>
									</ul></li>

								<!--<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="agile_inner_drop_nav_info">
									<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
										<a href="mens.html"><img src="images/top2.jpg" alt=" "/></a>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="mens.html">Clothing</a></li>
											<li><a href="mens.html">Wallets</a></li>
											<li><a href="mens.html">Footwear</a></li>
											<li><a href="mens.html">Watches</a></li>
											<li><a href="mens.html">Accessories</a></li>
											<li><a href="mens.html">Bags</a></li>
											<li><a href="mens.html">Caps & Hats</a></li>
										</ul>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="mens.html">Jewellery</a></li>
											<li><a href="mens.html">Sunglasses</a></li>
											<li><a href="mens.html">Perfumes</a></li>
											<li><a href="mens.html">Beauty</a></li>
											<li><a href="mens.html">Shirts</a></li>
											<li><a href="mens.html">Sunglasses</a></li>
											<li><a href="mens.html">Swimwear</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>-->
								<!--<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Wedding <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="agile_inner_drop_nav_info">
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="womens.html">Clothing</a></li>
											<li><a href="womens.html">Wallets</a></li>
											<li><a href="womens.html">Footwear</a></li>
											<li><a href="womens.html">Watches</a></li>
											<li><a href="womens.html">Accessories</a></li>
											<li><a href="womens.html">Bags</a></li>
											<li><a href="womens.html">Caps & Hats</a></li>
										</ul>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="womens.html">Jewellery</a></li>
											<li><a href="womens.html">Sunglasses</a></li>
											<li><a href="womens.html">Perfumes</a></li>
											<li><a href="womens.html">Beauty</a></li>
											<li><a href="womens.html">Shirts</a></li>
											<li><a href="womens.html">Sunglasses</a></li>
											<li><a href="womens.html">Swimwear</a></li>
										</ul>
									</div>
									<div class="col-sm-6 multi-gd-img multi-gd-text ">
										<a href="womens.html"><img src="images/top1.jpg" alt=" "/></a>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>-->
								<!--		<li class="menu__item dropdown">
					   <a class="menu__link" href="#" class="dropdown-toggle" data-toggle="dropdown">Wedding<b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="icons.html">Web Icons</a></li>
									<li><a href="typography.html">Typography</a></li>
								</ul>
					</li>
					<li class=" menu__item"><a class="menu__link" href="contact.html">Contact</a></li>-->
							</ul>
						</div>
					</div>

				</nav>

			</div>
                 <div class="top_nav_right">
				<div class="wthreecartaits wthreecartaits2 cart cart box_1">
					<form action="#" method="post" class="last">
					<a href="#"><i class="fa fa-2x fa-shopping-cart shop_cart" id="id_Cart"></i></a>
                                <lavel id="cart-badge" class="badge badge-warning"></lavel>
						</button>
					</form>

				</div>
			</div> 
			<div class="clearfix"></div>
		</div>
	
	</div> --%>





<div class="container main-container">

  		<div class="col-md-3 sidebar1">
  			<div class="row">
				<!-- uncomment code for absolute positioning tweek see top comment in css -->
				<div class="absolute-wrapper"> </div>
				<!-- Menu -->
				<div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
						<!-- Main Menu -->
						<div class="side-menu-container">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-plane"></span> Active Link</a></li>
								<li><a href="#"><span class="glyphicon glyphicon-cloud"></span> Link</a></li>
			
								<!-- Dropdown-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl1">
										<span class="glyphicon glyphicon-user"></span> Sub Level <span class="caret"></span>
									</a>
			
									<!-- Dropdown level 1 -->
									<div id="dropdown-lvl1" class="panel-collapse collapse">
										<div class="panel-body " style="border: none;">
											<ul class="nav navbar-nav">
												<li><a href="#">Link</a></li>
												<li><a href="#">Link</a></li>
												<li><a href="#">Link</a></li>
			
												<!-- Dropdown level 2 -->
												<li class="panel panel-default" id="dropdown">
													<a data-toggle="collapse" href="#dropdown-lvl2">
														<span class="glyphicon glyphicon-off"></span> Sub Level <span class="caret"></span>
													</a>
													<div id="dropdown-lvl2" class="panel-collapse collapse">
														<div class="panel-body">
															<ul class="nav navbar-nav">
																<li><a href="#">Link</a></li>
																<li><a href="#">Link</a></li>
																<li><a href="#">Link</a></li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>
			
								<li><a href="#"><span class="glyphicon glyphicon-signal"></span> Link</a></li>
			
							</ul>
						</div><!-- /.navbar-collapse -->
					</nav>
			
				</div>
			</div>  		
		</div>
		
		
		
  		<div class="col-md-9 content">
  			  <div class="panel panel-default">
				<div class="caption1">
					Dashboard
				</div>
				<div class="panel-body layoutpara">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
			</div>
  		</div>
  		
  		

  	</div>















	
	
	<!-- footer -->
	<div class="container-fluid footer_bg">
	<div class="container">
		<div class="footer_agile_inner_info_w3l">
			<div class="col-md-3 footer-left">

				<img
					src="${pageContext.request.contextPath}/resources/giftCardHome/images/ANB LOGO.png"
					width="140px" height="60px">
				<p>Lorem ipsum quia dolor sit amet, consectetur, adipisci velit,
					sed quia non numquam eius modi tempora.</p>
				<ul
					class="social-nav btm-social model-3d-0 footer-social w3_agile_social">
					<li><a href="#" class="facebook">
							<div class="front">
								<i class="fa fa-facebook" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-facebook" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="twitter">
							<div class="front">
								<i class="fa fa-twitter" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-twitter" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="instagram">
							<div class="front">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</div>
					</a></li>
					<li><a href="#" class="pinterest">
							<div class="front">
								<i class="fa fa-linkedin" aria-hidden="true"></i>
							</div>
							<div class="back">
								<i class="fa fa-linkedin" aria-hidden="true"></i>
							</div>
					</a></li>
				</ul>
			</div>
			<div class="col-md-9 footer-right">
				<div class="sign-grds">
					<div class="col-md-4 sign-gd">
						<h4>
							Our <span>Information</span>
						</h4>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="mens.html">Categories</a></li>
							<li><a href="womens.html">Wedding</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="typography.html">Short Codes</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>

					<div class="col-md-5 sign-gd-two">
						<h4>
							Store <span>Information</span>
						</h4>
						<div class="w3-address">
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-phone" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Phone Number</h6>
									<p>+1 234 567 8901</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Email Address</h6>
									<p>
										Email :<a href="mailto:example@email.com">
											mail@example.com</a>
									</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-map-marker" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Location</h6>
									<p>Broome St, NY 10002,California, USA.</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 sign-gd flickr-post">
						<h4>
							Flickr <span>Posts</span>
						</h4>
						<ul>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t2.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t3.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t4.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t2.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t3.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t2.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.html"><img
									src="${pageContext.request.contextPath}/resources/giftCardHome/images/t4.jpg"
									alt=" " class="img-responsive" /></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="agile_newsletter_footer">
				<div class="col-sm-6 col-xs-12  newsleft">
					<h3>SIGN UP FOR NEWSLETTER !</h3>
				</div>
				<div class="col-sm-6 newsright">
					<form action="#" method="post">
						<input type="email" placeholder="Enter your email..." name="email"
							required> <input type="submit" value="Submit">
					</form>
				</div>

				<div class="clearfix"></div>
			</div>

		</div>
	</div>
	</div>
	<!-- //footer -->
	<div class="footer_bottom">
		<p class="copy-right">&copy 2017 GiftCard. All rights reserved |
			Design by Interland Technology Services</p>
	</div>

	<!-- login -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<h3>Sign up for free</h3>
								<form>
									<div class="sign-up">
										<h4>Email :</h4>
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required>
									</div>
									<div class="sign-up">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required>

									</div>
									<div class="sign-up">
										<h4>Re-type Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required>

									</div>
									<div class="sign-up">
										<input type="submit" value="REGISTER NOW">
									</div>

								</form>
							</div>
							<div class="login-right">
								<h3>Sign in with your account</h3>
								<form>
									<div class="sign-in">
										<h4>Email :</h4>
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required>
									</div>
									<div class="sign-in">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required> <a href="#">Forgot password?</a>
									</div>
									<div class="single-bottom">
										<input type="checkbox" id="brand" value=""> <label
											for="brand"><span></span>Remember Me.</label>
									</div>
									<div class="sign-in">
										<input type="submit" value="SIGNIN">
									</div>
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
						<p>
							By logging in you agree to our <a href="#">Terms and
								Conditions</a> and <a href="#">Privacy Policy</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade product_view" id="product_view">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" class="class pull-right"><span
						class="glyphicon glyphicon-remove"></span></a>
					<h3 class="modal-title">HTML5 is a markup language</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6 product_img">
							<img
								src="http://img.bbystatic.com/BestBuy_US/images/products/5613/5613060_sd.jpg"
								class="img-responsive">
						</div>
						<div class="col-md-6 product_content">
							<h4>
								Product Id: <span>51526</span>
							</h4>
							<div class="rating">
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> (10 reviews)
							</div>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text ever since the 1500s, when an unknown
								printer took a galley of type and scrambled it to make a type
								specimen book.Lorem Ipsum is simply dummy text of the printing
								and typesetting industry.</p>
							<h3 class="cost">
								<span class="glyphicon glyphicon-usd"></span> 75.00 <small
									class="pre-cost"><span class="glyphicon glyphicon-usd"></span>
									60.00</small>
							</h3>
							<div class="row">
								<div class="col-md-4 col-sm-6 col-xs-12">
									<select class="form-control" name="select">
										<option value="" selected="">Color</option>
										<option value="black">Black</option>
										<option value="white">White</option>
										<option value="gold">Gold</option>
										<option value="rose gold">Rose Gold</option>
									</select>
								</div>
								<!-- end col -->
								<div class="col-md-4 col-sm-6 col-xs-12">
									<select class="form-control" name="select">
										<option value="">Capacity</option>
										<option value="">16GB</option>
										<option value="">32GB</option>
										<option value="">64GB</option>
										<option value="">128GB</option>
									</select>
								</div>
								<!-- end col -->
								<div class="col-md-4 col-sm-12">
									<select class="form-control" name="select">
										<option value="" selected="">QTY</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
									</select>
								</div>
								<!-- end col -->
							</div>
							<div class="space-ten"></div>
							<div class="btn-ground">
								<button type="button" class="btn btn-primary">
									<span class="glyphicon glyphicon-shopping-cart"></span> Add To
									Cart
								</button>
								<button type="button" class="btn btn-primary">
									<span class="glyphicon glyphicon-heart"></span> Add To Wishlist
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- //login -->
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<i class="glyphicon glyphicon-arrow-up" aria-hidden="true"></i> <span
		id="toTopHover" style="opacity: 1;"> </span>
	</a>

	<!-- js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/modernizr.custom.js"></script>
	<!-- Custom-JavaScript-File-Links -->
	<!-- cart-js -->
	<script
		src="j${pageContext.request.contextPath}/resources/giftCardHome/s/minicart.min.js"></script>
	<script>
		// Mini Cart
		paypal.minicart.render({
			action : '#'
		});

		if (~window.location.search.indexOf('reset=true')) {
			paypal.minicart.reset();
		}
	</script>

	<!-- //cart-js -->
	<!-- script for responsive tabs -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script> --%>
	<script>
		$(document).ready(function() {
			/* $('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			}); */
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>
	<!-- //script for responsive tabs -->
	<!-- stats -->
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.waypoints.min.js"></script>
	<%-- <script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script> --%>
	<!-- //stats -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/move-top.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.easing.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->


	<!-- for bootstrap working -->

	<script
		src="${pageContext.request.contextPath}/resources/js/scrolling-nav.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/countryFlags/jquery.ddslick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/popper/popper.min.js"></script>
	<!--   <script src="vendor/bootstrap/js/bootstrap.min.js"></script> -->

	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/homeCategory.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.countup.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/dataTables.responsive.min.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!--  <script>
		$(document).ready(function(){
		$(".dropdown").hover(            
			function() {
				$('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
				$(this).toggleClass('open');        
			},
			function() {
				$('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
				$(this).toggleClass('open');       
			}
		);
	});
	</script> -->
	<script>
		function addImage(pk) {
			alert("addImage: " + pk);
		}
		
		$('#myModal .save').click(function (e) {
			e.preventDefault();
			addImage(5);
			$('#myModal').modal('hide');
			//$(this).tab('show')
			return false;
		})
	</script>
</body>
</html>
