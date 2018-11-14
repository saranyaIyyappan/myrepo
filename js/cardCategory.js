function getContextPathCardCategory() {

	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
//var datatableSelectFlag=0;
var cardCategoryTable;
$(document).ready(function(){
	//$("#add_card_category_form")[0].reset();
	
	if($("#hidden-updateStatus-details").val()== "success"){
		toastr.success($("#hidden-updateStatus-message").val());
	//	window.location.href=getContextPathCardCategory()+"/cardCategory/cardCategoryList";
	//	$("#add_card_category_form")[0].reset();
	}
	if($("#hidden-updateStatus-details").val()== "failed"){
		toastr.success($("#hidden-updateStatus-message").val());
		$("#add_card_category_form")[0].reset();
	}
	getMerchantId();
	getCardTheme();
	var data=null;
	$.fn.dataTableExt.sErrMode = 'none';
	cardCategoryTable = $('#card-category-datatable-id').DataTable(
			
			{
				  "bProcessing": true,
			        "bDeferRender": true,
			        bAutoWidth: false,
			        bServerSide: true,
			        sAjaxSource : getContextPathCardCategory()+"/cardCategory/cardCategoryList",
			        "iDisplayLength": 5,
			        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
			        "sPaginationType": "full_numbers",
			        "bPaginate": true,
			        "fnServerParams": function(aoData) {
			       // var code="";
			       /* var clinicId =$("#id_hdn_clinic_ID").val();         
		            if(clinicId == null || clinicId == undefined){
		             clinicId = "";
		            }*/
		            var cardTheme =$("#id-card-theme-search").val();         
		            if(cardTheme == null || cardTheme == undefined){
		            	cardTheme = "";
		            }
		            var cardType =$("#id-card-type-search").val();         
		            if(cardType == null || cardType == undefined){
		            	cardType = "";
		            } 
		            
			        // var paymentStatus=$('#payment_status_id').val();
			           var dataString = JSON.stringify({cardTheme:cardTheme,cardType:cardType});
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
			                      
//{"mDataProp" : "clinicId","bSortable" : false}, 
//{"mDataProp" : "clinicMaster","bSortable" : false},
//{"mDataProp" : "merchantId","bSortable" : false},
//{"mDataProp" : "cardCategory","bSortable" : false},
{"mDataProp" : "cardType","bSortable" : false,"bVisible":true},
//{"mDataProp" : "enteredy","bSortable" : false,"bVisible":true},
{"mDataProp" : "themeEnglish","bSortable" : false,"bVisible":true},

{"mDataProp" : "designUrlEnglish","bSortable" : false,},
//{"mDataProp" : "dateUpdated","bSortable" : false,},
//{"mDataProp" : "updatedby","bSortable" : false},
//{"mDataProp": "protocol","bSortable": false},


			        ]
			});
	
	/*
	$("#cancel-id").click(function(){
		cardCategoryTable.$('tr.selected').removeClass('selected');
		data=null;
	});
	
	$("#id-diagnosis-code").change(function(){
		data=null;
		cardCategoryTable.draw();
	});
	
	*/
	/*$("#design-eng-id").click(function(){
		$.ajax({
			type : 'POST',
			url : getContextPathCardCategory() +"/cardCategory/uploadDocument",
			dataType : "json",
			data:{cardCategoryId:cardCategoryId},
			success : function(data) {
				if (data.status == 'success') {
	        		// groupList();
					cardCategoryTable.draw();
					//getCode();
					 toastr.success(data.message);
					 $("#card-category-edit-form")[0].reset();
					 $("#delete-card-category-modal").modal('hide');
				} else {
					toastr.warning(data.message);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Exception in deleting card category" + errorThrown);
			}
		});
	});*/
	$("#id_clear_card_category").click(function(){
		data=null;
		$("#id-card-type-search").val("");
		$("#id-card-theme-search").val("");
		cardCategoryTable.draw();
	});
	$("#card-category-add").click(function(){
		$("#add_card_category_form")[0].reset();
		$("#id-add-card-category-modal").modal('show');
		//setTimeout(function(){$("#id_group_ID").focus();}, 500);
		
	});
	$("#card-category-save-id").click(function(){
		data=null;
		//alert($("#id-merchant-id").val());
		if($("#id-merchant-id").val()==null){
			toastr.warning("Please enter Merchant Id");
		}else if($("#card-type-id").val()==""){
			toastr.warning("Please enter the Card Type");
		}else if($("#id-card-theme").val()==null){
			toastr.warning("Please enter the card Theme");
		}else if($("#id_doc_file").val()==""){
			toastr.warning("Please select the card image");
		}else{
			//savecardCategoryData();
			 $("#add_card_category_form").submit();
		//	 $("#add_card_category_form")[0].reset();
		}
	});
	
	$('#card-category-datatable-id').on( 'click', 'tr', function () {
		
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            //datatableSelectFlag=0;
            data=null;
            //$("#id-mapping-transcationid").val("");
        }
        else {
       	// datatableSelectFlag=1;
       	 cardCategoryTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            data = cardCategoryTable.row(this).data();
           // alert(data.cardCategory+"sdfdsgf");
            //var data = diagnosisTable.row(this).data();
            $("#card-type-edit-id").val(data.cardTypeValue);
            $("#id-card-theme-edit").val(data.cardTheme);
            $("#id-design-url-eng-edit").attr('value',data.img);
          //  $("#id-design-url-eng-edit").val(data.img);
           // $("#id-design-url-arb-edit").val(data.designUrlArb);
            $("#card-category-hidden-edit-id").val(data.cardCategory);
            $("#hidden-card-category").val(data.cardCategory);
            $("#hidden-card-theme").val(data.cardTheme);
            $("#hidden-card-type").val(data.cardTypeValue);
            $("#hidden-merchantId").val(data.merchantId);
            $(".item-img").empty();
            $(".item-img").append(data.designUrlEnglish);
        }
  } );
	
	$("#card-category-delete").click(function(){
		//$("#dignosis-edit-form")[0].reset();
	if(data!=null){
		$("#delete-card-category-modal").modal('show');
	}
		else
			toastr.warning("Please select a row to delete");
	});
	
	$("#id_btn_delete_card_category").click(function(){
		data=null;
		var cardCategoryId= $("#card-category-hidden-edit-id").val();
		var merchantIdHidden= $("#hidden-merchantId").val();
		var cardType= $("#hidden-card-type").val();
		var cardTheme= $("#hidden-card-theme").val();
		$.ajax({
			type : 'POST',
			url : getContextPathCardCategory() +"/cardCategory/deleteCardCategory",
			dataType : "json",
			traditional: true,
			data:{cardCategoryId:cardCategoryId,
				merchantIdHidden:merchantIdHidden,
				cardType:cardType,
				cardTheme:cardTheme},
			success : function(data) {
				if (data.status == 'success') {
	        		// groupList();
					cardCategoryTable.draw();
					//getCode();
					 toastr.success(data.message);
					 $("#card-category-edit-form")[0].reset();
					 $("#delete-card-category-modal").modal('hide');
				} else {
					toastr.warning(data.message);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Exception in deleting card category" + errorThrown);
			}
		});
	});
	
	
	
	$("#card-category-edit").click(function(){
		if(data!=null){
	$("#card-category-edit-modal-id").modal('show');
		}else{
		toastr.warning("Please select a row to edit");
		}
		});

$("#card_category_update").click(function(){
	data=null;
	if($("#card-type-edit-id").val()==""){
		toastr.warning("Please enter Card Type");
	}else if($("#id-card-theme-edit").val()==""){
	toastr.warning("Please enter Card Theme");
	}
		else{
			//updateCardCategoryData();
			 $("#card-category-edit-form").submit();
		}

});
$("#id_search_card_category").click(function(){
	data=null;
	cardCategoryTable.draw();
});
/*	
	
	$("#diagonosis-download").click(function(){
		
		window.location.href = getContextPath()
		+ "/diagnosisController/diagnosisExportAsExcel";
	});
	
	*/
});

/*function savecardCategoryData(){
	
	$.ajax({
		type : 'POST',
		url : getContextPathCardCategory() + "/cardCategory/saveCardCategory",
		dataType : "text",
		data:$("#add_card_category_form").serialize(),
		success : function(data) {
        	if (data.status == 'success') {
        		cardCategoryTable.draw();
        		//getCode();
				 toastr.success(data.message);
				$("#add_card_category_form")[0].reset();
				$("#id-add-card-category-modal").modal('hide');
			} else {
				toastr.warning(data.message);
			}

		},

		error : function(jqXHR, textStatus, errorThrown) {
			alert("Exception in Saving card category" + errorThrown);
		}
	});
}
*/
/*function updateCardCategoryData(){
	var cardCategoryId= $("#card-category-hidden-edit-id").val();
	$.ajax({
		type : 'POST',
		url : getContextPathCardCategory() + "/cardCategory/updateCardCategory",
		dataType : "json",
		data:$("#card-category-edit-form").serialize()+"&cardCategoryId="+cardCategoryId,
		success : function(data) {
        	if (data.status == 'Success') {
        		cardCategoryTable.draw();
				toastr.success(data.message);
				$("#card-category-edit-form")[0].reset();
				 $("#card-category-edit-modal-id").modal('hide');
				
			} else {
				toastr.info(data.message);
				$("#card-category-edit-form")[0].reset();
			}
		},

		error : function(jqXHR, textStatus, errorThrown) {
			alert("Exception in updating diagnosis" + errorThrown);
		}
	});
}*/


function getMerchantId(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPathCardCategory() +"/cardCategory/getMerchantId", 
		dataType : "json",
		success : function(data){  
			$("#id-merchant-id").empty();
		$("#id-merchant-id").append('<option selected disabled>Select Merchant Id</option>');  
		for(var i in data){  
			$("#id-merchant-id").append('<option value="' + data[i].merchantId + '">' + data[i].merchantId+ '</option>'); 
			}     },
			error : function(jqXHR, textStatus, errorThrown) {  
				alert("Server Exception in getMerchantId list"+ errorThrown);   
				}
			}); 
	}
function getCardTheme(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPathCardCategory() +"/cardCategory/getCardTheme", 
		dataType : "json",
		success : function(data){  
			$("#id-card-theme-search").empty();
			$("#id-card-theme").empty();
			$("#id-card-theme-edit").empty();
		$("#id-card-theme-search").append('<option selected disabled>select</option>');  
		$("#id-card-theme").append('<option selected disabled>select</option>');  
		$("#id-card-theme-edit").append('<option selected disabled>select</option>');  
		for(var i in data){  
			$("#id-card-theme-search").append('<option value="' + data[i].cardThm + '">' + data[i].cardThmEng+ '</option>'); 
			$("#id-card-theme").append('<option value="' + data[i].cardThm + '">' + data[i].cardThmEng+ '</option>'); 
			$("#id-card-theme-edit").append('<option value="' + data[i].cardThm + '">' + data[i].cardThmEng+ '</option>'); 
			}     },
			error : function(jqXHR, textStatus, errorThrown) {  
				alert("Server Exception in getCardTheme list"+ errorThrown);   
				}
			}); 
	}

function trim(el) {
    el.value = el.value.
    replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
    replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
    replace(/\n +/, "\n"); // Removes spaces after newlines
    return;
} 
//validation for amount and decimal
function validateFloatKeyPress(el, evt) {   
	var charCode = (evt.which) ? evt.which : event.keyCode;  
	var number = el.value.split('.');   
	if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) { 
		return false;    
		}    //just one dot  
	if(number.length>1 && charCode == 46){  
		return false;  
		}        //get the carat position  
	var caratPos = getSelectionStart(el);   
	var dotPos = el.value.indexOf(".");    
	if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){      
		return false;    
		}    return true;
		}
