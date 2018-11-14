<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Transfer Money" />
	<tiles:putAttribute name="body">

<style>
	.shop-card {
	text-align: center;
	padding: 10px 30px 20px 30px;
	box-shadow: 0px 0px 5px grey;
	background-color: white;
}

#id-gif-id {
    position:relative;
}

#img-load {
    position: absolute;
    left: 400px;
    top: 100px;
    width: 75; height: 75px;
}
	</style>

		<!--body wrapper start-->
		<div class="row" id="id-gif-id">
			<div class="col-md-8 serbox">
			<input type="hidden" id="id_card_id_hidden" name="cardId"/>
								<input type="hidden" id="id_balance_hidden" name="balance"/>
				<h3 style="text-align:center; color:#3c91d3; padding:0px 0px 20px;"><strong>Transfer Money</strong></h3>
				<div class="">
					<form id="id_payAmount_form" class="form-horizontal" action="#">
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-4">
									<label for="id_ben_mobile_number" class="col-sm-12 control-label">Mobile Number :<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-6">
										<input class="form-control" placeholder="Mobile Number" maxlength="20" onchange="getBenCardId()"
										type="text" name="" id="id_ben_mobile_number"/>
								
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-4">
									<label for="id_ben_card_id" class="col-sm-12 control-label">Beneficiary Wallet ID<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-6">
										<Select class="form-control"name="" id="id_ben_card_id" disabled="disabled">
										<option value selected>Select Wallet</option>
										</Select>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-4">
									<label for="id_amount_wish_to_pay"
										class=" col-sm-12 control-label">Amount :<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-6">
									<input class="form-control" placeholder="Amount" maxlength="50"
										type="text" name="amount" id="id_amount_wish_to_pay" onkeypress="return isNumber(event)" />
										<!-- <input class="form-control" maxlength="50"
										type="text" name="amountHidden" id="id_amount_hidden" />
										
										
										<input class="form-control" maxlength="50"
										type="text" name="payableAmountHidden" id="id_payable_amount_hidden" /> -->
								</div>
								<!-- <div class="col-md-3"><button type="button" id="id-btn-again" class="btn btn-success" style="width:170px;">Click here to more Amount</button></div> -->
							</div>

						</div>
						<!-- <div class="form-group">
							<div class="col-md-12">
								<div class="col-md-3">
									<label for="id_amt_to_pay"
										class="col-sm-5 control-label" style="width: 200px">Amount To Pay<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-6"> -->
								<input type="hidden" id="id_amt_to_pay">
								<!-- </div>
							</div>
							</div>
							<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-3">
									<label for="id_amt_in_card"
										class="col-sm-5 control-label" style="width: 200px">Amount In Card<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-6"> -->
								<input type="hidden" id="id_amt_in_card">
								<!-- </div>
							</div>
							</div> -->
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-4">
									<label for="id_purpose" class="col-sm-12 control-label">What
										is it for? (optional) : </label>
								</div>
								<div class="col-md-6">
									<input class="form-control" placeholder="What is it for"
										maxlength="50" type="text" name="whatIsItFor" id="id_purpose" />
								</div>
							</div>
						</div>
						<div align="center">
						<button type="button" id="pay_merchant" class="btn btn-warning">Pay</button>
						<button type="reset" id="pay_merchant_clear" class="btn btn-warning">Clear</button>
						</div>
						<div class="row"><div class="col-sm-12">&nbsp;</div></div>
						<div class="row"><div class="col-sm-12">&nbsp;</div></div>
						<div class="form-group">
							<div class="col-md-12" id="id-div-ref">
							<div class="col-md-12">
							<label for=""
										class="col-sm-5 control-label" ><b>Transactional Ref No:</b>
									</label>
									<div class="ref-no">
									<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
									</div>
							</div>
								<div class="col-md-6">
									<label for=""
										class="col-sm-12 control-label"><b>Wallet Numbers</b>
									</label><br>
									<div class="card-number">
									<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
									</div>
								</div>
								
								<div class="col-md-6">
									<label for=""
										class="col-sm-12 control-label"><b>Available Balance</b>
									</label><br>
									<div class="balance">
									<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
									</div>
								</div>
							</div>
							</div>
					</form>
				</div>
				
							
			</div>
		<!-- 	<div class="col-md-4"> -->
							<div id="img-load" align="center"><img class="img-responsive load-img-login" style="width:75px; height:75px;"  src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
					      <!--  </div> -->
			<div class="row" id="content-id"></div>
			<div class="col-md-2"></div>
		
		</div>

	<div class="modal fade" id="id_modalImage_card" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body modal-body-sub_agile">
					<div class="row">
						<h3 class="payfnt">Anb Gift Wallet</h3>
					</div>
					
					<div class="row" id="id_sample_sumi">
						
						
					</div>	
					<div class="row">
					<input type="button" value="Check Item" id="selectMyCards" class="btn btn-info btn_blue check-btn">
					</div>
					
					<div class="clearfix"></div>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //Modal content-->
	</div>
	<div class="modal fade" data-backdrop="static"
			id="id-confirm-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div id="confirm-transfer" class="modal-header">
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
							<c:out value="Amount sholud transfer from the selected Wallets ?" />
						</h4>
					</div>
					<div class="modal-footer">
						<div class="div-yes">
							<form id="ie-commission-profile-delete-form" action="#">
								<button id="id_confirm" type="button"
									class="btn btn-success">
									<!-- 	<span name="39" ></span> -->
									<i class="fa fa-check"></i>
									<c:out value="Yes" />
								</button>
							</form>
						</div>
						<div class="div-no">
							<button type="button" class="btn btn-danger" id="id_confirm_cancel" data-dismiss="modal" >
								<!-- <span name="40" ></span> -->
								<i class="fa fa-times"></i>
								<c:out value="No" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- aravind -->
	
	 <script src="${pageContext.request.contextPath}/resources/js/transferMoney.js"></script> 

	</tiles:putAttribute>
</tiles:insertDefinition>