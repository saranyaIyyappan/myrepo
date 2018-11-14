<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="dashboard.definition">
	<tiles:putAttribute name="title" value="Merchant Registeration" />
	<tiles:putAttribute name="body">
	<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/merchant/addNewMerchant.js"></script>
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
									<!-- 	<span style="background:url(images/1.jpg) no-repeat center"> </span>  -->
										 <div class="user-name">
											<p>${loggedUser}<span>Merchant</span></p>
										 </div>
										 <i class="lnr lnr-chevron-down"></i>
										 <i class="lnr lnr-chevron-up"></i>
										<div class="clearfix"></div>	
									</div>	
								</a>
								<ul class="dropdown-menu drp-mnu">
									<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
									<li> <a href="${pageContext.request.contextPath}/user/myProfile"><i class="fa fa-user"></i>Profile</a> </li> 
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
		<div class="container">
			<form id="id_merchant_signup_form" class="form-horizontal">
				<input type="hidden" maxlength="100" class="form-control"
					placeholder="" name="" id="id_input_hidden_user"
					value="${loggedUserName}">
				<div class="box-body">
	 									<div class="row" style="margin-top: 10px; padding-right: 55px">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id-merchant-id" style="float: right"
													class="control-label"><span>Mobile Number:</span><a
													style="color: red">*</a> </label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="35" class="form-control"
													placeholder="Mobile Number" id="id-merchant-id"
													name="merchantId" value="" onchange="return trim(this)"
													onkeypress="return isNumber(event)">
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id-alternate_id" style="float: right"
													class="control-label"><span>Alternative
														Mobile Number: <a style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="35" class="form-control"
													placeholder="Mobile Number" id="id-alternate_id"
													name="alternativeId"  value="" onchange="return trim(this)"
													onkeypress="return isNumber(event)">
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; padding-right: 55px">

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">Password :<a style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="password" maxlength="100" class="form-control"
													placeholder="Confirm Password" name=""
													id="id_confirm_password" onchange="return trim(this)">

											</div>
										</div>
										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">Confirm Password:<a
													style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="password" maxlength="100" class="form-control"
													placeholder="Password" id="id_password" name="password"
													onkeypress="return trim(this)">

											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; padding-right: 55px">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id-merchant-id" style="float: right"
													class="control-label"><span>Email Id:</span><a
													style="color: red">*</a> </label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="35" class="form-control"
													placeholder="EmailID" id="id-emailId" name="emailId">
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_merchant_name" style="float: right"
													class="control-label"><span>CR Number:<a
														style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="85" class="form-control"
													placeholder="CR Number" id="id-cr-number" name="crNumber">
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; padding-right: 55px">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_merchant_name" style="float: right"
													class="control-label"><span>Name of Shop
														&nbsp;:<a style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="85" class="form-control"
													placeholder="(English)" id="id_shop_name_english"
													name="merchantNameEng" onchange="return trim(this)">
											</div>
										</div>

										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_merchant_name" style="float: right"
													class="control-label"><span>Name of Shop
														&nbsp;:<a style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="85" class="form-control"
													placeholder="(Arabic)" id="id_shop_name_arabic"
													name="merchantNameArb" onchange="return trim(this)">
											</div>
										</div>
									</div>


									<div class="row" style="margin-top: 10px; padding-right: 55px">
										<div class="col-md-6">
											<div class="col-md-6">
												<label for="id_merchant_type" style="float: right"
													class="control-label"><span>Category :<a
														style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-md-6">
												<select class="form-control select2" name="merchantType"
													id="id_merchant_type" style="width: 100%; height: 30px"
													tabindex="-1" aria-hidden="true" id="add-codeType">
													<option value="">Category</option>
													<option value="1">Wallet Seller</option>
													<option value="2">General Merchant</option>

												</select>

											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_global_sale_id" style="float: right"
													class="control-label"><span>Sub-Category<a
														style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6" style="padding-top: 8px;">
												<select class="form-control select2" name="globalSale"
													id="id_global_sale_id" style="width: 100%; height: 30px"
													tabindex="-1" aria-hidden="true" id="add-codeType">
													<option value="">Sub Category</option>
													<option value="Y">Yes</option>
													<option value="N">No</option>
												</select>

											</div>
										</div>

									</div>

									<div class="row" style="margin-top: 10px; padding-right: 55px">
										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">Contact Name&nbsp;:<a
													style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													placeholder="Contact Name" id="id-contact-name"
													maxlength="85" onchange="return trim(this)"
													name="contactName">

											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_card_group_id" style="float: right"
													class="control-label"><span>Wallet
														Group&nbsp;:&nbsp;<a style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="11" class="form-control"
													placeholder="Wallet Group" name="cardGrp"
													onchange="return trim(this)" id="id_card_group_id"
													onkeypress="return isNumber(event)">
											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; padding-right: 55px">

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">Address 1:<a
													style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<textarea class="form-control" onchange="return trim(this)" name="address1"> </textarea>
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_card_group_id" style="float: right"
													class="control-label"><span>Address 2: 
												</span></label>
											</div>
											<div class="col-sm-6">
												<textarea class="form-control" onchange="return trim(this)" name="address2"> </textarea>
											</div>
										</div>
									</div>
									<!-- change -->
									<div class="row" style="margin-top: 10px; padding-right: 55px">

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">P.O.BOX:<a style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="pobox"
													onkeypress="return isNumber(event)">
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_card_group_id" style="float: right"
													class="control-label"><span>Zip Code :<a
														style="color: red">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="zip"
													onkeypress="return isNumber(event)">

											</div>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; padding-right: 55px">
 										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">State:<a style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="state">

											</div>
										</div>
										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name" style="float: right"
													class="control-label">ANB Account Number:<a
													style="color: red">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													placeholder="Account Number" id="id-anb-accountNumber"
													maxlength="85" name="anbAccountNumber"
													onkeypress="return isNumber(event)">

											</div>
										</div>
									</div>
									
									

								 
				 </div>

			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-success"
					id="id_merchant_details_save">
					<i class="fa fa-check"></i>&nbsp;Register
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="id_cancel_save_merchantDetails">
					<i class="fa fa-refresh"></i>&nbsp;Clear
				</button>
			</div>
		</div>



		<!--footer section start-->
			<footer>
			   <p>&copy 2015 Easy Admin Panel. All Rights Reserved | Design by <a href="" target="_blank"></a></p>
			</footer>
        <!--footer section end-->
        
	<script src="${pageContext.request.contextPath}/resources/dashboard/js/jquery.nicescroll.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/dashboard/js/scripts.js"></script> --%>
</div>
</body>
</html>
		</tiles:putAttribute>
</tiles:insertDefinition>