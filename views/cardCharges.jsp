<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="Card Charges" />
	<tiles:putAttribute name="body">
        <!--body wrapper start-->
        <div class="container">
      
       <div class="right_col" role="main">

			<div class="row row-1" >
				<div class="col-md-12 col-sm-12 col-xs-12">
		
					<div class="row row-1 top-div">
					<div class="col-md-12 col-sm-12 col-xs-12 table-div-sub">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true"> Wallet Charges</i></h3>
							<div class="col-md-12 table-div-sub-sub">
									<table id="card-charges-table"
									class="table table-bordered table-hover dataTable responsive nowrap">
									<thead>
										<tr>
											<th>Wallet Type</th>
											<th>Fixed Charge</th>
											<th>Credit Wallet Charge</th>
											<th>SadadOLP Charge</th>
											<th>Wallet Charge</th>
											<th>Sale Price</th>
											<th>Buy Price</th>
											<th>Afc Charge</th>
											<th>Bank Charge</th>
											<th>Merchant Charge</th>

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
							id="card-charges-create">
							<i class="fa fa-plus"></i>
							<!-- <span name="14" ></span> -->
							Create
						</button>

						<button type="button" class="btn btn-warning btn-sm"
							id="card-charges-edit">
							<i class="fa fa-pencil"></i>
							<!-- <span name="16" ></span> -->
							&nbsp;&nbsp;Edit&nbsp;&nbsp;
						</button>
						<button type="button" class="btn btn-danger btn-sm"
							id="card-charges-delete">
							<i class="fa fa-remove"></i>
							<!-- <span name="17" ></span> -->
							Delete
						</button>
					</div>

				</div>
				</div>

			<!--  create modal starting -->
				<!--create modal -->

				<div class="modal fade" data-backdrop="static"
					id="id-card-charges-modal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content" id="">
							<div id="id_group_header" class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<b>Add Wallet Charges</b>
								</h4>
							</div>
							<div class="modal-body">
								<!-- 	<h5>
							<a style="color: red">(*)Fields Are Mandatory</a>
						</h5> -->
								<form id="card-charges-form" class="form-horizontal" action="#">
									<div class="box-body">


										<div class="form-group">
											<label for="id-card-charges-cardType"
												class="col-sm-5 control-label">Wallet Type<a class="star">*</a></label>

											<div class="col-sm-7">
												<select class="form-control select2"
													tabindex="-1" aria-hidden="true"
													id="id-card-charges-cardType" name="cardType">
													<option value="">Select</option>
													<option value="0">Rechargable Wallet</option>
													<option value="1">Non Rechargable Wallet</option>
													<option value="2">Login Wallet</option>
													<option value="3">Digital Wallet</option>
												</select>
											</div>

										</div>

										<div class="form-group">
											<label for="id_card_fixed_charges"
												class="col-sm-5 control-label">Fixed Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_card_fixed_charges" name="fixedCharge"
													placeholder="Fixed Charge">

											</div>
										</div>



										<div class="form-group">
											<label for="id_card_credit_card_charges"
												class="col-sm-5 control-label">Credit Wallet Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_card_credit_card_charges" name="crcardCharge"
													placeholder="Credit Wallet Charges">

											</div>
										</div>


										<div class="form-group">
											<label for="id_sadad_card_charges"
												class="col-sm-5 control-label">Sadad OLP Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_sadad_card_charges" name="sadadolpCharge"
													placeholder="SadadOLP Charges">

											</div>
										</div>

										<div class="form-group">
											<label for="id_gift_card_charges"
												class="col-sm-5 control-label">Wallet Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_gift_card_charges" name="giftcardCharge"
													placeholder="Wallet Charges">

											</div>
										</div>

										<div class="form-group">
											<label for="id_sale_price" class="col-sm-5 control-label">Sale
												Price<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_sale_price" name="salePrice"
													placeholder="Sale Price">

											</div>
										</div>

										<div class="form-group">
											<label for="id_buy_price" class="col-sm-5 control-label">Buy
												Price<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_buy_price" name="buyPrice" placeholder="Buy Price">

											</div>
										</div>

										<div class="form-group">
											<label for="id_afc_charge" class="col-sm-5 control-label">Afc
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="2"
													id="id_afc_charge" name="afcCharge"
													placeholder="Afc Charge">

											</div>
										</div>

										<div class="form-group">
											<label for="id_bank_charge" class="col-sm-5 control-label">Bank
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_bank_charge" name="bankCharge"
													placeholder="Bank Charge">

											</div>
										</div>

										<div class="form-group">
											<label for="id_merchant_charge" class="col-sm-5 control-label">Merchant
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_merchant_charge" name="merCharge"
													placeholder="Merchant Charge">

											</div>
										</div>
										<div class="form-group">
											<label for="id_expiry_period" class="col-sm-5 control-label">Expiry Period<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="11"
													id="id_expiry_period" name="expiryPeriod"
													placeholder="Expiry Period">

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
					id="id_edit_cardcharges_modal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content" id="">
							<div id="id_group_header" class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<b>Edit Wallet Charges</b>
								</h4>
							</div>
							<div class="modal-body">
								<!-- 	<h5>
							<a style="color: red">(*)Fields Are Mandatory</a>
						</h5> -->
								<form id="edit-card-charges-form" class="form-horizontal" action="#">
									<div class="box-body">


										<div class="form-group">
											<label for="id-edit-card-charges-cardType"
												class="col-sm-5 control-label">Wallet Type<a class="star">*</a></label>


											<div class="col-sm-7">
												<select class="form-control select2"
													tabindex="-1" aria-hidden="true"
													id="id-edit-card-charges-cardType" name="cardType">
													<option value="">Select</option>
													<option value="0">Rechargable Wallet</option>
													<option value="1">Non Rechargable Wallet</option>
													<option value="2">Login Wallet</option>
													<option value="3">Digital Wallet</option>
												</select>
											</div>

										</div>

										<div class="form-group">
											<label for="id_edit_card_fixed_charges"
												class="col-sm-5 control-label">Fixed Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_fixed_charges" name="fixedCharge"
													placeholder="Fixed Charge">

											</div>
										</div>



										<div class="form-group">
											<label for="id_edit_credit_card_charges"
												class="col-sm-5 control-label">Credit Wallet Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_credit_card_charges" name="crcardCharge"
													placeholder="Credit Card Charges">

											</div>
										</div>


										<div class="form-group">
											<label for="id_edit_sadad_card_charges"
												class="col-sm-5 control-label">Sadad OLP Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_sadad_card_charges" name="sadadolpCharge"
													placeholder="SadadOLP Charges">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_gift_card_charges"
												class="col-sm-5 control-label">Wallet Charge<a class="star">*</a></label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_gift_card_charges" name="giftcardCharge"
													placeholder="Wallet Charges">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_sale_price" class="col-sm-5 control-label">Sale
												Price<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_sale_price" name="salePrice"
													placeholder="Sale Price">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_buy_price" class="col-sm-5 control-label">Buy
												Price<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_buy_price" name="buyPrice" placeholder="Buy Price">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_afc_charge" class="col-sm-5 control-label">Afc
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="2"
													id="id_edit_afc_charge" name="afcCharge"
													placeholder="Afc Charge">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_bank_charge" class="col-sm-5 control-label">Bank
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_bank_charge" name="bankCharge"
													placeholder="Bank Charge">

											</div>
										</div>

										<div class="form-group">
											<label for="id_edit_merchant_charge" class="col-sm-5 control-label">Merchant
												Charge<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="4"
													id="id_edit_merchant_charge" name="merCharge"
													placeholder="Merchant Charge">

											</div>
										</div>
										<div class="form-group">
											<label for="id_edit_card_expiry_period" class="col-sm-5 control-label">Expiry Period<a class="star">*</a>
											</label>
											<div class="col-sm-7">

												<input type="text" class="form-control" maxlength="11"
													id="id_edit_card_expiry_period" name="expiryPeriod"
													placeholder="Expiry Period">

											</div>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success"
											id="edit_card_charge_btn">
											<i class="fa fa-pencil"></i> Update
										</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">
											<i class="fa fa-close"></i> Cancel
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
				<!-- edit modal ends here -->


		<!-- delete modal starts here -->
		<div class="modal fade" data-backdrop="static"
			id="card-charges-delete-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="delete-charges" class="modal-header">
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
						<div class="div-yes">
							<button id="id_btn_delete_charges" type="button"
								class="btn btn-success">
								<i class="fa fa-check"></i>
								<c:out value="Yes" />
							</button>
						</div>
						<div class="div-no">
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i>
								<c:out value="No" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- delete modal ends here -->

	<!-- modal ends here -->	

			</div>
		</div>
		</div>
 
        <link href="${pageContext.request.contextPath}/resources/css/cardCharges.css" rel="stylesheet">
 <script src="${pageContext.request.contextPath}/resources/js/cardCharges.js"></script>

		</tiles:putAttribute>
</tiles:insertDefinition>


















