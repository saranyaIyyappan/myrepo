<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="User List" />
 	<tiles:putAttribute name="body">
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/portalUser.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/portalUser.js"></script>
	   <div><div class="row-1">
			<div class="row serboxe">
				<form class="form-inline">
					<div class="form-group">
						<label for="exampleInputName2">User ID</label> <input type="text"
							class="form-control" id="id-user-id" placeholder="User ID">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail2">User Name</label> <input
							type="email" class="form-control" id="id-user-name"
							placeholder="User Name">
					</div>
					<button type="button" class="btn btn-info btn-sm btn_padding"
						id="id_search_user">
						<i class="fa fa-search"></i> Search
					</button>
					<button type="button" class="btn btn-warning btn-sm btn_padding"
						id="id_clear_user">
						<i class="fa fa-refresh"></i>&nbsp;&nbsp;Clear&nbsp;&nbsp;
					</button>
				</form>
			</div>
			</div>
		</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="">
							<div class="col-md-12 col-sm-12 col-xs-12"> 
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12 ">
										<div class=" control-2">
											<h3>
											<i class="fa fa-list-alt customHead_Fa" aria-hidden="true">User
													List</i>
											</h3>
											<div class="col-md-12 table-div-sub-sub" id="no-more-tables">
												<table id="id-portalUserList"
													 class="col-md-12 table-bordered table-striped table-condensed cf">
													<thead class="cf">
														<tr>
															<th>User ID</th>
															<th>User Name</th>
															<th>Email ID</th>
															<th>Mobile Number</th>
															<th>Status</th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
						</div>
					</div>
					<div class=" pull-right grid-tools">
						<button type="button" class="btn btn-success btn-sm"
							id="id-create-user">
							<i class="fa fa-plus"></i>Create
						</button>
						<button type="button" class="btn btn-warning btn-sm"
							id="id-editUser">
							<i class="fa fa-pencil"></i>Edit
						</button>
						<button type="button" class="btn btn-danger btn-sm"
							id="id-deleteUser">
							<i class="fa fa-remove"></i>Delete
						</button>
						<button type="button" class="btn btn-success btn-sm"
							id="id-verify-user">
							<i class="fa fa-upload"></i>Verify
						</button>
					</div>
				</div>
			</div>
		</div>

		<!--edit modal -->
		<div class="modal fade" data-backdrop="static"
			id="id-userDetails-edit" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="id_group_header" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b>Edit User Details</b>
						</h4>
					</div>
					<div class="modal-body">
						<a class="star">(*)Fields Are Mandatory</a>
						<form id="id-form-edit-user" class="form-horizontal">
							<div class="box-body">
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">User
										ID :<a class="star">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-edit-userId" name="userId" placeholder="User Id"
											readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">User
										Name :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-edit-userName" name="userName" placeholder="User Name">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Mobile
										Number :<a style="color: red">*</a>
									</label>

									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-edit-mobileNumber" name="cellNo"
											placeholder="Mobile Number">
									</div>
								</div>

								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Email
										Id :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-edit-emailId" name="emaild" placeholder="Email  Id">
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success" id="edit_user_btn">
									<i class="fa fa-pencil"></i> Update
								</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">
									<i class="fa fa-close"></i>Cancel
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--edit modal -->
		<div class="modal fade" data-backdrop="static"
			id="id-userDetails-create" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="id_group_header" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b>Create User Details</b>
						</h4>
					</div>
					<div class="modal-body">
						<a style="color: red">(*)Fields Are Mandatory</a>
						<form id="id-form-create-User" class="form-horizontal">
							<div class="box-body">
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">User
										ID :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-create-userId" name="userId" placeholder="User Id">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">User
										Name :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-create-userName" name="userName"
											placeholder="User Name">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Mobile
										Number :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-create-mobileNumber" name="cellNo"
											placeholder="Mobile Number">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Email
										Id :<a style="color: red">*</a>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" maxlength="35"
											id="id-create-emailId" name="emaild" placeholder="Email  Id">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Password :<a
										style="color: red">*</a></label>
									<div class="col-sm-7">
										<input type="password" class="form-control" maxlength="35"
											id="id-create-password" placeholder="Password"
											name="password">
									</div>
								</div>
								<div class="form-group">
									<label for="id_edit_merchant_id" class="col-sm-5 control-label">Confirm-Password :<a
										style="color: red">*</a></label>
									<div class="col-sm-7">
										<input type="password" class="form-control" maxlength="35"
											id="id-create-confirmPassword" name="confirmPassword"
											placeholder="Confirm Password">
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									id="btn-create-user">
									<i class="fa fa-pencil"></i> Create
								</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="btn-create-cancel-user">
									<i class="fa fa-close"></i>Cancel
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- - -->
		<div class="modal fade" data-backdrop="static"
			id="id-user-verify-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="reject_userq" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b><c:out value="Verify User Details" /></b>
						</h4>
					</div>
					<div class="modal-body">
						<h4>
							<c:out value="Are you sure, you want to Verify ?" />
						</h4>
					</div>
					<div class="modal-footer">
						<div style="float: right; margin-right: 3px;">
							
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i>No
							</button>
						</div>
						<div style="margin-right: 77px;">
							<button id="btn-verify-confirm" type="button"
								class="btn btn-success">
								<i class="fa fa-check"></i>Yes
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" data-backdrop="static"
			id="id-user-delete-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="reject_userq" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b><c:out value="Delete User Details" /></b>
						</h4>
					</div>
					<div class="modal-body">
						<h4>
							<c:out value="Are you sure, you want to Delete ?" />
						</h4>
					</div>
					<div class="modal-footer">
						<div style="float: right; margin-right: 3px;">
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i>No
							</button>
						</div>
						<div style="margin-right: 77px;">
							<button id="btn-delete-user-confirm" type="button"
								class="btn btn-success">
								<i class="fa fa-check"></i>Yes
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</div></div> 
	</tiles:putAttribute>
</tiles:insertDefinition>