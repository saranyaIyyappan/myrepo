<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/responsive.dataTables.min.css">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/easy-responsive-tabs.css"
	rel='stylesheet' type='text/css' />
	<link
	href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css"
	rel='stylesheet' type='text/css' />
    <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css">
   <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
<title>GiftCard</title>

<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Elite Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />


</head>
<body>
<!-- header -->
<div id="status" class="container-fluid topbg">
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
<!-- //header -->
<input type="hidden" id="id_hdn_loggeduser" value="${loggedUser}">
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
							href="/GiftCard/user/home">Most popular</a></li>
						<li class=""><a class="nav-link js-scroll-trigger"
							href="/GiftCard/user/home">Buy Wallet</a></li>

						<li class="dropdown"><a class="loginDropDown" href="#"
							id="id_btn_login_dropdown">Login <i id="id_icon_anchor_tag"></i>
						</a>
							<ul id="id_ul_for_consumer"
								class="dropdown-menu multi-column mystyle">
								<div class="col-sm-12">
									<ul class="multi-column-dropdown">
<!-- 										<li><a -->
<%-- 											href="${pageContext.request.contextPath}/consumer/consumerDashboardScreen">My --%>
<!-- 												Accounts</a></li> -->
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
						<h3 class="agileinfo_sign">Sign In <span>Now</span></h3>
									<form action="" method="post" id="id_form_login">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userId" required id="id_text_userId_login">
								<label>Mobile Number</label>
								<span></span>
							</div>
							<div class="styled-input">
								<input type="password" name="password" required id="id_text_password_login"> 
								<label>Password</label>
								<span></span>
							</div> 
							<p><a href="#" id="id_forgotPassword"> Forgot password/User Id</a></p>
							<input type="hidden" name="groupId" value="2">
							<input type="button" value="Sign In" class="btn btn-primary" id="id_btn_consumer_login">
							 <input type="button" value="Sign Up" class="btn btn-primary" id="id_btn_consumer_signup"> 
						</form>
						  <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
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
														<div class="clearfix"></div>
														<p><a href="${pageContext.request.contextPath}/merchant/merchantPageReturn"> Are you a Merchant, Click here?</a></p>

						</div>
						<div class="col-md-4 modal_body_right modal_body_right1">
							<img src="${pageContext.request.contextPath}/resources/giftCardHome/images/log_pic.jpg" alt=" "/>
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
						<button type="button" class="close" data-dismiss="modal" id="id_close_modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b>Forgot Password?</b>
						</h4>
					</div>
					<div class="modal-body">
						<h5></h5>
					<form id="id_mail_submit_form" class="form-horizontal"
							action="#">
							
							<div class="box-body">
							<div class="row" style="margin-top: 10px; padding-right: 85px">
									
									<div align="center">
										<div class="col-md-6">

											<label for="id_userId_password" style="float: right"
												class="control-label"><span>Forgot Password/User Id&nbsp;:<a
													style="color: red">*</a></span></label>
										</div>
										<div class="col-md-6">
										<label>
										<input type="radio" id="id_check_password"
												name="checkSelect" >Password</label> 
												
												<label>
												<input
												type="radio" id="id_check_userId" name="checkSelect"
												>UserId</label>
 


										</div>
									</div>
									
								</div>
<div class="row" style="margin-top: 10px; padding-right: 85px">
									
									<div align="center">
										<div class="col-md-6">

											<label for="id_userId_forgot_password" style="float: right"
												class="control-label"><span>Enter user Id&nbsp;:<a
													style="color: red">*</a></span></label>
										</div>
										<div class="col-md-6">

											<input type="text" maxlength="85" class="form-control"
												placeholder="Enter Mobile Number" id="id_userId_forgot_password" name="merchantId"   >





										</div>
									</div>
									
								</div>
								<div class="row" style="margin-top: 10px; padding-right: 85px">
									
									<div align="center">
										<div class="col-md-6">

											<label for="id-email-Id_forgot_password" style="float: right"
												class="control-label"><span>Enter Email Id&nbsp;:<a
													style="color: red">*</a></span></label>
										</div>
										<div class="col-md-6">

											<input type="text" maxlength="85" class="form-control"
												placeholder="Email Id" id="id-email-Id_forgot_password" name="emailId"  >





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
												placeholder="Password" id="id-forgot-password" name="password"  >





										</div>
									</div>
									
								</div>
							
								
								
								
							


							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="id__mail_submit">
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
<!-- modal signup -->
<div class="modal fade" id="id_consumer_signup" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
						<div class="modal-body modal-body-sub_agile">
						<div class="col-md-8 modal_body_left modal_body_left1">
						<h3 class="agileinfo_sign">Sign Up <span>Now</span></h3>
						 <form action="#" method="post" id="id_form_signUp_consumer">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userId" required id="id_txt_userId_signup">
								<label>Mobile Number</label>
								<span></span>
							</div>
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="userName" required id="id_txt_userName_signup">
								<label>Full Name</label>
								<span></span>
							</div>
							<div class="styled-input">
								<input type="email" name="emaild" required id="id_txt_emailId_signup"> 
								<label>Email</label>
								<span></span>
							</div> 
							<div class="styled-input">
								<input type="password" name="password" required id="id_txt_pwd_signup"> 
								<label>Password</label>
								<span></span>
							</div> 
							<div class="styled-input">
								<input type="password" name="Confirm_Password" required id="id_txt_cnfpwd_signup"> 
								<label>Confirm Password</label>
								<span></span>
							</div> 
							<input type="button" value="Register" id="id_btn_register_consumer">
						</form>
						  <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
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
														<div class="clearfix"></div>
														<p><a href="#">By clicking register, I agree to your terms</a></p>

						</div>
						<div class="col-md-4 modal_body_right modal_body_right1">
							<img src="${pageContext.request.contextPath}/resources/giftCardHome/images/log_pic.jpg" alt=" "/>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- //Modal content-->
			</div>
		</div>

<!-- end modal signup -->



		</div>

<!-- login -->
			<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>Sign up for free</h3>
										<form>
											<div class="sign-up">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required>	
											</div>
											<div class="sign-up">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
												
											</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
												
											</div>
											<div class="sign-up">
												<input type="submit" value="REGISTER NOW" >
											</div>
											
										</form>
									</div>
									<div class="login-right">
										<h3>Sign in with your account</h3>
										<form>
											<div class="sign-in">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required>	
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
												<a href="#">Forgot password?</a>
											</div>
											<div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div>
											<div class="sign-in">
												<input type="submit" value="SIGNIN" >
											</div>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
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
								<th>eGift Card</th>
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
			
			
<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

		
	 <input type="hidden" id="app-context-path" value="${pageContext.request.contextPath}"/>
	<input type="hidden" id="app-session-out-time" value="${pageContext.session.maxInactiveInterval}"/>
 
<script>
//makes sure the whole site is loaded
jQuery(window).load(function() {
    // will first fade out the loading animation
jQuery("#status").fadeOut();
    // will fade out the whole DIV that covers the website.
jQuery("#preloader").delay(1000).fadeOut("slow");
})
</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/modernizr.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/minicart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.countup.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/move-top.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		 <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/moment/min/moment.min.js"></script>
     <%-- <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>  --%>
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    	<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css">

  	 <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</body>
</html>
