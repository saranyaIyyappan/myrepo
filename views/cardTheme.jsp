<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Card Theme" />
	<tiles:putAttribute name="body">

    <script src="${pageContext.request.contextPath}/resources/js/cardTheme.js"></script>
       
        <div class="container">

<div class="row row-1">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="container-fluid">
						<i class="fa fa-search customHead_Fa" aria-hidden="true"> Wallet Theme Search
							</i>

						<div class="row" style="padding-top: 20px">
						
							<div class="col-sm-8">
								<label for="card-theme-name-search" class="col-sm-4 control-label"
									style="margin-top:3px">Theme Name[ENGLISH]: </label>
								<div class="col-sm-8">
									<input type="text" id="card-theme-name-search"
										placeholder="Wallet Theme Name" class="form-control" value="" />
								</div>
							</div>
							 <div class="col-sm-1">
							 </div> 
							<div class="col-sm-3">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success btn-sm btn_padding"
									id="id-search-theme">
									<i class="fa fa-search"></i> Search
								</button>
								<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id-clear-theme">
									<i class="fa fa-refresh" style="font-size: 15px"></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button>
                                </div>

						</div>
						
						</div>
				</div>

				<div class="row row-1">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">
						<div class="container-fluid control-2">
							<i class="fa fa-list-alt customHead_Fa" aria-hidden="true">
								Wallet Theme Results</i>

							<div class="col-md-12" style="padding-top: 20px">
								<table id="giftCardThemeList"
									class="table table-bordered table-hover dataTable responsive nowrap">
									<thead>
										<tr>
											<!-- <th>Card Theme</th> -->
								            <th>Wallet Theme Name [ENGLISH]</th>
								            <th>Wallet Theme Name [ARABIC]</th>
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
							id="id-add-giftCard-theme">
							<i class="fa fa-plus"></i><span>Create</span>
						</button>


						<button type="button" class="btn btn-warning btn-sm"
							id="id-edit-giftCard-theme">
							<i class="fa fa-pencil"></i><span>Edit</span>
						</button>


						 <button type="button" class="btn btn-danger btn-sm"
							id="id-delete-giftCard-theme" style="height: 37px;">
							<i class="fa fa-remove"></i><span>Delete</span>
						</button> 
						
					</div>
					
				</div>

			</div>


		</div>
		
	 <!-- add modal starts -->
		<div class="modal fade giftCard-theme-add-modal" data-backdrop="static" 
		                  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content" id="">
									<div id="add-gift-Card-theme" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												<!-- <span name="19" ></span> --> Add Wallet Theme
											</b>
										</h4>
									</div>
									<div class="modal-body">
										<form id="giftCard-add-form" class="form-horizontal">
											<div class="box-body">
											
												<div class="form-group">
													<label for="id-card-theme-Name-english" class="col-sm-5 control-label"> Wallet Theme Name [ENGLISH]: <a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 
														 <input class="form-control" placeholder="Wallet Theme Name [ENGLISH]" maxlength="65"
														 type="text" name="cardThmEng" id="id-card-theme-Name-english" />
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="id-card-theme-Name-arab" class="col-sm-5 control-label">Wallet Theme Name [ARABIC]: <a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Theme Name [ARABIC]" maxlength="65"
														 type="text" name="cardThmArb" id="id-card-theme-Name-arab"/>
													</div>
												</div> 
																							
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success"
													id="card-theme-save">
													<i class="fa fa-check"></i>
													<!-- <span name="34" ></span> -->
													Save
												</button>
												<button type="button" class="btn btn-danger"
													data-dismiss="modal" id="card-theme-add-cancel" style="height: 37px;">
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
						
						<!--card thm edit modal starts -->
						<div class="modal fade giftCard-theme-Edit_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content" id="">
									<div id="edit-gidt-card-theme" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												<!-- <span name="19" ></span> --> Edit Wallet Theme 
											</b>
										</h4>
									</div>
									<div class="modal-body">
									
										<form id="giftCard-edit-form" class="form-horizontal">
											<div class="box-body">
												<div class="form-group">
													
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Group" maxlength="11"
														 type="hidden" id="card-theme-edit" name="cardTheme" readonly="readonly"/>
													</div>
												</div>
												<div class="form-group">
													<label for="cardTheme-english-edit" class="col-sm-5 control-label">Wallet Theme Name [ENGLISH]:<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 <input class="form-control" placeholder="Wallet Theme Name [ENGLISH]" maxlength="65"
														 type="text" id="cardTheme-english-edit" name="cardThmEng"/>
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="cardTheme-arabic-edit" class="col-sm-5 control-label">Wallet Theme Name [ARABIC]:<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														<input class="form-control" placeholder="Wallet Theme Name [ARABIC]" maxlength="65"
														 type="text" id="cardTheme-arabic-edit" name="cardThmArb"/>
													</div>
												</div> 

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success"
													id="giftCard-theme-update">
													<i class="fa fa-check"></i>
													<!-- <span name="34" ></span> -->
													Update
												</button>
												<button type="button" class="btn btn-danger"
													data-dismiss="modal" id="giftCard-theme-edit-cancel" style="height: 37px;">
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
						
						<!-- card thm delete -->
						<div class="modal fade" data-backdrop="static"
							id="delete-card-theme-modal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div id="delete-gift-card-theme" class="modal-header">
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
											<form id="id-giftCard-theme-delete-form">
												<input type="hidden" name="cardGrp" id="hidden-giftCard-theme-id-delete">
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