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

	<!-- //banner-top -->
	<!-- Modal1 -->
	<div class="modal fade" id="id_login_modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="col-md-8 modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">
							Sign In <span>Now</span>
						</h3>
						<form action="" method="post" id="id_form_login">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userId" required
									id="id_text_userId_login"> <label>Mobile Number</label>
								<span></span>
							</div>
							<div class="styled-input">
								<input type="password" name="password" required
									id="id_text_password_login"> <label>Password</label> <span></span>
							</div>
							<p>
								<a href="#" id="id_forgotPassword"> Forgot password/User Id?</a>
							</p>
							<input type="button" value="Sign In" class="btn btn-primary"
								id="id_btn_consumer_login">
								<div id="img-load" align="center"><img class="img-responsive load-img-login" style=" width: 75px; height: 75px;" src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
							  <input type="button"
								value="Sign Up" class="btn btn-primary"
								id="id_btn_consumer_signup"> 
							<input type="hidden" name="groupId" value="2">
						</form>
						<ul
							class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
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
						<div class="clearfix"></div>
						<p>
							<a
								href="${pageContext.request.contextPath}/merchant/merchantPageReturn">
								Are you a Merchant, Click here?</a>
						</p>

					</div>
					<div class="col-md-4 modal_body_right modal_body_right1">
						<img
							src="${pageContext.request.contextPath}/resources/giftCardHome/images/log_pic.jpg"
							alt=" " />
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal1 -->
	<!----------------------------------------------------------Forgot password  Modal----------------------------------  -->
	<div class="modal fade merchantmodal" data-backdrop="static"
		data-keyboard="false" id="id_forgot_password_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog  modal-md" role="document">
			<div class="modal-content" id="">
				<div id="id_forgot_password_header" class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						id="id_close_modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>Forgot Password?</b>
					</h4>
				</div>
				<div class="modal-body">
					<h5></h5>
					<form id="id_mail_submit_form" class="form-horizontal" action="#">

						<div class="box-body">
							<div class="row" style="margin-top: 10px; padding-right: 85px">

								<div align="center">
									<div class="col-md-6">

										<label for="id_userId_password" style="float: right"
											class="control-label"><span>Forgot
												Password/User Id&nbsp;:<a style="color: red">*</a>
										</span></label>
									</div>
									<div class="col-md-6">

										<label><input type="radio" id="id_check_password"
											name="checkSelect">Password</label> <label><input
											type="radio" id="id_check_userId" name="checkSelect">UserId</label>







									</div>
								</div>

							</div>

							<div class="row" style="margin-top: 10px; padding-right: 85px">

								<div align="center">
									<div class="col-md-6">

										<label for="id_userId_forgot_password" style="float: right"
											class="control-label"><span>Enter user
												Id&nbsp;:<a style="color: red">*</a>
										</span></label>
									</div>
									<div class="col-md-6">

										<input type="text" maxlength="85" class="form-control"
											placeholder="Enter Mobile Number"
											id="id_userId_forgot_password" name="merchantId">





									</div>
								</div>

							</div>
							<div class="row" style="margin-top: 10px; padding-right: 85px">

								<div align="center">
									<div class="col-md-6">

										<label for="id-email-Id_forgot_password" style="float: right"
											class="control-label"><span>Enter Email
												Id&nbsp;:<a style="color: red">*</a>
										</span></label>
									</div>
									<div class="col-md-6">

										<input type="text" maxlength="85" class="form-control"
											placeholder="Email Id" id="id-email-Id_forgot_password"
											name="emailId">





									</div>
								</div>

							</div>



							<div class="row" style="margin-top: 10px; padding-right: 85px">

								<div align="center">
									<div class="col-md-6">

										<label for="id-forgot-password" style="float: right"
											class="control-label"><span>Password&nbsp;:<a
												style="color: red">*</a></span></label>
									</div>
									<div class="col-md-6">

										<input type="password" maxlength="85" class="form-control"
											placeholder="Password" id="id-forgot-password"
											name="password">





									</div>
								</div>

							</div>






						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="id__mail_submit">
						<i class="fa fa-check"></i>Submit
					</button>

				</div>

			</div>
			<!-- /.box -->

		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- 	</div>
				 -->

	<!------------------------------------- -------------------------------------------------------- -->

	<!--//modal6-->

	<div class="modal fade" id="id_preview_modal_purchase" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<form method="post"
						action="${pageContext.request.contextPath}/consumer/purchaseCard"
						id="id_form_purchaseCard">
						<div class="col-md-7 modal_body_left modal_body_left1">
							<h3 class="agileinfo_sign">Anb Gift Card</h3>
							<input type="hidden" id="id_hdn_previeModal_merchantId"
								name="merchantId">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">Redemption
										Details</a></li>
								<li><a data-toggle="tab" href="#menu2">Retailers</a></li>
							</ul>
							<div class="tab-content">
								<div id="home" class="tab-pane fade in active">
									<h4 class="home_agile">HOME</h4>
									<p></p>
								</div>
								<div id="menu1" class="tab-pane fade">
									<h3 class="home_agile">Menu 1</h3>
									<p></p>
								</div>
								<!-- <div id="menu2" class=" tab-pane fade">
								<h3>Menu 2</h3>
								<p>Sed ut perspiciatis unde omnis iste natus error sit</p>
							</div> -->
							</div>
						</div>

						<div class="col-md-5">
							<div class="panel panel-warning">
								<div class="panel-body">
									<h5 class="header_info_1">eWallet</h5>
									<p class="text-center">AED 100-AED 5,000</p>
									<div class="img_1">
										<img src="images/banner4.jpg" class="img-responsive"
											width="180px" height="200px" id="id_preview_image_in_modal">
									</div>
									<br>

									<button class="btn btn-info btn_blue" type="button"
										id="id_btn_pick_egiftCard">
										Pick The eWallet <i class="fa fa-arrow-right"
											aria-hidden="true"></i>
									</button>

								</div>


							</div>
						</div>

						<!--<ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
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
														</ul>-->
						<div class="clearfix"></div>



					</form>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //Modal content-->
	</div>
	<!-- </div> -->
	<!----------------------------------------modal cart data------------  -->
	<div class="modal fade" id="id_card_results_" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" id="">
				<div id="" class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b> Your Orders </b>
					</h4>
				</div>
				<div class="row" id="no-more-tables">
					<table id="id_table_item_purchase_summary_home"
						class="col-md-12 table-bordered table-striped table-condensed cf">
						<thead class="cf">
							<tr>
								<th>Item Number</th>
								<th>eWallet</th>
								<th>Delivery</th>
								<th>Gift Value</th>
								<th>Service Fee</th>
								<th>Total</th>
								<th>Product Image</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<br>
					<div class="row">
					<div class="col-md-9"></div>
					<div class="col-md-1"></div>
					<!-- 
					<div class="col-md-3"></div> -->
					<div class="col-md-2"><button type="button"
												class="btn btn-default btn-info-full next-step"
												id="id_btn_buy_checkout_modal">Check out</button>
					</div>
					</div>
					<br>
					<div class="row"></div>

				</div>
				<!-- /.box -->

			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-------------------------------------------------------------------  -->



	<!--//modal6-->

	<!--//modal6-->


	<!-- Modal2 -->
	<div class="modal fade" id="id_consumer_signup" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="col-md-8 modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">
							Sign Up <span>Now</span>
						</h3>
						<form action="#" method="post" id="id_form_signUp_consumer">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userId" required
									id="id_txt_userId_signup"> <label>Mobile Number</label>
								<span></span>
							</div>
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userName" required
									id="id_txt_userName_signup"> <label>Full Name</label> <span></span>
							</div>
							<div class="styled-input">
								<input type="email" name="emaild" required
									id="id_txt_emailId_signup"> <label>Email</label> <span></span>
							</div>
							<div class="styled-input">
								<input type="password" name="password" required
									id="id_txt_pwd_signup"> <label>Password</label> <span></span>
							</div>
							<div class="styled-input">
								<input type="password" name="Confirm_Password" required
									id="id_txt_cnfpwd_signup"> <label>Confirm
									Password</label> <span></span>
							</div>
							<input type="button" value="Register"
								id="id_btn_register_consumer">
						</form>
						<ul
							class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
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
						<div class="clearfix"></div>
						<p>
							<a href="#">By clicking register, I agree to your terms</a>
						</p>

					</div>
					<div class="col-md-4 modal_body_right modal_body_right1">
						<img
							src="${pageContext.request.contextPath}/resources/giftCardHome/images/log_pic.jpg"
							alt=" " />

					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<!-- //Modal2 -->
<div id="banner" class="banner">


	<div class="">
		<nav class="navbar navbar-default navb_opcty">
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


					<ul class="nav navbar-nav navbar-right navbar_clt_in">

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
									<div class="col-sm-4 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">By Type</h4>
										<ul class="multi-column-dropdown" id="id_ul_group_category">

										</ul>
									</div>
									<div class="col-sm-4 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">Occassions</h4>
										<ul class="multi-column-dropdown"
											id="id_ul_occassions_category">

										</ul>
									</div>
										<div class="col-sm-4 multi-gd-img">
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

	<img id="id_img_carousel" alt="" src="${pageContext.request.contextPath}/resources/giftCardHome/images/banner33.png">
	<div class="main-bnr">
		<div class="carousel-caption">
		<h3>Send eWallets to family & friends in minutes...</h3>
		<p>Digital Wallets delivered instantly by Email, SMS or
			print at home</p>
		<a class="btn-primary button2  js-scroll-trigger btn_banr" id="id_div_card_view_section" style="text-decoration: none;" href="#id_div_card_view_section">Buy
			eWallet </a>
	</div>

		
	</div>
</div>


	<!-- banner -->
	<!-- <div id="myCarousel" class="carousel slide" data-ride="carousel">

		<div class="carousel-inner" role="listbox">

			<div class="item item2 active">
				<div class="container">
					<div class="carousel-caption">
						<h3>Send eGift Cards to family & friends in minutes...</h3>
						<p>Digital Gift Cards delivered instantly by Email, SMS or
							print at home</p>

					</div>
			
					<div class="row gift-card">
						<a class="btn-primary button2  js-scroll-trigger btn_banr" id="id_div_card_view_section" style="text-decoration: none;" href="#id_div_card_view_section">Buy
							eGift card </a>
					</div>




				</div>
			</div>

		</div>

	</div> -->
	
	<div class="container-fluid">
		<div class="row">
			<div class="box-width">
				<div class="number-box">
					1
				</div>
				<div class="square-box">
					Choose from 125+ top retailers				
				</div>
			</div>
			<div class="box-width">
				<div class="number-box1">
					2
				</div>
				<div class="square-box1">
					Choose from 125+ top retailers				
				</div>
			</div>
			<div class="box-width">
				<div class="number-box2">
					3
				</div>
				<div class="square-box2">
					Choose from 125+ top retailers				
				</div>
			</div>
			<div class="box-width">
				<div class="number-box3">
					4
				</div>
				<div class="square-box3">
					Choose from 125+ top retailers				
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container">
		<div class="col-md-3 header-middle">
			<div id="ddlSocial"></div>
			<form>

				<select class="form-control form_1">
					<option>Saudi Arabia</option>
					<!-- <option>BEHARIN</option>
					<option>INDIA</option>
					<option>USA</option>
					<option>ENGLAND</option> -->
				</select>
			</form>
		</div>
		<div class="col-md-4 header-middle">
			<form>
				<select class="form-control form_1" id="id_select_group">
					<!-- <option>UAE</option>
					<option>BEHARIN</option>
					<option>INDIA</option>
					<option>USA</option>
					<option>ENGLAND</option> -->
				</select>
			</form>
		</div>
		<div class="col-md-5 header-middle">
			<form>
				<select class="form-control form_1" id="id_select_theme">
					<!-- <option>UAE</option>
					<option>BEHARIN</option>
					<option>INDIA</option>
					<option>USA</option>
					<option>ENGLAND</option> -->
				</select>
			</form>
		</div>
		<!-- <div class="col-md-3 header-middle">
			<form>
				<div class="input-group">
				
					<input type="text" class="form-control form_2" placeholder="Search"
						style="border-top-width: 1px;">
					<div class="input-group-btn">
						<button class="btn btn-default form_2" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div> -->

	</div>
	<!-- /new_arrivals -->

	<!-- test -->

	<div class="container-fluid flipbg" id="id_div_card_view_section">
		<div class="container-fluid">
			<div class="row">
				<h3>
					<b>Buy Most Popular eWallets in Saudi Arabia</b>
				</h3>
				<p>Personalized gift vouchers delivered online & redeemable at
					popular Saudi Arabia stores</p>
			</div>
			<!-- <div class="row">
        		<div class="col-md-5">
        		<h3><span class="label label-red col-md-6"id="id_li_category_0"></span></h3>
        		</div>
        		<div class="col-md-7"></div>
        		</div> -->
			<div class="container">
				<div class="row">


					<div class="brand-list" brand-scroll="">
						<div class="brands_container ng-isolate-scope"
							infinite-scroll="loadMore(nextUrl)"
							infinite-scroll-disabled="busy" infinite-scroll-distance="3" id="id_div_get_all_merchantLogo">
						<div id="img-load-mer-logo" align="center"><img class="img-responsive load-img-login" style=" width: 75px; height: 75px;"src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
							<%-- <div
								class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">

								<div class="flip-container"
									ontouchstart="this.classList.toggle('hover');">
									<span class="right">SAR</span> <span class="pin"><img
										src="https://cdnstatic.yougotagift.com/static/img/common/pin-f1f1f1.png"
										alt="" title=""></span> <a data-target=".brand-modal"
										class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">Virgin
										Megastore</a>
									<div class="flipper">
										<figure class="front">
											<div class="block">
											<div id="img-load"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/giftCardHome/images/two.gif" /></div>
												<strong><span>Virgin Megastore</span></strong> 
												<img class="img-responsive" src="${pageContext.request.contextPath}/resources/giftCardHome/images/card.png">
												
											</div>
										</figure>
										<figure class="back">
											<div class="back-block">
												<span class="col-md-12 p-a-0 title"> 
																									
												</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>Virgin
															Megastore</span></strong>				
												
												<img class="img-responsive" width="100%" src="${pageContext.request.contextPath}/resources/giftCardHome/images/card.png" >
												<span class="btn"><i
													class="icon-arrow-right-1 icon_span"></i> Pick this Gift
													Card </span>
											</div>
										</figure>
									</div>
								</div> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 
				<div class="row" id="id_div_merchant_logo_images_list">
				</div> -->
		</div>
	</div>
	<!-- test end -->
	<%-- 
	
	<section id="id_div_card_view_section">
	<div class="new_arrivals_agile_w3ls_info" >
		<div class="container">
			<h3 class="wthree_text_info">Buy Most Popular eGift Card</h3>
			
			<div id="horizontalTab">
				<ul class="resp-tabs-list" id="id_ul_reps_tabs_themes_list">
					<li id="id_li_category_0"></li>
				</ul>
				<div class="resp-tabs-container">
					<!--/tab_one-->
					<div class="tab1" id="id_div_img_tab">
						<div class="col-md-3 product-men">
							<div class="men-pro-item simpleCart_shelfItem">
								<div class="men-thumb-item">
									<img
										src="${pageContext.request.contextPath}/resources/giftCardHome/images/m2.jpg"
										alt="" class="pro-image-front">
									<div class="row">
										<div class="pro-image-back">

											<div class="col-sm-5">
												<a href=""><img
													src="${pageContext.request.contextPath}/resources/giftCardHome/images/LOGO.png"
													width="70px" height="50px"></a>
											</div>
											<div class="col-sm-7">
												<h3>gift card</h3>
											</div>
											<div id="carousel-example-generic" class="carousel slide"
												data-ride="carousel">

												<div class="carousel-inner" role="listbox">
													<div class="item item8 active">
														<img
															src="${pageContext.request.contextPath}/resources/giftCardHome/images/m3.jpg">
													</div>
													<div class="item item8">
														<img
															src="${pageContext.request.contextPath}/resources/giftCardHome/images/m3.jpg">
													</div>
													<div class="item item8">
														<img
															src="${pageContext.request.contextPath}/resources/giftCardHome/images/m3.jpg">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="men-cart-pro">
										<div class="inner-men-cart-pro">
											<a href="#" class="link-product-add-cart" data-toggle="modal"
												data-target="#myModal6">Buy Gift Card</a>

										</div>
									</div>

								</div>
								<div class="item-info-product ">
									<h4>
										<a href="#">Lu Lu Malldddd</a>
									</h4>


								</div>
							</div>
						</div>
				
					
						
						
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	</section> --%>
	<!-- aravind -->
	<section id="about"></section>
	<!-- aravind -->
	<div class="container-fluid boxbg">
		<div class="container">
			<div class="row">
				<div class="col-md-3 red">
					<a href="#" class="redbox"><i class="fa fa-truck"
						aria-hidden="true"></i></a>
					<h4>FREE SHIPPING</h4>
					<p></p>
				</div>
				<div class="col-md-3 red">
					<a href="#" class="redbox"><i class="fa fa-headphones"
						aria-hidden="true"></i></a>
					<h4>24/7 SUPPORT</h4>
					<p></p>
				</div>
				<div class="col-md-3 red">
					<a href="#" class="redbox"><i class="fa fa-shopping-bag"
						aria-hidden="true"></i></a>
					<h4>MONEY BACK GUARANTEE</h4>
					<p></p>
				</div>
				<div class="col-md-3 red">
					<a href="#" class="redbox"><i class="fa fa-gift"
						aria-hidden="true"></i></a>
					<h4>FREE GIFT COUPONS</h4>
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<!--grids-->
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
				<div class="col-md-6 col-sm-12  col-xs-12  newsleft">
					<h3>SIGN UP FOR NEWSLETTER !</h3>
				</div>
				<div class="col-md-6 col-sm-12  newsright">
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
		<p class="copy-right">&copy 2017 Wallet. All rights reserved |
			Design by Interland Technology Services</p>
	</div>
	<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

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
	<!-- <a href="#home" class="scroll" id="toTop" style="display: block;">
		<i class="glyphicon glyphicon-arrow-up" aria-hidden="true"></i> <span
		id="toTopHover" style="opacity: 1;"> </span>
	</a> -->
	<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 0;"></span></a>

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
		var image = document.querySelector('#id_img_carousel');
		var imageCanvas = document.createElement('canvas');
		var imageCanvasContext = imageCanvas.getContext('2d');
		var lineCanvas = document.createElement('canvas');
		var lineCanvasContext = lineCanvas.getContext('2d');
		var pointLifetime = 1000;
		var points = [];
	
		if (image.complete) {
		  start();
		} else {
		  image.onload = start;
		}
	
		/**
		 * Attaches event listeners and starts the effect.
		 */
		function start() {
		  document.addEventListener('mousemove', onMouseMove);
		  window.addEventListener('resize', resizeCanvases);
		  //document.body.appendChild(imageCanvas);
		  $("#banner").append(imageCanvas);
		  resizeCanvases();
		  tick();
		}
	
		/**
		 * Records the user's cursor position.
		 *
		 * @param {!MouseEvent} event
		 */
		function onMouseMove(event) {
		  points.push({
		    time: Date.now(),
		    x: event.clientX,
		    y: event.clientY
		  });
		}
	
		/**
		 * Resizes both canvases to fill the window.
		 */
		function resizeCanvases() {
		  imageCanvas.width = lineCanvas.width = window.innerWidth;
		  imageCanvas.height = lineCanvas.height = window.innerHeight;
		}
	
		/**
		 * The main loop, called at ~60hz.
		 */
		function tick() {
		  // Remove old points
		  points = points.filter(function(point) {
		    var age = Date.now() - point.time;
		    return age < pointLifetime;
		  });
	
		  drawLineCanvas();
		  drawImageCanvas();
		  requestAnimationFrame(tick);
		}
	
		/**
		 * Draws a line using the recorded cursor positions.
		 *
		 * This line is used to mask the original image.
		 */
		function drawLineCanvas() {
		  var minimumLineWidth = 25;
		  var maximumLineWidth = 100;
		  var lineWidthRange = maximumLineWidth - minimumLineWidth;
		  var maximumSpeed = 50;
	
		  lineCanvasContext.clearRect(0, 0, lineCanvas.width, lineCanvas.height);
		  lineCanvasContext.lineCap = 'round';
		  lineCanvasContext.shadowBlur = 30;
		  lineCanvasContext.shadowColor = '#000';
		  
		  for (var i = 1; i < points.length; i++) {
		    var point = points[i];
		    var previousPoint = points[i - 1];
	
		    // Change line width based on speed
		    var distance = getDistanceBetween(point, previousPoint);
		    var speed = Math.max(0, Math.min(maximumSpeed, distance));
		    var percentageLineWidth = (maximumSpeed - speed) / maximumSpeed;
		    lineCanvasContext.lineWidth = minimumLineWidth + percentageLineWidth * lineWidthRange;
	
		    // Fade points as they age
		    var age = Date.now() - point.time;
		    var opacity = (pointLifetime - age) / pointLifetime;
		    lineCanvasContext.strokeStyle = 'rgba(0, 0, 0, ' + opacity + ')';
		    
		    lineCanvasContext.beginPath();
		    lineCanvasContext.moveTo(previousPoint.x, previousPoint.y);
		    lineCanvasContext.lineTo(point.x, point.y);
		    lineCanvasContext.stroke();
		  }
		}
	
		/**
		 * @param {{x: number, y: number}} a
		 * @param {{x: number, y: number}} b
		 * @return {number} The distance between points a and b
		 */
		function getDistanceBetween(a, b) {
		  return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
		}
	
		/**
		 * Draws the original image, masked by the line drawn in drawLineToCanvas.
		 */
		function drawImageCanvas() {
		  // Emulate background-size: cover
		  var width = imageCanvas.width;
		  var height = imageCanvas.width / image.naturalWidth * image.naturalHeight;
		  
		  if (height < imageCanvas.height) {
		    width = imageCanvas.height / image.naturalHeight * image.naturalWidth;
		    height = imageCanvas.height;
		  }
	
		  imageCanvasContext.clearRect(0, 0, imageCanvas.width, imageCanvas.height);
		  imageCanvasContext.globalCompositeOperation = 'source-over';
		  imageCanvasContext.drawImage(image, 0, 0, width, height);
		  imageCanvasContext.globalCompositeOperation = 'destination-in';
		  imageCanvasContext.drawImage(lineCanvas, 0, 0);
		}
	</script>
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
