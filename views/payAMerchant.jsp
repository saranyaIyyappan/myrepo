<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Pay A Merchant" />
	<tiles:putAttribute name="body">

		<!--body wrapper start-->
		<div class="">
			<div class="serbox col-md-8">
			<input type="hidden" id="id_card_id_hidden" name="cardId"/>
								<input type="hidden" id="id_balance_hidden" name="balance"/>
				<h3 style="text-align:center; color:#3c91d3; padding:0px 0px 20px;"><strong>Pay a Merchant</strong></h3>
				<div class="">
					<form id="id_payAmount_form" class="form-horizontal" action="#">
						<div class="form-group">
							<div class="col-md-12">
							<!-- 
							<label for="id_mrNo_search" class="col-sm-3 control-label">MR NO&nbsp;:&nbsp;<a class="star1">*</a>
										 </label>
									<div class="col-sm-6">
										<!-- <datalist id="Autocompmedicine"></datalist>  -->
 										<!-- 	<input class="form-control awesomplete" id="id_mrNo_search" list="autoCompnyCode"
											name="mrNo" onchange="" placeholder="MR NO" 
											type="text" />
                                    
									</div>
							
							
							
							
							 -->
						
							
							
							
								<div class="col-md-4">
									<label for="id_merchant_id" class="col-sm-12 control-label">Merchant Id :<a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-8">
								
										<!-- <datalist id="autoCompnyCode"></datalist> --> 
										<input class="form-control awesomplete" id="id_merchant_id" 
											name="merchantId" onchange="" placeholder="Merchant Id" 
											type="text" />
									
								</div>
						
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12" id="id-gif">
								<div class="col-md-4">
									<label for="id_amount_wish_to_pay"
										class="col-sm-12 control-label">Amount : <a style="color: red">*</a>
									</label>
								</div>
								<div class="col-md-8">
									<input class="form-control" placeholder="Amount" maxlength="12"
										type="text" name="amount" id="id_amount_wish_to_pay" onkeypress="return isNumber(event)"  onblur=""/>
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
								<div class="col-md-8">
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
										class="col-sm-5 control-label" style="width: 200px"><b>Wallet Numbers</b>
									</label><br>
									<div class="card-number">
									<!-- <label for=""
										class="col-sm-5 control-label" style="width: 200px">
									</label> -->
									</div>
								</div>
								
								<div class="col-md-6">
									<label for=""
										class="col-sm-5 control-label" style="width: 200px"><b>Available Balance</b>
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
			<!-- <div class="col-sm-4"> -->
								<div id="img-load" align="center"><img class="img-responsive load-img-login"  src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
							<!-- </div> -->
			<div class="row" id="content-id"></div>
			<div class="col-md-2"></div>

			<!-- 
          <div class="panel panel-default">
    <div class="panel-body">

  
</div>
  </div> -->
			<!--   <div class="col-md-3"></div>
         <div class="col-md-4">
         <form id="id_payAmount_form" class="form-horizontal" action="#"> 
         <input type="text" class="form-control form-group">
         <button type="button" class="btn btn-success"
									id="card_category_update">
									<i class="fa fa-check"></i>
									<span name="34" ></span>
									Update
								</button>
         </form>
         
         </div>
         <div class="col-md-3"></div> -->
			<!-- put your main code here -->
		</div>

	
	
	
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
					
					<div class="row" id="id_sample_sumi">
						
						<!-- <div class="form-group">	
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Running.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
								
							</label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk2" id="item4" value="val2" class="hidden" autocomplete="off"></label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Running.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
								
							</label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk2" id="item4" value="val2" class="hidden" autocomplete="off"></label>
							<div class="check-amnt">5000</div>
							</div>
						</div> -->
						<!-- <div class="form-group">	
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Running.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
								
							</label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk2" id="item4" value="val2" class="hidden" autocomplete="off"></label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Running.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off">
								
							</label>
							<div class="check-amnt">5000</div>
							</div>
							<div class="col-md-3">
							<label class="btn btn-primary checkpdng"><img src="http://content.nike.com/content/dam/one-nike/globalAssets/menu_header_images/OneNike_Global_Nav_Icons_Basketball.png" alt="..." class="img-thumbnail img-check"><input type="checkbox" name="chk2" id="item4" value="val2" class="hidden" autocomplete="off"></label>
							<div class="check-amnt">5000</div>
							</div>
						</div> -->
						
						
					</div>	
					<div class="row">
					<input type="button" value="Check Item" id="selectMyCards" class="btn btn-info btn_blue check-btn">
					</div>
					<!-- <div class="col-md-7 modal_body_left modal_body_left1">
						<h3 class="payfnt">Anb Gift Card</h3>						
						<div class="tab-content" id="id_sample">
							
						</div>
					</div> -->

					<!-- <div class="col-md-5">
						<div class="panel panel-warning">
							<div class="panel-body shop-card">
								<h5 class="header_info_1">eGift Card</h5>
								<p>Amount :</p><p id="id_amt"></p>
								<div class="img_1" id="id_selected_card" style="padding-right:3px">
									<img src="images/banner4.jpg" width="147px" height="160px" >
								</div>
								<div class="item-meta">
								<h3 class="name" id="id_card_theme" ></h3>
								<label>Actual Price  </label>&nbsp;<p id="id_price"></p>
								</div>
								<br>
								<button class="btn btn-info btn_blue" id="id-pick-card">
									Pick The eGift Card <i class="fa fa-arrow-right"
										aria-hidden="true"></i>
								</button>

							</div>


						</div>
					</div>
 -->
					<!--<ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
															<li><a href="#" class="facebook">
																  <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="twitter"> 
																  <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="instagram">
																  <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div></a></li>
															<li><a href="#" class="pinterest">
																  <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
																  <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div></a></li>
														</ul>-->
					<div class="clearfix"></div>





				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //Modal content-->
	</div>
<!-- aravind -->
	  
	       
	 <script src="${pageContext.request.contextPath}/resources/js/payMerchant.js"></script> 
	 <script>
		/* $(document).ready(function(e){
	 		$(".img-check").click(function(){
					$(this).toggleClass("check");
				});
		});*/
	 </script>

	</tiles:putAttribute>
</tiles:insertDefinition>