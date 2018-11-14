<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Consumer Profile" />
	<tiles:putAttribute name="body">

		<!--body wrapper start-->
		<div class="">
			<div class="x_content">

				<div class="x_title">
					<input type="hidden" id="hidden-updateStatus-details"
						value="${updateStatus}" />
					

					<div class="clearfix"></div>
				</div>
				<div class="row">
					<div class="col-md-9 serboxx">
					
					<div class="col-md-3">
					<h4 class="profl_head">
						<span id="id-employee-name-id"></span>
					</h4>
						<form method="POST" enctype="multipart/form-data"
							id="id-form-consumer-profile-profile" class="form-horizontal"
							action="${pageContext.request.contextPath}/consumerProfile/uploadPhoto">
							<div>
								<div class="profile_img">
									<div id="crop-avatar">

										<input type="hidden" id="propic" name="profilePicture">
										<!-- Current avatar -->
										<!-- style="height: 170px; width: 170px;" -->
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
										<!-- <div class="col-sm-2">&nbsp;</div> -->
									</div>
									<div>&nbsp;</div>
								</div>

							</div>
							<div class="col-md-9 col-sm-9 col-xs-12">

								<div class=""></div>
								<!-- start of user-activity-graph -->
								<!--<div id="graph_bar" style="width:100%; height:280px;"></div>-->
								<!-- end of user-activity-graph -->


							</div>
						</form>
					</div>
					<div class="col-md-8">
						<form method="POST" enctype="multipart/form-data"
							id="id-form-consumer-profile-details" class="form-horizontal"
							action="${pageContext.request.contextPath}/consumerProfile/updateConsumertProfile">
							<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
							<div>

								<div class=""></div>
								<div class="" role="tabpanel" data-example-id="togglable-tabs">
									<div class="col-md-12" id="id-gif">
										<div class="col-md-8"></div>
										 <div class="col-md-12">
											<div class="form-group">
												 <span class=""></span><h4 class="round-head">&nbsp;&nbsp;&nbsp;Update Your Profile</h4>
											</div>
											
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-consumerId" class="col-md-4 col-sm-12 control-label sweepng_pdng_1">Consumer Id
													:
												</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control"	id="id-consumerId" placehbolder="consumer Id" readonly/>
												</div>
											</div>
										</div>
																				
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-eMail" class="col-md-4 col-sm-12 control-label sweepng_pdng_1">E-Mail
													:<a class="star">*</a>
												</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="emaild" autofocus="autofocus"
														id="id-eMail" maxlength="50" onchange="return trim(this)">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-poboxNumber" class="col-md-4 col-sm-12 control-label sweepng_pdng_1">Cell
													Number:</label>
												<div class="col-md-7 col-sm-12">
													<input type="text" class="form-control" name="cellNo"
														id="id-poboxNumber" maxlength="50">
												</div>
											</div>
										</div>

										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-curnt-passwrd-consumer"
													class="col-md-4 col-sm-12  control-label sweepng_pdng_1">Current Password:</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control" name="password" onblur="passwordChange()" autocomplete="off" 
														id="id-curnt-passwrd-consumer"
														placeholder="Current Password" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-new-passwrd-consumer"
													class="col-md-4 col-sm-12 control-label sweepng_pdng_1">New Password:</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control" readonly="readonly"
														name="passwordNew" id="id-new-passwrd-consumer"
														placeholder="New Password"
														onchange="return trim(this)" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-conform-passwrd-consumer"
													class="col-md-4 col-sm-12  control-label sweepng_pdng_1">Confirm Password :</label>
												<div class="col-md-7 col-sm-12">
													<input type="password" class="form-control" readonly="readonly"
														name="confirmPassword" id="id-conform-passwrd-consumer"
														placeholder="Confirm Password"
														onchange="return trim(this)" maxlength="100">
												</div>
											</div>
										</div>
										<div class="form-horizontal">
											<div class="col-sm-6 field-data">
												<div class="form-group">
													<button type="button" id="id-update-consumer-details"
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

	<link href="${pageContext.request.contextPath}/resources/css/consumerProfile.css" rel="stylesheet">
		<script
			src="${pageContext.request.contextPath}/resources/js/consumerProfile.js"></script>

	</tiles:putAttribute>
</tiles:insertDefinition>