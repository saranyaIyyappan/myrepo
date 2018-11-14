function getContextPath(){

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

var sweepingTable=null;
var transactionTable=null;
var tableData=null;
$(document).ready(function(){
	//$("#transaction_table_div").hide();
$("#id_search_sweepingDate").datetimepicker({
        
        format: 'YYYY-MM-DD',
        sideBySide: true,
	});
$("#id-search").click(function(){
	sweepingTable.draw();
});
$("#id-clear").click(function(){
	$("#id_search_sweepingDate").val("");
	sweepingTable.draw();
});
	$.fn.dataTableExt.sErrMode = 'none';
	sweepingTable = $('#merchant-sweeping-datatable-id').DataTable({
				  "bProcessing": true,
			        "bDeferRender": true,
			        bAutoWidth: false,
			        bServerSide: true,
			        "bLengthChange": false,
			        sAjaxSource : getContextPath()+"/merchantSweeping/merchantSweepingList",
			        "iDisplayLength": 5,
			        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
			        "sPaginationType": "full_numbers",
			        "bPaginate": true,
			        "fnServerParams": function(aoData) {

				        
			            var sweepingDate =$("#id_search_sweepingDate").val();         
			            if(sweepingDate == null || sweepingDate == undefined){
			            	sweepingDate = "";
			            }
			           
			           
			            var dataString = JSON.stringify({sweepingDate: sweepingDate});
			            aoData.push({name: "searchData", value: dataString});
			        },
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
{"mDataProp" : "sweepDate","bSortable" : false},
{"mDataProp" : "transactionDesc","bSortable" : false},
{"mDataProp" : "noOfTrans","bSortable" : false},
{"mDataProp" : "sweepAmount","bSortable" : false},
{"mDataProp" : "charges","bSortable" : false},
{"mDataProp" : "discounts","bSortable" : false}
			        ],'columnDefs': [
	              		{
	                		'targets': 0,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'Sweep Date'); 
	                		}
	             		},
	             		{
	                		'targets': 1,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'Transaction Description'); 
	                		}
	             		},
	             		{
	                		'targets': 2,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'No. Of Transactions'); 
	                		}
	             		},
	             		{
	                		'targets': 3,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'Sweep Amount'); 
	                		}
	             		},
	             		{
	                		'targets': 4,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'Charges'); 
	                		}
	             		},
	             		{
	                		'targets': 5,
	                		'createdCell':  function (td, cellData, rowData, row, col) {
	                   			$(td).attr('data-title', 'Discounts/Offers'); 
	                		}
	             		}
	             		
	          		]
			});
	
	
	
	
	$('#merchant-sweeping-datatable-id').on( 'click', 'tr', function () {
		 if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	            tableData=null;
	          //  $("#transaction_table_div").hide();
	        }
	        else {
	        	
	        	sweepingTable.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	            tableData = sweepingTable.row(this).data();
	           
	            if(tableData!=null && tableData!=undefined ){
	            	$("#id_modal_transaction_results").modal('show');
	            $('#merchant-transaction-datatable-id').DataTable().destroy();
	   		 $.fn.dataTableExt.sErrMode = 'none';
	   		transactionTable = $('#merchant-transaction-datatable-id').DataTable({
	   						"bProcessing": true,
	   				        "bDeferRender": true,
	   				        bAutoWidth: false,
	   				        bServerSide: true,
	   				        sAjaxSource : getContextPath()+"/merchantSweeping/merchantTransactionList",
	   				        "iDisplayLength": 5,
	   				        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
	   				        "sPaginationType": "full_numbers",
	   				        "bPaginate": true,
	   				        "fnServerParams": function(aoData) {
	   				       
	   				        	var transferDate =tableData.sweepDate;      
	   			            if(transferDate == null || transferDate == undefined){
	   			            	transferDate = "";
	   			            }
	   				           var dataString = JSON.stringify({transferDate:transferDate});
	   				            aoData.push({name: "searchData", value:dataString});
	   				          
	   				        },
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
	   	{"mDataProp" : "transDate","bSortable" : false},
	   	{"mDataProp" : "transDetailsEng","bSortable" : false},
	   	{"mDataProp" : "purchaseAmt","bSortable" : false},
	   				        ],'columnDefs': [
	   		              		{
	   		                		'targets': 0,
	   		                		'createdCell':  function (td, cellData, rowData, row, col) {
	   		                   			$(td).attr('data-title', 'Transaction Date'); 
	   		                		}
	   		             		},
	   		             		{
	   		                		'targets': 1,
	   		                		'createdCell':  function (td, cellData, rowData, row, col) {
	   		                   			$(td).attr('data-title', 'Transaction Details'); 
	   		                		}
	   		             		},
	   		             		{
	   		                		'targets': 2,
	   		                		'createdCell':  function (td, cellData, rowData, row, col) {
	   		                   			$(td).attr('data-title', 'Transaction Amount'); 
	   		                		}
	   		             		} 		
	   		          		]
	   				});
	        }
	        }

		
		
	});
	
});