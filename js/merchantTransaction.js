function getContextPathMerchantTransaction() {

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function(){
	$("#id_startDate_search").datetimepicker({
		format: 'YYYY-MM-DD',
        sideBySide: true,
       // minDate:moment().subtract(1,'d')
	});    
	$("#id_endDate_search").datetimepicker({
		format: 'YYYY-MM-DD',
        sideBySide: true,
        minDate: false,
      //  minDate:moment().subtract(1,'d')
	});   
	$("#id_startDate_search").on("dp.change", function(e) {
		$('#id_endDate_search').data("DateTimePicker").minDate(e.date);
	});
	var startDate=$("#id_startDate_search").val();
	var ensDate=$("#id_endDate_search").val();
	var start;
	var end;
	if(startDate==''){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd = '0'+dd
		} 
		if(mm<10) {
		    mm = '0'+mm
		} 
		//today = mm + '/' + dd + '/' + yyyy;
		start = yyyy + '-' + mm + '-' +dd ;	
		end = yyyy + '-' + mm + '-' +dd ;	
		//alert("fgdfh"+start);
	}else{
		start=startDate;
		end=ensDate;
	}
	//alert("ready()"+today);
	//if($("#id_startDate_search").val()=="" && $("#id_endDate_search").val()==""){
		/*var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		
		var startDate=new date();*/
	//}
	var data=null;
	$.fn.dataTableExt.sErrMode = 'none';
	TransactionTable = $('#merchant-transaction-datatable-id').DataTable(
			
			{
				  "bProcessing": true,
			        "bDeferRender": true,
			        bAutoWidth: false,
			        bServerSide: true,
			        sAjaxSource : getContextPathMerchantTransaction()+"/merchantTransaction/merchantTransactionList",
			        "iDisplayLength": 5,
			        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
			        "sPaginationType": "full_numbers",
			        "bPaginate": true,
			        "fnServerParams": function(aoData) {
			           var dataString = JSON.stringify({start:start,end:end});
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
{"mDataProp" : "transDate","bSortable" : false,"bVisible":true},
{"mDataProp" : "transDetailsEng","bSortable" : false,"bVisible":true},
{"mDataProp" : "purchaseAmt","bSortable" : false,},

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
	$("#id_search_transaction").click(function(){
		/*if($("#id_startDate_search").val().trim()=="" && $("#id_endDate_search").val().trim()!=""){
			toastr.warning("Please provide Starting date");
		}else{
			if(startDate!='' && ensDate==''){
				start=startDate;
				end=startDate;
			}else{
				start=startDate;
				end=ensDate;
			}
			data=null;
			TransactionTable.draw();
		}*/
		startDate=$("#id_startDate_search").val();
		ensDate=$("#id_endDate_search").val();
		if(startDate==''){
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			if(dd<10) {
			    dd = '0'+dd
			} 
			if(mm<10) {
			    mm = '0'+mm
			} 
			//today = mm + '/' + dd + '/' + yyyy;
			start = yyyy + '-' + mm + '-' +dd ;	
			end = yyyy + '-' + mm + '-' +dd ;	
			//alert("fgdfh"+start);
		}else if(startDate!=''&&ensDate==''){
			start=startDate;
			end=startDate;
		}else{
			start=startDate;
			end=ensDate;
		}
		data=null;
		TransactionTable.draw();
	/*	alert(today);
		
		document.write(today);*/
		
	});
	$("#id_clear_transaction").click(function(){
		$('#id_endDate_search').data("DateTimePicker").minDate(false);
		data=null;
		$("#id_startDate_search").val("");
		$("#id_endDate_search").val("");
		TransactionTable.draw();
	});
});