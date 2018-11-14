<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="My Wallets" />
	<tiles:putAttribute name="body">
	<style>
	#id-gif-id{
    position:relative;
}

#img-load {
    position: absolute;
    left: 275px;
    top: 50px;
    width: 75px; height:75px;
}
	</style>
	 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
		<script
			src="${pageContext.request.contextPath}/resources/js/merchantDiscount.js"></script>
		<!--body wrapper start-->
		<div class="bodyMinHeight">
			<div class="">
				<div class="col-md-12 merchant_row_list">

					
							<h4><span class="fa-stack fa-stack-discount"><i class="fa fa-tags"></i><i class="fa fa-scissors"></i></span>Define My Discount</h4>
							
					<div id="ttab1" class="tab-pane in active tab_panel_info">
						<!-- <div class="col-sm-1">&nbsp;</div>
 -->						<div>
							<!-- <div class="col-sm-1">&nbsp;</div> -->
							<div class="panel body">



<form id="merchant-discount">
								<div class="row">
									<div class="col-md-10" id="id-gif-id">
											<div class="col-md-6">
											<div class="merchant_input">
												<div class="col-md-5 sweepng_pdng">
													<label for="label_Treatment-id">Coupon Code</label>
												</div>
												<div class="col-md-7 merchant_padding">
													<input class="form-control" type="text" name="coupenCode" id="coupon-code_id"
														placeholder="Coupon Code" />
												</div>
												</div>
												<div class="merchant_input">
												<div class="col-md-5 sweepng_pdng">
													<label for="label_Treatment-id">Discount Percentage</label>
												</div>
												<div class="col-md-7 merchant_padding">
													<input class="form-control" type="text" name="discountPercentage"  id="discount-per_id"
														placeholder="Discount Percentage" />
												</div>
                                                </div>
                                                <div class="merchant_input">
												<div class="col-md-5 sweepng_pdng">
													<label for="label_Expiry-id">Expiry Date</label>
												</div>
												<div class="col-md-7 merchant_padding">
													<input class="form-control" type="text" name="expiryDate" placeholder="Expiry Date" id="expiry-date_id" />
												</div>
												</div>
												<div class="merchant_input">
												<div class="col-md-5 sweepng_pdng">
													<label for="label_Treatment-id">Discount Logo</label>
												</div>
												<div class="col-md-7 merchant_padding">
													<input type='file' id="chooseFile" name="discountLogo" 
														onchange="readURL(this);" />
														</div>
														</div>
														
																																							
													    </div>
											<div class="col-md-6 merchant_padding">
													<div id="crop-avatar" class="crop_mrgn">
														<!-- Current avatar -->
														<img class="img-responsive avatar-view"
															src="${pageContext.request.contextPath}/resources/img/user.png"
															alt="No Image Found" 
															style="height: 80px; width: 80px;"
															id="profilePictureModal" name="profilePictureModal">

													</div>
												</div>
													<div class="col-md-12 merchant_btn">
												
														<button type="button"
												class="btn btn-primary btn-info-full next-step"
												id="id_btn_proceed_to_save" >save</button>
														</div>
										<br>
										
										<div id="img-load" align="center"><img class="img-responsive load-img-login"  src="${pageContext.request.contextPath}/resources/giftCardHome/images/three.gif" /></div>
									</div>
<!-- <div class="col-md-12 text-center">
											<button type="button"
												class="btn btn-primary btn-info-full next-step"
												id="id_btn_proceed_to_save" >save</button>
										
													</div> -->
									<br>
									<!-- <div class="col-sm-1">&nbsp;</div> -->
									<div class="row">
										
									</div>
								</div>
								</form>
							</div>
						</div>



					</div>
				</div>
			</div>
			
			
			
				<div class="row row-1">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">
						<div class="container-fluid control-2">
							<!-- <i class="fa fa-list-alt customHead_Fa" aria-hidden="true">
								Gift Card Theme Results</i> -->

							<div class="col-md-12" style="padding-top: 20px" id="no-more-tables" >
								<table id="id_table_discount"
									class="col-md-12 table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
								            <th>Coupon Code</th>
								            <th>Expiry Date</th>
								            <th>Discount Percentage</th>
								            <th>Discount Logo</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>

							</div>

						</div>
					</div>

					<div class="pull-right grid-tools" style="padding-top: 30px; margin-right: 57px">

						<button type="button" class="btn btn-warning btn-sm"
							id="id-edit-discount">
							<i class="fa fa-pencil"></i><span>Edit</span>
						</button>


						 <button type="button" class="btn btn-danger btn-sm"
							id="id-delete-discount">
							<i class="fa fa-remove"></i><span>Delete</span>
						</button> 
						
					</div>
					
				</div> 
				<br>
			<!-------------------------------- delete modal-------------------------->
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
			                     <!------------------------modal end -------------------->
			
			
			
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
												<!-- <span name="19" ></span> --> Edit  
											</b>
										</h4>
									</div>
									<div class="modal-body">
									
										<form id="giftCard-edit-form" class="form-horizontal">
											<div class="box-body">
												<div class="form-group">
													
													<div class="col-sm-7">
														<input class="form-control" placeholder="Card Group" maxlength="11"
														 type="hidden" id="card-theme-edit" name="cardTheme" readonly="readonly"/>
													</div>
												</div>
												<div class="form-group">
													<label for="expiry-date-id" class="col-sm-5 control-label">Expiry Date<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														 <input class="form-control" placeholder="Expiry Date" maxlength="65"
														 type="text" id="expiry-modal-date_id" name="expiryDate"/>
														 
													</div>
												</div>
												 <div class="form-group">
													<label for="discount-percentage-id" class="col-sm-5 control-label">Discount percentage<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														<input class="form-control" placeholder="Discount percentage" maxlength="65"
														 type="text" id="discount-modal-percentage-id" name="discountPercentage"/>
													</div>
												</div> 
											   <div class="form-group">
													<label for="discount-logo-id" class="col-sm-5 control-label">Discount Logo<a style="color: red">*</a>
													</label>
													<div class="col-sm-7">
														<div id="crop-avatar">
														<input type='file' id="chooseFile-id" name="discountLogo"
														onchange="readURLEdit(this);" />
														<!-- Current avatar -->
														<%-- <img class="img-responsive avatar-view"
															src="${pageContext.request.contextPath}/resources/img/user.png"
															alt="No Image Found" 
															style="height: 200px; width: 200px;"
															id="profilePictureModal1" name="profilePictureModal"> --%>
													<div id="id_image_modal"></div>
													</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-success"
													id="discount-modal-update">
													<i class="fa fa-check"></i>
													<!-- <span name="34" ></span> -->
													Update
												</button>
												<button type="button" class="btn btn-danger"
													data-dismiss="modal" id="discount-modal-edit-cancel" >
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
						
			                     <!------------------------modal end -------------------->
			
			
		</div>
		<style>
		.fa-stack-discount{
        position:relative;
        padding-left:6px;
}
.fa-scissors {
		position:absolute;
		left:0px;
		top:-2px;
		</style>
		<script
			src="${pageContext.request.contextPath}/resources/js/myCards.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>