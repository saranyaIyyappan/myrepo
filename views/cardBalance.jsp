<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="Card Balance" />
	<tiles:putAttribute name="body">

		<!--body wrapper start-->
			<div class="container">
				<div class="right_col serbox1" role="main">
					<div class="row">
						<div class="col-md-offset-1 col-md-10">
							<div class="">
								<div class="row">
									<div class="col-sm-6">
										<label for="id_card_no"
											class="col-sm-8 control-label input_merchant">Card
											Number (16 Digits) </label> <input class="form-control"
											id="id_card_no" maxlength="16"
											onkeypress="return isNumber(event)" name="cardNo"
											placeholder="XXXX-XXXX-XXXX-XXXX" type="text" />
										<!-- <div class="col-sm-7">
								
											<select class="form-control column_filter" aria-hidden="true"
										id="id_card_no" name="cardNo" data-column="0" style="height: 30px">
									</select>
								
									
								</div> -->
									</div>
									<div class="col-sm-6">
										<label for="id_card_no"
											class="col-sm-8 control-label input_merchant">Pin
											Number (4 Digits) </label> <input class="form-control" id="id_pin_no"
											maxlength="4" onkeypress="return isNumber(event)"
											name="pinNo" placeholder="XXXX" type="text" />
										<!-- <div class="col-sm-7">
								
											<select class="form-control column_filter" aria-hidden="true"
										id="id_card_no" name="cardNo" data-column="0" style="height: 30px">
									</select>
								
									
								</div> -->
									</div>
								</div>

								<div class="row card_btn_1">
									<div class="col-sm-12">
										<button type="button" class="btn btn-info btn-sm btn_padding1"
											id="id_card_balance_btn">
											<i class="fa fa-search" style="font-size: 15px"></i> Get Wallet
											Balance
										</button>
										<!-- 	<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id_card_balance_clr_btn">
									<i class="fa fa-refresh" style="font-size: 15px"></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button> -->
										<button type="button" class="btn btn-info btn-sm"
											id="id_card_balance_reg">
											<i class="fa fa-user-plus " style="font-size: 15px"></i>
											&nbsp;&nbsp;Register&nbsp;&nbsp;
										</button>
									</div>

								</div>
								<div class="row">
									<div class="col-sm-12">

										<p class="para_pdng">N.B. Register the Wallet with login Credential to
											view/Add more Wallets</p>
											</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row"
					id="id-div-card-balance-table">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class=" control-2">
							<h3 class="card_hdng">
								<i class="fa fa-list-alt customHead_Fa" aria-hidden="true"> Your
									last Transations on this Wallet</i>
							</h3>
							<div class="col-md-12">
								<table id="card-balance-datatable-id"
									class="table-bordered table-striped table-condensed cf no-footer dataTable">
									<thead>
										<tr>
											<th>Date</th>
											<th>Description</th>
											<th>Amount</th>
										</tr>
									</thead>

								</table>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-6 lbl_card" style="font-size: x-large;">
							<label>Current Balance:</label><span id="id_p_balAmount"></span>
						</div>
					</div>

				</div>
			</div>

		<script
			src="${pageContext.request.contextPath}/resources/js/cardBalance.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>