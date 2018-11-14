function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function(){
	var data=null;
	var giftCardThemeDetails;
	//getCardGroup();
	//getThemeName();
	
//------------create button click-------------------//	
	    $("#id-add-giftCard-theme").click(function(){
		$("#giftCard-add-form")[0].reset();
		$("#card-theme-name-search").val("");
		//giftCardThemeDetails.draw();
		$(".giftCard-theme-add-modal").modal('show');
		//setTimeout(function(){$("#id-card-group-id").focus();}, 500);
	    });
//-----------update button click-------------------//
	        $("#id-edit-giftCard-theme").click(function(){
	        	$("#card-theme-name-search").val("");
	    		//giftCardThemeDetails.draw();
			if(data!=null){
			$(".giftCard-theme-Edit_modal").modal('show');
			}else{
				toastr.warning("Please select a row");
			}
		});
//-----------delete button click-------------------//	    
	    $("#id-delete-giftCard-theme").click(function(){
	    	$("#card-theme-name-search").val("");
			//giftCardThemeDetails.draw();
			if(data!=null)
			$("#delete-card-theme-modal").modal('show');
			else
				toastr.warning("Please select a row");
		});
	
//-----------------data table---------------//
	
	    giftCardThemeDetails = $('#giftCardThemeList').DataTable({
        "bProcessing": true,
        "bDeferRender": true,
        bAutoWidth: false,
        bServerSide: true,
        sAjaxSource: getContextPath()+"/cardThemeController/cardThemeList",
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        
        "fnServerParams": function(aoData) {

        	/*var cardGroupSearch =$("#card_id_search").val();
             if(cardGroupSearch == null || cardGroupSearch == undefined){  
            	 cardGroupSearch = "";   
             	} */ 
             var cardNameSearch =$("#card-theme-name-search").val();
             if(cardNameSearch == null || cardNameSearch == undefined){  
            	 cardNameSearch = "";   
             	}  
             
            var dataString = JSON.stringify({cardName:cardNameSearch});
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
        "aaSorting": [[1, "asc"]],
        "sDom": 'rt<lp>',
        "aoColumns": [
            /*{"mDataProp": "cardTheme", "bSortable": false},*/
            {"mDataProp": "themeNameEng", "bSortable": false},
            {"mDataProp": "themeNameArb", "bSortable": false},
                     ]
    });
//--------------row select for edit----------------//
	
	$('#giftCardThemeList').on( 'click', 'tr', function () { 
		if ( $(this).hasClass('selected') ) { 
			$(this).removeClass('selected'); 
			data=null;
			}else{     
				giftCardThemeDetails.$('tr.selected').removeClass('selected');  
				$(this).addClass('selected');    
			    data = giftCardThemeDetails.row(this).data();  
				$("#card-theme-edit").val(data.cardTheme);     
				$("#cardTheme-english-edit").val(data.themeNameEng);  
				$("#cardTheme-arabic-edit").val(data.themeNameArb);   
				}  
		} );

//-------------add function-------------//	
$("#card-theme-save").click(function(){
	data=null;
		/* if($("#id-card-group-id").val().trim()==""){
		    toastr.warning("Please enter the Card Group !");
		}else*/ if($("#id-card-theme-Name-english").val().trim()==""){
			toastr.warning("Please enter the Theme Name [ENGLISH] !");
		}else if($("#id-card-theme-Name-arab").val().trim()==""){
			toastr.warning("Please enter the Theme Name [ARABIC] !");
		}else{
			$.ajax({
				type : 'POST',
				url : getContextPath() + "/cardThemeController/saveCardTheme",
				dataType : "json",
				data:$("#giftCard-add-form").serialize(),
				success : function(data) {
					$(".giftCard-theme-add-modal").modal('hide');
					//getThemeName();
					giftCardThemeDetails.draw();
					if(data.status=="Success"){
						toastr.success(data.message);
					}else if(data.status=="Failed"){
						toastr.warning(data.message);
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Exception in Saving file" + errorThrown);
				}
			});
		}
	});

//--------------edit functon----------------//	
$("#giftCard-theme-update").click(function(){
	data=null;
	 if($("#cardTheme-english-edit").val().trim()==""){
	toastr.warning("Please enter the Theme Name [ENGLISH]");
	}else if($("#cardTheme-arabic-edit").val().trim()==""){
		toastr.warning("Please enter the Theme Name [ARABIC]");
	}else{
		$.ajax({
			type : 'POST',
			url : getContextPath() + "/cardThemeController/updateCardTheme",
			dataType : "json",
			data:$("#giftCard-edit-form").serialize(),
			success : function(data) {
				$(".giftCard-theme-Edit_modal").modal('hide');
				giftCardThemeDetails.draw();
				//getThemeName();
				if(data.status=="Success"){
					toastr.info(data.message);
					$("#giftCard-edit-form")[0].reset();
				}else{
					toastr.warning(data.message);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Exception in updating file" + errorThrown);
			}
		});
	}
});
//---------------delete function-------------//
$("#delete-giftCard-row").click(function(){
	data=null;
	var cardTheme= $("#card-theme-edit").val();
	$.ajax({
		type : 'POST',
		url : getContextPath() + "/cardThemeController/deleteCardTheme",
		dataType : "json",
		data:{cardTheme:cardTheme},
		success : function(data) {
			//getThemeName();
			giftCardThemeDetails.draw();
			if(data.status=="Success"){
				$("#delete-card-theme-modal").modal('hide');
				toastr.info(data.message);
			}else{
				toastr.warning(data.message);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Exception in deleting file" + errorThrown);
		}
	});
});
	
//getMedicineCode();

//----------------search button click-----------------//
$("#id-search-theme").click(function(){
	data=null;
	//$("#card-theme-name-search").val("");
	giftCardThemeDetails.draw();
	
});
//----------------clear button click-----------------//
$("#id-clear-theme").click(function(){
	data=null;
	/*getCardGroup();
	getCardName();*/
	$("#card-theme-name-search").val("");
	giftCardThemeDetails.draw();
	
	
});
//----------------cancel btn click for edit--------------------------------------

$("#card-theme-add-cancel").click(function(){
	giftCardThemeDetails.$('tr.selected').removeClass('selected');  
	data=null;
	//$("#medicineMaster-add-form")[0].reset();
});
$("#giftCard-theme-edit-cancel").click(function(){
	giftCardThemeDetails.$('tr.selected').removeClass('selected');  
	data=null;
});

//--------------ready function ends----------------------


/*$("#medicineMaster-download-id").click(function(){
	
	window.location.href = getContextPath()
	+ "/medicineMaster/medicineExportAsExcel";
});*/


});

//----------------cardGroup DropDown------------------------//

/*function getThemeName(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPath() +"/cardThemeController/getCardGroup", 
		dataType : "json",
		success : function(data){  
		$("#card_id_search").empty();
		$("#card_id_search").append('<option selected disabled>Select</option>');  
		for(var i in data){  
			if(data[i]!=""){
			$("#card_id_search").append('<option value="' + data[i] + '">' + data[i]+ '</option>'); 
			}  }   },
			error : function(jqXHR, textStatus, errorThrown) {  
				alert("Server Exception in getUnitName list"+ errorThrown);   
				}
			}); 
	}*/

//----------------cardName DropDown----------------------------

/*function getCardName(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPath() +"/cardGroupController/getCardName", 
		dataType : "json",
		success : function(data){  
		$("#card_name_search").empty();
		$("#card_name_search").append('<option selected disabled>Select</option>');  
		for(var i in data){  
			if(data[i]!=""){
			$("#card_name_search").append('<option value="' + data[i] + '">' + data[i]+ '</option>'); 
			}  }   },
			error : function(jqXHR, textStatus, errorThrown) {  
				alert("Server Exception in getUnitName list"+ errorThrown);   
				}
			}); 
	}*/

//-----------------------number validation----------------

function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Only numbers");

    return false;

    } return true;

  } 