function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

var imageFlag=0;
var userImage;
$(document).ready(function(){
	$("#img-load").hide();
	getMerchantProfileDetails();
//----------toastr for update----------------------
	if($("#hidden-updateStatus-details").val()=="success"){
		toastr.success("Merchant Details Updated successfully");
	}
	if($("#hidden-updateStatus-details").val()=="fail"){
		toastr.warning("Merchant Details Update Failed");
	}
	
	
	
	
//------------datePicker-------------------------
	/*$("#id-insurance-renewal").datetimepicker({
		format: 'YYYY-MM-DD'});*/
	
//----------------upload photo button------------------
	$("#fileUploadBtn").click(function(){
    	$("#chooseFile").trigger('click');
    });
	
	//-----------------------chooseFile button for profile picture---------------------
	 $("#chooseFile").change(function() {
			var stats=true;
			if(imageFlag==1){
			var allowedFiles = [".jpg", ".jpeg",".png"];
	        var fileUpload = document.getElementById("chooseFile");
	        var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:\()\\s])+(" + allowedFiles.join('|') + ")$");
	        if($("#chooseFile").val()!=""){
	   		 if (!regex.test(fileUpload.value.toLowerCase())) {
	   			toastr.warning('Please upload images having extensions:"' + allowedFiles.join(", ") +' " only');
	   			//document.getElementById("profilePictureModal").src ="data:image/png;base64,"+userImage;
	   			stats= false;
	   	        }else{
	   	        	//updateEmployeeProfile();
	   	         $("#id-form-employee-profile-picture").submit();
	   	        }
	   		 }
			}
		});
	
//---------------------update button others----------------------
	


$("#id-update-merchant-details").click(function(){
	updateMerchantProfile();});
});

//---------------photo upload choosing file-----------------

function readURL(input) {
	imageFlag=1;
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#profilePictureModal')
                .attr('src', e.target.result)
                .width(150)
                .height(150);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

//----------------get Profile details-------------------------

function getMerchantProfileDetails(){
	$.ajax({
        url: getContextPath()+"/merchantProfile/getMerchantProfileDetails",
        type: 'POST',
        contentType: "image/png",
        dataType: "json",
        beforeSend: function(msg){
			$("#img-load").show();
          },
        success: function(data) {
        	$("#img-load").hide();
        	//  $("#id-employee-id").val(data.employeeId);
        	//$("#id-curnt-passwrd-super").val("");
        	
        	 // $("#id-designation-id").html("Designation: "+data.designation);
        	 // $("#id-employee-code-id").html("Employee Code: "+data.employeeCode);
        	 
        	  if(data.userName=="No Username"){}
        	  else{
        	  $("#id-employee-name-id").html("Hi, "+data.userName);
        	  }
        	 ("profilePictureModal")
        	 
        	  $("#id-merchantId").val(data.merchantId);
        	  $("#id-address-present").val(data.address1);
        	  $("#id-address-permanent").val(data.address2);
        	 // $("#id-mobile").val(data.mobile);
        	  $("#id-eMail").val(data.eMailId);
        	  $("#id-poboxNumber").val(data.pobox);
        	  $("#id-zip").val(data.zip);
        	  $("#id-state").val(data.state);
        	  $("#id-city").val(data.city);
        	  $("#id-mobile").val(data. merchantId);
        	  userImage=data.merchantLogo;
        	  if(data.merchantLogo!="No Image Found"){
         	  $("#profilePictureModal").attr("src", getContextPath()+"/"+data.merchantLogo);
        	  }else{
        		  $("#profilePictureModal").attr("src",getContextPath()+"/resources/img/user.png");
        	  }
        	/*  if(userImage){
        		  $("#profilePictureModal").attr("src",userImage);
        	  }else{
        		  $("#profilePictureModal").attr("src",getContextPath()+"/resources/img/user.png");
        	  }
        	 */
        /*	if(data.merchantLogo=="No Image Found"){
        		document.getElementById("profilePictureModal").src =userImage;
        	  
           }else{
        	   document.getElementById("profilePictureModal").src =userImage;
           }*/
        },
        error: function() {
        	alert("error in getEmployeeDetails");
        }
    });
}

//------------------numbers only------------------

function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Only numbers");

    return false;

    } return true;
}

function updateMerchantProfile(){
	var stats=true;
	var isValidEmailAddress = function(emailAddress) {
	    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
	    return pattern.test(emailAddress);
	};
	var contactEmail = $('#id-eMail').val().trim();
	 if($("#id-address-present").val().trim()==""){
		   toastr.warning("Please enter Present Address");}
	 else if($("#id-address-permanent").val().trim()==""){
		   toastr.warning("Please enter Permanent Address");}
	 else if($("#id-eMail").val().trim()==""){
		   toastr.warning("Please enter E-mail");
		}else if(!isValidEmailAddress(contactEmail)){
			toastr.warning("Please enter the valid E-mail");
		}else{
	var stats=true;
	if(stats){
	
		if($('#id-new-passwrd-employee').is('[readonly]')){
			$("#id-form-employee-profile-details").submit();
		}else{
				 if($("#id-new-passwrd-employee").val()==""){
					toastr.warning("Please Enter new password");
				}else if($("#id-conform-passwrd-employee").val()==""){
					toastr.warning("Please Enter confirm password");
				}else if($("#id-new-passwrd-employee").val()!=$("#id-conform-passwrd-employee").val()){
					toastr.warning("new password and confirm password not matching");
				}else{
			 $("#id-form-employee-profile-details").submit();
			 }
	}}}}

function passwordChange(){
	var password=$("#id-curnt-passwrd-merchant").val();
	if(password!=""){
	$.ajax({
        url: getContextPath()+"/merchantProfile/checkCurrentPassword",
        type: 'POST',
        data:{password:password},
        dataType: "text",
        success: function(data) {
        	if(data=="matching"){
        		 $("#id-new-passwrd-employee").prop("readonly",false);
        		 $("#id-conform-passwrd-employee").prop("readonly",false);
        		 $("#id-new-passwrd-employee").focus();
        	}else{
        		 $("#id-new-passwrd-employee").prop("readonly",true);
        		 $("#id-conform-passwrd-employee").prop("readonly",true);
        		 toastr.warning("Incorrect Password");
        	}
        },
        error: function() {
        	
        }
    });
	}else{
		$("#id-new-passwrd-employee").prop("readonly",true);
		 $("#id-conform-passwrd-employee").prop("readonly",true);
		
	}
}


