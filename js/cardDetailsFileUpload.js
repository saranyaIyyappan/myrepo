
//var dbColumnNamesStaffFileUpload;

$(document).ready(function(){
	var divValue=$("#id-modal-bodyUpload").html();//used for resetting the modal
	//getColumnNamesFromStaffDetailToDisplay();
	//resets to default modal when closing the current modal and popups modal
	 $("#cardDetails-upload-id").click(function(){
			$("#id-btn-get-mapping-modalUpload",parent.document).css("display","none");
		 $("#import-excel-submitFileUpload",parent.document).css("display","inline");
		 $('#id-tri-blinkUpload',parent.document).css("display","none");
		 $("#id-transactionFileUpload",parent.document).val("");
		 $('#id-upload-status-listUpload',parent.document).empty();
		 $("#uploadedFileName1Upload",parent.document).empty();
		 $('#id_pgr_bar_fileUpload',parent.document).css('width', 0 + "%");
		 $('#id-per-spanFileUpload',parent.document).html("0%");
		 $("#id-inv-map-continue",parent.document).remove();
		 $("#import-excel-submitFileUpload",parent.document).prop("disabled",false);
		 $("#id-dynamic-append-mapUpload",parent.document).html("");
	     $("#id-modal-bodyUpload",parent.document).html(divValue);
	    	$("#import-excel-windowUpload").modal('show');
	    });
	 $("#id-label-choose-fileUpload").click(function(){
		 $("#uploadedFileName1Upload").empty();
		 //$("#import-excel-submit",parent.document).prop("disabled",false);
	 });
	var fileStatus=$('#hidden_fileUpldStatus').val();
	console.log(fileStatus+"sssssssssss");
	
    if(fileStatus=="true"){
    	$("#id-transactionFileUpload",parent.document).prop("disabled",true);
    	$('#id-tri-blinkUpload',parent.document).css("display","none");
    	$("#import-excel-submitFileUpload",parent.document).prop("disabled",true);
    	$('#id_pgr_bar_fileUpload',parent.document).css('width', 20 + "%");
    	 $('#id-per-spanFileUpload',parent.document).html("20%");
    	 $('#id-upload-status-listUpload',parent.document).append("<li>INFO: virus scan completed....</li>");
	        scrollDown();
        checkMapping();
    }
    else if(fileStatus=="false"){
    	 $("#import-excel-submitFileUpload",parent.document).prop("disabled",false);
    	$('#id_pgr_bar_fileUpload',parent.document).css('width', 10 + "%");
    	 $('#id-per-spanFileUpload',parent.document).html("10%");
    	 var fileNameExtension=$("#uploadedFileName1Upload",parent.document).text().split(".")[1];
    	 var fileType="";
    	 if(fileNameExtension=="xls"||fileNameExtension=="xlsx"||fileNameExtension=="XLS"||fileNameExtension=="XLSX"){
    		 fileType="excel";
    	 }else if(fileNameExtension=="tsv"||fileNameExtension=="TSV"){
    		 fileType="tsv";
    	 }
    	 $('#id-tri-blinkUpload',parent.document).css("display","inline-block");
    	$('#id-upload-status-listUpload',parent.document).append("<li>Important Security Message: Threat has been detected!!!Failed To Scan "+fileTypeStaff+" File...</li>");
    	 scrollDown();
    }
    $("#import-excel-submitFileUpload").click(function(){
    	var stats=true;
		var allowedFiles = [".xls", ".xlsx",".tsv"];
        var fileUpload = document.getElementById("id-transactionFileUpload");
       
        var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:\()\\s])+(" + allowedFiles.join('|') + ")$");
        $("#import-excel-submitFileUpload",parent.document).prop("disabled",true);
    	if($("#id-transactionFileUpload").val()!=""){
    		 if (!regex.test(fileUpload.value.toLowerCase())) {
    			 $('#id-upload-status-listUpload',parent.document).append('<li style="color:orange;">WARNING: Please upload files having extensions: <b>"' + allowedFiles.join(", ") +' "</b> only</li>');
    	            stats= false;
    	            $("#import-excel-submitFileUpload",parent.document).prop("disabled",false);
    	        }
    		 var fileNameLength=$("#uploadedFileName1Upload",parent.document).text().length;
			 if(fileNameLength>34){
				 $('#id-upload-status-listUpload',parent.document).append('<li style="color:orange;">WARNING: Please upload files having file name length less than 35 letters</li>');
				 stats= false;
				 $("#import-excel-submitFileUpload",parent.document).prop("disabled",false);
			 }
    		if(stats){
    	
   	 $('#id_pgr_bar_fileUpload').css('width', 10 + "%");
   	$('#id-per-spanFileUpload').html("10%");
   	$('#id-upload-status-listUpload',parent.document).append("<li>INFO: File uploading started......</li>");
   	//var myVar=setInterval(function(){myTimer()},1);
    scrollDown();
   	 var iframe = $("#postiframeUpload");

   	 $("#id-form-upload-excel-fileUpload").submit(function() {
   	   this.target = iframe.attr("name");
   	iframe.get(0).processContent = true; // The use of this flag will be explained
   	 });
      $("#id-form-upload-excel-fileUpload").submit();
    	}
    	}
    	else{
    		$("#import-excel-submitFileUpload",parent.document).prop("disabled",false);
    		 $('#id-upload-status-listUpload',parent.document).append('<li style="color:orange;">WARNING: Please upload an excel file of format .xls or .xlsx</li>');
    	}
   });
	
	$('input[type=file]',parent.document).change(function(e){
		  $("#uploadedFileName1Upload").empty();
		     $("#uploadedFileName1Upload").append(" &nbsp;<i class=\"fa fa-file-excel-o\" style=\"color:blue;\"></i> "+$('input[type=file]')[0].files[0].name);
		
		});
	
	$("#id-btn-get-mapping-modalUpload",parent.document).click(function(){
		 $("#mapping-modalFileUpload",parent.document).modal("show");
	 });
});

function checkMapping(){
	$("#import-excel-submitFileUpload",parent.document).css("display","none");
	$('#id_pgr_bar_fileUpload',parent.document).css('width', 30 + "%");
	 $('#id-per-spanFileUpload',parent.document).html("30%");
	 $('#id-upload-status-listUpload',parent.document).append("<li>INFO: Checking Field Mapping......</li>");
	 $.ajax({
		    type: 'POST',
		    url: getContextPathFileUpload()+"/cardDetails/excelUploadMappingCheck",
		    dataType: "text",
		    async:false,
		    success: function(data) {
		    	
		    	var fileStatus=$('#hidden_fileUpldStatus').val();
		    	
		    	if(data=="not matching"){
		    		$('#id_pgr_bar_fileUpload',parent.document).css('width', 50 + "%");
		    		 $('#id-per-spanFileUpload',parent.document).html("50%");
		    		$('#id-upload-status-listUpload',parent.document).append("<li>INFO: Mapping Required....</li>");
		    		scrollDown();
		        	populateMappingModal();
		    	}else if(data=="matching"){
		    		$('#id_pgr_bar_fileUpload',parent.document).css('width', 50 + "%");
		    		 $('#id-per-spanFileUpload',parent.document).html("50%");
		    		$('#id-upload-status-listUpload',parent.document).append("<li>INFO: Validating the file....</li>");
		    		scrollDown();
		    		validateAndUploadExcelWithOutRearrangingStaff();
		    	}else if(data=="column number not matching"){
		    		$('#id-upload-status-listUpload',parent.document).append("<li style='color:orange;'>WARNING: Column number not matching, please upload valid excel file....</li>");
		    		scrollDown();
		    		$("#id-transactionFileUpload").val("");
		    	}
		    	else if(data=="Data not found"){
		    		$('#id-upload-status-listUpload',parent.document).append("<li style='color:orange;'>WARNING: Data not found, please upload an excel file with data..</li>");
		    		scrollDown();
		    		$("#id-transactionFileUpload").val("");
		    	}
		    	},
		    error: function(jqXHR, textStatus, errorThrown) {
		    alert("Server Exception in check mapping");
		    }

		});
}

function validateAndUploadExcelWithOutRearrangingStaff(){
	 $.ajax({
		    type: 'POST',
		    url: getContextPathFileUpload()+"/cardDetails/validateAndUploadExcelWithOutRearranging",
		    dataType: "text",
		    async:false,
		    success: function(data) {
		    	
		    	$('#id_pgr_bar_fileUpload',parent.document).css('width', 100 + "%");
	       		 $('#id-per-spanFileUpload',parent.document).html("100%");
		    	$('#id-upload-status-listUpload',parent.document).append(data);
		    	scrollDown();
		    	$("#id-btn-import-excel-submitFileUpload",parent.document).text("Close");
	        	$("#id-inv-map-continue",parent.document).css("display","none");
	        },
		    error: function(jqXHR, textStatus, errorThrown) {
		    alert("Server Exception in check mapping");
		    }

		});
}

function populateMappingModal(){
	var dbColumns=["card_id","card_type","card_theme","card_cat","card_grp","card_amount","purchaser_id"];
	var dbColumnsDisplay=["Card Id","Card Type","Card Theme","Card Category","Card Group","Card Amount","Purchaser Id"];
	 $("#id-hdn-dbColumn-lengthUpload",parent.document).val(dbColumns.length);
	$.ajax({
		    type: 'POST',
		    url: getContextPathFileUpload()+"/cardDetails/getCardDetailsColumnNames",
		    dataType: "json",
		    async:false,
		    success: function(data) {
		    	$("#id-div-mapping-dyn",parent.document).empty();
		    	for(k=0;k<dbColumns.length;k++){
		    		
		    		$("#id-div-mapping-dyn",parent.document).append('<div class=" col-md-6" id="divFile-'+k+'">	'+dbColumnsDisplay[k]+':</div> <div class="col-md-6"><select class="form-control"  name="'+dbColumns[k]+'" id="selectStaff'+k+'">');
		    	}
		    	$("#id-hdn-dbColumn-lengthUpload").val(dbColumns.length);
		    	for(k=0;k<dbColumns.length;k++){
		    		for(j=0;j<data[0].noOfColumns;j++){
		    	
			    	$("#selectStaff"+k,parent.document).append('<option value="'+j+'">'+data[j].columnNameExcel+'</option>');
			    			}
		    	$("#selectStaff"+k,parent.document).append('</select>');
		    	}
		    	$("#mapping-modalFileUpload",parent.document).modal("show");
		    	$('#id-upload-status-listUpload',parent.document).append("<li style='color:blue;'>INFO: Please map the corresponding field using the select box as shown as below..</li>");
		    	
		    	 $('#id-footer-buttonsUpload',parent.document).append(' <button type="button" onclick="javascript:uploadFileAfterMapping()" id="id-inv-map-continue" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> Continue</button>');
		    	
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		    alert("Server Exception in getAllDepartment ");
		    }

		});
}


function uploadFileAfterMapping(){
	$("#id-inv-map-continue",parent.document).prop("disabled",true);
	
	 $.ajax({
		    type: 'POST',
		    url: getContextPathFileUpload()+"/cardDetails/excelUploadMapping",
		    dataType: "text",
		    data:$("#id-form-dynamic-append-using-etcModalFileUpload").serialize(),
		    async:false,
		    success: function(data) {
		    	if(!isNaN(data)){
		    		$('#id-upload-status-listUpload',parent.document).append("<li style='color:orange;'>WARNING: Duplication found on:"+$("#divFile-"+data,parent.document).html()+"</li>");
		    		$('#id-upload-status-listUpload',parent.document).append("<li style='color:blue;'>INFO: Click the mapping screen button to map data correctly</li>");
		    		$("#id-btn-import-excel-submitFileUpload",parent.document).text("Close");
		    		$("#import-excel-submitFileUpload",parent.document).prop("disabled",true);
		    		$("#id-inv-map-continue",parent.document).prop("disabled",false);
		    		scrollDown();
		    		 $("#id-btn-get-mapping-modalUpload",parent.document).css("display","inline");
		    	}
		    	else{
		    		$("#id-btn-get-mapping-modalUpload",parent.document).css("display","none");
		    	$('#id_pgr_bar_fileUpload',parent.document).css('width', 100 + "%");
	       		 $('#id-per-spanFileUpload',parent.document).html("100%");
		    	$('#id-upload-status-listUpload',parent.document).append(data);
		    	scrollDown();
		    	$("#id-btn-import-excel-submitFileUpload",parent.document).text("Close");
	        	$("#id-inv-map-continue",parent.document).css("display","none");
	        	/*setTimeout(
						  function() 
						  {
							  location.reload();
						  }, 3000);*/
	        	insuranceCompanyMasterDetails.draw();
		    	}
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		    alert("Server Exception in getAllDepartment ");
		    }

		});
}

function scrollDown(){
    $('#id-status-panel1Upload',parent.document).animate({scrollTop:$('#id-status-panel1Upload',parent.document).prop("scrollHeight")},500);     	   

}

/*function getColumnNamesFromStaffDetailToDisplay(){
	$.ajax({
	    type: 'POST',
	    url: getContextPathFileUpload()+"/diagnosisController/getColumnNamesFromStaffDetailToDisplay",
	    dataType: "json",
	    async:false,
	    success: function(data) {
	    	dbColumnNamesStaffFileUpload=data;
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    //alert("Server Exception in check mapping");
	    }

	});
}
*/



function getContextPathFileUpload() {
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function nameChange(){
	  $("#uploadedFileName1Upload").empty();
	     $("#uploadedFileName1Upload").append(" &nbsp;<i class=\"fa fa-file-excel-o\" style=\"color:blue;\"></i> "+$('input[type=file]')[0].files[0].name);
}
