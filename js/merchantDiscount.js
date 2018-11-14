function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
var discountTable =null;
var discountData=null;
$(document).ready(function() {
	$("#img-load").hide();
	$("#expiry-date_id").datetimepicker({
		format: 'YYYY-MM-DD',
        sideBySide: true
       // minDate:moment().subtract(1,'d')
	}); 
	//-----------modal date picker------------------//
	$("#expiry-modal-date_id").datetimepicker({
		format: 'YYYY-MM-DD',
        sideBySide: true
       // minDate:moment().subtract(1,'d')
	}); 
	//-----------delete button click-------------------//	    
    $("#id-delete-discount").click(function(){
    	//$("#card-theme-name-search").val("");
		//giftCardThemeDetails.draw();
		if(discountData!=null)
		$("#delete-card-theme-modal").modal('show');
		else
			toastr.warning("Please select a row");
	});	
	
  //-----------update button click-------------------//
    $("#id-edit-discount").click(function(){
    	//$("#card-theme-name-search").val("");
		//giftCardThemeDetails.draw();
	if(discountData!=null){
	$(".giftCard-theme-Edit_modal").modal('show');
	}else{
		toastr.warning("Please select a row");
	}
});
	
	
$("#chooseFile")
.click(
		function() {
		
			var stats = true;
			//if (imageFlag == 1) {
				var allowedFiles = [ ".jpg", ".jpeg", ".png" ];
				var fileUpload = document.getElementById("chooseFile");
				var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:\()\\s])+("
						+ allowedFiles.join('|') + ")$");
				if ($("#chooseFile").val() != "") {
					if (!regex.test(fileUpload.value.toLowerCase())) {
						document.getElementById("profilePictureModal").src = searchPic;
						stats = false;
					} else {
						$("#id-form-user-profile-details").submit();
					}
				}
		//	}
		});

/*-----------------------modal photo upload---------------------------*/

$("#chooseFile-id")
.click(
		function() {
		
			var stats = true;
			//if (imageFlag == 1) {
				var allowedFiles = [ ".jpg", ".jpeg", ".png" ];
				var fileUpload = document.getElementById("chooseFile");
				var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:\()\\s])+("
						+ allowedFiles.join('|') + ")$");
				if ($("#chooseFile-id").val() != "") {
					if (!regex.test(fileUpload.value.toLowerCase())) {
						document.getElementById("profilePictureModal1").src = searchPic;
						stats = false;
					} else {
						$("#id-form-user-profile-details").submit();
					}
				}
		//	}
		});
/*-----------------------end modal photo upload---------------------------*/

/*-----------------------save discount merchant---------------------------*/

$("#id_btn_proceed_to_save").click(function() {
	
	var couponId=$("#coupon-code_id").val();
	var discountId=$("#discount-per_id").val();
	var expiryId=$("#expiry-date_id").val();
	var discountlogoId=$("#chooseFile").val();
	/*if($("#id_set_custom_amount").val()==""){
		cardValue=$("#id_hdn_cardValue").val();
	}else{
		cardValue=$("#id_set_custom_amount").val();
	}*/
	//alert($("#merchant-discount").serialize());
	if(couponId=="" ){
		toastr.warning("Please enter the coupon code");
	}else if(discountId=="" || couponId==""){
		toastr.warning("Please enter the Discount percentage");
	}
	else if(expiryId=="" ){
		toastr.warning("Please Select the expiry Date");
	}else if(discountlogoId=="" ){
		toastr.warning("Please Select an image");
	}else{
		
		  var reqData = new FormData();
		  var docFile = $("#chooseFile").prop("files")[0];  
	    if(null!=reqData && typeof reqData!='undefined'){
		   reqData.append("docFile", docFile);  
		   reqData.append("coupenCode",couponId);
		   reqData.append("discountPer",discountId);
		   reqData.append("expiryDate",expiryId);
	    }
		$.ajax({
			url : getContextPath() + "/merchantDiscount/saveMerchantDiscount",
			type : 'POST',
			contentType : false,
       	 	processData: false,
 	         data : reqData,
	        enctype: 'multipart/form-data',
			dataType : "json",
			beforeSend: function(msg){
				$("#img-load").show();
	          },
			
			success : function(data) {
				$("#img-load").hide();
				discountTable.draw();
				$('#merchant-discount')[0].reset();
				document.getElementById("profilePictureModal").src = getContextPath() + "/resources/img/user.png";

				if(data.status=="Success"){
					toastr.success(data.message);
				}else if(data.status=="Failed"){
					toastr.warning(data.message);
				}
			},
									error : function() {
										alert("Exception in checkout" + errorThrown);
									}
								}); 
	}
});





/*-----------------------delete function---------------------------*/

$("#delete-giftCard-row").click(function(){
	if(discountData!=null){
		var couponCode= discountData.couponCode;
		$.ajax({
			type : 'POST',
			url : getContextPath() + "/merchantDiscount/deleteMerchantDiscount",
			dataType : "json",
			data:{couponCode:couponCode},
			success : function(data) {
				discountTable.draw();
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
	}
	
});

//--------------edit functon----------------//	
$("#giftCard-theme-update").click(function(){
	discountData=null;
	 if($("#expiry-date-id").val().trim()==""){
	toastr.warning("Please enter the expiry date");
	}else if($("#discount-percentage-id").val().trim()==""){
		toastr.warning("Please enter the discount percentage");
	}else if($("#discount-logo-id").val().trim()==""){
	toastr.warning("Please enter thediscount logo");
}else{
		$.ajax({
			type : 'POST',
			url : getContextPath() + "/merchantDiscount/updateMerchantDiscount",
			dataType : "json",
			data:$("#giftCard-edit-form").serialize(),
			success : function(data) {
				$(".giftCard-theme-Edit_modal").modal('hide');
				discountTable.draw();
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



/*------------------- Discount table -------------------------------*/


discountTable = $('#id_table_discount').DataTable({
"bProcessing": true,
"bDeferRender": true,
bAutoWidth: false,
bServerSide: true,
sAjaxSource: getContextPath()+"/merchantDiscount/merchantDiscountList",
"iDisplayLength": 5,
"aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
"sPaginationType": "full_numbers",
"bPaginate": true,

"fnServerParams": function(aoData) {
/*
     var cardNameSearch =$("#card-theme-name-search").val();
     if(cardNameSearch == null || cardNameSearch == undefined){  
    	 cardNameSearch = "";   
     	}  */
     
    var dataString = JSON.stringify({});
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
    {"mDataProp": "couponCode", "bSortable": false},
    {"mDataProp": "expiryDate", "bSortable": false},
    {"mDataProp": "dicountPercentage", "bSortable": false},
    {"mDataProp": "discountLogo", "bSortable": false}
             ],
				'columnDefs': [
              		{
                		'targets': 0,
                		'createdCell':  function (td, cellData, rowData, row, col) {
                   			$(td).attr('data-title', 'Coupon Code'); 
                		}
             		},
             		{
                		'targets': 1,
                		'createdCell':  function (td, cellData, rowData, row, col) {
                   			$(td).attr('data-title', 'Expiry Date'); 
                		}
             		},
             		{
                		'targets': 2,
                		'createdCell':  function (td, cellData, rowData, row, col) {
                   			$(td).attr('data-title', 'Discount Percentage'); 
                		}
             		},
             		{
                		'targets': 3,
                		'createdCell':  function (td, cellData, rowData, row, col) {
                   			$(td).attr('data-title', 'Discount Logo'); 
                		}
             		}
             		
          		]
});

/*------------------------------------------------------------------*/


$('#id_table_discount').on( 'click', 'tr', function () { 
	if ( $(this).hasClass('selected') ) { 
		$(this).removeClass('selected'); 
		discountData=null;
		}else{     
			discountTable.$('tr.selected').removeClass('selected');  
			$(this).addClass('selected');    
			discountData = discountTable.row(this).data();  
			if(discountData!=null){
				$("#discount-modal-percentage-id").val(discountData.dicountPercentage);
				$("#expiry-modal-date_id").val(discountData.expiryDate);
				//$("#profilePictureModal1").attr("src",discountData.discountLogo);
				$("#id_image_modal").empty();
				$("#id_image_modal").append(discountData.discountLogo);
				$("#id_image_modal img").attr("id","profilePictureModal1");
			}
			}  
	} );


/*-----------------------save edit modal update---------------------------*/

$("#discount-modal-update").click(function() {
	var expiryId=$("#expiry-modal-date_id").val();
	var discountId=$("#discount-modal-percentage-id").val();
	var discountlogoId=$("#chooseFile-id").val();
	/*if($("#id_set_custom_amount").val()==""){
		cardValue=$("#id_hdn_cardValue").val();
	}else{
		cardValue=$("#id_set_custom_amount").val();
	}*/
	//alert($("#merchant-discount").serialize());
	if(expiryId=="" ){
		toastr.warning("Please enter the expiry Date");
	}else if(discountId==""){
		toastr.warning("Please enter the Discount percentage");
	}
	/*else if(discountlogoId=="" ){
		toastr.warning("Please Select the photo");
	}*/else{
		$(".giftCard-theme-Edit_modal").modal('hide');
		  var reqData = new FormData();
		  var docFile = $("#chooseFile-id").prop("files")[0];  
	    if(null!=reqData && typeof reqData!='undefined'){
		   reqData.append("docFile", docFile);  
		   reqData.append("discountPer",discountId);
		   reqData.append("expiryDate",expiryId);
		   reqData.append("coupenCode",discountData.couponCode);
	    }
		$.ajax({
			url : getContextPath() + "/merchantDiscount/updateMerchantDiscount",
			type : 'POST',
			contentType : false,
       	 	processData: false,
 	         data : reqData,
	        enctype: 'multipart/form-data',
			dataType : "json",
			success : function(data) {
				
				if(data.status=="Success"){
					discountTable.draw();
					toastr.success(data.message);
				}else if(data.status=="Failed"){
					toastr.warning(data.message);
				}
			},
									error : function() {
										alert("Exception in checkout" + errorThrown);
									}
								}); 
	}
});

});


/*----------------------image function--------------------------*/

function readURL(input) {
//imageFlag = 1;
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function(e) {
	$('#profilePictureModal').attr('src', e.target.result).width(80)
			.height(80);
};
reader.readAsDataURL(input.files[0]);
}
}

function readURLEdit(input) {
	//imageFlag = 1;
	if (input.files && input.files[0]) {
	var reader = new FileReader();
	reader.onload = function(e) {
		$('#profilePictureModal1').attr('src', e.target.result).width(70)
				.height(70);
	};
	reader.readAsDataURL(input.files[0]);
	}

	}




