<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Merchant Profile" />
	<tiles:putAttribute name="body">
		<script
			src="${pageContext.request.contextPath}/resources/js/merchantProfile.js"></script>
			<link
			href="${pageContext.request.contextPath}/resources/css/merchantProfile.css"
			rel="stylesheet">
		<!--body wrapper start-->
		<div>
			<div class="x_content">

				<div class="x_title">
					

					<div class="clearfix"></div>
				</div>
				<div class="row">

					<div class="col-md-9 serbox">
					<div class="row">
					<div class="col-md-3 head_pad">
						<h4 class="profl_head">
						<span id="id-employee-name-id"></span>
					</h4>
						<form method="POST" enctype="multipart/form-data"
							id="id-form-employee-profile-picture" class="form-horizontal"
							action="${pageContext.request.contextPath}/merchantProfile/uploadPhoto">
							<div>
								<div class="profile_img">
									<div id="crop-avatar">
										<input type="hidden" id="hidden-updateStatus-details"
											value="${updateStatus}" /> <input type="hidden" id="propic"
											name="profilePicture">
										
										<img class="img-responsive-profile avatar-view"
											src="${pageContext.request.contextPath}/resources/img/user.png"
											alt="Avatar" title="Change the profile picture"
											id="profilePictureModal"
											name="profilePictureModal"> <input type="file"
											id="chooseFile" onchange="readURL(this);"
											 name="docFile"
											accept=".jpg,.jpeg,.png" />
									</div>

									<div>&nbsp;</div>
									<div class="row">
										<!-- <div class="col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
										<div class="col-sm-12">
										 <a class="btn btn-success"
												id="fileUploadBtn"><i class="fa fa-upload m-right-xs"></i>&nbsp;Upload
												Photo</a>
										</div>
									</div>
									<div>&nbsp;</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-9">
					
					
						<form method="POST" enctype="multipart/form-data"
							id="id-form-employee-profile-details" class="form-horizontal"
							action="${pageContext.request.contextPath}/merchantProfile/updateMerchantProfile">

							<div>

								<div class="" role="tabpanel" data-example-id="togglable-tabs">
									<div class="col-md-12" id="id-gif">
										<div class="col-md-8"></div>
					                    <div class="col-md-12">
											<div class="form-group">
												 <span class=""></span><h4 class="round-head">Update Your Profile</h4>
											</div>
											
										</div>
										
					
										<div class="col-md-12">
											<div class="form-group">
												<label for="id-merchantId"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Merchant Id :</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control"	id="id-merchantId"  placeholder="merchant Id"  readonly />
												</div>
											</div>
										</div>
										
									 <div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-address-present"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Present Address :<a class="star"
													>*</a></label>
												<div class="col-md-7 col-sm-12">
													<textarea class="form-control" maxlength="200"
														id="id-address-present"
														name="address1" placeholder="Address" onchange="return trim(this)"></textarea>
												</div>
											</div>
										</div>
										
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-address-permanent"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1"> Permanent Address :<a class="star"
													>*</a></label>
												<div class="col-md-7 col-sm-12">
													<textarea class="form-control "
														id="id-address-permanent" maxlength="200" name="address2"
														placeholder="Address" onchange="return trim(this)"></textarea>
												</div>
											</div>
										</div>

										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-eMail" class="col-md-5 col-sm-12 control-label sweepng_pdng_1">E-Mail
													:<a class="star">*</a>
												</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="emailId"
														id="id-eMail" maxlength="50" onchange="return trim(this)">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-poboxNumber" class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Po
													Box:</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="pobox"
														id="id-poboxNumber" maxlength="50" onkeypress="return isNumber(event)">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-zip" class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Zip:</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="zip"
														id="id-zip" maxlength="50" onkeypress="return isNumber(event)">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-city" class="col-md-5 col-sm-12 control-label sweepng_pdng_1">City
													:</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="city"
														id="id-city">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-state" class="col-md-5 col-sm-12 control-label sweepng_pdng_1">State
													:</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="state"
														id="id-state" maxlength="50">
												</div>
											</div>
										</div>

										<div class="col-md-12 field-data" >
											<div class="form-group">
												<label for="id-curnt-passwrd-merchant"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Current Password :</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control" name="password" onblur="passwordChange()"
														id="id-curnt-passwrd-merchant"
														placeholder="Current Password" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-new-passwrd-employee"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1">New Password :</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control" readonly="readonly"
														name="passwordNew" id="id-new-passwrd-employee"
														placeholder="New Password"
														onchange="return trim(this)" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-conform-passwrd-employee"
													class="col-md-5 col-sm-12 control-label sweepng_pdng_1">Confirm Password :</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control"
														name="confirmPassword" id="id-conform-passwrd-employee" readonly="readonly"
														placeholder="Confirm Password"
														onchange="return trim(this)" maxlength="100">
												</div>
											</div>
										</div>
										<div class="form-horizontal">
											<div class="col-sm-6 field-data">
												<div class="form-group">
													<button type="button" id="id-update-merchant-details"
														class="btn btn-success">
														&nbsp;<i class="fa fa-check"></i>&nbsp;Update&nbsp;&nbsp;
													</button>
												</div>
											</div>
										</div>
										<div id="img-load" align="center"><img class="img-responsive load-img-login"  src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
									</div>
									<div id="myTabContent" class="tab-content">
										<div role="tabpanel" class="tab-pane fade active in"
											id="tab_content1" aria-labelledby="home-tab">

											<!-- start recent activity -->

											<!-- end recent activity -->

										</div>
									</div>
								</div>
							</div>
						</form>
						</div>
						</div>
					</div>
				</div>
			</div>
			<!-- put your main code here -->
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>