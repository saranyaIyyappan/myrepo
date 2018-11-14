<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="purchase Wallet" />
	<tiles:putAttribute name="body">
		<link
			href="${pageContext.request.contextPath}/resources/purchaseCard/css/pageStyle.css"
			rel="stylesheet">

		<div class="container">
		<!-- <h1 class="head_prsnl">Personalize Gift Card</h1> -->
			<input type="hidden" id="id_hdn_loggedUser_name_pur"> <input
				type="hidden" id="id_hdn_loggedUser_image_pur"> <input
				type="hidden" id="id_hdn_loggedUser_image_merger_pur">
			<div class="row">
				<div
					class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container">
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 bhoechie-tab-menu fxd_brand check-left">

						<div class="list-group">
							<a href="#" class="list-group-item text-center active" id="id_a_tab_1">
								<h4 class="glyphicon">1</h4>
								<br />Pick Amount <span id="id_pick_amount"></span>
							</a> <a class="list-group-item text-center" id="personal_message"
								style="pointer-events: none;">
								<h4 class="glyphicon">2</h4>
								<br />Make It Personal <span id="id-personal_message"></span>
							</a> <a class="list-group-item text-center"
								style="pointer-events: none;" id="choose-delivery">
								<h4 class="">3</h4>
								Choose Delivery <span id="choose_delivery_id"></span>
							</a> 
							
							
							<a class="list-group-item text-center"
								style="pointer-events: none;" id="idTabCheckOut">
								<h4 class="">4</h4>
								Checkout <span id="chechout_id"></span>
							</a>
							
							
							
							  
							
							
						</div>
							<div class="col-md-12 col-sm-12 col-xs-12 p-l-0 brand brand-item brand-item-preloaded brand_10 brand_11">

								<div class="flip-container flip_height_1"
									ontouchstart="this.classList.toggle('hover');">
									<span class="right">SAR</span> <span class="pin"><img
										src="https://cdnstatic.yougotagift.com/static/img/common/pin-f1f1f1.png"
										alt="" title=""></span> <a data-target=".brand-modal"
										class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">Virgin
										Megastore</a>
									<div class="">
										<figure class="img_pdng1">
											<div class="head_mega">
												<img class="img-responsive" src="${pageContext.request.contextPath}/resources/giftCardHome/images/card.png" id="id_selected_image_tag">
												<p id="id_p_amount_for_image_tag"></p>
											</div>
										</figure>
									</div>
								</div>
							</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 bhoechie-tab check-right">
						<!-- flight section -->
						<div class="bhoechie-tab-content active">
							<div class="row" id="amount_id">
								<span class="round-cir">1</span>
								<h4 class="round-head">How much would you like to give?</h4>
								<p class="select-amount">Select from popular amounts</p>
								<div class="dropdown">
									<select class="btn btn-default" id="id_period_type"
										style="outline-color: red;">
										<option value="SAR">SAR</option>
									</select> <a href="#personal_message_id"><button type="button"
											class="btn btn-default amount_btn" onClick="setAmount(this)">100</button></a>
									<a href="#personal_message_id"><button type="button"
											class="btn btn-default amount_btn" onClick="setAmount(this)">200</button></a>
									<a href="#personal_message_id"><button type="button"
											class="btn btn-default amount_btn" onClick="setAmount(this)">300</button></a>
									<a href="#personal_message_id"><button type="button"
											class="btn btn-default amount_btn" onClick="setAmount(this)">400</button></a>
									<a href="#personal_message_id"><button type="button"
											class="btn btn-default amount_btn" onClick="setAmount(this)">500</button></a>
									(or)&nbsp<input class="btn btn-default" size="9px;"
										style="padding-bottom: 5px;" type="text"
										placeholder="Set your own" id="id_set_custom_amount">
									<!-- <input type="hidden" id="id_hdn_cardValue"> -->
									<input type="hidden" id="id_hdn_cart_cardThemeId">
									<!-- 	<input type="hidden" id="id_hdn_cart_cardType"> -->
								</div>
							</div>

							<div class="row top-pdng one" id="personal_message_id">
								<span class="round-cir">2</span>
								<h4 class="round-head">Choose your own Theme</h4>
								<div class="row row_top">
								<div class="row">
							<div class="col-md-12">
									<!-- <div class="col-lg-8 col-md-8">
										<h3>
											<span class="label label-red col-md-6" id="id_li_category_0"></span>
											
										</h3>
										<div class="col-sm-1">&nbsp;</div><button type="button" class="btn label label-red col-md-5"
											data-toggle="modal" data-target="#exampleModal">View More</button>
									</div> -->
									                                        <div class="row">
									                 <div id="id_div_theme_image_loader" align="center"><img class="img-responsive load-img-login" src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>                       
												<div class="col-sm-11" id="id_div_themes_all"></div>
												<div id="hides-show-id" class="row"
																style="display: none;">
																<!-- <div class="row">
																	<div class="col-sm-1">&nbsp;</div>
																	<div class="col-sm-10">
																		<button type="button" class="btn btn-success btn_1">row2</button>
																		<button type="button" class="btn btn-success btn_1">birthday</button>
																		<button type="button" class="btn btn-success btn_1">birthday</button>
																		<button type="button" class="btn btn-success btn_1">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																	</div>

																</div> -->
															<!-- 	<br>

																<div class="row">

																	<div class="col-sm-10">
																		<button type="button" class="btn btn-success">row3</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																		<button type="button" class="btn btn-success">birthday</button>
																	</div>

																</div>
																<br>
																<div class="row">

																	<div class="col-sm-10">
																		<button type="button" class="btn btn-info">row4</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>

																	</div>

																</div> -->
															</div>
									                                        
																			<div class="col-md-12">
																				<div class="carousel slide media-carousel"
																					id="media">
																					<div class="carousel-inner"
																						id="id_div_carousel_images">
													
																					</div>
																					<button type="button" class="left carousel-control"
																						id="id_btn_previous">‹</button>
																					<button type="button"
																						class="right carousel-control" id="id_btn_next">›</button>


																				
																				</div>
																			</div>
																			</div>
										
									</div>
									
</div>
<div class="clear-fix"></div><br><br>


										<div class="row">
										
																				<form class="form-horizontal"
																					id="id-form-upload-excel-fileUpload" method="POST"
																					enctype="multipart/form-data"
																					action="${pageContext.request.contextPath}/purchaseCard/mergeImages">
							<div class="col-md-12">
									<div class="col-lg-12 col-md-12">
									<div>
                    	<!-- <button class="btn btn-default orange-circle-button" href=""type="button" id="id_get_previous_theme"><span><i class="fa fa-chevron-left" aria-hidden="true"></i></i></span></button> -->
                    	</div>
										<div class="pur-img" id="id_div_preview_image_for_display"></div>
										<div class="btn_clr">
                      <!-- <button type="button" class="btn btn-default btn_orng orange-circle-button_1" id="id_get_next_theme" href=""><span><i class="fa fa-chevron-right" aria-hidden="true"></i></span></button> -->
                      </div>
									</div>
									</div>
									</form>
									</div>
									<br>
                     <h4 class="round-head">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Design your personal message</h4>
									<div class="row img_pdng_1">
									<div class="col-lg-5 col-md-5">
										<div class="gre-box">
									<div class="message-box">
													<textarea name="message" autocomplete="off"
														id="gift_message" class="text-area">Happy Birthday,
											I thought you would like this gift!
										</textarea>
										<!-- <div class="edit_btn_1">click to edit</div> -->
												</div>
									
									</div>
									</div>
									<div class="col-lg-5 col-md-5">
										<div class="gre-box">
											<div class="white-box">
												
												<div>
													<img style="padding-top: 15px;"
														src="https://cdnstatic.yougotagift.com/static/img/card_design/sample_pic.jpg"
														alt="Sample" title="Sample" id="profilePictureModal"
																											name="profilePictureModal">
												</div>
												<div>
													<input style="padding-top: 10px;" type="file"
														id="chooseFile"name="chosenImage" onchange="readURL(this);"
														>
														<br>
														 <button type="button"id="id_upload_image_to_merge"
																										class="btn btn-success">Preview</button> 
												</div>
											</div>
										</div>
									</div>
									</div>
								</div>
							</div>

							<div class="row top-pdng" id="">
								<span class="round-cir">3</span>
								<h4 class="round-head">How would you like to deliver this
									eWallet?</h4>
								<div class="form-group">
									<div id="Tokyo">
										<br>
										<!-- <ul class="nav nav-pills" style="padding-bottom: 20px;">
													<li class="active"><a data-toggle="tab" href="#home_2">Send
															by Email</a></li>
												</ul> -->
										<div class="panel panel-info">
											<div class="panel panel-heading " style=" background-color: #4294d4">
												<div class="row ">
													<div class="col-md-9">
														<!-- <i class="fa fa-envelope-open-o" aria-hidden="true"></i> -->
														<i class="fa fa-address-card" style="color: #ecf7fc;"></i>    <label    
															for="label_Treatment-id" style="color: #ecf7fc;">   Email & SMS</label>
													</div>
													<!-- <div class="col-md-2">
																	<label class="switch"> <input type="checkbox"
																		onchange="onchangeHangle()" id="switch_slider-id">
																		<span class="slider round"></span>
																	</label>
																</div> -->
												</div>
											</div>


											<div class="panel panel-body " id="panel-body_id" >
												<div class="row ">
													<div class="col-md-12">
														<h4 class="select-amount">
															<b>Purchaser's details</b>
														</h4>

														<div class="col-md-4">
															<i class="fa fa-user-circle" aria-hidden="true"></i> <label
																for="id_pur_name_details">Purchaser's Name </label> <input id="id_pur_name_details"
																class="form-control form_padng" type="text" />
														</div>
														<div class="col-md-4">
															<i class="fa fa-envelope" aria-hidden="true"></i> <label
																for="id_pur_email_details">Purchaser's Email</label> <input id="id_pur_email_details"
																class="form-control form_padng" type="text" />
														</div>
														<div class="col-md-4">
															<i class="fa fa-mobile" aria-hidden="true"></i> <label
																for="id_pur_mob_details">Purchaser's Mobile</label> <input id="id_pur_mob_details"
																class="form-control form_padng" type="text" />
														</div>
													</div>
												</div>
											</div>


											<div class="panel panel-body " id="panel-body_id">
												<div class="row ">
													<div class="col-md-12">
														<h4 class="select-amount">
															<b>Friend's details</b>
														</h4>

														<div class="col-md-4">
															<i class="fa fa-user-circle" aria-hidden="true"></i> <label
																for="label_Treatment-id">Friend's Name </label><input id="id_friend_name_details"
																class="form-control form_padng" type="text"  onblur="checkData()"/>
														</div>
														<div class="col-md-4">
															<i class="fa fa-envelope" aria-hidden="true"></i> <label
																for="label_Treatment-id">Friend's Email</label> <input id="id_friend_email_details"
																class="form-control form_padng" type="text" onblur="checkData()" />
														</div>
														<div class="col-md-4">
															<i class="fa fa-mobile" aria-hidden="true"></i> <label
																for="label_Treatment-id">Friend's Mobile</label> <input 
																id="id_friend_number" 
																class="form-control form_padng" type="text" onblur="checkData()" />

														</div>
													</div>
												</div>
											</div>
										</div>



										<div class="panel panel-info" id="id_div_pur_authentication">
											<div class="panel panel-heading" style=" background-color: #4294d4 " >
												<div class="row">
													<div class="col-md-12">
														<div class="row"     style=" color: #fafdff">
<div class="col-md-2">
																	<label class="radio-inline"> <input
																		type="radio" onclick="onclickid4(this.value)" 
																		id="id_rad_guest" value="guest" name="optradio" >Guest
																	</label>
																</div>
															<div class="col-md-2">
																<label class="radio-inline"> <input type="radio"
																	checked="checked" onclick="onclickid4(this.value)"
																	id="id_rad_signup" value="signup" name="optradio">Sign
																	up
																</label>
															</div>
															<div class="col-md-2">
																<label class="radio-inline"> <input type="radio"
																	onclick="onclickid4(this.value)" id="id_rad_login"
																	value="login" name="optradio">Login
																</label>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="panel panel-body panel1" id="panel-body1_id">
												<div class="row">
													<form id="id_form_pur_register_consumer">
														<div class="col-md-12">
															<div class="row">
																<div class="col-md-12">
																	<div class="col-md-4">
																		<i class="fa fa-user-o" aria-hidden="true"></i> <label
																			class="user-pdng" for="id_txt_userName_signup_pur">Your
																			Name </label><input class="form-control"
																			id="id_txt_userName_signup_pur" type="text"
																			name="userName" />
																	</div>
																	<div class="col-md-4">
																		<i class="fa fa-mobile" aria-hidden="true"></i> <label
																			class="user-pdng" for="id_txt_userId_signup_pur">Mobile
																			Number</label><input class="form-control"
																			id="id_txt_userId_signup_pur" type="text"
																			name="userId" />
																	</div>
																	<div class="col-md-4">
																		<i class="fa fa-envelope" aria-hidden="true"></i> <label
																			class="user-pdng" for="id_txt_emailId_signup_pur">Your
																			Email</label> <input class="form-control" type="text"
																			id="id_txt_emailId_signup_pur" name="emaild" />
																	</div>
																</div>
															</div>
															<br>
															<div class="row">
																<div class="col-md-12">
																	<div class="col-md-4">
																		<i class="fa fa-lock" aria-hidden="true"></i> <label
																			class="user-pdng" for="id_txt_pwd_signup_pur">Your
																			Password
																			<div class="glyphicon glyphicon-info-sign myClass"
																				data-toggle="tooltip" data-placement="right"
																				title="*one letter should be capital                                                                     *atleast minimum eight letters                                                     *one special character                                                                          *Must contains one number"
																				aria-hidden="true"></div>
																		</label><input class="form-control pwd"
																			id="id_txt_pwd_signup_pur" type="password"
																			name="password" />
																		<div class="progress">
																			<div class="progress-bar progress-bar-danger"
																				id="password-progress-bar" role="progressbar"
																				aria-valuenow="0" aria-valuemin="0"
																				aria-valuemax="100" style="width: 0">
																				<span class="sr-only">0% Complete (danger)</span> <span
																					id="progress-bar-text" style="color: #000;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-4">
																		<i class="fa fa-lock" aria-hidden="true"></i> <label
																			class="user-pdng" for="id_txt_cnfpwd_signup_pur">Confirm
																			Password</label><input class="form-control"
																			id="id_txt_cnfpwd_signup_pur" type="password"
																			name="Confirm_Password" />
																	</div>
																	<div class="col-md-4">

																		<button type="button" class="btn btn-success reg-btn"
																			id="id_register_btn_purchase"
																			onclick="registerConsumer()">Register</button>
																	</div>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>

										</div>
										<ul class="list-inline pull-right pull_pdng">
										<!-- <ul class="list-inline pull-right" style="margin-top: 20px;"> -->
										<!-- <li><button type="button"
												class="btn btn-default prev-step" id="tabstep4">Previous</button></li> -->
										<!-- <li><button type="button"
												class="btn btn-default btn-info-full"
												id="id_btn_buy_now">Buy Now</button></li> -->
										<li><button type="button"
												class="btn btn-default btn-info-full"
												id="id_btn_add_to_cart">Add to Cart</button></li>
										<!-- <li><button type="button"
												class="btn btn-primary btn-info-full continueShopping"
												id="id_btn_continueShopping">Continue Shopping</button></li> -->
										<li><button type="button"
												class="btn btn-default btn-info-full"
												id="id_btn_proceed_to_checkout">Proceed to Checkout</button></li>
									</ul>
									</div>
								</div>
							</div>

						</div>
						<!-- train section -->
						<div class="bhoechie-tab-content">
							<center>
								<h1 class="glyphicon glyphicon-road"
									style="font-size: 12em; color: #55518a"></h1>
								<h2 style="margin-top: 0; color: #55518a">Cooming Soon</h2>
								<h3 style="margin-top: 0; color: #55518a">Train Reservation</h3>
							</center>
						</div>

						<!-- hotel search -->
						<div class="bhoechie-tab-content">
							<center>
								<h1 class="glyphicon glyphicon-home"
									style="font-size: 12em; color: #55518a"></h1>
								<h2 style="margin-top: 0; color: #55518a">Cooming Soon</h2>
								<h3 style="margin-top: 0; color: #55518a">Hotel Directory</h3>
							</center>
						</div>
						<div class="bhoechie-tab-content">
							<center>
								<!-- <span class="round-cir">4</span> -->
								<h4 class="round-head">My Cart</h4>
								<br>
								
								<form id="id_form_checkOut_purchase" method="post"
											action="${pageContext.request.contextPath}/purchaseCard/checkOut">
											<input type="hidden" id="id_hdn_checkout_merchantID"
												name="itemNo"> <input type="hidden"
												id="id_hdn_merchant_ID" value="${merchantId}"
												name="merchantId"> <input type="hidden"
												id="id_hdn_theme_ID" name="themeId"> <input
												type="hidden" id="id_hdn_theme_Cat" name="themeCat">
											<input type="hidden" id="id_hdn_totalCharge"
												name="totalCharge"> <input type="hidden"
												id="id_hdn_cardValue" name="cardValue"> <input
												type="hidden" id="id_hdn_cart_cardType" name="cardType">
											<input type="hidden" id="id_hdn_cart_friendNum"
												name="friendNum"> <input type="hidden"
												id="id_hdn_mergedImageUrl" name="mergedImagePath">
										</form>
								
								
								<%-- <div class="tab-pane" role="tabpanel" id="complete">
									<div class="row" id="no-more-tables">
										<table id="id_table_item_purchase_summary"
											class="col-md-12 table-bordered table-striped table-condensed cf">
											<thead class="cf">
												<tr>
													<th>Item Number</th>
													<th>eGift Card</th>
													<th>Delivery</th>
													<th>Gift Value</th>
													<th>Service Fee</th>
													<th>Total</th>
													<th>Product Image</th>
													<th>Remove</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>

										
								
									</div>
									<br>
										<ul class="list-inline pull-right">
										<li><button type="button"
												class="btn btn-default btn-info-full next-step"
												id="id_btn_buy_checkout">Check out</button></li>
									</ul>
										<form id="id_form_checkOut_purchase" method="post"
											action="${pageContext.request.contextPath}/purchaseCard/checkOut">
											<input type="hidden" id="id_hdn_checkout_merchantID"
												name="itemNo"> <input type="hidden"
												id="id_hdn_merchant_ID" value="${merchantId}"
												name="merchantId"> <input type="hidden"
												id="id_hdn_theme_ID" name="themeId"> <input
												type="hidden" id="id_hdn_theme_Cat" name="themeCat">
											<input type="hidden" id="id_hdn_totalCharge"
												name="totalCharge"> <input type="hidden"
												id="id_hdn_cardValue" name="cardValue"> <input
												type="hidden" id="id_hdn_cart_cardType" name="cardType">
											<input type="hidden" id="id_hdn_cart_friendNum"
												name="friendNum"> <input type="hidden"
												id="id_hdn_mergedImageUrl" name="mergedImagePath">
										</form>
								</div> --%>


								<!-- <div class="row top-pdng">
									<h4 class="round-head">Secure Checkout</h4>



									CREDIT CARD FORM STARTS HERE
									<div class="panel panel-default credit-card-box">
										<div class="display-table">

											<div class="row display-tr">
												<div class="col-xs-12 col-md-10 col-lg-8 panel1">
													<h3 class="panel-title display-td">Payment Details</h3>
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
																<label class="user-pdng" for="couponCode">Name
																	on the Card</label> <input type="text" class="form-control"
																	name="couponCode" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="user-pdng" for="cardNumber">CARD
																	NUMBER</label>
																<div class="input-group">
																	<input type="tel" class="form-control"
																		name="cardNumber" placeholder="Valid Card Number"
																		autocomplete="cc-number" required autofocus />
																	<span class="input-group-addon"><i
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
																	class="visible-xs-inline">EXP</span> DATE</label> <input
																	type="tel" class="form-control" name="cardExpiry"
																	placeholder="MM / YY" autocomplete="cc-exp" required />
															</div>
														</div>
														<div class="col-xs-5 col-md-5 pull-right">
															<div class="form-group">
																<label class="user-pdng" for="cardCVC">CV CODE</label> <input
																	type="tel" class="form-control" name="cardCVC"
																	placeholder="CVC" autocomplete="cc-csc" required />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group">
																<label class="user-pdng" for="couponCode">Mobile
																	Number(optional)</label> <input type="text"
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
										CREDIT CARD FORM ENDS HERE


									</div>
									<div class="col-md-4"></div>




								</div> -->
								
<div class="">
	<div class="row">
		<div class="col-xs-7 cart_scroll">
		<div id="id_div_cart_image_loader"><img class="img-responsive load-img-login" src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
			<div class="panel ">
				<div class="panel-heading cart-panel">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-5">
								<h5 class="shpng-hd"><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
							</div>
							<div class="col-xs-7">
								<button type="button" class="btn btn-primary btn-sm" id="id_btn_continueShopping">
									<span class="glyphicon glyphicon-share-alt"></span> Continue shopping
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body" id="id_my_cart_panel">
					<!-- <div class="row">
						<div class="col-xs-3"><img style="height: 65px; width: 100px;" src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-6">
							<p class="product-name"><strong>Product name</strong></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
						</div>
						<div class="col-xs-3">
							<div class="col-xs-6 text-right">
								<h6><strong class="red-cart">25.00 </strong></h6>
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="rm-btn">
							<button type="button" class="remove-btn">Remove</button><button type="button" class="remove-btn">Edit</button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-3"><img  style="height: 65px; width: 100px;"  src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-6">
							<p class="product-name"><strong>Product name</strong></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
						</div>
						<div class="col-xs-3">
							<div class="col-xs-6 text-right">
								<h6><strong class="red-cart">25.00 </strong></h6>
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="rm-btn">
							<button type="button" class="remove-btn">Remove</button><button type="button" class="remove-btn">Edit</button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-xs-3"><img  style="height: 65px; width: 100px;"  src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-6">
							<p class="product-name"><strong>Product name</strong></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
							<p class="product-name-sm"><small><b>Style#:</b> 144810F-469</small></p>
						</div>
						<div class="col-xs-3">
							<div class="col-xs-6 text-right">
								<h6><strong class="red-cart">25.00 </strong></h6>
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="rm-btn">
							<button type="button" class="remove-btn">Remove</button><button type="button" class="remove-btn">Edit</button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="text-center">
							<div class="col-xs-7">
								<h6 class="text-right" style="padding-top: 10px;">Added items?</h6>
							</div>
							<div class="col-xs-5">
								<button type="button" class="remove-btn">
									Update cart
								</button>
							</div>
						</div>
					</div> -->
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-8">
							<h4 class="text-right" style="padding-top: 8px;">Total <strong id="id_label_total_amount"></strong></h4>
						</div>
						<div class="col-xs-4">
							<button type="button" class="btn btn-success btn-block" id="id_btn_checkout_div_cart">
								Checkout
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-5 cart_scroll">
			<div class="right-blk">
				<h4>SUMMARY</h4>
				<div id="id_div_summary_image_loader"><img class="img-responsive load-img-login" src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
				<div id="id_div_summary_cart">
				<!-- <div class="right-black-span">
					<span class="pull-left">right-blk</span><span class="pull-right">$10</span>
				</div>
				<div class="right-black-span">
					<span class="pull-left">right-blk</span><span class="pull-right">$10</span>
				</div>
				<div class="right-black-span">
					<span class="pull-left">right-blk</span><span class="pull-right">$10</span>
				</div>
				<div class="right-black-span">
					<span class="pull-left">right-blk</span><span class="pull-right">$10</span>
				</div>
				<div class="right-black-span">
					<span class="pull-left chk-hd">CONVERSE FREE SHIPPING APPLIED</span><span class="pull-right chk-hd">$10</span>
				</div>
				<div class="right-black-span">
					<span class="pull-left total">TOTAL</span><span class="pull-right total">$500</span>
				</div>
				<a href="#"><div type="button" class="total-check">
								Checkout
							</div></a>-->
							</div> 
			</div>
		</div>
	</div>
</div>
								
								
								
								
								
								
								
								
								
								
								
								
							</center>
						</div>
						<div class="bhoechie-tab-content">
							<center>
								<h1 class="glyphicon glyphicon-credit-card"
									style="font-size: 12em; color: #55518a"></h1>
								<h2 style="margin-top: 0; color: #55518a">Cooming Soon</h2>
								<h3 style="margin-top: 0; color: #55518a">Credit Card</h3>
							</center>
						</div>
					</div>
				</div>
				 <%--     <div class="col-lg-3 col-md-3 fxd_brand">
				     <%-- <div class="col-lg-3 col-md-3 fxd_brand">
            <div class="col-md-12 col-sm-12 col-xs-12 brand brand-item brand-item-preloaded brand_10 brand_11">

								<div class="flip-container flip_height"
									ontouchstart="this.classList.toggle('hover');">
									<span class="right">SAR</span> <span class="pin"><img
										src="https://cdnstatic.yougotagift.com/static/img/common/pin-f1f1f1.png"
										alt="" title=""></span> <a data-target=".brand-modal"
										class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">Virgin
										Megastore</a>
									<div class="">
										<figure class="img_pdng1">
											<div class="head_mega">
												<img class="img-responsive" src="${pageContext.request.contextPath}/resources/giftCardHome/images/card.png">
												
											</div>
										</figure>
									</div>
								</div>
							</div>
            </div> --%>
			</div>
		</div>
		<div class="clear-fix"></div><br><br>


















		<!-- <div class="container">
		
			<div class="row">
				<section>
					<div class="wizard">
						<div class="wizard-inner">
							<div class="connecting-line"></div>
							<ul class="nav nav-tabs nav_1" role="tablist">

								<li role="presentation" class="active" id="id_list_tab_1"><a
									href="#step1" data-toggle="tab" aria-controls="step1"
									role="tab" title="Pick amount"> <span class="round-tab"
										id="page1-id"> <i class="fa fa-credit-card"></i>
									</span>
								</a></li>

								<li role="presentation" class="disabled" id="id_list_tab_2"><a
									href="#step2" data-toggle="tab" aria-controls="step2"
									role="tab" title="Make it personal"> <span
										class="round-tab" id="page2-id"> <i class="fa fa-user"></i>
									</span>
								</a></li>
								<li role="presentation" class="disabled" id="id_list_tab_3"><a
									href="#step3" data-toggle="tab" aria-controls="step3"
									role="tab" title="Choose Delivery"> <span class="round-tab"
										id="page3-id"> <i class="fa fa-cart-plus"></i>
									</span>
								</a></li>

								<li role="presentation" class="disabled" id="id_list_tab_4"><a
									href="#complete" data-toggle="tab" aria-controls="complete"
									role="tab" title="Check out"> <span class="round-tab"
										id="page4-id"> <i class="glyphicon glyphicon-ok"></i>
									</span>
								</a></li>
							</ul>
						</div>

						<div class="tab-content nav_con_1">
							<div class="tab-pane  active" role="tabpanel" id="step1">
								<div class="row">
									<div class="col-md-10">
										<div class="col-md-1">
											<div class="form-group"></div>
										</div>

										<div class="col-sm-9">
											<div class="form-group">
												<div id="London">

													<h4>How much would you like to give?</h4>
													<p class="select-amount">Select from popular amounts</p>
													<div class="dropdown">
														<select class="btn btn-default" id="id_period_type"
															style="outline-color: red;">
															<option value="AED">AED</option>
															<option value="SAR">SAR</option>
															<option value="QAR">QAR</option>
															<option value="USD">USD</option>
															<option value="GBP">GBP</option>
															<option value="EUR">EUR</option>
															<option value="BHD">BHD</option>
														</select>


														<button type="button" class="btn btn-default"
															onClick="setAmount(this)">100</button>
														<button type="button" class="btn btn-default"
															onClick="setAmount(this)">200</button>
														<button type="button" class="btn btn-default"
															onClick="setAmount(this)">300</button>
														<button type="button" class="btn btn-default"
															onClick="setAmount(this)">400</button>
														<button type="button" class="btn btn-default"
															onClick="setAmount(this)">500</button>
														(or)&nbsp<input class="btn btn-default" size="9px;"
															style="padding-bottom: 5px;" type="text"
															placeholder="Set your own" id="id_set_custom_amount">
														<input type="hidden" id="id_hdn_cart_cardThemeId">
													</div>
												</div>
											</div>
										</div>





									</div>
								</div>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-primary next-step" id="tabstep1">Next</button></li>
								</ul>
							</div>
							<br> <br>


							<div class="tab-pane" role="tabpanel" id="step2">
								<div class="row">
									<div class="col-md-offset-1 col-md-10">
										<div class="form-group">
											<br>
											<div class="tab-content">
												<div id="tt1" class="tab-pane fade in active">

													<div class="row">
														<div class="row">
															<div class="col-md-12">
																<h4>Step 1:Choose a Theme</h4>

																<div class="col-sm-10" id="id_div_themes_all">

																</div>

															</div>
															<br> <br>

															<h4 style="padding-left: 15px;">Select an image</h4>

															<div id="hides-show-id" class="row"
																style="display: none;">
																<div class="row">
																	<div class="col-sm-1">&nbsp;</div>
																	<div class="col-sm-10">
																		<button type="button" class="btn btn-info btn_1">row2</button>
																		<button type="button" class="btn btn-info btn_1">birthday</button>
																		<button type="button" class="btn btn-info btn_1">birthday</button>
																		<button type="button" class="btn btn-info btn_1">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																	</div>

																</div>
																<br>

																<div class="row">

																	<div class="col-sm-10">
																		<button type="button" class="btn btn-info">row3</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																	</div>

																</div>
																<br>
																<div class="row">

																	<div class="col-sm-10">
																		<button type="button" class="btn btn-info">row4</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>
																		<button type="button" class="btn btn-info">birthday</button>

																	</div>

																</div>
															</div>

															<div class="row">
																
																<div class="col-sm-8">
																	&nbsp;

																	<div class="container">
																		<!-- <div class="row"></div> 
																		<div class="row">

																			<div class="col-md-6">
																				<div class="carousel slide media-carousel"
																					id="media">
																					<div class="carousel-inner"
																						id="id_div_carousel_images">
													
																					</div>
																					<button type="button" class="left carousel-control"
																						id="id_btn_previous">‹</button>
																					<button type="button"
																						class="right carousel-control" id="id_btn_next">›</button>


																				
																				</div>
																			</div>
																			<div class="col-md-4"></div>
																		</div>
																		<div class="row">
																			<div class="col-md-12">


																				<form class="form-horizontal"
																					id="id-form-upload-excel-fileUpload" method="POST"
																					enctype="multipart/form-data"
																					action="${pageContext.request.contextPath}/purchaseCard/mergeImages">
																					<div class="col-md-4">
																						<a class="thumbnail"><img alt=""
																							src="${pageContext.request.contextPath}/resources/img/user.png"
																							id="id_img_hover_preview" name="designImage">
																							<div class="box-p">
																								<p></p>
																							</div> </a>
																					</div>

																					<div class="row">
																						<div class="col-md-12">
																							<h4>Step 2:Design a personal text</h4>
																							<br>

																							<textarea name="message" cols="35"
																								autocomplete="off" id="gift_message"
																								style="overflow: hidden; width: 100%; min-height: 2em; height: 150px;"
																								maxlength="190">
                                                                                    </textarea>
																						</div>
																					</div>
																					<br>
																					<div class="row">
																						<div class="col-md-12">
																							<div id="crop-avatar">
																								<h4>Step 3:Choose your own image</h4>
																								<!-- Current avatar 
																								<div class="col-sm-6"
																									style="padding-top: 20px; padding-bottom: 20px;">
																									<input type='file' id="chooseFile"
																										name="chosenImage" onchange="readURL(this);" />

																									<div class="col-sm-3">
																										<img class="img-responsive avatar-view"
																											style="padding-top: 20px;"
																											src="${pageContext.request.contextPath}/resources/img/user.png"
																											alt="No Image Found"
																											title="Change the avatar"
																											id="profilePictureModal"
																											name="profilePictureModal">
																										<!--  <input type='file' id="chooseFile"  onchange="readURL(this);"   style="display: none;" name="fileUploads" accept=".jpg,.jpeg,.png"/> 
																								</div>
																							</div>
																							<br>
																							<div class="row">
																								<div class="col-md-12">

																									<button type="button"
																										id="id_upload_image_to_merge"
																										class="btn btn-success">Merge and
																										preview</button>

																								</div>

																							</div>
																						</div>
																					</div>
																					<iframe id="postiframeUpload" name="postiframe"
																						style="display: none;"></iframe>
																				</form>
																			</div>

																		</div>
																	</div>
																</div>

															</div>

														</div>
														<div class="col-sm-1">&nbsp;</div>
														<div class="col-sm-1">&nbsp;</div>
													</div>
												</div>

											</div>
										</div>

									</div>
								</div>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step" id="tabstep2">Previous</button></li>

									<li><button type="button"
											class="btn btn-primary btn-info-full next-step" id="tabstep3">Next</button></li>

								</ul>
							</div>

							<div class="tab-pane" role="tabpanel" id="step3">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<div id="Tokyo">
												<h4>How would you like to deliver this eGift Card?</h4>
												<br>
												<ul class="nav nav-pills" style="padding-bottom: 20px;">
													<li class="active"><a data-toggle="tab" href="#home_2">Send
															by Email</a></li>
												</ul>
												<div class="panel panel-info">
													<div class="panel panel-heading">
														<div class="row ">
															<div class="col-md-9">
																<span class="glyphicon glyphicon-envelope"></span> <label
																	for="label_Treatment-id"> EMail </label>
															</div>
														
														</div>
													</div>


													<div class="panel panel-body " id="panel-body_id">
														<div class="row ">
															<div class="col-md-12">
																<h4>Purchaser's details</h4>

																<div class="col-md-4">
																	<i class="fa fa-user-circle" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Purchaser's Name </label><input
																		class="form-control" type="text" />
																</div>
																<div class="col-md-4">
																	<i class="fa fa-envelope" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Purchaser's Email</label> <input
																		class="form-control" type="text" />
																</div>
																<div class="col-md-4">
																	<i class="fa fa-mobile" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Purchaser's mobile</label> <input
																		class="form-control" type="text" />
																</div>
															</div>
														</div>
													</div>


													<div class="panel panel-body " id="panel-body_id">
														<div class="row ">
															<div class="col-md-12">
																<h4>Friend's details</h4>

																<div class="col-md-4">
																	<i class="fa fa-user-circle" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Friend's Name </label><input
																		class="form-control" type="text" />
																</div>
																<div class="col-md-4">
																	<i class="fa fa-envelope" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Friend's Email</label> <input
																		class="form-control" type="text" />
																</div>
																<div class="col-md-4">
																	<i class="fa fa-mobile" aria-hidden="true"></i> <label
																		for="label_Treatment-id">Friend's mobile</label> <input
																		id="id_friend_number" id="id_friend_number"
																		class="form-control" type="text" />

																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="panel panel-info" id="id_div_pur_authentication">
													<div class="panel panel-heading">
														<div class="row">
															<div class="col-md-12">
																<div class="row">
																
																	<div class="col-md-2">
																		<label class="radio-inline"> <input
																			type="radio" checked="checked"
																			onclick="onclickid4(this.value)" id="id_rad_signup"
																			value="signup" name="optradio">Sign up
																		</label>
																	</div>
																	<div class="col-md-2">
																		<label class="radio-inline"> <input
																			type="radio" onclick="onclickid4(this.value)"
																			id="id_rad_login" value="login" name="optradio">Login
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												
													<div class="panel panel-body" id="panel-body1_id">
														<div class="row">
															<form id="id_form_pur_register_consumer">
																<div class="col-md-12">
																	<div class="row">
																		<div class="col-md-12">
																			<div class="col-md-4">
																				<i class="fa fa-user-o" aria-hidden="true"></i><label
																					for="id_txt_userName_signup_pur">Your Name
																				</label><input class="form-control"
																					id="id_txt_userName_signup_pur" type="text"
																					name="userName" />
																			</div>
																			<div class="col-md-4">
																				<i class="fa fa-mobile" aria-hidden="true"></i> <label
																					for="id_txt_userId_signup_pur">Mobile
																					Number</label><input class="form-control"
																					id="id_txt_userId_signup_pur" type="text"
																					name="userId" />
																			</div>
																			<div class="col-md-4">
																				<i class="fa fa-envelope" aria-hidden="true"></i><label
																					for="id_txt_emailId_signup_pur">Your Email</label>
																				<input class="form-control" type="text"
																					id="id_txt_emailId_signup_pur" name="emaild" />
																			</div>
																		</div>
																	</div>
																	<br>
																	<div class="row">
																		<div class="col-md-12">
																			<div class="col-md-4">
																				<i class="fa fa-lock" aria-hidden="true"></i><label
																					for="id_txt_pwd_signup_pur">Your password
																					<div class="glyphicon glyphicon-info-sign myClass"
																						data-toggle="tooltip" data-placement="right"
																						title="*one letter should be capital                                                                     *atleast minimum eight letters                                                     *one special character                                                                          *Must contains one number"
																						aria-hidden="true"></div>
																				</label><input class="form-control pwd"
																					id="id_txt_pwd_signup_pur" type="password"
																					name="password" />
																				<div class="progress">
																					<div class="progress-bar progress-bar-danger"
																						id="password-progress-bar" role="progressbar"
																						aria-valuenow="0" aria-valuemin="0"
																						aria-valuemax="100" style="width: 0">
																						<span class="sr-only">0% Complete (danger)</span>
																						<span id="progress-bar-text" style="color: #000;"></span>
																					</div>
																				</div>
																			</div>
																			<div class="col-md-4">
																				<i class="fa fa-lock" aria-hidden="true"></i><label
																					for="id_txt_cnfpwd_signup_pur">Confirm
																					password</label><input class="form-control"
																					id="id_txt_cnfpwd_signup_pur" type="password"
																					name="Confirm_Password" />
																			</div>
																			<div class="col-md-4">
																				<button type="button" class="btn btn-success"
																					id="id_register_btn_purchase"
																					onclick="registerConsumer()">Register</button>
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
									</div>
									<ul class="list-inline pull-right">
										<li><button type="button"
												class="btn btn-default prev-step" id="tabstep4">Previous</button></li>
										<li><button type="button"
												class="btn btn-primary btn-info-full"
												id="id_btn_add_to_cart">Add to cart</button></li>
										<li><button type="button"
												class="btn btn-primary btn-info-full continueShopping"
												id="id_btn_continueShopping">Continue Shopping</button></li>
										<li><button type="button"
												class="btn btn-primary btn-info-full"
												id="id_btn_proceed_to_checkout">proceed to Check
												out</button></li>
									</ul>
								</div>
							</div>
						
						</div>
					</div>
				</section>
			</div>
		</div> --%>


		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog modal_list_1" role="document">
				<div class="modal-content">
					<div class="modal-header mdl_head">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h5 class="modal-title" id="exampleModalLabel">Select a
							design for your gift card</h5>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-3 bordr_clum">

									<h5>occasions</h5>
									<ul class="list-unstyled"
										id="id_ul_list_of_all_different_themes">
										<!--    <li><label><input type="checkbox" name="casual_dating"> Anniversary</label></li>
             
									</ul>
								</div>
								<div class="col-md-9">
									<div class="well well-sm well_padng">

										<div class="btn-group pull-right">
											<a href="#" id="list" class="btn btn-default btn-sm"><span
												class="glyphicon glyphicon-th-list"> </span>List</a> <a href="#"
												id="grid" class="btn btn-default btn-sm"><span
												class="glyphicon glyphicon-th"></span>Grid</a>
										</div>
									</div>
									<div id="products" class="row list-group">
										<!--  <div class="item  col-xs-12 col-lg-4 col-md-4">
            <div class="thumbnail img_thumb">
                <img class="group list-group-image img-responsive" src="http://placehold.it/400x250/000/fff" alt="" />              
            </div>
        </div>
        -->

										<div class="modal-footer">
											<!-- <button type="button" class="btn btn-primary">Use
												This Design</button> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document)
					.ready(
							function() {
								$("div.bhoechie-tab-menu>div.list-group>a")
										.click(
												function(e) {
													e.preventDefault();
													$(this)
															.siblings(
																	'a.active')
															.removeClass(
																	"active");
													$(this).addClass("active");
													var index = $(this).index();
													$(
															"div.bhoechie-tab>div.bhoechie-tab-content")
															.removeClass(
																	"active");
													$(
															"div.bhoechie-tab>div.bhoechie-tab-content")
															.eq(index)
															.addClass("active");
												});
							});
		</script>
		<script
			src="${pageContext.request.contextPath}/resources/js/purchaseCard.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>