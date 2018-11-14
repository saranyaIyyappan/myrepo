<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Admin Dashboard" />
	<tiles:putAttribute name="body">
	<link href="${pageContext.request.contextPath}/resources/css/adminDashboard.css" rel="stylesheet">
	  <script src="${pageContext.request.contextPath}/resources/js/cardGroup.js"></script>
	     <div class="container">
         
        <!-- put your main code here --> 

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 top-div">
						<!-- <div class="container-fluid control-2"> -->
							<!-- <i class="fa fa-list-alt customHead_Fa" aria-hidden="true">
								Gift Card Results</i> -->
							<div class="col-md-12 table-div-sub">
								<table id="giftCardList"
									class="table table-bordered table-hover dataTable responsive nowrap">
									<thead>
										<tr>
											<th>Wallet Group</th>
								            <th>Wallet Name [ENGLISH]</th>
								            <th>Wallet Name [ARABIC]</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="pull-right grid-tools">
						<button type="button" class="btn btn-success btn-sm"
							id="id-add-giftCard">
							<i class="fa fa-plus"></i><span>Create</span>
						</button>

						<button type="button" class="btn btn-warning btn-sm"
							id="id-edit-giftCard">
							<i class="fa fa-pencil"></i><span>Edit</span>
						</button>

						 <button type="button" class="btn btn-danger btn-sm"
							id="id-delete-giftCard">
							<i class="fa fa-remove"></i><span>Delete</span>
						</button> 
						
						 <!-- <button type="button" class="btn btn-success btn-sm"
							id="medicineMaster-upload-id">
							<i class="fa fa-upload"></i>
							<span name="17" ></span>
								&nbsp;	&nbsp;	&nbsp;	&nbsp;File Upload	&nbsp;	&nbsp;	&nbsp;	&nbsp;
						</button>
						<button type="button" class="btn btn-success btn-sm"
							id="medicineMaster-download-id">
							<i class="fa fa-download"></i>
							<span name="14" ></span>
							Template Download
						</button> -->
						
					</div>
					
				</div>

			</div>


		
	 <!-- add modal starts -->
		<div class="modal fade giftCard-add-modal" data-backdrop="static" 
		                  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content" id="">
									<div id="add-gift-Card" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												<!-- <span name="19" ></span> --> Add Wallet
											</b>
										</h4>
									</div>
									<div class="modal-body">
										<!-- <h5>
											<a style="color: red">(*)<span name="20" ></span>
												Fields Are Mandatory
											</a>
										</h5> -->
										<form id="giftCard-add-form" class="form-horizontal">
											<div class="box-body">
											
												<div class="form-group">
													<label for="id-card-group-id" class="col-sm-5 control-label"> Wallet Group: <a class="star">*</a>
													</label>
													<div class="col-sm-7">
														 
														 <select class="form-control column_filter" aria-hidden="true"
										                         id="id-card-group-id" name="cardGrp">
										                         <option value="selected"disabled>Select</option>
										                         <option value="1">Hyper Markets</option>
										                         <option value="2">Malls</option>
										                         <option value="3">Products</option>
										                         <option value="4">Other</option>
									                     </select>
														 
													</div>
												</div>
												<div class="form-group">
													<label for="id-cardName-english" class="col-sm-5 control-label"> Wallet Name [ENGLISH]: <a class="star">*</a>
													</label>
													<div class="col-sm-7">
														 
														 <input class="form-control" placeholder="Wallet Name [ENGLISH]" maxlength="65"
														 type="text" name="groupNameEng" id="id-cardName-english" />
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="id-cardName-arab" class="col-sm-5 control-label">Wallet Name [ARABIC]: <a class="star">*</a>
													</label>
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Name [ARABIC]" maxlength="65"
														 type="text" name="groupNameArb" id="id-cardName-arab"/>
													</div>
												</div> 
																							
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success"
													id="card-group-save">
													<i class="fa fa-check"></i>
													<!-- <span name="34" ></span> -->
													Save
												</button>
												<button type="button" class="btn btn-danger"
													data-dismiss="modal" id="card-group-add-cancel">
													<i class="fa fa-close"></i>
													<!-- <span name="35" ></span> -->
													Cancel
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
						<!-- /add modal ends-->
						
						<!--medicine master edit modal starts -->
						<div class="modal fade giftCard-Edit_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content" id="">
									<div id="edit-gidt-card" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												<!-- <span name="19" ></span> --> Edit Wallet 
											</b>
										</h4>
									</div>
									<div class="modal-body">
										<!-- <h5>
											<a style="color: red">(*)<span name="20" ></span>
												Fields Are Mandatory
											</a>
										</h5> -->
										<form id="giftCard-edit-form" class="form-horizontal">
											<div class="box-body">
												<div class="form-group">
													<!-- <label for="card-group-edit" class="col-sm-5 control-label">Card Group: 
													</label> -->
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Group" maxlength="11"
														 type="hidden" id="card-group-edit" name="cardGrp" readonly="readonly"/>
													</div>
												</div>
												<div class="form-group">
													<label for="cardName-english-edit" class="col-sm-5 control-label">Wallet Name [ENGLISH]:<a class="star">*</a>
													</label>
													<div class="col-sm-7">
														 <input class="form-control" placeholder="Wallet Name [ENGLISH]" maxlength="65"
														 type="text" id="cardName-english-edit" name="groupNameEng"/>
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="cardName-arabic-edit" class="col-sm-5 control-label">Wallet Name [ARABIC]:<a class="star">*</a>
													</label>
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Name [ARABIC]" maxlength="65"
														 type="text" id="cardName-arabic-edit" name="groupNameArb"/>
													</div>
												</div> 

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success"
													id="giftCard-update">
													<i class="fa fa-check"></i>
													<!-- <span name="34" ></span> -->
													Update
												</button>
												<button type="button" class="btn btn-danger"
													data-dismiss="modal" id="giftCard-edit-cancel">
													<i class="fa fa-close"></i>
													<!-- <span name="35" ></span> -->
													Cancel
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
						
						<!--modal end  -->
						
						<!-- medicine master delete -->
						<div class="modal fade" data-backdrop="static"
							id="delete-giftCard-modal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div id="delete-gift-card" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												<!-- <span name="17" ></span> --> <!-- <c:out value="Are you sure," /> -->
												<c:out value="Are you sure," /> 
											</b>
										</h4>
									</div>
									<div class="modal-body">
										<h4>
											<!-- <span name="38" ></span> -->
											 <c:out value="Are you sure, you want to delete ?" /> 
									
										 <c:out value="Are you sure, you want to delete ?" /> 
											
										</h4>
									</div>
									<div class="modal-footer">
										<div class="div-yes">
											<form id="id-giftCard-delete-form">
												<input type="hidden" name="cardGrp" id="hidden-giftCard-group-id-delete">
												<button id="delete-giftCard-row" type="button" class="btn btn-success">
													<!-- 	<span name="39" ></span> -->
													<i class="fa fa-check"></i>
													<c:out value="Yes" />
												</button>
											</form>
										</div>
										<div class="div-no">
											<button type="button" class="btn btn-danger" data-dismiss="modal">
												<!-- <span name="40" ></span> -->
												<i class="fa fa-times"></i>
												<c:out value="No" />
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>	
        
	</tiles:putAttribute>
</tiles:insertDefinition>
