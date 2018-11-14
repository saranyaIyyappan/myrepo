function getContextPathMerchantList() {

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
var merchantListTable;
$(document).ready(function(){
	var data=null;
	$.fn.dataTableExt.sErrMode = 'none';
	merchantListTable = $('#merchant-list-datatable-id').DataTable(
			
			{
				  "bProcessing": true,
			        "bDeferRender": true,
			        bAutoWidth: false,
			        bServerSide: true,
			        sAjaxSource : getContextPathMerchantList()+"/merchantVerification/merchantVerificationList",
			        "iDisplayLength": 5,
			        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
			        "sPaginationType": "full_numbers",
			        "bPaginate": true,
			        "fnServerParams": function(aoData) {},
			        "fnServerData": function(sSource, aoData, fnCallback, oSettings) {
			            oSettings.jqXHR = $.ajax({
			            
			                "dataType": 'json',
			                "type": "POST",
			                "url": sSource,
			                "data": aoData,
			                "success": fnCallback,
			                "error": function(e) {
			                    console.log(e.message);
			                }
			            });
			        },
			       
			        "aaSorting": [[0, "asc"]],
			        "sDom": 'rt<lp>',
			        "aoColumns": [
{"mDataProp" : "merchantNameEng","bSortable" : false,"bVisible":true},
{"mDataProp" : "emailId","bSortable" : false,"bVisible":true},
{"mDataProp" : "contactName","bSortable" : false,},
			        ],
			        'columnDefs': [
				              		{
				                		'targets': 0,
				                		'createdCell':  function (td, cellData, rowData, row, col) {
				                   			$(td).attr('data-title', 'Merchant Name English'); 
				                		}
				             		},
				             		{
				                		'targets': 1,
				                		'createdCell':  function (td, cellData, rowData, row, col) {
				                   			$(td).attr('data-title', 'Email Id'); 
				                		}
				             		},
				             		{
				                		'targets': 2,
				                		'createdCell':  function (td, cellData, rowData, row, col) {
				                   			$(td).attr('data-title', 'Contact Name'); 
				                		}
				             		}
				          		]
			});
	
	
$('#merchant-list-datatable-id').on( 'click', 'tr', function () {
		
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            data=null;
        }
        else {
        	merchantListTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            data = merchantListTable.row(this).data();
            $("#merchant_id").val(data.merchantId);
        }
  } );
$("#id-btn-merchant-verify").click(function(){
	var merchantId=$("#merchant_id").val();
	$.ajax({
		type : 'POST',
		url : getContextPathMerchantList() + "/merchantVerification/verifyMerchant",
		dataType : "json",
		traditional: true,
		data:{merchantId:merchantId},
		success : function(data) {
        	if (data.status == 'success') {
        		merchantListTable.draw();
				 toastr.success(data.message);
			} else {
				toastr.warning(data.message);
			}

		},

		error : function(jqXHR, textStatus, errorThrown) {
			alert("Exception in verifyMerchant" + errorThrown);
		}
	});
});
});