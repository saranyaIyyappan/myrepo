function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
var cardDetailsData = null;
$(document)
		.ready(
				function() {
					getAllCardTheme();
					getAllCardGroup();
					getAllMerchants();

					toastr.options = {
						"preventDuplicates" : true,
						"preventOpenDuplicates" : true
					};

					var cardDetails = $('#card-details-table').DataTable(
							{

								"bProcessing" : true,
								"bDeferRender" : true,
								bAutoWidth : false,
								bServerSide : true,
								sAjaxSource : getContextPath()
										+ "/cardDetails/cardDetailsList",
								"iDisplayLength" : 5,
								"aLengthMenu" : [ [ 5, 10, 25, 50, 100 ],
										[ 5, 10, 25, 50, 100 ] ],
								"sPaginationType" : "full_numbers",
								"bPaginate" : true,
								"fnServerParams" : function(aoData) {

									
								/*	 var clinicId =
									  $("#id_hdn_clinic_ID").val(); 
									 if
									  (clinicId == null || clinicId ==
									  undefined) { clinicId = ""; }*/
									 
									 var cardType=$("#id-card-type-search").val();
									  if(cardType == null || cardType ==
									 undefined){ cardType = ""; } var
									 merchantId=$("#id-merchant-id-search").val();
									  if(merchantId == null || merchantId ==
									  undefined){ merchantId = ""; }
									 

									var dataString = JSON.stringify({
								
										cardType :cardType,
										merchantId :merchantId
									});

									aoData.push({
										name : "searchData",
										value : dataString
									});

								},
								"fnServerData" : function(sSource, aoData,
										fnCallback, oSettings) {
									oSettings.jqXHR = $.ajax({
										"dataType" : 'json',
										"type" : "POST",
										"url" : sSource,
										"data" : aoData,
										"success" : fnCallback,
										"error" : function(e) {
											console.log(e.message);
										}

									});
								},
								"aaSorting" : [ [ 1, "asc" ] ],
								"sDom" : 'rt<lp>',
								"aoColumns" : [ {
									"mDataProp" : "cardType",
									"bSortable" : false,
								},

								{
									"mDataProp" : "cardCat",
									"bSortable" : false,
							
								}, {
									"mDataProp" : "cardTheme",
									"bSortable" : false
								},

								{
									"mDataProp" : "cardGrp",
									"bSortable" : false
								}, {
									"mDataProp" : "merchantId",
									"bSortable" : false
								}, {
									"mDataProp" : "locationName",
									"bSortable" : false
								}, {
									"mDataProp" : "cardAmount",
									"bSortable" : false
								}, {
									"mDataProp" : "status",
									"bSortable" : false
								}, /*
									 * { "mDataProp" : "AfcCharge", "bSortable" :
									 * false }, { "mDataProp" : "bankCharge",
									 * "bSortable" : false }, { "mDataProp" :
									 * "merCharge", "bSortable" : false }
									 */

								],
								columnDefs : [ {
									targets : [ 0 ],
									render : function(data, type, row) {
										switch (data) {
										case 0:
											return 'Rechargable Wallet';
											break;
										case 1:
											return 'Non Rechargable Wallet';
											break;
										case 2:
											return 'Login Card';
											break;
										case 3:
											return 'Digital Card';
											break;

										}
									}
								} ]
								

							});

					$("#card-details-create	").click(function() {

						$('#card-details-form')[0].reset();
						$("#id-card-details-modal").modal('show');

					});

					$("#create_card_btn")
							.click(
									function() {
										var allInputs = $(":input");
										allInputs.each(function() {
											$(this).val($.trim($(this).val()));
										});
										if ($("#id_merchant_id").val() == "") {
											toastr
													.warning("Please enter the Merchant Id!");
										} else if ($(
												"#id-card-details-cardType")
												.val() == "") {
											toastr
													.warning("Please enter the Card Type!");
										} else if ($(
												"#id-card-details-card-theme")
												.val() == "") {
											toastr
													.warning("Please enter the Card Theme!");
										} else if ($("#id_card_card_category")
												.val() == "") {
											toastr
													.warning("Please enter the Card Category!");
										} else if ($("#id_card_group").val() == "") {
											toastr
													.warning("Please enter the Card Group!");
										} else if ($("#id_card_amount").val() == "") {
											toastr
													.warning("Please enter the Card Amount!");
										} else if ($("#id_status").val() == "") {
											toastr
													.warning("Please enter the Status!");
										} /*
											 * else if
											 * ($("#id_bank_charge").val() ==
											 * "") { toastr.warning("Please
											 * enter the Bank Charge!"); } else
											 * if
											 * ($("#id_merchant_charge").val() ==
											 * "") { toastr.warning("Please
											 * enter the Merchant Charge!"); }
											 * else if
											 * ($("#id_expiry_period").val() ==
											 * "") { toastr.warning("Please
											 * enter the Expiry Period!"); }
											 */
										else {

											$
													.ajax({
														url : getContextPath()
																+ "/cardDetails/createCard",
														type : 'POST',
														data : $(
																"#card-details-form")
																.serialize(),
														success : function(data) {
															var res = JSON
																	.parse(data);
															var status = res.status;
															var message = res.message;
															if (status == 'Success'
																	|| status == 'success') {
																toastr
																		.success(message);
															} else {
																toastr
																		.success(message);
															}

															$(
																	"#id-card-details-modal")
																	.modal(
																			'hide');
															cardDetails.draw();

														},
														error : function() {
															$(
																	"#id-card-details-modal")
																	.modal(
																			'hide');

														}
													});

										}
									});

					$("#id_edit-card-details-cardType")
							.change(
									function() {
										var cardType = $(
												"#id_edit-card-details-cardType")
												.val();
										var cardTheme = $(
												"#id_edit-card-details-theme")
												.val();
										var merchantId = $(
												"#id_edit_merchant_id").val();

										if ($("#id_edit_merchant_id").val() != ""
												&& $(
														"#id_edit-card-details-theme")
														.val() != "") {

											getAllCardCategory(merchantId,
													cardType, cardTheme);

										}

									});
					$("#id_edit-card-details-theme").change(
							function() {
								if ($("#id_edit_merchant_id").val() != ""
										&& $("#id_edit-card-details-cardType")
												.val() != "") {

									var cardType = $(
											"#id_edit-card-details-cardType")
											.val();
									var cardTheme = $(
											"#id_edit-card-details-theme")
											.val();
									var merchantId = $("#id_edit_merchant_id")
											.val();
									getAllCardCategory(merchantId, cardType,
											cardTheme);
								}

							});
					$("#id_edit_merchant_id")
							.change(
									function() {
										if ($("#id_edit-card-details-theme")
												.val() != ""
												&& $(
														"#id_edit-card-details-cardType")
														.val() != "") {

											var cardType = $(
													"#id_edit-card-details-cardType")
													.val();
											var cardTheme = $(
													"#id_edit-card-details-theme")
													.val();
											var merchantId = $(
													"#id_edit_merchant_id")
													.val();
											getAllCardCategory(merchantId,
													cardType, cardTheme);
										}

									});

					$("#id-card-details-cardType")
							.change(
									function() {
										var cardType = $(
												"#id-card-details-cardType")
												.val();
										var cardTheme = $(
												"#id-card-details-theme").val();
										var merchantId = $("#id_merchant_id")
												.val();

										if ($("#id_merchant_id").val() != ""
												&& $("#id-card-details-theme")
														.val() != "") {

											getAllCardCategory(merchantId,
													cardType, cardTheme);

										}

									});
					$("#id-card-details-theme")
							.change(
									function() {
										if ($("#id_merchant_id").val() != ""
												&& $(
														"#id-card-details-cardType")
														.val() != "") {

											var cardType = $(
													"#id-card-details-cardType")
													.val();
											var cardTheme = $(
													"#id-card-details-theme")
													.val();
											var merchantId = $(
													"#id_merchant_id").val();
											getAllCardCategory(merchantId,
													cardType, cardTheme);
										}

									});
					$("#id_merchant_id")
							.change(
									function() {
										if ($("#id-card-details-theme").val() != ""
												&& $(
														"#id-card-details-cardType")
														.val() != "") {

											var cardType = $(
													"#id-card-details-cardType")
													.val();
											var cardTheme = $(
													"#id-card-details-theme")
													.val();
											var merchantId = $(
													"#id_merchant_id").val();
											getAllCardCategory(merchantId,
													cardType, cardTheme);
										}

									});
					$('#card-details-table').on(
							'click',
							'tr',
							function() {
								if ($(this).hasClass('selected')) {
									$(this).removeClass('selected');
									cardDetailsData = null;
								} else {
									cardDetails.$('tr.selected').removeClass(
											'selected');
									$(this).addClass('selected');
									cardDetailsData = cardDetails.row(this)
											.data();

								}
							});
					$("#card-details-edit").click(
							function() {

								if (cardDetailsData != null) {

									$("#hidden_card_id").val(
											cardDetailsData.cardId);

									$("#id_edit_merchant_id").val(
											cardDetailsData.merchantId);
									$("#id_edit-card-details-cardType").val(
											cardDetailsData.cardType);

									$("#id_edit-card-details-theme").val(
											cardDetailsData.cardTheme);
									$("#id_edit_card_group").val(
											cardDetailsData.cardGrp);

									var cardType = $(
											"#id_edit-card-details-cardType")
											.val();
									var cardTheme = $(
											"#id_edit-card-details-theme")
											.val();
									var merchantId = $("#id_edit_merchant_id")
											.val();
									getAllCardCategoryEdit(merchantId,
											cardType, cardTheme);

									$("#id_edit_loc_name").val(
											cardDetailsData.locationName);
									$("#id_edit_card_amount").val(
											cardDetailsData.cardAmount);
									$("#id_edit_status").val(
											cardDetailsData.status);

									$("#id-edit_card-details-modal").modal(
											'show');

								} else {
									toastr.warning("Please Select a Row !!");
								}
							});

					$("#edit_card_btn")
							.click(
									function() {
										var allInputs = $(":input");
										allInputs.each(function() {
											$(this).val($.trim($(this).val()));
										});
										if ($("#id_edit_merchant_id").val() == "") {
											toastr
													.warning("Please enter the Merchant Id!");
										} else if ($(
												"#id_edit-card-details-cardType")
												.val() == "") {
											toastr
													.warning("Please enter the Card Type!");
										} else if ($(
												"#id_edit-card-details-theme")
												.val() == "") {
											toastr
													.warning("Please enter the Card Theme!");
										} else if ($(
												"#id_edit-card-details-cardType")
												.val() == "") {
											toastr
													.warning("Please enter the Card Category!");
										} else if ($("#id_edit_card_group")
												.val() == "") {
											toastr
													.warning("Please enter the Card Group!");
										} else if ($("#id_edit_card_amount")
												.val() == "") {
											toastr
													.warning("Please enter the Card Amount!");
										} else if ($("#id_edit_status").val() == "") {
											toastr
													.warning("Please enter the Status!");
										} /*
											 * else if
											 * ($("#id_bank_charge").val() ==
											 * "") { toastr.warning("Please
											 * enter the Bank Charge!"); } else
											 * if
											 * ($("#id_merchant_charge").val() ==
											 * "") { toastr.warning("Please
											 * enter the Merchant Charge!"); }
											 * else if
											 * ($("#id_expiry_period").val() ==
											 * "") { toastr.warning("Please
											 * enter the Expiry Period!"); }
											 */
										else {

											$
													.ajax({
														url : getContextPath()
																+ "/cardDetails/updateCards",
														type : 'POST',
														data : $(
																"#card-edit_details-form")
																.serialize(),
														success : function(data) {
															var res = JSON
																	.parse(data);
															var status = res.status;
															var message = res.message;
															if (status == 'Success'
																	|| status == 'success') {
																toastr
																		.success(message);
															} else {
																toastr
																		.success(message);
															}

															$(
																	"#id-edit_card-details-modal")
																	.modal(
																			'hide');
															cardDetails.draw();

														},
														error : function() {
															$(
																	"#id-edit_card-details-modal")
																	.modal(
																			'hide');

														}
													});

										}
									});
					$("#card-details-delete").click(function() {

						if (cardDetailsData != null) {
							$("#card-details-delete-modal").modal('show');
						} else {
							toastr.warning("Please Select a Row !!");
						}

					});
					
					$("#id_search_card_details").click(function() {

						cardDetails.draw();
						});
					
					 $('#id_clear_card_details').click(function(){
						 cardDetailsData=null;
						
						 $('#id-card-type-search').val("");
						 
						 $('#id-merchant-id-search').val("");
						 cardDetails.draw();
					    });

					
					$("#id_btn_delete_details").click(
							function() {
								$.ajax({
									url : getContextPath()
											+ "/cardDetails/deleteCards",
									type : 'POST',
									data : {
										cardId : cardDetailsData.cardId
									},
									dataType : "json",
									success : function(data) {
										$("#card-details-delete-modal").modal(
												'hide');
										cardDetailsData = null;
										cardDetails.draw();
										if (data.status == "Success") {
											toastr.success(data.message);
										} else {
											toastr.info(data.message);
										}

									},
									error : function() {
										$("#card-details-delete-modal").modal(
												'hide');
										alert("Exception in deleteCardDetails"
												+ errorThrown);
									}
								});
							});
				});
function getAllCardTheme() {
	$.ajax({
		url : getContextPath() + "/cardDetails/getAllCardTheme",
		type : 'POST',
		dataType : "json",
		success : function(response) {
			
			var data=response.Data;
			$("#id-card-details-theme").empty();
			$("#id-card-details-theme").append(
					'<option value="">Select</option>');
			$("#id_edit-card-details-theme").empty();
			$("#id_edit-card-details-theme").append(
					'<option value="">Select</option>');
			for ( var i in data) {
				$("#id-card-details-theme").append(
						'<option value="' + data[i].cardTheme + '">'
								+ data[i].cardThemeEng + '</option>');
				$("#id_edit-card-details-theme").append(
						'<option value="' + data[i].cardTheme + '">'
								+ data[i].cardThemeEng + '</option>');
			}

		},
		error : function() {
			alert("Exception in getallCardType");
		}
	});
}
function getAllCardGroup() {
	$
			.ajax({
				url : getContextPath() + "/cardDetails/getAllCardGroup",
				type : 'POST',
				dataType : "json",
				success : function(data) {
					$("#id_card_group").empty();
					$("#id_card_group").append(
							'<option value="">Select</option>');
					$("#id_edit_card_group").empty();
					$("#id_edit_card_group").append(
							'<option value="">Select</option>');

					for ( var i in data) {
						$("#id_card_group").append(
								'<option value="' + data[i].cardGrp + '">'
										+ data[i].cardGrpEng + '</option>');
						$("#id_edit_card_group").append(
								'<option value="' + data[i].cardGrp + '">'
										+ data[i].cardGrpEng + '</option>');
					}

				},
				error : function() {
					alert("Exception in getallCardGroup");
				}
			});
}

function getAllMerchants() {
	$.ajax({
		url : getContextPath() + "/cardDetails/getAllMerchants",
		type : 'POST',
		dataType : "json",
		success : function(response) {
			
			
			var data=response.Data;
			$("#id_merchant_id").empty();
			$("#id_merchant_id").append('<option value="">Select</option>');
			$("#id_edit_merchant_id").empty();
			$("#id_edit_merchant_id")
					.append('<option value="">Select</option>');
			$("#id-merchant-id-search").empty();
			$("#id-merchant-id-search").append(
					'<option value="">Select</option>');
			for ( var i in data) {
				$("#id_merchant_id").append(
						'<option value="' + data[i].merId + '">'
								+ data[i].merNameEng + '</option>');
				$("#id_edit_merchant_id").append(
						'<option value="' + data[i].merId + '">'
								+ data[i].merNameEng + '</option>');
				$("#id-merchant-id-search").append(
						'<option value="' + data[i].merId + '">'
								+ data[i].merNameEng + '</option>');
			}

		},
		error : function() {
			alert("Exception in getAllMerchants");
		}
	});
}

function getAllCardCategory(merchantId, cardType, cardTheme) {

	$.ajax({
		url : getContextPath() + "/cardDetails/getAllCardCategory",
		type : 'POST',
		dataType : "json",
		data : {
			merchantId : merchantId,
			cardType : cardType,
			cardTheme : cardTheme
		},
		success : function(data) {
			$("#id_card_card_category").empty();
			$("#id_card_card_category").append(
					'<option value="">Select</option>');
			$("#id_edit_card_card_category").empty();
			$("#id_edit_card_card_category").append(
					'<option value="">Select</option>');

			for ( var i in data) {
				$("#id_card_card_category").append(
						'<option value="' + data[i].cardCategory + '">'
								+ data[i].cardCategory + '</option>');
				$("#id_edit_card_card_category").append(
						'<option value="' + data[i].cardCategory + '">'
								+ data[i].cardCategory + '</option>');
			}

		},
		error : function() {
			alert("Exception in getallCardCategory");
		}
	});
}
function getAllCardCategoryEdit(merchantId, cardType, cardTheme) {

	$.ajax({
		url : getContextPath() + "/cardDetails/getAllCardCategory",
		type : 'POST',
		dataType : "json",
		data : {
			merchantId : merchantId,
			cardType : cardType,
			cardTheme : cardTheme
		},
		success : function(data) {
			$("#id_card_card_category").empty();
			$("#id_card_card_category").append(
					'<option value="">Select</option>');
			$("#id_edit_card_card_category").empty();
			$("#id_edit_card_card_category").append(
					'<option value="">Select</option>');

			for ( var i in data) {
				$("#id_card_card_category").append(
						'<option value="' + data[i].cardCategory + '">'
								+ data[i].cardCategory + '</option>');
				$("#id_edit_card_card_category").append(
						'<option value="' + data[i].cardCategory + '">'
								+ data[i].cardCategory + '</option>');
			}
			$("#id_edit_card_card_category").val(cardDetailsData.cardCat);
		},
		error : function() {
			alert("Exception in getallCardCategory");
		}
	});
}
