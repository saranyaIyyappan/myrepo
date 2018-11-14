function getContextPathCardBalance() {

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function(){
	$("#id-div-card-balance-table").hide();
	toastr.options = {
			"preventDuplicates" : true,
			"preventOpenDuplicates" : true
		};
	/*$('#id_card_no').keypress(function(event){
	    if(event.which != 8 && event.which != 46 && isNaN(String.fromCharCode(event.which))){
	        event.preventDefault();
	        toastr.warning("Please enter numbers");
	    }
	});
	$('#id_pin_no').keypress(function(event){
	    if(event.which != 8 && event.which != 46 && isNaN(String.fromCharCode(event.which))){
	        event.preventDefault();
	        toastr.warning("Please enter numbers");
	    }
	});*/
	$("#id_card_balance_btn").click(function(){
	if($("#id_card_no").val()==""){

		toastr.warning("Please enter Card Number");
		$("#id-div-card-balance-table").hide();
		$('#card-balance-datatable-id').DataTable().destroy();
	
	}
		else if($("#id_pin_no").val()==""){
			toastr.warning("Please enter Pin Number");
			$("#id-div-card-balance-table").hide();
			$('#card-balance-datatable-id').DataTable().destroy();
		}else {
			var cardNo=$("#id_card_no").val();
			var pinNo=$("#id_pin_no").val();
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
					           var dataString = JSON.stringify({cardNo:cardNo,pinNo:pinNo});
					            aoData.push({name: "searchData", value:dataString});
					        },
					        "fnServerData": function(sSource, aoData, fnCallback, oSettings) {
					            oSettings.jqXHR = $.ajax({
					            
					                "dataType": 'json',
					                "type": "POST",
					                "url": sSource,
					                "data": aoData,
					                "success" : function(data){
					                	if(data.status!=""){
						                     toastr.warning(data.status);
						                     $('#card-balance-datatable-id').DataTable().destroy();
						                     $("#id-div-card-balance-table").hide();
						                     }else{
						                    	 $("#id-div-card-balance-table").show();
								                	fnCallback(data);
						                     }
					                	
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
					        ]
					});
		}
	});

	$("#id_card_balance_clr_btn").click(function(){
		$("#id-div-card-balance-table").hide();
		$('#card-balance-datatable-id').DataTable().destroy();
	});
	
	
	$("#id_card_balance_reg").click(function(){
		$("#id_consumer_signup").modal('show');
	});
});
function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Please enter numbers");

    return false;

    } return true;}

