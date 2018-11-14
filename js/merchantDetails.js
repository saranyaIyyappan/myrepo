function getContextPath() {
	    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 }




$(document).ready(function() {
	$("#img-load").hide();

	$("#id_password").first().on('keyup', changePasswordProgressBar);

	var contextPath =$('#app-context-path').val();
	toastr.options = {
			"preventDuplicates": true,
			"preventOpenDuplicates": true
			};


//------------------------------------------------merchant Details Sign UP --------------------------------------//	
	$("#id_mearchant_Signup").click(function(){
		$("#id_merchant_signup_modal").modal('show');
		openCity(event, 'London');
		$("#id_merchant_details_next").show();		
		$("#id_merchant_details_previous").hide();
		$("#id_merchant_details_save").hide();
		
	});
	

	
	$("#id_merchant_details_next").click(function(){
		//$("#id_merchant_signup_modal").modal('show');
		openCity(event, 'Paris');
		$("#id_merchant_details_next").hide();		
		$("#id_merchant_details_previous").show();
		$("#id_merchant_details_save").show();		
		$("#id_merId").val($("#id-merchant-id").val());
	});
	
	$("#id_merchant_details_previous").click(function(){
		openCity(event, 'London');
		$("#id_merchant_details_next").show();		
		$("#id_merchant_details_previous").hide();
		$("#id_merchant_details_save").hide();
		});
	
	
	
	
	$("#id_merchant_details_save").click(function(){
		 best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;
		 var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		 var str=$("#id_password").val();
			 if(!best.test(str)) {
					toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
			    }else if($("#password-progress-bar").html()=="POOR"){
					toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
				}else if($("#password-progress-bar").html()=="WEAK"){
					toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
				}
				else if($("#id-merchant-id").val()==""){
			   toastr.warning("Please enter Mobile Number");}
		 else if($("#id-alternate_id").val()==""){
			   toastr.warning("Please enter Alternative Mobile Number");}
		 else if($("#id-emailId").val()=="")
			   toastr.warning("Please enter Email Id");
		 else if(regex.test($("#id-emailId").val())==false) 
			 toastr.warning("Please enter valid Email Id"); 
		 else if($("#id-cr-number").val()=="") 
			 toastr.warning("Please enter CR Number"); 
		 else if($("#id_shop_name_english").val()==""){
			   toastr.warning("Please enter Name of Shop(English)");}
		 else if($("#id_shop_name_arabic").val()=="")
			   toastr.warning("Please enter Name of Shop(Arabic)");
		 else if($("#id_merchant_type").val()==""){
			   toastr.warning("Please select Category");}
		 else if($("#id_global_sale_id").val()==""){
			   toastr.warning("Please select Sub-Category");}
		 else if($("#id-contact-name").val()==""){
			   toastr.warning("Please enter Contact Name");}
		 else if($("#id_card_group_id").val()==""){
			   toastr.warning("Please enter Card Group");}
			 
		 else if($("#id-address1").val().trim()==""){
			   toastr.warning("Please enter Address 1");}
		 else if($("#id-address2").val().trim()==""){
			   toastr.warning("Please enter Address 2");}
		 else if($("#id-pobox").val()==""){
			   toastr.warning("P.O.BOX");}
		 else if($("#id-zip-code").val()==""){
			   toastr.warning("Zip Code");}
		 else if($("#id-state").val()==""){
			   toastr.warning("State");}
		 else if($("#id-anb-accountNumber").val()==""){
			   toastr.warning("ANB Account Number");}
		 else if($("#id_password").val()==""){
			   toastr.warning("Please enter Password");}
		 else if($("#id_confirm_password").val()==""){
			   toastr.warning("Please Confirm Password");}
		 else if($("#id_password").val()!=$("#id_confirm_password").val()){
			   toastr.warning("Password and Confirm Password are not matching");}
		else{
			$.ajax({
				type : 'POST',
				url : getContextPath()+"/merchant/saveMerchantDetails",
				data : $("#id_merchant_signup_form").serialize(),
				dataType : "json",
				success : function(data) {
				   if (data.status=='Success') {
					   toastr.success(data.message);
				   } else {
						toastr.error(data.message);
				   }
				$("#id_merchant_signup_form")[0].reset();
				$("#id_merchant_signup_modal").modal('hide');

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Server Exception in saving Merchant Details" );
			}
			});
  
	}
	});
//------------------------cancel save details--------------------------------------------------//
	$("#id_cancel_save_merchantDetails").click(function(){
		$("#id_merchant_signup_form")[0].reset();
	});
	
	$("#id_close_modal").click(function(){
		$("#id_merchant_signup_form")[0].reset();
	});
//----------------------------------------forgot password------------------------------------------------//
	$("#id_forgot_password_merchant").click(function(){
		$("#id_forgot_password_modal").modal('show');
	});
//-----------------------------Merchant Login----------------------------------------------------------//
	 $("#id-merchant-login").click(function(){
		 $.ajax({
				url : getContextPath() + "/user/login",
				type : 'POST',
				data:$("#id_form_merchant_login").serialize(),
				dataType : "text",
				beforeSend: function(msg){
					$("#img-load").show();
		          },
				
				success : function(data) {
					$("#img-load").hide();
					
					if(data!="Invalid UserName or Password" && data!="Server Problem"){
						window.location.href= getContextPath() +data;
					}else{
						toastr.warning("Invalid Username or Password");
					}
				},
										error : function() {
											alert("Exception in saveInsurancePayer" + errorThrown);
										}
			}); 
	 
	 });
	 
 
	 getAllGroups();
	 

	 
});
//--------------------------checkForUniqueMailId---------------------------------------------------------//
function isMailIdExist(){
	var mailId=$("#id-email-Id").val();
	$.ajax({
		type : 'POST',
		url : getContextPath()+"/merchant/checkForUniqueMail",
		data : {mailId:mailId},
		dataType : "json",
		success : function(data) {
						if (data.status=='Success') {
				toastr.warning(data.message);
				
				$("#id-email-Id").val("");

			} else {
			}
			

		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Server Exception in checkForUniqueMail" );
		}
	});

	
}
function changePasswordProgressBar(ev) {
    // less than 8 characters
    var wrost = 3,
        // minimum 8 characters
        bad = /(?=.{2,}).*/,
        //Alpha Numeric plus minimum 8
        good = /^(?=\S*?[a-z])(?=\S*?[0-9])\S{6,}$/,
        //Must contain at least one upper case letter.
        better = /^(?=\S*?[A-Z])((?=\S*?[0-9])|(?=\S*?[^\w\*]))\S{8,}$/,
        //Must contain at least one upper case letter, one lower case letter and (one number AND one special char).
        best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/,
        password = $(ev.target).val(),
        strength = '0',
        progressClass = 'progress-bar progress-bar-',
        ariaMsg = '0% Complete (danger)',
        $progressBarElement = $('#password-progress-bar');

    if (best.test(password) === true) {
        strength = '100%';
        progressClass += 'success';
        ariaMsg = '100% Complete (success)';
        $("#password-progress-bar").html("EXCELLENT");
    } else if (better.test(password) === true) {
        strength = '80%';
        progressClass += 'info';
        ariaMsg = '80% Complete (info)';
        $("#password-progress-bar").html("STRONG");
    } else if (good.test(password) === true) {
        strength = '50%';
        progressClass += 'warning';
        ariaMsg = '50% Complete (warning)';
        $("#password-progress-bar").html("MEDIUM");
    } else if (bad.test(password) === true) {
        strength = '30%';
        progressClass += 'warning';
        ariaMsg = '30% Complete (warning)';
        $("#password-progress-bar").html("WEAK");
    } else if (password.length >= 1 && password.length <= wrost) {
        strength = '10%';
        progressClass += 'danger';
        ariaMsg = '10% Complete (danger)';
       $("#password-progress-bar").html("POOR");
    } else if (password.length < 1) {
        strength = '0';
        progressClass += 'danger';
        ariaMsg = '0% Complete (danger)';
        $("#password-progress-bar").html("POOR");
    }

    $progressBarElement.removeClass().addClass(progressClass);
    $progressBarElement.attr('aria-valuenow', strength);
    $progressBarElement.css('width', strength);
    $progressBarElement.find('span.sr-only').text(ariaMsg);
}

 
//---------------------trim leading and trailing spaces----------------------------------------------------//
function trim(el) {
    el.value = el.value.
    replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
    replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
    replace(/\n +/, "\n"); // Removes spaces after newlines
    return;
}
//-----------------------number validation----------------
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    	toastr.warning("Only numbers");
    	return false;
    }else{
    	return true;
    }

  } 
function openCity(evt, cityName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(
				" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function getAllGroups(){
	$.ajax({
		url : getContextPath()+"/merchant/getAllCardGroups",
		type : 'POST',
		dataType : "json",
		success : function(data) {
				$("#id_card_group_id").empty();
				$("#id_card_group_id").append('<option value>Select Card Group</option>');
				for(var i in data){
					$("#id_card_group_id").append('<option value="'+data[i].cardGroup+'">'+data[i].cardGroupName+'</option>');
				}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Server Exception in getAllGroups" );
		}
	});
}
