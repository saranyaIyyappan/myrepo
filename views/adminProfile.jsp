<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Admin Profile" />
	<tiles:putAttribute name="body">

		<!--body wrapper start-->
		<div class="container">
			<div class="x_content">
				<div class="x_title">
					<h4>
						<span id="id-employee-name-id"></span>
					</h4>
					<div class="clearfix"></div>
				</div>
				<div class="row"></div>
				<div class="row">

					<div class="col-md-4">
						<div class="row"></div>
						<input type="hidden" id="hidden-updateStatus-details"
							value="${updateStatus}" />
						<form method="POST" enctype="multipart/form-data"
							id="id-form-employee-profile-profile" class="form-horizontal"
							action="${pageContext.request.contextPath}/adminProfile/uploadPhoto">
							<div>
								<div class="profile_img">
									<div id="crop-avatar">
										<input type="hidden" id="propic" name="profilePicture">
										<!-- Current avatar -->
										<!-- style="height: 170px; width: 170px;"  -->
										<img class="img-responsive-profile avatar-view"
											src="${pageContext.request.contextPath}/resources/img/user.png"
											alt="Avatar" title="Change the profile picture" id="profilePictureModal"
											name="profilePictureModal"> <input type="file"
											id="chooseFile" onchange="readURL(this);"
											name="docFile"
											accept=".jpg,.jpeg,.png" />
									</div>

									<div>&nbsp;</div>
									<div class="row">
										<!-- <div class="col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
										<div class="col-sm-12">
											&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-success"
												id="fileUploadBtn"><i class="fa fa-upload m-right-xs"></i>&nbsp;Upload
												Photo</a>
										</div>
										<!-- <div class="col-sm-2">&nbsp;</div> -->
									</div>
									<div>&nbsp;</div>
								</div>
								<ul class="list-unstyled user_data">
									<!--  <li><i class="fa fa-map-marker user-profile-icon"></i>
                        
                        </li>
 -->
									<li><i class="fa fa-briefcase user-profile-icon"></i> <span
										id="id-designation-id"></span></li>

									<li><i class="fa fa-briefcase user-profile-icon"></i> <span
										id="id-employee-code-id"></span></li>
									<!-- <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>
                          <a href="#" target="_blank"></a>
                        </li> -->
								</ul>




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
							id="id-form-employee-profile-details" class="form-horizontal"
							action="${pageContext.request.contextPath}/adminProfile/updateAdminProfile">
							<div>
								<%-- <div class="profile_img">
                        <div id="crop-avatar">
                         <input type="hidden" id="hidden-updateStatus-details"
					value="${updateStatus}"/>
                        <input type="hidden" id="propic" name="profilePicture">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="${pageContext.request.contextPath}/resources/img/user.png" 
                          alt="Avatar" title="Change the profile picture" style="height: 170px; width:170px;"
                          id="profilePictureModal" name="profilePictureModal">
                         <input type="file" id="chooseFile"  onchange="readURL(this);"   style="display: none;" name="docFile" accept=".jpg,.jpeg,.png"/>
                        </div>
                        
                        <div>&nbsp;</div>
                        <div class="row">
                        	<!-- <div class="col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
                        	<div class="col-sm-12">&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a class="btn btn-success" id="fileUploadBtn"><i class="fa fa-upload m-right-xs"></i>&nbsp;Upload Photo</a>
                        	</div>
                        	<!-- <div class="col-sm-2">&nbsp;</div> -->
                        </div>
                         <div>&nbsp;</div>
                      </div> --%>
								<!-- <h3>Samuel Doe</h3> -->



								<!--         <ul class="list-unstyled user_data">
                        <li><i class="fa fa-map-marker user-profile-icon"></i>
                        
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i>
                           <span id="id-designation-id"></span>
                        </li>
                        
						<li>
                          <i class="fa fa-briefcase user-profile-icon"></i>
                           <span id="id-employee-code-id"></span>
                        </li>
                        <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>
                          <a href="#" target="_blank"></a>
                        </li>
                      </ul>
 -->



							</div>
							<div>

								<div class=""></div>
								<!-- start of user-activity-graph -->
								<!--<div id="graph_bar" style="width:100%; height:280px;"></div>-->
								<!-- end of user-activity-graph -->

								<div class="" role="tabpanel" data-example-id="togglable-tabs">
									<div class="col-md-12">
										<div class="col-md-8">

											<!-- <div class="form-group">
						<label for="id-employee-id" class="col-sm-3 control-label">Employee Id</label>
							<div class="col-md-4">
								<input type="text" class="form-control" style="width: 300px; height: 30px;" name="employeeId"  readonly>
							</div>
						</div> -->
										</div>
										<br>
										<br>
										<!--      <div class="col-md-12" style="margin-top:10px;">
                        <div class="form-group">
						<label for="id-mobile" class="col-sm-3 control-label">Mobile :</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="mobile" id="id-mobile" maxlength="20">
							</div>
						</div>
                        </div> -->
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-eMail" class="col-sm-3 control-label">E-Mail
													:<a class="star">*</a>
												</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="emaild"
														id="id-eMail" maxlength="50">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-poboxNumber" class="col-sm-3 control-label">Cell
													Number:</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="cellNo"
														id="id-poboxNumber" maxlength="50">
												</div>
											</div>
										</div>

										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-curnt-passwrd-merchant"
													class="col-sm-3 control-label">Current Password :</label>
												<div class="col-sm-9">
													<input type="password" class="form-control" name="password"
														id="id-curnt-passwrd-merchant"
														placeholder="Current Password" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-new-passwrd-employee"
													class="col-sm-3 control-label">New Password :</label>
												<div class="col-sm-9">
													<input type="password" class="form-control"
														name="passwordNew" id="id-new-passwrd-employee"
														placeholder="New Password" onclick="passwordChange()"
														onchange="return trim(this)" maxlength="100">
												</div>
											</div>
										</div>
										<div class="col-md-12 field-data">
											<div class="form-group">
												<label for="id-conform-passwrd-employee"
													class="col-sm-3 control-label">Confirm Password :</label>
												<div class="col-sm-9">
													<input type="password" class="form-control"
														name="confirmPassword" id="id-conform-passwrd-employee"
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
	<link  href="${pageContext.request.contextPath}/resources/css/adminProfile.css" rel="stylesheet">
		<script
			src="${pageContext.request.contextPath}/resources/js/adminProfile.js"></script>
	
		<script
			src="${pageContext.request.contextPath}/resources/js/cardCategory.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>