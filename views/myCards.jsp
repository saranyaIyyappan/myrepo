<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="My Wallets" />
	
	<tiles:putAttribute name="body">
	
       
        <!--body wrapper start-->
			<div class="row serboxx my_mrgn">
				<div class="col-md-12 col-sm-12 col-xs-12">			
							<div class="col-md-8 col-sm-12 ">
							<label for="company_id_search" class=" col-lg-5 col-md-12 col-sm-12 control-label"
									>Wallet Number: </label>
								<div class="col-lg-7 col-md-12 col-sm-12">
											<select class="form-control column_filter" aria-hidden="true"
										id="id_card_no" name="cardNo" data-column="0" style="height: 30px">
									</select>
								</div>
								
							</div>
						
					<div class="row" id="id-div-card">
					<div class="col-md-8 col-sm-12 col-xs-12">
						<div class=" control-2">
							<!-- <h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Your last Transations on this Card</i></h3> -->
							<div class="col-md-12"  id="id_div_design_card_images">								
								<div class="col-md-6 btn_merchant">
								<button type="button" id="id_btn_image_card" class="btn btn-default">
								<img id="id_image_card_view" src="${pageContext.request.contextPath}/resources/giftCardHome/images/anb_pockets_web.png" width="400px" height="235px">
								</button>
								</div>
								<!-- <div class="col-md-offset-1 col-sm-4"> -->
								<div id="img-load"><img class="img-responsive load-img-login" src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
							<!-- </div> -->
								
									
							</div>

						</div>
					</div>
					<!-- <div class="row" style="padding-top: 20px">
					<div class="col-md-12">
					<div class="col-md-2"></div>
					<div class="col-md-6">Current Balance ----------------------------------------------</div>
					<div class="col-md-4"></div>
					</div>
					</div> -->

				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px" id="id_div_results_transaction">
						<div class="container-fluid control-2">
							<i class="fa fa-list-alt customHead_Fa" aria-hidden="true">
								Transaction Results</i>

							<div class="col-md-12" style="padding-top: 20px" id="no-more-tables">
								<table id="id_table_transactions_for_cardId"
									class="col-md-12 table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<!-- <th>Card Theme</th> -->
								            <th>Date</th>
								            <th>Description</th>
								            <th>Amount</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							<!-- 	<div class="col-md-3">
								<label> Current Balance </label>
								</div>
								<div class="col-md-5"></div>
								<div class="col-md-4">
								5000
								</div> -->
							</div>
							
					<div class="row" style="padding-top: 20px">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-6" style="font-size:x-large;"><label>Current Balance:</label><span id="id_p_balAmount"></span></div>
					</div>
						</div>
					</div>
				
				</div>
               </div>
			
        
<script src="${pageContext.request.contextPath}/resources/js/myCards.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/myCards.css"
			rel="stylesheet">
		</tiles:putAttribute>
</tiles:insertDefinition>