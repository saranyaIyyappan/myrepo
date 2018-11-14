<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="Merchant Details" />
	<tiles:putAttribute name="body">
		<link
			href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css"
			rel="stylesheet">
			<link href="${pageContext.request.contextPath}/resources/css/merchantDetails.css" rel="stylesheet">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/merchantDetails.js"></script>
 	<div class="container-fluid login-bknd">
			<div class="container">
				<div class="merchant-login"  id="id-gif">
					<div class="login-sign-bg">Login to Your Account</div>
					<div class="account-wall">
					
						<form  id="id_form_merchant_login">
							<input type="text" class="form-control" id="id_userId"
								name="userId" placeholder="Enter Your Mobile Number" required
								autofocus> &nbsp; <input type="password" 
								class="form-control pwd" style="margin-bottom: 20px;" id="id_pasword"  name="password"
								placeholder="Password" required >
							<button class="btn  btn-primary btn-block sign-btn" type="button" onclick="merchantsignin()"
								id="id-merchant-login">Sign in</button>
							<button class="btn  btn-primary btn-block sign-btn" type="button"
								id="id_mearchant_Signup">Sign Up</button>
							<input type="hidden" name="groupId" value="1"> <a
								href="#" class="need-help"
								id="id_forgot_password_merchant">Forgot UserId/Password? </a><span
								class="clearfix"></span>
						</form>
					</div>
					<div id="img-load" align="center"><img class="img-responsive load-img-login"  src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
				</div>
			</div>
		</div>

		<!----------------------------------------------------------Save Merchant Details Modal----------------------------------  -->
		<div class="modal fade merchantmodal" data-backdrop="static"
			data-keyboard="false" id="id_merchant_signup_modal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog  modal-lg" role="document">
				<div class="modal-content" id="">
					<div id="id_merchant_signup_header" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							id="id_close_modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b style="color: #fff;letter-spacing: 0px;">Merchant Registration</b>
						</h4>
					</div>
					<div class="modal-body registration">
						<div class="tab">
							<button class="tablinks " onclick="openCity(event, 'London')"></button>
							<button class="tablinks" onclick="openCity(event, 'Paris')"></button>

						</div>
						<form id="id_merchant_signup_form" class="form-horizontal"> 
						<div id="London" class="tabcontent">
							 	<input type="hidden" maxlength="100" class="form-control"
									placeholder="" name="" id="id_input_hidden_user">
								<div class="box-body">

									<div class="row content-row">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id-merchant-id"
													class="control-label"><span>Mobile Number:</span><a class="star">*</a> </label>
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
												<label for="id-alternate_id"
													class="control-label"><span>Alternative
														Mobile Number: <a class="star">*</a>
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
									<div class="row content-row">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id-merchant-id"
													class="control-label"><span>Email Id:</span><a class="star">*</a> </label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="35" class="form-control"
													placeholder="EmailID" id="id-emailId" name="emailId" onchange="return trim(this)">
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_merchant_name" 
													class="control-label"><span>CR Number:<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="85" class="form-control"
													placeholder="CR Number" id="id-cr-number" name="crNumber" onkeypress="return isNumber(event)" onchange="return trim(this)">
											</div>
										</div>
									</div>
									<div class="row content-row">
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_merchant_name"
													class="control-label"><span>Name of Shop
														&nbsp;:<a class="star">*</a>
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
												<label for="id_merchant_name"
													class="control-label"><span>Name of Shop
														&nbsp;:<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" maxlength="85" class="form-control"
													placeholder="(Arabic)" id="id_shop_name_arabic"
													name="merchantNameArb" onchange="return trim(this)">
											</div>
										</div>
									</div>


									<div class="row content-row">
										<div class="col-md-6">
											<div class="col-md-6">
												<label for="id_merchant_type"
													class="control-label"><span>Category :<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-md-6">
												<select class="form-control select2" name="merchantType"
													id="id_merchant_type"
													tabindex="-1" aria-hidden="true" id="add-codeType">
													<option value="">Category</option>
													<option value="1">Wallet Seller</option>
													<option value="2">General Merchant</option>

												</select>

											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_global_sale_id"
													class="control-label"><span>Sub-Category<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6 sub" >
												<select class="form-control select2" name="globalSale"
													id="id_global_sale_id"
													tabindex="-1" aria-hidden="true" id="add-codeType">
													<option value="">Sub Category</option>
													<option value="Y">Yes</option>
													<option value="N">No</option>
												</select>

											</div>
										</div>

									</div>

									<div class="row content-row" >
										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name"
													class="control-label">Contact Name&nbsp;:<a class="star">*</a></label>
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
												<label for="id_card_group_id"
													class="control-label"><span>Wallet
														Group&nbsp;:&nbsp;<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<!-- <input type="text" maxlength="11" class="form-control"
													placeholder="Card Group" name="cardGrp"
													onchange="return trim(this)" id="id_card_group_id"
													onkeypress="return isNumber(event)"> -->
													
													<select class="form-control select2" name="cardGrp"id="id_card_group_id"tabindex="-1" aria-hidden="true">
													
												</select>
													
											</div>
										</div>
									</div>
									<div class="row content-row">

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name"
													class="control-label">Address 1:<a class="star">*</a></label>
											</div>
											<div class="col-sm-6">
												<textarea class="form-control" onchange="return trim(this)" name="address1" id="id-address1"> </textarea>
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_card_group_id"
													class="control-label"><span>Address 2: 
												</span></label>
											</div>
											<div class="col-sm-6">
												<textarea  class="form-control"  name="address2" id="id-address2"> </textarea>
											</div>
										</div>
									</div>
									<!-- change -->
									<div class="row content-row" >

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name"
													class="control-label">P.O.BOX:<a class="star">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="pobox"
													onkeypress="return isNumber(event)" id="id-pobox">
											</div>
										</div>
										<div class="col-md-6">
											<div class="col-sm-6 ">
												<label for="id_card_group_id"
													class="control-label"><span>Zip Code :<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="zip"
													onkeypress="return isNumber(event)" id="id-zip-code">

											</div>
										</div>
									</div>
									<div class="row content-row">

										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name"
													class="control-label">State:<a class="star">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													onchange="return trim(this)" name="state" id="id-state">

											</div>
										</div>
										<div class="col-sm-6 ">
											<div class="col-sm-6 ">
												<label for="id-contact-name"
													class="control-label">ANB Account Number:<a class="star">*</a></label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													placeholder="Account Number" id="id-anb-accountNumber"
													maxlength="85" name="anbAccountNumber"
													onkeypress="return isNumber(event)" onchange="return trim(this)">

											</div>
										</div>
									</div>

									<div class="row content-row" >
										<div class="col-md-9"></div>
										<div class="col-md-2">
											<button type="button" class="btn btn-success btn-modal" id="id_merchant_details_next">
												<i class="fa fa-check"></i>Next
											</button>

										</div>
									</div>
								</div>
						</div>

						<div id="Paris" class="tabcontent">
							<!-- <h3>Paris</h3>
  							<p>Paris is the capital of France.</p> 
  							 -->
							
								<input type="hidden" maxlength="100" class="form-control"
									placeholder="" name="" id="id_input_hidden_user">
								<div class="box-body">
									<div class="row">
										<div class="col-md-1"></div>
										<div class="col-md-8">
											<div class="col-sm-6">
												<label for="id_password"
													class="control-label"><span></span>Merchant
													Id&nbsp;:&nbsp;<a class="star">*</a></label>
											</div>
											<div class="col-sm-6 sub">
												<input type="text" readonly="readonly" maxlength="100"
													class="form-control" placeholder="" id="id_merId"
													name="merId">

											</div>
										</div>
									
									</div>
							
									<div class="row">
										<div class="col-md-1"></div>
										<div class="col-md-8">
											<div class="col-sm-6">
												<label for="id_password"
													class="control-label"><span></span>Password <div class="glyphicon glyphicon-info-sign myClass" data-toggle="tooltip" data-placement="right" title="*one letter should be capital                                                                     *atleast minimum eight letters                                                     *one special character                                                                          *Must contains one number"  aria-hidden="true"></div>&nbsp;:&nbsp;<a class="star">*</a></label>
											</div>
											<div class="col-sm-6 sub">
												<input type="password" maxlength="100" class="form-control pwd"
													placeholder="Password" id="id_password" name="password"
													
													onkeypress="return trim(this)">
<div class="progress">
                    <div class="progress-bar progress-bar-danger" id="password-progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0">
                        <span class="sr-only">0% Complete (danger)</span>
                        <span id="progress-bar-text" style="color:#000;"></span>
                    </div></div>
											</div>
										</div>
										
									</div>
							

									<div class="row ">
										<div class="col-md-1"></div>
										<div class="col-md-8">
											<div class="col-sm-6 ">
												<label for="id_confirm_password" 
													class="control-label"><span>Confirm
														Password&nbsp;:&nbsp;<a class="star">*</a>
												</span></label>
											</div>
											<div class="col-sm-6">
												<input type="password" maxlength="100" class="form-control"
													placeholder="Confirm Password" name=""
													id="id_confirm_password" onchange="return trim(this)">
											</div>
										</div>
										
									</div>
									<div class="row content-row">

										<div class="row sub">
											<div class="col-md-6"></div>
											<div class="col-md-2">

												<button type="button" class="btn btn-success btn-modal"
													 id="id_merchant_details_previous">
													<i class="fa fa-check"></i>Previous
												</button>
											</div>
										</div>
									</div>


								</div>
						</div></form>
						<h5></h5>

					</div>
					<div class="modal-footer">
						<div class="row">
							<!-- <div class="col-sm-6">&nbsp;</div> -->
							<div class="col-sm-2"></div>
							<div class="col-sm-4" id="id_dynamic_but_div"></div>
							<div class="col-sm-6">
								<button type="button" class="btn btn-success btn-modal" id="id_merchant_details_save">
									<i class="fa fa-check"></i>Register
								</button>
								<button type="button" class="btn btn-danger btn-modal"data-dismiss="modal"
									id="id_cancel_save_merchantDetails">
									<i class="fa fa-close"></i>Cancel
								</button>

							</div>
						</div>

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
								<div class="row div-forgot">

									<div align="center">
										<div class="col-md-6">

											<label for="id_userId_password"
												class="control-label"><span>Forgot
													Password/User Id&nbsp;:<a class="star">*</a>
											</span></label>
										</div>
										<div class="col-md-6">
											<label> <input type="radio" id="id_check_password"
												name="checkSelect">Password
											</label> <label> <input type="radio" id="id_check_userId"
												name="checkSelect">UserId
											</label>



										</div>
									</div>

								</div>
								<div class="row div-forgot">

									<div align="center">
										<div class="col-md-6">

											<label for="id_userId_forgot_password"
												class="control-label"><span>Enter user
													Id&nbsp;:<a class="star">*</a>
											</span></label>
										</div>
										<div class="col-md-6">

											<input type="text" maxlength="85" class="form-control"
												placeholder="Enter Mobile Number"
												id="id_userId_forgot_password" name="merchantId">





										</div>
									</div>

								</div>



								<div class="row div-forgot" >

									<div align="center">
										<div class="col-md-6">

											<label for="id-forgot-password"
												class="control-label"><span>Password&nbsp;:<a class="star">*</a></span></label>
										</div>
										<div class="col-md-6">

											<input type="password" maxlength="85" class="form-control"
												placeholder="Password" id="id-forgot-password"
												name="password">





										</div>
									</div>

								</div>
								<div class="row div-forgot">

									<div align="center">
										<div class="col-md-6">

											<label for="id-email-Id_forgot_password"
												class="control-label"><span>Enter Email
													Id&nbsp;:<a class="star">*</a>
											</span></label>
										</div>
										<div class="col-md-6">

											<input type="text" maxlength="85" class="form-control"
												placeholder="Email Id" id="id-email-Id_forgot_password"
												name="emailId">





										</div>
									</div>

								</div>






							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-modal" id="id__mail_submit">
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



	</tiles:putAttribute>
</tiles:insertDefinition>
