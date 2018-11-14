function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

$(document).ready(function() {

	toastr.options = {
		"preventDuplicates" : true,
		"preventOpenDuplicates" : true
	};
	var cardChargesData = null;

	var cardChargesDetails = $('#card-charges-table').DataTable({

		"bProcessing" : true,
		"bDeferRender" : true,
		bAutoWidth : false,
		bServerSide : true,
		sAjaxSource : getContextPath() + "/cardCharge/cardChargeList",
		"iDisplayLength" : 5,
		"aLengthMenu" : [ [ 5, 10, 25, 50, 100 ], [ 5, 10, 25, 50, 100 ] ],
		"sPaginationType" : "full_numbers",
		"bPaginate" : true,
		"fnServerParams" : function(aoData) {

			/*
			 * var clinicId = $("#id_hdn_clinic_ID").val(); if (clinicId == null ||
			 * clinicId == undefined) { clinicId = ""; } var
			 * compliantCode=$("#compliant_code_search").val(); if(compliantCode ==
			 * null || compliantCode == undefined){ compliantCode = ""; } var
			 * countryCode=$("#country_code_search").val(); if(countryCode ==
			 * null || countryCode == undefined){ countryCode = ""; }
			 */

			var dataString = JSON.stringify({});

			aoData.push({
				name : "searchData",
				value : dataString
			});

		},
		"fnServerData" : function(sSource, aoData, fnCallback, oSettings) {
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
			"mDataProp" : "fixedCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "crCardCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "sadadOlpCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "giftCardCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "salePrice",
			"bSortable" : false
		}, {
			"mDataProp" : "buyPrice",
			"bSortable" : false
		}, {
			"mDataProp" : "AfcCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "bankCharge",
			"bSortable" : false
		}, {
			"mDataProp" : "merCharge",
			"bSortable" : false
			
		},
		
		],
		columnDefs : [
		              { targets : [0],
		                render : function (data, type, row) {
		                  switch(data) {
		                     case 0 : return 'Rechargable Wallet'; break;
		                     case 1 : return 'Non Rechargable Wallet'; break;
		                     case 2 : return 'Login Card'; break;
		                     case 3 : return 'Digital Card'; break;
		                     
		                  }
		                }
		              }
		         ]
	
	});

	$("#card-charges-create").click(function() {

		$('#card-charges-form')[0].reset();
		$("#id-card-charges-modal").modal('show');

	});

	$("#create_card_btn").click(function() {
		var allInputs = $(":input");
		allInputs.each(function() {
			$(this).val($.trim($(this).val()));
		});

		if ($("#id-card-charges-cardType").val() == "") {
			toastr.warning("Please enter the Card Type!");
		} 
		else if ($("#id_card_fixed_charges").val() == "") {
			toastr.warning("Please enter the Fixed Charge!");
		} else if ($("#id_card_credit_card_charges").val() == "") {
			toastr.warning("Please enter the Credit Card Charge!");
		} else if ($("#id_sadad_card_charges").val() == "") {
			toastr.warning("Please enter the SadadOLP Charge!");
		} else if ($("#id_gift_card_charges").val() == "") {
			toastr.warning("Please enter the Wallet Charge!");
		}else if ($("#id_sale_price").val() == "") {
			toastr.warning("Please enter the Sale Price!");
		} else if ($("#id_buy_price").val() == "") {
			toastr.warning("Please enter the Buy Price!");
		} else if ($("#id_afc_charge").val() == "") {
			toastr.warning("Please enter the Afc Charge!");
		} else if ($("#id_bank_charge").val() == "") {
			toastr.warning("Please enter the Bank Charge!");
		} else if ($("#id_merchant_charge").val() == "") {
			toastr.warning("Please enter the Merchant Charge!");
		}
		else if ($("#id_expiry_period").val() == "") {
			toastr.warning("Please enter the Expiry Period!");
		}
		else {

			$.ajax({
				url : getContextPath() + "/cardCharge/createCardCharge",
				type : 'POST',
				data : $("#card-charges-form").serialize(),
				success : function(data) {
					var res = JSON.parse(data);
					var status = res.status;
					var message = res.message;
					if (status == 'Success' || status == 'success') {
						toastr.success(message);
					} else {
						toastr.success(message);
					}
					
					$("#id-card-charges-modal").modal('hide');
					cardChargesDetails.draw();

				},
				error : function() {
					$("#id-card-charges-modal").modal('hide');

				}
			});

		}
	});
	
	
	
	$('#card-charges-table').on('click', 'tr', function() {
	    if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            cardChargesData=null;
        }
        else {
        	cardChargesDetails.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            cardChargesData = cardChargesDetails.row(this).data();

        }
	});
	
	$("#card-charges-edit").click(function() {

		if (cardChargesData != null) {
			
			$("#id-edit-card-charges-cardType").val(cardChargesData.cardType);
			$("#id_edit_fixed_charges").val(cardChargesData.fixedCharge);
			$("#id_edit_credit_card_charges").val(cardChargesData.crCardCharge);
			$("#id_edit_sadad_card_charges").val(cardChargesData.sadadOlpCharge);
			$("#id_edit_gift_card_charges").val(cardChargesData.giftCardCharge);
			$("#id_edit_sale_price").val(cardChargesData.salePrice);
			$("#id_edit_buy_price").val(cardChargesData.buyPrice);
			$("#id_edit_afc_charge").val(cardChargesData.AfcCharge);
			$("#id_edit_bank_charge").val(cardChargesData.bankCharge);
			$("#id_edit_merchant_charge").val(cardChargesData.merCharge);
			$("#id_edit_card_expiry_period").val(cardChargesData.experyPeriod);
			
		
			$("#id_edit_cardcharges_modal").modal('show');
			
		
		} else {
			toastr.warning("Please Select a Row !!");
		}
	});
	$("#edit_card_charge_btn").click(function() {
		var allInputs = $(":input"); 
		allInputs.each(function() {
		        $(this).val($.trim($(this).val()));
		    });
	
		
		if ($("#id-edit-card-charges-cardType").val()== "") {
			toastr.warning("Please enter the Card Type!");
		} 
		else if ($("#id_edit_fixed_charges").val()== "") {
			toastr.warning("Please enter the Fixed Charge!");
		} else if ($("#id_edit_credit_card_charges").val()== "") {
			toastr.warning("Please enter the Credit Card Charge!");
		} else if ($("#id_edit_sadad_card_charges").val()== "") {
			toastr.warning("Please enter the SadadOLP Charge!");
		} else if ($("#id_edit_gift_card_charges").val()== "") {
			toastr.warning("Please enter the Wallet Charge!");
		}else if ($("#id_edit_sale_price").val() == "") {
			toastr.warning("Please enter the Sale Price!");
		} else if ($("#id_edit_buy_price").val() == "") {
			toastr.warning("Please enter the Buy Price!");
		} else if ($("#id_edit_afc_charge").val() == "") {
			toastr.warning("Please enter the Afc Charge!");
		} else if ($("#id_edit_bank_charge").val() == "") {
			toastr.warning("Please enter the Bank Charge!");
		} else if ($("#id_edit_merchant_charge").val() == "") {
			toastr.warning("Please enter the Merchant Charge!");
		}
		else if ($("#id_edit_card_expiry_period").val() == "") {
			toastr.warning("Please enter the Expiry Period!");
		}
		else {

			$.ajax({
				url : getContextPath() + "/cardCharge/updateCardCharges",
				type : 'POST',
				data : $("#edit-card-charges-form").serialize(),
				success : function(data) {
					var res = JSON.parse(data);
					var status = res.status;
					var message = res.message;
					if (status == 'Success' || status == 'success') {
						toastr.success(message);
					} else {
						toastr.success(message);
					}
					
					$("#id_edit_cardcharges_modal").modal('hide');
					cardChargesDetails.draw();

				},
				error : function() {
					$("#id_edit_cardcharges_modal").modal('hide');

				}
			});
		
	  }
	 });

	$("#card-charges-delete").click(function() {
		
		if (cardChargesData != null) {
			$("#card-charges-delete-modal").modal('show');
		} else {
			toastr.warning("Please Select a Row !!");
		}

	});
	
	$("#id_btn_delete_charges").click(function() {
		$.ajax({
			url : getContextPath() + "/cardCharge/deleteCardCharges",
			type : 'POST',
			data :{ cardType:cardChargesData.cardType},
			dataType : "json",
			success : function(data) {
				$("#card-charges-delete-modal").modal('hide');
				cardChargesData=null;
				cardChargesDetails.draw();
				if (data.status == "Success") {
					toastr.success(data.message);
				} else {
					toastr.info(data.message);
				}
		
				
			},
			error : function() {
				$("#card-charges-delete-modal").modal('hide');
				alert("Exception in deleteCardCharges" + errorThrown);
			}
		});
	});
	
	
});