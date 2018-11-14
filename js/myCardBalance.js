function getContextPathCardBalance() {

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function(){
	getCardNumber();
	$("#id-div-card-balance-table").hide();
	
	$("#id_card_balance_btn").click(function(){
		
		if($("#id_card_no").val()!=""){
			$("#id-div-card-balance-table").show();
			var cardNo=$("#id_card_no").val();
			$('#card-balance-datatable-id').DataTable().destroy();
			$.fn.dataTableExt.sErrMode = 'none';
			cardBalanceTable = $('#card-balance-datatable-id').DataTable(
					
					{
						  "bProcessing": true,
					        "bDeferRender": true,
					        bAutoWidth: false,
					        bServerSide: true,
					        sAjaxSource : getContextPathCardBalance()+"/consumerCardBalanace/getCardBalance",
					        "iDisplayLength": 5,
					        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
					        "sPaginationType": "full_numbers",
					        "bPaginate": true,
					        "fnServerParams": function(aoData) {
					           var dataString = JSON.stringify({cardNo:cardNo});
					            aoData.push({name: "searchData", value:dataString});
					          
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
					            //alert(aoData.balAmount);
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
			toastr.warning("Please Select a card");
			$("#id-div-card-balance-table").hide();
			$('#card-balance-datatable-id').DataTable().destroy();
		}
	});

	$("#id_card_balance_clr_btn").click(function(){
		$("#id-div-card-balance-table").hide();
		$('#card-balance-datatable-id').DataTable().destroy();
	});
	
});
function getCardNumber(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPathCardBalance() +"/consumerCardBalanace/getCardNumber", 
		dataType : "json",
		success : function(data){  
			$("#id_card_no").empty();
		$("#id_card_no").append('<option value="">Select Card No</option>');  
		for(var i in data){  
			$("#id_card_no").append('<option value="' + data[i].cardNo + '">' + data[i].cardNo+ '</option>'); 
			}     },
			error : function(jqXHR, textStatus, errorThrown) {  
				alert("Server Exception in getCardNumber list"+ errorThrown);   
				}
			}); 
	}