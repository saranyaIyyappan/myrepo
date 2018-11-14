<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Card Group" />
	<tiles:putAttribute name="body">

   <script src="${pageContext.request.contextPath}/resources/js/cardGroup.js"></script>
        <!--body wrapper start-->
        <div class="container">
         
        <!-- put your main code here --> 

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">

							<div class="col-md-12" style="padding-top: 20px">
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

					<div class="pull-right grid-tools" style="padding-top: 30px; margin-right: 35px">
						<button type="button" class="btn btn-success btn-sm"
							id="id-add-giftCard">
							<i class="fa fa-plus"></i><span>Create</span>
						</button>


						<button type="button" class="btn btn-warning btn-sm"
							id="id-edit-giftCard">
							<i class="fa fa-pencil"></i><span>Edit</span>
						</button>


						 <button type="button" class="btn btn-danger btn-sm"
							id="id-delete-giftCard" style="height: 37px;">
							<i class="fa fa-remove"></i><span>Delete</span>
						</button> 
						
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
													<label for="id-card-group-id" class="col-sm-5 control-label"> Wallet Group: <a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 
														 <select class="form-control column_filter" aria-hidden="true"
										                         id="id-card-group-id" name="cardGrp" style="height:34px;">
										                         <option value="selected"disabled>Select</option>
										                         <option value="1">Hyper Markets</option>
										                         <option value="2">Malls</option>
										                         <option value="3">Products</option>
										                         <option value="4">Other</option>
									                     </select>
														 
													</div>
												</div>
												<div class="form-group">
													<label for="id-cardName-english" class="col-sm-5 control-label"> Wallet Name [ENGLISH]: <a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 
														 <input class="form-control" placeholder="Wallet Name [ENGLISH]" maxlength="65"
														 type="text" name="groupNameEng" id="id-cardName-english" />
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="id-cardName-arab" class="col-sm-5 control-label">Wallet Name [ARABIC]: <a style="color: red">*</a>
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
													data-dismiss="modal" id="card-group-add-cancel" style="height: 37px;">
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
						
						<!--card grp edit modal starts -->
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
													<label for="cardName-english-edit" class="col-sm-5 control-label">Wallet Name [ENGLISH]:<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 <input class="form-control" placeholder="Wallet Name [ENGLISH]" maxlength="65"
														 type="text" id="cardName-english-edit" name="groupNameEng"/>
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="cardName-arabic-edit" class="col-sm-5 control-label">Wallet Name [ARABIC]:<a style="color: red">*</a>
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
													data-dismiss="modal" id="giftCard-edit-cancel" style="height: 37px;">
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
						
						<!-- card grp delete -->
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
										<div style="float: right; margin-right: 3px;">
											<form id="id-giftCard-delete-form">
												<input type="hidden" name="cardGrp" id="hidden-giftCard-group-id-delete">
												<button id="delete-giftCard-row" type="button" class="btn btn-success">
													<!-- 	<span name="39" ></span> -->
													<i class="fa fa-check"></i>
													<c:out value="Yes" />
												</button>
											</form>
										</div>
										<div style="margin-right: 77px;">
											<button type="button" class="btn btn-danger" data-dismiss="modal" style="height: 37px;">
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