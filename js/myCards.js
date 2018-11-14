function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname .indexOf("/", 2));
}
var transactionTable=null;
$(document).ready(function() {
	$("#img-load").hide();
	$("#id_div_results_transaction").hide();
	getAllCards();
	$("#id_card_no").change(function(){
		var cardId=$("#id_card_no").val();
		if(cardId!=""){
		$.ajax({
			url : getContextPath() + "/myCards/getAllCardImages",
			data:{cardId:cardId},
			type : 'POST',
			dataType : "json",
			beforeSend: function(msg){
				$("#img-load").show();
	          },
			success : function(data) {
				
				$("#img-load").hide();
				$("#id_image_card_view").removeAttr("src");
				if(data.designImage!="No Image Found"){
			 	//$("#id_image_card_view").attr("src","data:image/png;base64,"+data.designImage);
					$("#id_image_card_view").attr("src",getContextPath()+"/"+data.designImage);
					
				}else{
					$("#id_image_card_view").attr("src",getContextPath() + "/resources/giftCardHome/images/anb_pockets_web.png");
				}
				$("#id_btn_image_card").click();
			},
			error : function() {
				alert("Exception in card img" + errorThrown);
			}
		});
	}else{
		toastr.warning("Please select a Card ID For displaying your card");
		$("#id_image_card_view").attr("src",getContextPath() + "/resources/giftCardHome/images/anb_pockets_web.png");
		$("#id_div_results_transaction").hide();
	}
	});
	
	
	$("#id_btn_image_card").click(function(){
		if($("#id_card_no").val()!=""){
		$("#id_div_results_transaction").show();
		$('#id_table_transactions_for_cardId').DataTable().destroy();
		$.fn.dataTableExt.sErrMode = 'none';
		transactionTable=$('#id_table_transactions_for_cardId').DataTable({
					  "bProcessing": true,
				        "bDeferRender": true,
				        bAutoWidth: false,
				        bServerSide: true,
				        sAjaxSource : getContextPath()+"/consumerCardBalanace/getCardBalance",
				        "iDisplayLength": 5,
				        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
				        "sPaginationType": "full_numbers",
				        "bPaginate": true,
				        "fnServerParams": function(aoData) {
				        	 var cardId=$("#id_card_no").val();
				             if(cardId == null || cardId == undefined){
				            	 cardId = "";
				             }
				             var dataString = JSON.stringify({cardNo:cardId});
				             aoData.push({name: "searchData", value: dataString});
				          
				        },
				        "fnServerData": function(sSource, aoData, fnCallback, oSettings) {
				            oSettings.jqXHR = $.ajax({
				            
				                "dataType": 'json',
				                "type": "POST",
				                "url": sSource,
				                "data": aoData,
				                "success" : function(data){
				                     fnCallback(data);
				                     $("#id_p_balAmount").text(data.balAmount);
				                },
				                "error": function(e) {
				                    console.log(e.message);
				                }
				            });
				        },
				       
				        "aaSorting": [[0, "asc"]],
				        "sDom": 'rt<lp>',
				        "aoColumns": [
				              		{"mDataProp" : "transDate","bSortable" : false,"bVisible":true},
				            		{"mDataProp" : "transDetailsEng","bSortable" : false,"bVisible":true},
				            		{"mDataProp" : "purchaseAmt","bSortable" : false,},
				            					        ],
				            					        'columnDefs': [
				           						              		{
				           						                		'targets': 0,
				           						                		'createdCell':  function (td, cellData, rowData, row, col) {
				           						                   			$(td).attr('data-title', 'Date'); 
				           						                		}
				           						             		},
				           						             		{
				           						                		'targets': 1,
				           						                		'createdCell':  function (td, cellData, rowData, row, col) {
				           						                   			$(td).attr('data-title', 'Description'); 
				           						                		}
				           						             		},
				           						             		{
				           						                		'targets': 2,
				           						                		'createdCell':  function (td, cellData, rowData, row, col) {
				           						                   			$(td).attr('data-title', 'Amount'); 
				           						                		}
				           						             		}
				           						          		]
				});
		}else{
			toastr.warning("Please select your Card Number");
			$("#id_div_results_transaction").hide();
			$('#id_table_transactions_for_cardId').DataTable().destroy();
		}
	});
	
	
	
});

function getAllCards() {
	$.ajax({
		url : getContextPath() + "/myCards/getAllCardId",
		type : 'POST',
		dataType : "json",
		beforeSend: function(msg){
			$("#img-load").show();
          },
		success : function(data) {
			$("#img-load").hide();
				$("#id_card_no").empty();
				$("#id_card_no").append("<option value=''>Select Card ID</option>");
				
			for(var i in data){
				$("#id_card_no").append("<option value="+data[i].cardId+">"+data[i].cardId+"</option>")
			}
		},
		error : function() {
			toastr.error("Server problem");
		}
	});
}