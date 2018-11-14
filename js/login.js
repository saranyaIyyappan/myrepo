function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}

var pageFlag="0";
var cartTable;
$(document).ready(function() {
	$("#id_Cart").click(function(){
		if($("#id_hdn_loggeduser").val()!=""){
		$("#id_card_results_").modal("show");
		}});
	$("#id_btn_login_dropdown").click(function(){
		//if($("#id_hdn_loggeduser").val()==""){
			if($("#id_btn_login_dropdown").attr("data-toggle")==undefined){
			pageFlag="0";
		$("#id_login_modal").modal("show");
		$("#img-load").hide();
		}
	});
	
	/*$("#id_btn_card_balance").click(function(){
		if($("#id_hdn_loggeduser").val()==""){
		$("#id_login_modal").modal("show");
		}else{
		window.location.href= getContextPath() + "/consumer/consumerDashboardScreen";
		}
	});*/
	
	if($("#id_hdn_loggeduser").val()!=""){
		//if($("#id_btn_login_dropdown").attr("data-toggle")==undefined){
		$("#id_btn_login_dropdown").html($("#id_hdn_loggeduser").val()+" "+"<i class='fa fa-caret-down'></i>");
		$("#id_btn_login_dropdown").attr("data-toggle","dropdown");
		getProductListMyCart();
	}
	/*
	$("#id_btn_logout_consumer").click(function(){
		 $.ajax({
				url : getContextPath() + "/user/logout",
				type : 'POST',
				dataType : "text",
				success : function(data) {
					alert(data)
					$("#id_login_modal").modal('hide');
					if(data=="success"){
						window.location.href= getContextPath() + "/user/home";
					}else{
						alert(data);
					}
				},
										error : function() {
											alert("Exception in saveInsurancePayer" + errorThrown);
										}
									}); 
	});*/
	$("#id_btn_consumer_signup").click(function(){
		$("#id_login_modal").modal('hide');
		$("#id_consumer_signup").modal("show");
	});
	
	
	
	$("#id_btn_register_consumer").click(function(){
		 best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;
			var str=$("#id_txt_pwd_signup").val();
		    if(!best.test(str)) {
				toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
		    }else if($("#id_txt_userId_signup").val()==""){
			toastr.warning("Please Enter Mobile Number");
		}else if($("#id_txt_userName_signup").val()==""){
			toastr.warning("Please Enter Full Name");
		}else if($("#id_txt_emailId_signup").val()==""){
			toastr.warning("Please Enter Email ID");
		}else if($("#id_txt_pwd_signup").val()==""){
			toastr.warning("Please Enter the Password");
		}else if($("#id_txt_cnfpwd_signup").val()==""){
			toastr.warning("Please Enter Confirm Password");
		}else if($("#password-progress-bar").html()=="POOR"){
			toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
		}else if($("#password-progress-bar").html()=="WEAK"){
			toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
		}else{
			if($("#id_txt_pwd_signup").val()!=$("#id_txt_cnfpwd_signup").val()){
				toastr.warning("Password and Confirm Password Should Be Same");
			}else
		 $.ajax({
				url : getContextPath() + "/consumer/registerConsumer",
				type : 'POST',
				data:$("#id_form_signUp_consumer").serialize(),
				dataType : "json",
				success : function(data) {
					
					if(data.status=="success"){
						$("#id_consumer_signup").modal("hide");
						$("#id_form_signUp_consumer")[0].reset();
						toastr.info(data.message);
					}else{
						toastr.warning(data.message);
					}
				},
										error : function() {
											alert("Exception in saveInsurancePayer" + errorThrown);
										}
									}); 
		}
	});
	
	
	 $("#id_btn_consumer_login").click(function(){
		 if($("#id_text_userId_login").val()==""){
				toastr.warning("Please enter Mobile Number");
			}else if($("#id_text_password_login").val()==""){
				toastr.warning("Please enter Password");
			}else
		 $.ajax({
				url : getContextPath() + "/user/login",
				type : 'POST',
				data:$("#id_form_login").serialize(),
				dataType : "text",
				beforeSend: function(msg){
					$("#img-load").show();
		          },
				success : function(data) {
					$("#id_login_modal").modal('hide');
					if(data!="Invalid UserName or Password" && data!="Server Problem"){
						if(pageFlag=="0"){
						window.location.href= getContextPath() + data;
						}else if(pageFlag=="1"){
							$("#id_form_purchaseCard").submit();
						}
					}else{
						toastr.warning(data);
					}
				},
										error : function() {
											alert("Exception in consumer login" + errorThrown);
										}
									}); 
	 
	 });
	//----------------------------------------forgot password------------------------------------------------//
		$("#id_forgotPassword").click(function(){
			$("#id_login_modal").modal('hide');
			$("#id_forgot_password_modal").modal('show');
		});
	//-------------------------------------------------------------------------------------------------------//	
		
	
		//---------------------------------Forgot Password----------------------------------------------------//
		 $("#id__mail_submit").click(function(){
			 if((document.getElementById("id_check_userId").checked == false)&&(document.getElementById("id_check_password").checked == false)){
				 toastr.warning("Please select an option"); 
			 }
			 else if(document.getElementById("id_check_userId").checked == true){
				var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			 if($("#id-forgot-password").val()==""){
					toastr.warning("Please Enter Password");
				}else if($("#id-email-Id_forgot_password").val()==""){
					toastr.warning("Please Enter email Id");
				} else if(regex.test($("#id-email-Id_forgot_password").val())==false){
					 toastr.warning("Please enter valid Email Id"); 
						
				 }
				else{ var password=$("#id-forgot-password").val();
				 var emailId=$("#id-email-Id_forgot_password").val();
				 $.ajax({
						type : 'POST',
						url : getContextPath()+"/merchant/forgotPassword",
						data : {password:password,emailId:emailId},
						dataType : "json",
						success : function(data) {
										if (data.status=='Success') {
											toastr.info(data.message);
											$("#id_forgot_password_modal").modal('hide');
											$("#id-forgot-password").val("");
											$("#id-email-Id_forgot_password").val("");
											document.getElementById("id_check_userId").checked = false;

							} else {
								toastr.error(data.message);
								$("#id_forgot_password_modal").modal('hide');
								$("#id-forgot-password").val("");
								$("#id-email-Id_forgot_password").val("");
								document.getElementById("id_check_userId").checked = false;
							}

						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("Server Exception in saving Merchant Details" );
						}
					});
					 
				 
					
				}}
			 
				else if(document.getElementById("id_check_password").checked ==true){
					var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					 if($("#id_userId_forgot_password").val()==""){
							toastr.warning("Please Enter UserId");
						}else if($("#id-email-Id_forgot_password").val()==""){
							toastr.warning("Please Enter email Id");
						} else if(regex.test($("#id-email-Id_forgot_password").val())==false){
							 toastr.warning("Please enter valid Email Id"); 
								
						 }else{ var userId=$("#id_userId_forgot_password").val();
						 var emailId=$("#id-email-Id_forgot_password").val();
							
						 $.ajax({
								type : 'POST',
								url : getContextPath()+"/merchant/forgotPassword",
								data : {userId:userId,emailId:emailId},
								dataType : "json",
								success : function(data) {
												if (data.status=='Success') {
										toastr.info(data.message);
										$("#id_userId_forgot_password").val("");
										$("#id-email-Id_forgot_password").val("");
										document.getElementById("id_check_password").checked=false;
										$("#id_forgot_password_modal").modal('hide');

									} else {
										toastr.error(data.message);
										$("#id_userId_forgot_password").val("");
										$("#id-email-Id_forgot_password").val("");
										document.getElementById("id_check_password").checked=false;
										$("#id_forgot_password_modal").modal('hide');
										
									}

								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert("Server Exception in saving Merchant Details" );
								}
							});
							 
						 }
				}
			
				
		 });
		 
	//-----------------------------------------------------------------------------------------------------//
		 
	$('input:radio[name="checkSelect"]').change( function(){
		if(document.getElementById("id_check_userId").checked == true){
			$("#id-email-Id_forgot_password").val("");
			$("#id_userId_forgot_password").val("");
			$("#id-forgot-password").val("");
			$("#id-email-Id_forgot_password").prop("readonly", false);
			$("#id_userId_forgot_password").prop("readonly", true);
			$("#id-forgot-password").prop("readonly", false);
			}

		else if(document.getElementById("id_check_password").checked == true){
		$("#id-email-Id_forgot_password").val("");
		$("#id_userId_forgot_password").val("");
		$("#id-forgot-password").val("");
		$("#id-email-Id_forgot_password").prop("readonly", false);
		$("#id_userId_forgot_password").prop("readonly", false);
		$("#id-forgot-password").prop("readonly",true);
		}
	
		});
	$("#id_btn_pick_egiftCard").click(function(){
		$("#id_form_purchaseCard").submit();
		/*
		pageFlag="1";
		if($("#id_hdn_loggeduser").val()==""){
			$("#id_preview_modal_purchase").modal("hide");
			toastr.warning("Please Login To Continue.....");
			$("#id_login_modal").modal("show");
		}else{
		$("#id_form_purchaseCard").submit();
		}
	*/});
	

	$("#id_btn_buy_checkout_modal").click(function(){
		window.location.href=getContextPath()+"/purchaseCard/myCart";
	});
	});
function removeProduct(itemNo){
	$.ajax({
		url : getContextPath() + "/purchaseCard/deleteCardCart",
		type : 'POST',
		data:{itemNo:itemNo},
		dataType : "json",
		success : function(data) {
			if(data.status=="success"){
				getProductListMyCart();
				toastr.success(data.message);
				
		}else{
			toastr.error(data.message);
		}
		},
								error : function() {
									alert("Exception in removeProduct" + errorThrown);
								}
							}); 
}

//--------------------------------------disableEnableFields------------------------//

function getProductListMyCart(){

	$('#id_table_item_purchase_summary_home').DataTable().destroy();
$.fn.dataTableExt.sErrMode = 'none';
cartTable=$('#id_table_item_purchase_summary_home').DataTable({
			  	"bProcessing": true,
		        "bDeferRender": true,
		        bAutoWidth: false,
		        bServerSide: true,
		        sAjaxSource : getContextPath()+"/purchaseCard/getAllProductList",
		        "iDisplayLength": 5,
		        "bLengthChange": false,
		       // "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
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
		                	$("#cart-badge").empty();
		                	$("#cart-badge").append(data.iTotalRecords);
		                	if($("#cart-badge").text()=="0"){
		                		$("#id_btn_buy_checkout_modal").prop("disabled",true);
		                	}else{
		                		$("#id_btn_buy_checkout_modal").prop("disabled",false);
		                	}
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

}

function changePasswordProgressBar(ev) {
    // less than 8 characters
    var wrost = 3,
        // minimum 8 characters
        bad = /(?=.{4,}).*/,
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