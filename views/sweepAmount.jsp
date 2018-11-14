<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Merchant Transaction" />
	<tiles:putAttribute name="body">
		<!--body wrapper start-->
<style>
.card {
    background: #fff;
    border-radius: 10px;
    margin: 0px 0px 0px 0px;
    width: 100%;
    min-height: 150px;
    padding: 30px 20px;
    height: 100%;
    -webkit-box-shadow: 0 0 8px #ccc;
    -moz-box-shadow: 0 0 8px #ccc;
    box-shadow: 0 0 8px #ccc;
}
.sweep-amnt {
	font-size: 5vh;
}
.sweep-control{
	padding-bottom: 10px;
	text-align: right;
}
.crd-foot{
	font-size: 13px;
	margin-top: 30px;
	text-align: center;
}
.crd-foot-top{
	border-top: 1px solid #999999;
}
.crd-foot-right {
	border-right: 1px solid #999999;
}
.form-control-modify{
	background: transparent; 
	border: 0px none;
	margin-top: -10px;
}
</style>
		<div class="right_col" role="main">
			<div class="row-1">
				
					<input type="hidden" id="id-context" value="${pageContext.request.contextPath}">
					<input type="hidden" id="id_vat-hidn" value="${merchantData.vat}">
					<input type="hidden" id="id_sarie-hidn" value="${merchantData.sarie}">
					<input type="hidden" id="id_ata-hidn" value="${merchantData.ata}">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 table-div-sub">
							<div class=" control-2">
								<h3>
									<i class="fa fa-money customHead_Fa" aria-hidden="true"> Transfer Money to Account</i>
								</h3>
								<div class=" table-div-sub-sub" id="no-more-tables">
									<div class="col-md-7 col-sm-12 col-xs-12">
										<div class="card">
										
											<form class="form-horizontal">
												<div class="form-group" style="padding-left: 20px;">
													<label class="control-label col-sm-5" for="id_account-number">Account Number</label>
													<div class="col-sm-7">
														<input id="id_account-number" type="text"  class="form-control" value="${merchantData.accountNumber}" placeholder="Account Number" disabled>
													</div>
												</div>
												<div class="form-group" style="padding-left: 20px;">
													<label class="control-label col-sm-5" for="id_transaction-mode">Transaction Mode</label>
													<div class="col-sm-7">
														<select id="id_transaction-mode"  class="form-control">
															<option value="select" selected>Select
															<option value="SARIE">SARIE
															<option value="ATA">Account To Account
														</select>
													</div>
												</div>
												<div class="form-group" style="padding-left: 20px;">
													<label class="control-label col-sm-5" for="id_sweep-amnt">Amount</label>
													<div class="col-sm-7">
														<input type="text" class="form-control" id="id_sweep-amnt" name="amount" placeholder="0.0">
													</div>
												</div>
												<div id="id_amnt-calc" class="form-group" style="padding-left: 20px;">
													<label class="control-label col-sm-5" for="id_sweep-amnt"></label>
													<div class="col-sm-7">
														<div class="form-control form-control-modify">
															<div class="col-sm-6"><span>VAT</span></div>
															<div class="col-sm-6"><span id="id_vat-amount">+0.0</span></div>
														</div>
														<div class="form-control form-control-modify" >
															<div class="col-sm-6"><span id="id_label-mode">ATA</span></div>
															<div class="col-sm-6"><span id="id_mode-amount">+0.0</span></div>
														</div>
														<div style="border-top: 1px solid #999999;">
															<div class="col-sm-6"><span id="id_label-total">Total</span></div>
															<div class="col-sm-6"><span id="id_total-amnt">10.0</span></div>
														</div>
													</div>
												</div>
												<div class="form-group" style="padding-left: 20px;">
													<label class="control-label col-sm-5" for="id_remarks">Description</label>
													<div class="col-sm-7">
														<textarea id="id_remarks" class="form-control" rows="3" cols="1" maxlength="80"></textarea>
													</div>
												</div>
												<div  class="" style="text-align: right;;">
													<button type="button" class="btn btn-info btn-sm btn_padding" id="id_sweep_amnt_btn">
														<i class="fa fa-credit-card"></i> Transfer
													</button>
												</div>
												
											</form>
										</div>
									</div>
									<div class="col-md-5 col-sm-12 col-xs-12">
										<div class="card">
											<h4>Amount Available</h4>
											<label id="id_amount-display" class="sweep-amnt">${merchantData.amount}</label>
											<div class="crd-foot">
												<div class="crd-foot-top col-sm-12">
													<div class="crd-foot-right col-sm-6">
														<span>VAT: ${merchantData.vat} %</span>
													</div>
													<div class="col-sm-6">
														<span>SARIE: ${merchantData.sarie}</span>
													</div>
												</div>
												<div class="crd-foot-top col-sm-12">
													<span>Account To Account: ${merchantData.ata}</span>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		<link href="${pageContext.request.contextPath}/resources/css/merchantTransaction.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/resources/js/sweepAmount.js"></script>

	</tiles:putAttribute>
</tiles:insertDefinition>