<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Card Details" />
	<tiles:putAttribute name="body">
 			<c:if test="${not empty fileUpldStatus}">
				<input type="hidden" id="hidden_fileUpldStatus"
					value="${fileUpldStatus}" />
			</c:if>
       
        <!--body wrapper start-->
        <div class="container">
       <div class="right_col" role="main">

			<div class="row row-1" style="padding-top: 30px">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="">
	<div class="row" style="padding-top: 20px">
							<div class="col-sm-4">
							<label for="id-card-type-search" class="col-sm-4 control-label"
									style="margin-top: 3px">Wallet Type: </label>
								<div class="col-sm-7">
								<select class="form-control column_filter" aria-hidden="true"
										id="id-card-type-search" name="cardType" data-column="0" style="height: 30px">
									<option value="">select</option>
												<option value="0">Rechargeble Wallet</option>
												<option value="1">Non Rechargeble Wallet</option>
												<option value="2">Login Wallet</option>
												<option value="3">Digital Wallet</option>
									</select>
								</div>
							</div>
							<div class="col-md-5">
								<label for="id-merchant-id-search" class="col-sm-4 control-label"
									style="margin-top: 3px">Merchant Id: </label>
								<div class="col-sm-6">

									<select class="form-control column_filter" aria-hidden="true"
										id="id-merchant-id-search" name="merchantId" data-column="0" style="height: 30px">
									</select>

								</div>
							</div>
							 	<div class="col-sm-3 pull-right">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm btn_padding"
									id="id_search_card_details">
									<i class="fa fa-search" style="font-size: 15px"></i> Search
								</button>
								<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id_clear_card_details">
									<i class="fa fa-refresh" style="font-size: 15px"></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button>
                                </div>
						</div>
					</div>
					<div class="row row-1" style="padding-top: 30px">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Wallet Categories</i></h3>
							<div class="col-md-12" style="padding-top: 20px">
									<table id="card-details-table"
								class="table table-bordered table-hover dataTable responsive nowrap">
								<thead>
									<tr>
										<th>Wallet Type</th>
										<th>Wallet Category</th>
										<th>Wallet Theme</th>
										<th>Wallet Group</th>
										<th>Merchant Id</th>
										<th>Location Name</th>
										<th>Wallet Amount</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
						</div>
					</div>
		<div class="pull-right grid-tools"
						style="padding-top: 30px; padding-bottom: 30px; margin-right: 35px">
						
						<button type="button" class="btn btn-success btn-sm"
							id="card-details-create">
							<i class="fa fa-plus"></i>
							<!-- <span name="14" ></span> -->
							Create
						</button>

						<button type="button" class="btn btn-warning btn-sm"
							id="card-details-edit">
							<i class="fa fa-pencil"></i>
							<!-- <span name="16" ></span> -->
							&nbsp;&nbsp;Edit&nbsp;&nbsp;
						</button>
						<button type="button" class="btn btn-danger btn-sm"
							id="card-details-delete" style="height:36px">
							<i class="fa fa-remove"></i>
							<!-- <span name="17" ></span> -->
							Delete
						</button>
						<button type="button" class="btn btn-success btn-sm"
							id="cardDetails-upload-id">
							<i class="fa fa-upload"></i>
							<!-- <span name="17" ></span> -->
							File Upload
						</button>
					</div>

				</div>
				</div>
			</div>
		</div>
		</div>
  <!--  create modal starting -->
			<!--create modal -->

			<div class="modal fade" data-backdrop="static"
				id="id-card-details-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" id="">
						<div id="id_group_header" class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								<b>Add Wallet Details</b>
							</h4>
						</div>
						<div class="modal-body">
							<!-- 	<h5>
							<a style="color: red">(*)Fields Are Mandatory</a>
						</h5> -->
							<form id="card-details-form" class="form-horizontal" action="#">
								<div class="box-body">
									<div class="form-group">
										<label for="id_merchant_id" class="col-sm-5 control-label">Merchant
											ID<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_merchant_id"
												name="merchantId">
												<option value="">Select</option>

											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="id-card-details-cardType"
											class="col-sm-5 control-label">Wallet Type<a
											style="color: red">*</a></label>

										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true"
												id="id-card-details-cardType" name="cardType">
												<option value="">Select</option>
												<option value="0">Rechargable Wallet</option>
												<option value="1">Non Rechargable Wallet</option>
												<option value="2">Login Wallet</option>
												<option value="3">Digital Wallet</option>
											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="id-card-details-card-theme"
											class="col-sm-5 control-label">Wallet Theme<a
											style="color: red">*</a></label>

										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id-card-details-theme"
												name="cardTheme">
												<option value="">Select</option>

											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="id_card_group" class="col-sm-5 control-label">Wallet
											Group<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_card_group"
												name="cardGrp">
												<option value="">Select</option>

											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="id_card_card_category"
											class="col-sm-5 control-label">Wallet Category<a
											style="color: red">*</a></label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_card_card_category"
												name="cardCat">
												<option value="">Select</option>
											</select>
										</div>
									</div>




									<div class="form-group">
										<label for="id_loc_name" class="col-sm-5 control-label">Location
											Name </label>
										<div class="col-sm-7">

											<input type="text" class="form-control" maxlength="35"
												id="id_loc_name" name="locationName"
												placeholder="Location Name">

										</div>
									</div>

									<div class="form-group">
										<label for="id_card_amount" class="col-sm-5 control-label">Card
											Amount<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">

											<input type="text" class="form-control" maxlength="10"
												id="id_card_amount" name="cardAmount"
												placeholder="Wallet Amount"> 
										</div>
									</div>

									<div class="form-group">
										<label for="id_status" class="col-sm-5 control-label">Status
											<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">


											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_status"
												name="status">
												<option value="">Select</option>
												<option value="Active">Active</option>
												<option value="InActive">InActive</option>
												<option value="Blocked">Blocked</option>
												
											</select>
										</div>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										id="create_card_btn">
										<i class="fa fa-check"></i>Create
									</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">
										<i class="fa fa-close"></i>Cancel
									</button>
								</div>
							</form>
						</div>
						<!-- /.box -->

					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- created modal ends here -->

			<!--edit modal -->
		<div class="modal fade" data-backdrop="static"
				id="id-edit_card-details-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" id="">
						<div id="id_group_header" class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								<b>Edit Wallet Details</b>
							</h4>
						</div>
						<div class="modal-body">
							<!-- 	<h5>
							<a style="color: red">(*)Fields Are Mandatory</a>
						</h5> -->
							<form id="card-edit_details-form" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label for="id_edit_merchant_id" class="col-sm-5 control-label">Merchant
											ID<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_edit_merchant_id"
												name="merchantId">
												<option value="">Select</option>

											</select>
										</div>
									</div>
									<input type="hidden" id="hidden_card_id" name="cardId">
									<div class="form-group">
										<label for="id_edit-card-details-cardType"
											class="col-sm-5 control-label">Wallet Type<a
											style="color: red">*</a></label>

										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true"
												id="id_edit-card-details-cardType" name="cardType">
												<option value="">Select</option>
												<option value="0">Rechargable Wallet</option>
												<option value="1">Non Rechargable Wallet</option>
												<option value="2">Login Wallet</option>
												<option value="3">Digital Wallet</option>
											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="id_edit-card-details-card-theme"
											class="col-sm-5 control-label">Wallet Theme<a
											style="color: red">*</a></label>

										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_edit-card-details-theme"
												name="cardTheme">
												<option value="">Select</option>

											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="id_edit_card_group" class="col-sm-5 control-label">Wallet
											Group<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_edit_card_group"
												name="cardGrp">
												<option value="">Select</option>

											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="id_edit_card_card_category"
											class="col-sm-5 control-label">Wallet Category<a
											style="color: red">*</a></label>
										<div class="col-sm-7">
											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_edit_card_card_category"
												name="cardCat">
												<option value="">Select</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="id_edit_loc_name" class="col-sm-5 control-label">Location
											Name </label>
										<div class="col-sm-7">

											<input type="text" class="form-control" maxlength="35"
												id="id_edit_loc_name" name="locationName"
												placeholder="Location Name">

										</div>
									</div>

									<div class="form-group">
										<label for="id_edit_card_amount" class="col-sm-5 control-label">Wallet
											Amount<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">

											<input type="text" class="form-control" maxlength="10"
												id="id_edit_card_amount" name="cardAmount"
												placeholder="Card Amount">  
										</div>
									</div>

									<div class="form-group">
										<label for="id_edit_status" class="col-sm-5 control-label">Status
											<a style="color: red">*</a>
										</label>
										<div class="col-sm-7">


											<select class="form-control select2" style="width: 100%;"
												tabindex="-1" aria-hidden="true" id="id_edit_status"
												name="status">
												<option value="">Select</option>
												<option value="Active">Active</option>
												<option value="InActive">InActive</option>
												<option value="Blocked">Blocked</option>
												
											</select>
										</div>
									</div>

								</div>
								
							</form>
						</div>
						<div class="modal-footer">
									<button type="button" class="btn btn-success"
										id="edit_card_btn">
										<i class="fa fa-pencil"></i> Update
									</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">
										<i class="fa fa-close"></i>Cancel
									</button>
						</div>
						<!-- /.box -->

					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- edit modal ends here -->


			<!-- delete modal starts here -->
			<div class="modal fade" data-backdrop="static"
				id="card-details-delete-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div id="delete-details" class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								<b><c:out value="Are you sure," /></b>
							</h4>
						</div>
						<div class="modal-body">
							<h4>
								<c:out value="Are you sure, you want to delete ?" />
							</h4>
						</div>
						<div class="modal-footer">
							<div style="float: right; margin-right: 3px;">
								<button id="id_btn_delete_details" type="button"
									class="btn btn-success">
									<i class="fa fa-check"></i>
									<c:out value="Yes" />
								</button>
							</div>
							<div style="margin-right: 77px;">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">
									<i class="fa fa-times"></i>
									<c:out value="No" />
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- delete modal ends here -->



<!-- --------------------------------file upload----------------------------- -->
	<!-- modal redesigned for Card data-->
				<div class="modal fade" id="import-excel-windowUpload" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×
								</button>
								<h4 class="modal-title">Upload file</h4>
							</div>
							<div class="modal-body" id="id-modal-bodyUpload">
								<div class="form-horizontal">
									<form class="form-horizontal"
										id="id-form-upload-excel-fileUpload" method="POST"
										enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/cardDetails/excelUploadVirusScan">

										<div class="form-group">

											<label for="inputEmail3" class="col-md-2 control-label">Load
												file</label>
											<div class="col-md-8">
												<label class="btn btn-lg btn-info"
													for="id-transactionFileUpload"
													id="id-label-choose-fileUpload"><span
													class="glyphicon glyphicon-cloud-upload" aria-hidden="true"></span>
													Choose File</label> <input name="transactionFile" type="file"
													id="id-transactionFileUpload" onchange="nameChange()"
													style="visibility: hidden"
													accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,.tsv">
												<span id="uploadedFileName1Upload"></span>
											</div><!-- onchange="setFileNameStaff()"  -->
										</div>
										<iframe id="postiframeUpload" name="postiframe"
											style="display: none;"></iframe>
									</form>

									<div class="form-group">
										<div class="col-md-offset-2 col-sm-offset-2 col-md-5 col-sm-5">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													id="id_pgr_bar_fileUpload" role="progressbar"
													aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
													<!-- content to show on progressbar -->
												</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-body"
													style="background-color: #f1f1f1; color: grey; height: 100px; overflow: auto;"
													id="id-status-panel1Upload">
													<ul id="id-upload-status-listUpload"
														style="list-style: none; padding-left: 5px;">

													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-4">

											<div class="blink blink-infinite" id="id-tri-blinkUpload"
												style="display: inline-block; display: none; text-align: right;">
												<i class="fa fa-exclamation-triangle suspect"
													aria-hidden="true"></i>
											</div>
											<div class="pro-per">
												<span id="id-per-spanFileUpload">0%</span>
											</div>
										</div>

									</div>
									<form class="form-horizontal" id="id-form-inv-upload">

										<div class="modal-body" id="id-dynamic-append-mapUpload"></div>
										<input type="hidden" id="id-hdn-dbColumn-lengthUpload"
											name="dbColumn_length">
									</form>
								</div>
							</div>
							<div class="modal-footer" id="id-footer-buttonsUpload">
								<button type="button" id="id-btn-get-mapping-modalUpload"
									class="btn btn-default">
									<span
										aria-hidden="true"></span> Mapping Screen
								</button>
								<button type="button" id="import-excel-submitFileUpload"
									class="btn btn-success">
									<span class="glyphicon glyphicon-cloud-upload"
										aria-hidden="true"></span> Upload
								</button>
								<button type="button" class="btn btn-danger"
									id="id-btn-import-excel-submitFileUploads" data-dismiss="modal">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									Cancel
								</button>
							</div>

						</div>
					</div>

				</div>
				<!-- modal ends here -->
			
					  <!-- Modal Mapping-->
  <div  class="modal fade" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"id="mapping-modalFileUpload">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Mapping</h4>
        </div>
        <form id="id-form-dynamic-append-using-etcModalFileUpload">
								<!-- <div id="id-div-mapping-dyn">
								</div> -->
        <div class="modal-body" id="id-div-mapping-dyn" style="height:11cm">
        
								
        </div>
        </form>
        <div class="modal-footer">
         <button type="button" id="id-btn-finish"data-dismiss="modal"
									class="btn btn-success">
									<span class="glyphicon glyphicon-cloud-upload"
										aria-hidden="true"></span> Confirm
								</button>
        </div>
      </div>
      
    </div>
  </div>
			<!-- end of mapping modal -->
<script
	src="${pageContext.request.contextPath}/resources/js/carddetails.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/js/cardDetailsFileUpload.js"></script>
		</tiles:putAttribute>
</tiles:insertDefinition>
