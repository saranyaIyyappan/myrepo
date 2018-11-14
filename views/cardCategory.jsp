<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Card Category" />
	<tiles:putAttribute name="body">
       
        <!--body wrapper start-->
        <div class="container">
       <div class="right_col" role="main">
		<input type="hidden" id="hidden-updateStatus-details"
					value="${status}" />
				<input type="hidden" id="hidden-updateStatus-message"
					value="${message}" />  
		<c:if test="${not empty fileUpldStatus}">
				<input type="hidden" id="hidden_fileUpldStatus"
					value="${fileUpldStatus}" />
			</c:if>
			<div class="row row-1">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="">

						<div class="row top-div">
							<div class="col-sm-4">
							<label for="company_id_search" class="col-sm-4 control-label">Wallet Type: </label>
								<div class="col-sm-7">
								<select class="form-control column_filter" aria-hidden="true"
										id="id-card-type-search" name="cardType">
												<option value="">select</option>
												<option value="0">Rechargeble Wallet</option>
												<option value="1">Non Rechargeble Wallet</option>
												<option value="2">Login Wallet</option>
									</select>
								</div>
							</div>
							<div class="col-md-5">
								<label for="company_id_search" class="col-sm-4 control-label">Wallet Theme: </label>
								<div class="col-sm-6">

									<select class="form-control column_filter" aria-hidden="true"
										id="id-card-theme-search" name="cardTheme">
									</select>

								</div>
							</div>
							<!-- <div class="col-sm-3">
							 </div> -->
							<div class="col-sm-3">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm btn_padding"
									id="id_search_card_category">
									<i class="fa fa-search"></i> Search
								</button>
								<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id_clear_card_category">
									<i class="fa fa-refresh"></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button>
                                </div>

						</div>
					</div>
					<div class="row row-1">
					<div class="col-md-12 col-sm-12 col-xs-12 table-div">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Wallet Categories</i></h3>
							<div class="col-md-12 table-div-sub">
								<table id="card-category-datatable-id"
									class="table table-bordered table-hover dataTable responsive">
									<thead>
										<tr>
											<!-- <th>Wallet Category</th> -->
											<th>Wallet Type</th>
											<th>Wallet Theme</th>
											<th>Design Url English</th>
										</tr>
									</thead>

								</table>

							</div>

						</div>
					</div>

					<div class="pull-right grid-tools">
						
						<button type="button" class="btn btn-success btn-sm"
							id="card-category-add">
							<i class="fa fa-plus"></i>Create
						</button>

						<button type="button" class="btn btn-warning btn-sm"
							id="card-category-edit">
							<i class="fa fa-pencil"></i>
							<!-- <span name="16" ></span> -->
							&nbsp;&nbsp;Edit&nbsp;&nbsp;
						</button>
						<button type="button" class="btn btn-danger btn-sm"
							id="card-category-delete">
							<i class="fa fa-remove"></i>
							<!-- <span name="17" ></span> -->
							Delete
						</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		</div>
   <!--  create modal starting -->
		<div class="modal fade commissionProfileid_modal"
			data-backdrop="static" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" id="id-add-card-category-modal">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="">
					<div id="" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b> <!-- <span name="19" ></span> --> Add Code Category
							</b>
						</h4>
					</div>
					<div class="modal-body">
						<h5>
							<a class="star">(*)<!-- <span name="20" ></span> -->
								Fields Are Mandatory
							</a>
						</h5>
						<form class="form-horizontal"
										id="add_card_category_form" method="POST"
										enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/cardCategory/saveCardCategory">
							<div class="box-body">


								<div class="form-group">
									<label for="merchant-id" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->Merchant Id<a class="star">*</a>
									</label>
									<div class="col-sm-7">
									<select class="form-control column_filter" aria-hidden="true"
										id="id-merchant-id" name="merchantId" data-column="0">
									</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->
										Wallet Type<a class="star">*</a>
									</label>
									<div class="col-sm-7">
									<select class="form-control column_filter" aria-hidden="true"
										id="card-type-id" name="cardType" data-column="0">
												<option value="">select</option>
												<option value="0">Rechargeble Wallet</option>
												<option value="1">Non Rechargeble Wallet</option>
												<option value="2">Login Wallet</option>
									</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->
										Wallet Theme<a class="star">*</a>
									</label>
									<div class="col-sm-7">
									<select class="form-control column_filter" aria-hidden="true"
										id="id-card-theme" name="cardTheme" data-column="0">
									</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->
										Design Url English
									</label>
									<div class="col-sm-7">
											<input type = "file" id="id_doc_file" name = "docFile" size = "50" />
     									    <br />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									id="card-category-save-id">
									<i class="fa fa-check"></i>Save
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
		<!-- save Modal ends here -->
<div class="modal fade" data-backdrop="static"
			id="delete-card-category-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="delete-diagonosis" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b> <!-- <span name="17" ></span> --> <c:out
									value="Are you sure," />
							</b>
						</h4>
					</div>
					<div class="modal-body">
						<h4>
							<!-- <span name="38" ></span> -->
							<c:out value="Are you sure, you want to delete ?" />
						</h4>
					</div>
					<div class="modal-footer">
						<div class="div-yes">
							<form id="ie-commission-profile-delete-form" action="#">
								<input type="hidden" name="cardCategoryHidden"
									id="card-category-hidden-edit-id">
								<button id="id_btn_delete_card_category" type="button"
									class="btn btn-success">
									<!-- 	<span name="39" ></span> -->
									<i class="fa fa-check"></i>
									<c:out value="Yes" />
								</button>
							</form>
						</div>
						<div class="div-no">
							<button type="button" class="btn btn-danger" data-dismiss="modal" >
								<!-- <span name="40" ></span> -->
								<i class="fa fa-times"></i>
								<c:out value="No" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- delete modal ends here -->
		<!--update modal  -->
		<div class="modal fade commissionProfileidEdit_modal"
			data-backdrop="static" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" id="card-category-edit-modal-id">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="">
					<div id="edit-diagnosis-profile" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b> <!-- <span name="19" ></span> --> Edit Wallet Category
							</b>
						</h4>
					</div>
					<div class="modal-body">
						<h5>
							<a class="star">(*)<!-- <span name="20" ></span> -->
								Fields Are Mandatory
							</a>
						</h5>
						<form class="form-horizontal"
										id="card-category-edit-form" method="POST"
										enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/cardCategory/updateCardCategory">
							<div class="box-body">
								<div class="form-group">
								<input type="hidden" name="cardCat"
									id="hidden-card-category">
									<input type="hidden" name="cardThmHidden"
									id="hidden-card-theme">
									<input type="hidden" name="cardTypeHidden"
									id="hidden-card-type">
									<input type="hidden" name="merchantIdHidden"
									id="hidden-merchantId">
									<label for="" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->
										Wallet Type<a class="star">*</a>
									</label>
									<div class="col-sm-7">
									<select class="form-control column_filter search-select" aria-hidden="true"
										id="card-type-edit-id" name="cardType" data-column="0" >
									<option value="">select</option>
												<option value="0">Rechargeble Wallet</option>
												<option value="1">Non Rechargeble Wallet</option>
												<option value="2">Login Wallet</option>
									</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-5 control-label"> <!-- <span name="21" ></span> -->
										Wallet Theme<a class="star">*</a>
									</label>
									<div class="col-sm-7">
									<select class="form-control column_filter search-select" aria-hidden="true"
										id="id-card-theme-edit" name="cardTheme" data-column="0">
									</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-5 control-label"> <span name="21" ></span>
										Design Url English
									</label>
									<div class="col-sm-7">
									<div class="item-img"></div>
									<input type = "file" name = "docFileEdit" size = "50" id="id-design-url-eng-edit"/>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									id="card_category_update">
									<i class="fa fa-check"></i>
									<!-- <span name="34" ></span> -->
									Update
								</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="cancel-id">
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
<link href="${pageContext.request.contextPath}/resources/css/cardCategory.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/cardCategory.js"></script>
		</tiles:putAttribute>
</tiles:insertDefinition>