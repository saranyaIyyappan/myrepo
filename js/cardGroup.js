function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function(){
	var data=null;
	var giftCardDetails;
	
	
//------------create button click-------------------//	
	    $("#id-add-giftCard").click(function(){
		$("#giftCard-add-form")[0].reset();
		//giftCardDetails.draw();
		$(".giftCard-add-modal").modal('show');
		//setTimeout(function(){$("#id-card-group-id").focus();}, 500);
	    });
//-----------update button click-------------------//
	        $("#id-edit-giftCard").click(function(){
	    		//giftCardDetails.draw();
			if(data!=null){
			$(".giftCard-Edit_modal").modal('show');
			}else{
				toastr.warning("Please select a row");
			}
		});
//-----------delete button click-------------------//	    
	    $("#id-delete-giftCard").click(function(){
			//giftCardDetails.draw();
			if(data!=null)
			$("#delete-giftCard-modal").modal('show');
			else
				toastr.warning("Please select a row");
		});
	
//-----------------data table---------------//
	
	    giftCardDetails = $('#giftCardList').DataTable({
        "bProcessing": true,
        "bDeferRender": true,
        bAutoWidth: false,
        bServerSide: true,
        sAjaxSource: getContextPath()+"/cardGroupController/cardGroupList",
        "iDisplayLength": 5,
        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        
        "fnServerParams": function(aoData) {

        	var cardGroupSearch =$("#card_id_search").val();
             if(cardGroupSearch == null || cardGroupSearch == undefined){  
            	 cardGroupSearch = "";   
             	}  
             var cardNameSearch =$("#card_name_search").val();
             if(cardNameSearch == null || cardNameSearch == undefined){  
            	 cardNameSearch = "";   
             	}  
             
            var dataString = JSON.stringify({cardGroup: cardGroupSearch,cardName:cardNameSearch});
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
            {"mDataProp": "cardGroup", "bSortable": false},
            {"mDataProp": "groupNameEng", "bSortable": false},
            {"mDataProp": "groupNameArb", "bSortable": false},
                     ],
                     columnDefs : [
                                   { targets : [0],
                                     render : function (data, type, row) {
                                       switch(data) {
                                          case 1 : return 'Hyper Markets'; break;
                                          case 2 : return 'Malls'; break;
                                          case 3 : return 'Products'; break;
                                          case 4 : return 'Other'; break;
                                          default  : return 'N/A';
                                       }
                                     }
                                   }
                              ]
        
        
    });
//--------------row select for edit----------------//
	
	$('#giftCardList').on( 'click', 'tr', function () { 
		if ( $(this).hasClass('selected') ) { 
			$(this).removeClass('selected'); 
			data=null;
			}else{     
				giftCardDetails.$('tr.selected').removeClass('selected');  
				$(this).addClass('selected');    
			    data = giftCardDetails.row(this).data();  
				$("#card-group-edit").val(data.cardGroup);     
				$("#cardName-english-edit").val(data.groupNameEng);  
				$("#cardName-arabic-edit").val(data.groupNameArb);   
				}  
		} );

//-------------add function-------------//	
$("#card-group-save").click(function(){
	data=null;
		 if($("#id-card-group-id").val().trim()==""){
		    toastr.warning("Please enter the Card Group !");
		}else if($("#id-cardName-english").val().trim()==""){
			toastr.warning("Please enter the Card Name [ENGLISH] !");
		}else if($("#id-cardName-arab").val().trim()==""){
			toastr.warning("Please enter the Card Name [ARABIC] !");
		}else{
			$.ajax({
				type : 'POST',
				url : getContextPath() + "/cardGroupController/saveCardGroup",
				dataType : "json",
				data:$("#giftCard-add-form").serialize(),
				success : function(data) {
					$(".giftCard-add-modal").modal('hide');
					giftCardDetails.draw();
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
$("#giftCard-update").click(function(){
	data=null;
	 if($("#cardName-english-edit").val().trim()==""){
	toastr.warning("Please enter the Card Name [ENGLISH]");
	}else if($("#cardName-arabic-edit").val().trim()==""){
		toastr.warning("Please enter the Card Name [ARABIC]");
	}else{
		$.ajax({
			type : 'POST',
			url : getContextPath() + "/cardGroupController/updateCardGroup",
			dataType : "json",
			data:$("#giftCard-edit-form").serialize(),
			success : function(data) {
				$(".giftCard-Edit_modal").modal('hide');
				giftCardDetails.draw();
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
	var cardGroup= $("#card-group-edit").val();
	$.ajax({
		type : 'POST',
		url : getContextPath() + "/cardGroupController/deleteCardGroup",
		dataType : "json",
		data:{cardGroup:cardGroup},
		success : function(data) {
			giftCardDetails.draw();
			if(data.status=="Success"){
				$("#delete-giftCard-modal").modal('hide');
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
	

//----------------search button click-----------------//
$("#id_search_card").click(function(){
	data=null;
	giftCardDetails.draw();
	
});
//----------------clear button click-----------------//
$("#id_clear_card").click(function(){
	data=null;
	giftCardDetails.draw();
	
	
});
//----------------cancel btn click for edit--------------------------------------

$("#card-group-add-cancel").click(function(){
	giftCardDetails.$('tr.selected').removeClass('selected');  
	data=null;
	//$("#medicineMaster-add-form")[0].reset();
});
$("#giftCard-edit-cancel").click(function(){
	giftCardDetails.$('tr.selected').removeClass('selected');  
	data=null;
});

//--------------ready function ends----------------------


/*$("#medicineMaster-download-id").click(function(){
	
	window.location.href = getContextPath()
	+ "/medicineMaster/medicineExportAsExcel";
});*/


});




//-----------------------number validation----------------

function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Only numbers");

    return false;

    } return true;

  } 