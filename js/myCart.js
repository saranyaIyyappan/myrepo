function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

var myCartTable;
$(document).ready(function() {

	$('#id_table_item_purchase_summary_home_myCart').DataTable().destroy();
$.fn.dataTableExt.sErrMode = 'none';
myCartTable=$('#id_table_item_purchase_summary_home_myCart').DataTable({
			  	"bProcessing": true,
		        "bDeferRender": true,
		        bAutoWidth: false,
		        bServerSide: true,
		        sAjaxSource : getContextPath()+"/purchaseCard/getAllProductList",
		        "iDisplayLength": 5,
		        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
		        "sPaginationType": "full_numbers",
		        "bPaginate": true,
		        "fnServerParams": function(aoData) {
		             var dataString = JSON.stringify({});
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
		                },
		                "error": function(e) {
		                    console.log(e.message);
		                }
		            });
		        },
		        "aaSorting": [[0, "asc"]],
		        "sDom": 'rt<lp>',
		        "aoColumns": [
              		{"mDataProp" : "itemNumber","bSortable" : false,"bVisible":true},
            		{"mDataProp" : "giftCardName","bSortable" : false,"bVisible":true},
            		{"mDataProp" : "deliveryDate","bSortable" : false},
            		{"mDataProp" : "giftValue","bSortable" : false},
            		{"mDataProp" : "serviceFee","bSortable" : false},
            		{"mDataProp" : "totalCharge","bSortable" : false},
            		{"mDataProp" : "productImage","bSortable" : false},
            		{"mDataProp" : "removeProduct","bSortable" : false}
            					        ],
            							'columnDefs': [
           						              		{
           						                		'targets': 0,
           						                		'createdCell':  function (td, cellData, rowData, row, col) {
           						                   			$(td).attr('data-title', 'Item Number'); 
           						                		}
           						             		},
           						             		{
           						                		'targets': 1,
           						                		'createdCell':  function (td, cellData, rowData, row, col) {
           						                   			$(td).attr('data-title', 'eGift Card'); 
           						                		}
           						             		},
           						             		{
           						                		'targets': 2,
           						                		'createdCell':  function (td, cellData, rowData, row, col) {
           						                   			$(td).attr('data-title', 'Delivery'); 
           						                		}
           						             		},
           						             		{
           						                		'targets': 3,
           						                		'createdCell':  function (td, cellData, rowData, row, col) {
           						                   			$(td).attr('data-title', 'Gift Value'); 
           						                		}
           						             		},
           						             		{
           						                		'targets': 4,
           						                		'createdCell':  function (td, cellData, rowData, row, col) {
           						                   			$(td).attr('data-title', 'Service Fee'); 
           						                		}
           						             		}
           						             	,
       						             		{
       						                		'targets': 5,
       						                		'createdCell':  function (td, cellData, rowData, row, col) {
       						                   			$(td).attr('data-title', 'Total'); 
       						                		}
       						             		},
       						             		{
       						                		'targets': 6,
       						                		'createdCell':  function (td, cellData, rowData, row, col) {
       						                   			$(td).attr('data-title', 'Product Image'); 
       						                		}
       						             		},
       						             		{
       						                		'targets': 7,
       						                		'createdCell':  function (td, cellData, rowData, row, col) {
       						                   			$(td).attr('data-title', 'Remove'); 
       						                		}
       						             		}
           						             	
           						          		]
		});
$("#id_btn_buy_checkout_mycart").click(function(){
	window.location.href=getContextPath()+"/purchaseCard/checkOut";
});
});