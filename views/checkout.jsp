<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Check Out" />
	<tiles:putAttribute name="body">


		<div class="row">
			<div class="col-md-10">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-md-12">
				<label class="secure" for="label_Treatment-id">Secure
					Checkout</label>

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab1">Credit
							Wallet payment</a></li>
					<li><a data-toggle="tab" href="#tab2">SADAD OLP</a></li>
					<c:if test="${empty userType}">
					<li><a data-toggle="tab" href="#tab3">Wallet</a></li>
					</c:if>
					<!-- onclick="getTotalCharge()" -->
				</ul>

				<div class="tab-content">
					<div id="tab1" class="tab-pane fade in active">

						<div id="ttab1" class="tab-pane in active">

							<div class="panel panel-info serbox col-md-12 col-sm-12">



								<div class="row">

									<div class="panel credit-card-box">
										<div class="display-table">

											<div class="row display-tr">
												<div class="col-xs-12 col-md-10 col-lg-12 panel1">
													<h3 class="panel-title display-td round-head">Payment
														Details</h3>
													<div class="display-td">
														<img class="img-responsive pull-right"
															src="http://i76.imgup.net/accepted_c22e0.png">
													</div>
												</div>
											</div>
											<div class="panel-body">
												<form role="form" id="payment-form" method="POST"
													action="javascript:void(0);">
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="user-pdng" for="couponCode">Name on the wallet :</label> <input type="text" placeholder="Name on the Card"class="form-control"

																	name="couponCode" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="user-pdng" for="cardNumber">Wallet
																	NUMBER :</label>
																<div class="input-group">
																	<input type="tel" class="form-control"
																		name="cardNumber" placeholder="Valid Wallet Number"
																		autocomplete="cc-number" required autofocus /> <span
																		class="input-group-addon"><i
																		class="fa fa-credit-card"></i></span>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-7 col-md-7">
															<div class="form-group">
																<label class="user-pdng" for="cardExpiry"><span
																	class="hidden-xs">EXPIRATION</span><span
																	class="visible-xs-inline">EXP</span> DATE :</label> <input
																	type="tel" class="form-control" name="cardExpiry"
																	placeholder="MM / YY" autocomplete="cc-exp" required />
															</div>
														</div>
														<div class="col-xs-5 col-md-5 pull-right">
															<div class="form-group">
																<label class="user-pdng" for="cardCVC">CV CODE :</label> <input
																	type="tel" class="form-control" name="cardCVC"
																	placeholder="CVC" autocomplete="cc-csc" required />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="user-pdng" for="couponCode">Mobile
																	Number(optional) : </label> <input type="text"
																	class="form-control" name="couponCode" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<button
																class="subscribe btn btn-success btn-lg btn-block"
																type="button">Start Subscription</button>
														</div>
													</div>
													<div class="row" style="display: none;">
														<div class="col-xs-12">
															<p class="payment-errors"></p>
														</div>
													</div>
												</form>
											</div>
										</div>


									</div>





								</div>
		
							</div>
						</div>

					</div>
					<div id="tab2" class="tab-pane fade">

						<div class="panel panel-info serbox  col-md-8 col-sm-6">
							<!-- <div class="col-sm-2">&nbsp;</div>
							<div class="col-sm-2">&nbsp;</div> -->
							<div class="panel body ">

								<div class="row">
									<div class="col-md-12">
										<div class="col-lg-4 col-md-12 col-sm-12">
											<label class="checkout-pdng" for="label_Treatment-id">Sadad
												olp :</label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12">
											<input class="form-control checkout-pdng" type="number"
												name="temp" placeholder="" />
										</div>
										<div class="clear-fix"></div>
										<br clear="all"> <br clear="all">


										<div class="col-lg-4 col-md-12 col-sm-12">
											<label class="dropdown" for="label_Treatment-id">Bank
												ID :</label>
										</div>
										<div class="col-lg-8 col-md-12 col-sm-12">
											<select class="btn btn-default" id="id_checkout_sadad_bankId"
												style="outline-color: red;">
												
											</select>
										</div>

									</div>
								</div>
							</div>
							<div class="col-sm-1">&nbsp;</div>
							<div class="col-sm-1">&nbsp;</div>
							<div class="col-sm-1">&nbsp;</div>
							<div class="col-sm-1">&nbsp;</div>
						</div>
					</div>
					<div id="tab3" class="tab-pane fade">
						<div class="panel panel-default col-md-8 serbox">
							<input type="hidden" id="id_card_id_hidden" name="cardId" /> <input
								type="hidden" id="id_balance_hidden" name="balance" />
							<h4 class="caption3">Pay Using Wallet</h4>
							<div class="panel-body">
								<form id="id_payAmount_form" class="form-horizontal" action="#">
									<div class="form-group">
										<div class="col-md-12"></div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="col-lg-4 col-md-12 col-sm-12">
												<label for="id_amount_wish_to_pay"
													class="col-md-12 col-sm-12  control-label">Amount : <a
													style="color: red">*</a>
												</label>
											</div>
											<div class="col-lg-8 col-md-12 col-sm-12">
												<input class="form-control" placeholder="Amount"
													maxlength="50" type="text" name="amount"
													readonly="readonly" id="id_amount_wish_to_pay" />

											</div>
										</div>

									</div>

									<input type="hidden" id="id_amt_to_pay"> <input
										type="hidden" id="id_amt_in_card">

									<div class="form-group">
										<div class="col-md-12">
											<div class="col-lg-4 col-md-12 col-sm-12">
												<label for="id_purpose"
													class="col-md-12 col-sm-12 control-label">What is
													it for? (optional): </label>
											</div>
											<div class="col-lg-8 col-md-12 col-sm-12">
												<input class="form-control" placeholder="What is it for"
													maxlength="50" type="text" name="whatIsItFor"
													id="id_purpose" />
											</div>

										</div>
									</div>
									<div align="center">
										<button type="button" id="pay_merchant"
											class="btn btn-success">Pay</button>
										<button type="reset" id="pay_merchant_clear"
											class="btn btn-warning" style="width: 110px;">Clear</button>
									</div>
									<div class="row">
										<div class="col-sm-12">&nbsp;</div>
									</div>
									<div class="row">
										<div class="col-sm-12">&nbsp;</div>
									</div>
									<div class="form-group">
										<div class="col-md-12" id="id-div-ref">
											<div class="col-md-12">
												<label for="" class="col-sm-5 control-label"><b>Transactional
														Ref No:</b> </label>
												<div class="ref-no">
													<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
												</div>
											</div>
											<div class="col-md-6">
												<label for="" class="col-sm-5 control-label"><b>Wallet
														Numbers</b> </label><br>
												<div class="card-number">
													<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
												</div>
											</div>

											<div class="col-md-6">
												<label for="" class="col-sm-5 control-label"><b>Available
														Balance</b> </label><br>
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

					</div>

				</div>
			</div>
			<div class="col-lg-4  col-md-11 col-sm-11 serboxx_11" style="margin:150px 0px;">
									
									<!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
									 when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, 
									 but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
									  passages, and more recently with desktop publishing software like Aldus PageMaker
									 including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
									  when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, 
									  remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing
									   software like Aldus PageMaker including versions of Lorem Ipsum.</p> -->
									
									<input type="hidden" id="id_purchaserId_hdn_guest" value="${guestId}">
									<div>&nbsp;</div>
											<div class="panel panel-body col-md-6 serbox ">
									<div class="row">
								<div style="color:#4992d7;font-weight:bold;"><h4>&nbsp;Your order summary</h4></div>
									<br>
									 <label id="id-purchase-id" 
										class="col-sm-12 control-label labelSummary"> </label> 
									<!-- <div class="col-sm-12">
										<input class="form-control" type="text"
											id="id-purchase-id" readonly="readonly" />
									</div> -->

			</div>
				<div class="row" Style="padding-top:10px;">
									<label id="id-gift-card-amount"
										class="col-sm-12 control-label labelSummary">Wallet Amount </label>
									</div>
					<div class="row" Style="padding-top:10px;">
									<label id="id_serviceCharge_cr_dr"
										class="col-sm-12 control-label labelSummary">Service Charge (Credit/Debit)</label>
									</div>
												<div class="row" Style="padding-top:10px;">
									<label id="id_serviceCharge_sadad_olp"
										class="col-sm-12 control-label labelSummary">Service Charge (Sadad OLP)</label>
									</div>
										<div class="row" Style="padding-top:10px;">
									<label id="id_serviceCharge_gift_card"
										class="col-sm-12 control-label labelSummary">Service Charge (Wallet)</label>
									</div>
									<div class="row" Style="padding-top:10px;">
									<label id="id_total_amount_credit"
										class="col-sm-12 control-label labelSummary">Total Charge(Credit/Debit)</label>
								</div>
								<div class="row" Style="padding-top:10px;">
									<label id="id_total_amount_sadadOLP"
										class=Walletm-12 control-label labelSummary">Total Charge(Sadad OLP)</label>
								</div>
								<div class="row" Style="padding-top:10px;">
									<label id="id_total_amount_giftcard"
										class="col-sm-12 control-label labelSummary">Total Charge(Wallet)</label>
								</div>
									
			
									</div>
									</div>
									</div>
									
								
							
									
									
						
									
									
										<!-- <div class="row">
									<label for="id-card-theme-Name-english"
										class="col-sm-5 control-label">Total Payable Amount </label>
									<div class="col-sm-7">
										<input class="form-control" type="text"
											id="id_txt_totalCharge" readonly="readonly" />
									</div></div>
										<div class="row">
									<label for="id-card-theme-Name-english"
										class="col-sm-5 control-label">Total Payable Amount </label>
									<div class="col-sm-7">
										<input class="form-control" type="text"
											id="id_txt_totalCharge" readonly="readonly" />
									</div>
									</div> -->
									
									

		</div>
		<!-- <div class="col-md-1">&nbsp;</div> -->

		<!-- pay modal starts -->
		<div class="modal fade" data-backdrop="static" id="id_modal_checkout"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="">
					<div id="" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							<b> </b>
						</h4>
					</div>
					<div class="modal-body">
						<form id="id_form_checkout_card_purchase" class="form-horizontal">
							<div class="box-body">

								<div class="form-group">
									<label for="id-card-theme-Name-english"
										class="col-sm-5 control-label">Total Payable Amount </label>
									<div class="col-sm-7">
										<input class="form-control" type="text"
											id="id_txt_totalCharge" readonly="readonly" />
									</div>
									<input type="hidden" id="id_hdn_itemNo" name=""
										value="${itemNo}"> <input type="hidden"
										id="id_hdn_themeId" name="cardTheme" value="${themeId}">
									<input type="hidden" id="id_hdn_merchantId" name="merchantId"
										value="${merchantId}"> <input type="hidden"
										id="id_hdn_total_charge" name="" value="${totalCharge}">
									<input type="hidden" id="id_hdn_themeCat" name="cardCat"
										value="${themeCat}">
									<%--  <input type="hidden"
										id="id_hdn_cardValue" name="cardAmount" value="${cardValue}"> --%>
									<input type="hidden" id="id_hdn_cardValue" name="cardAmount">
									<input type="hidden" id="id_hdn_cardType" name="cardType"
										value="${cardType}"> <input type="hidden"
										id="id_hdn_activation_date" name="actDate">
									<c:if test="${not empty friendNum}">
										<input type="hidden" id="id_hdn_friendNum"
											value="${friendNum}">
									</c:if>
									<c:if test="${empty friendNum}">
										<input type="hidden" id="Wallet_friendNum">
									</c:if>

									<input type="hidden" id="id_hdn_mergedImageUrl"
										name="mergedImagePath" value="${mergedImagePath}">
								</div>
								<div class="form-group">
									<p class="col-sm-12">"The new Credit Wallet is assigned to
										your friend Mobile Number 0504423443. Please request your
										friend to login to the App and download the Wallet."</p>
								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									id="id_pay_checkout_btn">
									<i class="fa fa-check"></i> Pay
								</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="">
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
		<!-- /pay modal ends-->
		<input type="hidden" id="id_hdn_paymentMode">

		<div class="modal fade" id="myModal6" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body modal-body-sub_agile">
						<div class="row">
							<h3 class="payfnt">Anb Wallet</h3>
						</div>

						<div class="row" id="id_sample"></div>
						<div class="row">
							<input type="button" value="Check Item" id="selectMyCards" onclick="multipleCardPay()"
								class="btn btn-info btn_blue check-btn">
						</div>

						<div class="clearfix"></div>

					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
		<!-- //Modal content-->
	</div>
<!-- aravind -->
	
<%-- 	 <script src="${pageContext.request.contextPath}/resources/js/payUsingGiftCard.js"></script>  --%>
		<!-- aravind -->

		<script
			src="${pageContext.request.contextPath}/resources/js/payUsingGiftCard.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/checkout.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>
