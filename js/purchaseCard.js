function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
var displayStart=0;
var displayLength=4;
var selectedImage;
var cartTablePurchase;
var contextPath = $('#app-context-path').val();

var globalData;

var modalFlag="";
$(document).ready(function() {
	$("#id_div_theme_image_loader").hide();
	$("#id_div_cart_image_loader").hide();
	$("#id_div_summary_image_loader").hide();
	$(".load-img-login").hide();
	
	$("#id_rad_login").click();
	
    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
	
	$(".amount_btn").click(function(){
		$("#id_pick_amount").attr("class","glyphicon glyphicon-ok");
		
		$("#id_a_tab_1").addClass('active');

	});
	
/*	$("#id_btn_add_to_cart").click(function(){
	
	});
	*/
	
	
	$("#id_btn_buy_checkout").click(function(){
		$("#id_form_checkOut_purchase").submit();
	});
	
	$(".pwd").first().on('keyup', changePasswordProgressBar);

	$("#gift_message").val("Happy Birthday,\nI thought you would like this gift!");
	
	if($("#id_hdn_loggeduser").val()!=""){
		$("#idTabCheckOut").css("pointer-events","");
		$("#id_div_pur_authentication").hide();
		getProductListMyCart();
		myCartList();
	}

	
	$('#horizontalTab').easyResponsiveTabs({
		type : 'default', //Types: default, vertical, accordion           
		width : 'auto', //auto or any width like 600px
		fit : true, // 100% fit in a container
		closed : 'accordion', // Start closed if in accordion view
		activate : function(event) { // Callback function if tab is switched
			var $tab = $(this);
			var $info = $('#tabInfo');
			var $name = $('span', $info);
			$name.text($tab.text());
			$info.show();
		}
	});
	
	$("#id_btn_add_to_cart").click(function() {
		
		$("#id_hdn_cart_friendNum").val($("#id_friend_number").val());
		var status="";
		if($("#id_hdn_loggeduser").val()!=""){
			status="logged";
		}else if($("#id_hdn_loggedUser_name_pur").val()!=""){
			status="logged";
		}
		
		if(status=="" && $('#id_rad_guest').is(':checked')==false) {
		var userId=$("#id_pur_user_id_login").val();
		var password=$("#id_pur_pwd_login").val();
		var groupId="2";
		
		if(userId=="" && password==""){
			toastr.warning("Please Login to continue");
		}
		else if(userId!="" && password==""){
			toastr.warning("Please Enter Password");
		}else if(password!="" && userId==""){
			toastr.warning("Please Enter User Id");
		}else{
		 $.ajax({
				url : contextPath + "/user/loginFromPurchasing",
				type : 'POST',
				data:{userId:userId,password:password,groupId:groupId},
				dataType : "json",
				success : function(data) {
					
					if(data.status=="success"){
						$("#choose_delivery_id").attr("class","glyphicon glyphicon-ok");
						$("#choose-delivery").addClass('active');
						getProductListMyCart();
						$("#idTabCheckOut").css("pointer-events","");
						$("#id_btn_login_dropdown").html(data.userName+" "+"<i class='fa fa-caret-down'></i>");
						$("#id_btn_login_dropdown").attr("data-toggle","dropdown");
						$("#id_hdn_loggedUser_name_pur").val(data.userName);
						toastr.info(data.message);
						$("#id_div_pur_authentication").hide();
						addToCart();
					}else{
						toastr.warning(data.message);
					}
				},
										error : function() {
											alert("Exception in consumer login" + errorThrown);
										}
									}); 
	}
	}else{
		addToCart();
	}
		
	
	
	});
	
	$(".button-back").hide();
	$(".button-next").hide();
	$("#id_rad_guest").click(function() {
	});
	$(document).on(
			'click',
			'.browse',
			function() {
				var file = $(this).parent().parent()
						.parent().find('.file');
				file.trigger('click');
			});
	$(document).on(
			'change',
			'.file',
			function() {
				$(this).parent().find('.form-control').val(
						$(this).val().replace(
								/C:\\fakepath\\/i, ''));
			});
	
	
$("#id_get_previous_theme").prop("disabled",true);
	
/*	$("#id_get_previous_theme").click(function(){
		if(displayStart!=0){
		if((displayStart-4)>=0){
			$("#id_get_next_theme").prop("disabled",false);
			displayStart=displayStart-4;
			getImagesByTHemeIdAndMerchantId($("#id_hdn_theme_ID").val(),"");	
		}
		}
		
	});

	$("#id_get_next_theme").click(function(){
		$("#id_get_previous_theme").prop("disabled",false);
		displayStart=displayStart+4;
		getImagesByTHemeIdAndMerchantId($("#id_hdn_theme_ID").val(),"");
	});
	*/
	
	$("#id_btn_previous").prop("disabled",true);
	
	$("#id_btn_previous").click(function(){
		if(displayStart!=0){
		if((displayStart-1)>=0){
			$("#id_btn_next").prop("disabled",false);
			displayStart=displayStart-4;
			getImagesByTHemeIdAndMerchantId($("#id_hdn_theme_ID").val(),"next");	
		}
		}
		
	});

	$("#id_btn_next").click(function(){
		$("#id_btn_previous").prop("disabled",false);
		displayStart=displayStart+4;
		getImagesByTHemeIdAndMerchantId($("#id_hdn_theme_ID").val(),"next");
	});
	getAllThemes();

/*-----------------------------------------image merge------------------------------------------------------------------*/
	$("#id_upload_image_to_merge").click(function(){
		  var reqData = new FormData();
		  var publicKey = $("#chooseFile").prop("files")[0];  
		  var imgUrl=$("#id_hdn_loggedUser_image_pur").val();
		  var message=$("#gift_message").val();
	    if(null!=reqData && typeof reqData!='undefined'){
		   reqData.append("publicKey", publicKey);  
		   reqData.append("name","Akshay");
		   reqData.append("img",imgUrl);
		   reqData.append("message",message);
	     	$.ajax({
	            url: contextPath+"/purchaseCard/mergeImages",
	    		type : 'POST',
	       	 	dataType : "text",
	       	 	contentType : false,
	       	 	processData: false,
	 	         data : reqData,
		        enctype: 'multipart/form-data',
		             success: function(data) {
		            var obj=	 JSON.parse(data);
		            	 document.getElementById("profilePictureModal").src ="data:image/png;base64,"+obj.mergedImage;
		            	 $("#id_hdn_mergedImageUrl").val(obj.mergedImagePath);
		             },
		             error: function() {
		                 toastr.warning("Please provide valid public key certificate");
		             }
		         });
		   
		  }else{
			  toastr.warning("Please select public key certificate for Validate");
		  }
		  
		 });	
	
	
/*-----------------------------------------------------------------------------------------------------------------------------*/	

	
	//------------------------ tab click -------------------------
	 $(".next-step").click(function (e) {
    	 var $active = $('li.active');
		    $active.next().removeClass('disabled');
		    nextTab($active);
    });
	
	 $(".prev-step").click(function (e) {
	        var $active = $('li.active');
	        prevTab($active);
	    });
	
	 //Initialize tooltips
	 $('.nav-tabs > li a[title]').tooltip();
 
	 //Wizard
	 $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		
		 var $target = $(e.target);
		 if ($target.parent().hasClass('disabled')) {
         return false;
		 }
	 });
//-------------------------------------------------------------------------
 /*
	 $("#id_list_tab_1 > a").click(function(){
		 alert(1)
	 });*/
	 
	 
	 /*-------------------------- cart list table ----------------------------------*/
	
	 /*-----------------------------------------------------------------------------*/
		
		$("#id_btn_proceed_to_checkout").click(function (){
			var status="";
			if($("#id_hdn_loggeduser").val()!=""){
				status="logged";
				
			}
			else if($("#id_hdn_loggedUser_name_pur").val()!=""){
				status="logged";
			}
			if($('#id_rad_guest').is(':checked')) {
				$("#idTabCheckOut").css("pointer-events","");
				$("#idTabCheckOut").click();
				$("#id_list_tab_4").addClass("active");
				$("#id_list_tab_4").removeClass("disabled");
				$("#page4-id").click();
				//$("#chechout_id").attr("class","glyphicon glyphicon-ok");
				//$("#idTabCheckOut").addClass('active');
				}
			else if(status==""){
				//toastr.warning("Please Login to continue");
				var userId=$("#id_pur_user_id_login").val();
				var password=$("#id_pur_pwd_login").val();
				var groupId="2";
				
				if(userId=="" && password==""){
					toastr.warning("Please Login to continue");
				}
				else if(userId!="" && password==""){
					toastr.warning("Please Enter Password");
				}else if(password!="" && userId==""){
					toastr.warning("Please Enter User Id");
				}else{
			 $.ajax({
					url : contextPath + "/user/loginFromPurchasing",
					type : 'POST',
					data:{userId:userId,password:password,groupId:groupId},
					dataType : "json",
					success : function(data) {
						
						if(data.status=="success"){
							$("#chechout_id").attr("class","glyphicon glyphicon-ok");
							$("#idTabCheckOut").addClass('active');
							getProductListMyCart();
							myCartList();
							$("#idTabCheckOut").css("pointer-events","");
							$("#idTabCheckOut").click();
							$("#id_btn_login_dropdown").html(data.userName+" "+"<i class='fa fa-caret-down'></i>");
							$("#id_btn_login_dropdown").attr("data-toggle","dropdown");
							$("#id_hdn_loggedUser_name_pur").val(data.userName);
							toastr.info(data.message);
							$("#id_div_pur_authentication").hide();
							
							if($("#cart-badge").text()=="0"){
								$("#idTabCheckOut").css("pointer-events","none");	
								$("#idTabCheckOut").removeClass("active");
								$("#idTabCheckOut").addClass("disabled");
								toastr.warning("No items in cart.Please add an item to cart");
							}else{
								$("#idTabCheckOut").css("pointer-events","");	
								$("#idTabCheckOut").removeClass("disabled");
								$("#id_list_tab_4").removeClass("disabled");
								$("#page4-id").click();
								$("#idTabCheckOut").click();
							}
						}else{
							toastr.warning(data.message);
						}
					},
											error : function() {
												alert("Exception in consumer login" + errorThrown);
											}
										}); 
		}
		}else{
			if($("#cart-badge").text()=="0"){
				$("#idTabCheckOut").css("pointer-events","none");	
				$("#idTabCheckOut").removeClass("active");
				$("#idTabCheckOut").addClass("disabled");
				toastr.warning("No items in cart.Please add an item to cart");
			}else{
				$("#idTabCheckOut").css("pointer-events","");	
				$("#idTabCheckOut").removeClass("disabled");
				$("#id_list_tab_4").removeClass("disabled");
				$("#page4-id").click();
				$("#idTabCheckOut").click();
			}
			/*$("#idTabCheckOut").click();
			$("#id_list_tab_4").removeClass("disabled");
			$("#page4-id").click();*/
		}
			/*if(status!=""){
			$("#id_list_tab_4").removeClass("disabled");
			$("#page4-id").click();
			}else{
				toastr.warning("Please Login to continue");
			}*/
		});
		
		$(".continueShopping").click(function(){
			$("#page1-id").click();
		});
		
		$("#id_btn_checkout_div_cart").click(function(){
			if($('#id_rad_guest').is(':checked')) {
				var guest=$("#id_guest_mobile_no").val();
				window.location.href=getContextPath()+"/home/redirectToCheckOut?guest="+guest;
				}else{
					window.location.href=getContextPath()+"/purchaseCard/checkOut";		
				}
			
		});
		$("#id_btn_continueShopping").click(function(){
			$("#id_a_tab_1").click();
			$("#id_pick_amount").removeAttr("class","glyphicon glyphicon-ok");

			$("#id-personal_message").removeAttr("class","glyphicon glyphicon-ok");
			$("#personal_message").removeClass('active');

			$("#id-personal_message").removeAttr("class","glyphicon glyphicon-ok");
			$("#personal_message").removeClass('active');
			
			$("#choose_delivery_id").removeAttr("class","glyphicon glyphicon-ok");
			$("#choose-delivery").removeClass('active');
			$("#chechout_id").removeAttr("class","glyphicon glyphicon-ok");
			$("#idTabCheckOut").removeClass('active');
		
		
			
		});
		
	
});

///-------------------------------------tab click-------------------------
function nextTab(elem) {
  $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
  $(elem).prev().find('a[data-toggle="tab"]').click();
}
//-------------------------------------------------------------------------

$("#chooseFile")
.click(
		function() {
			var stats = true;
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
		});

function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function(e) {
	$('#profilePictureModal').attr('src', e.target.result).width(258)
			.height(160);
};
reader.readAsDataURL(input.files[0]);
}
}
function onclickid4(value) {
	var guest = '<div class="row"><div class="col-md-12"><div class="col-md-6"><i class="fa fa-user-o" aria-hidden="true"></i></i><label for="">Mobile Number</label><input class="form-control" type="text" name="mobileNo" id="id_guest_mobile_no" onblur="checkDuplicateMobileNumber()" /></div><div class="col-md-6"><i class="fa fa-envelope" aria-hidden="true"></i><label for="">Your Email</label> <input class="form-control" type="text" name="emaild" id="id_guest_email"/></div></div></div>';
	var signup = '<div class="row"><form id="id_form_pur_register_consumer"><div class="col-md-12"><div class="row"><div class="col-md-12"><div class="col-md-4"><i class="fa fa-user-o" aria-hidden="true"></i><label for="id_txt_userName_signup_pur">Your Name </label><input class="form-control form_padng"id="id_txt_userName_signup_pur" type="text" name="userName" /></div><div class="col-md-4"><i class="fa fa-mobile" aria-hidden="true"></i> <label for="id_txt_userId_signup_pur">Mobile Number</label><input class="form-control form_padng" id="id_txt_userId_signup_pur"onclick="passwordverify()"type="text" name="userId" /></div><div class="col-md-4"><i class="fa fa-envelope" aria-hidden="true"></i><label for="id_txt_emailId_signup_pur">Your Email</label> <input class="form-control form_padng" type="text"id="id_txt_emailId_signup_pur" name="emaild" /></div></div></div><br><div class="row"><div class="col-md-12"><div class="col-md-4"><i class="fa fa-lock" aria-hidden="true"></i> <label for="id_txt_pwd_signup_pur">Your Password</label><input class="form-control form_padng" id="id_txt_pwd_signup_pur"type="password" name="password" /></div><div class="col-md-4"><i class="fa fa-lock" aria-hidden="true"></i> <label for="id_txt_cnfpwd_signup_pur">Confirm Password</label><input class="form-control form_padng" id="id_txt_cnfpwd_signup_pur"type="password" name="Confirm_Password" /></div><div class="col-md-4"><button type="button" class="btn btn-success page_margn_1" id="id_register_btn_purchase" onclick="registerConsumer()">Register</button></div></div></div></div></div>';
	var login = '<div class="row"><div class="col-md-12"><div class="col-md-6"><i class="fa fa-mobile" aria-hidden="true"></i> <label for="label_Treatment-id">Your Mobile Number </label> <input class="form-control form_padng" type="text" name="userId" id="id_pur_user_id_login" /></div><div class="col-md-6"><i class="fa fa-lock" aria-hidden="true"></i> <label for="label_Treatment-id">Password</label> <input class="form-control form_padng" type="password" name="password" id="id_pur_pwd_login" /></div></div></div>';
	if (value == 'signup') {
		$("#panel-body1_id").empty();
		$("#panel-body1_id").append(signup);
	} else if (value == 'login') {
		$("#panel-body1_id").empty();
		$("#panel-body1_id").append(login);
	} else if (value == 'guest') {
		$("#panel-body1_id").empty();
		$("#panel-body1_id").append(guest);
	} 

}



/*function getAllThemes1(){
	var merchantId=$("#id_hdn_merchant_ID").val();
	$.ajax({
		url : getContextPath() + "/purchaseCard/getAllThemesByMerchantId",
		type : 'POST',
		data:{merchantId:merchantId},
		dataType : "json",
		success : function(data) {
			$("#id_ul_list_of_all_different_themes").empty();
			for(var i in data){
				if(i==0){
					getImagesByTHemeIdAndMerchantId(data[i].themeId,data[i].themeNames);
				$("#id_ul_list_of_all_different_themes").append('<li><label><input type="radio" value="'+data[i].themeNames+'" checked="checked" onclick="getImagesByTHemeIdAndMerchantId(\''+data[i].themeId+'\',\''+data[i].themeNames+'\')" name="themes">'+data[i].themeNames+'</label></li>');
				}else{
					$("#id_ul_list_of_all_different_themes").append('<li><label><input type="radio" value="'+data[i].themeNames+'" onclick="getImagesByTHemeIdAndMerchantId(\''+data[i].themeId+'\',\''+data[i].themeNames+'\')" name="themes">'+data[i].themeNames+'</label></li>');
				}
			}
		},
								error : function() {
									alert("Exception in getAllThemes" + errorThrown);
								}
							}); 
}*/

function getAllThemes(){
	var merchantId=$("#id_hdn_merchant_ID").val();
	$("#id_div_theme_image_loader").show();
	$.ajax({
		url : getContextPath() + "/purchaseCard/getAllThemesByMerchantId",
		type : 'POST',
		data:{merchantId:merchantId},
		dataType : "json",
		success : function(data) {
			$("#id_div_theme_image_loader").hide();
			var buttonArr=[];
			$("#id_div_themes_all").empty();
			for(var i in data){
				if(i==0){
					getImagesByTHemeIdAndMerchantId(data[i].themeId,data[i].themeNames);
				$("#id_hdn_theme_ID").val(data[0].themeId);

				$("#id_div_themes_all").append('<button type="button" class="btn btn-info check purchs_btn active_btn" onclick="getImagesByTHemeIdAndMerchantId(\''+data[i].themeId+'\',this)">'+data[i].themeNames+'</button>');

			}else{
				if(i<7){
				$("#id_div_themes_all").append('<button type="button" class="btn btn-info check purchs_btn" onclick="getImagesByTHemeIdAndMerchantId(\''+data[i].themeId+'\',this)">'+data[i].themeNames+'</button>');
				}else{
					buttonArr.push('<button type="button" class="btn btn-info check purchs_btn" onclick="getImagesByTHemeIdAndMerchantId(\''+data[i].themeId+'\',this)">'+data[i].themeNames+'</button>');
				}
			}
			}
			if(buttonArr.length>0){
				$("#id_div_themes_all").append('<button type="button" class="btn btn-info check purchs_btn"onclick="toggleDiv(this)" id="id_btn_more_brands">More</button>');
			var divVal="";
				for(var i in buttonArr){
				if(buttonArr.length==1){
					$("#hides-show-id").empty();
					divVal=divVal+'<div class="row"><div class="col-sm-11 btn_mgn">'+buttonArr[i];
					divVal=divVal+'</div><div class="col-sm-1">&nbsp;</div></div>';
				}else {
					if(i==0){
					$("#hides-show-id").empty();
					divVal=divVal+'<div class="row"><div class="col-sm-11 btn_mgn">'+buttonArr[i];
				}else{
					if(i%8!=0){
						divVal=divVal+buttonArr[i];
						if(i==buttonArr.length){
							divVal=divVal+'</div></div>';
						}
					}else{
						divVal=divVal+'</div></div>';
					}
				}
			}
			}
				$("#hides-show-id").append(divVal)	;
			}
			//getImagesByTHemeIdAndMerchantId($("#id_hdn_theme_ID").val(),"");
		},
								error : function() {
									alert("Exception in getAllThemes" + errorThrown);
								}
							}); 
}
function getImagesByTHemeIdAndMerchantId(themeId,themeName){
	$('.check').removeClass("active_btn");	
	$(themeName).addClass("active_btn");
	
	if(themeName!="next"){
		displayStart=0;
	}
	
/*	if($("#id_div_themes_all").hasClass('btn btn-info check')){
        $("#id_div_themes_all").removeClass('btn btn-info check')
    } else {
        $("#id_div_themes_all").addClass('btn active_btn check')
    }*/
	$("#id_hdn_theme_ID").val(themeId);
	var merchantId=$("#id_hdn_merchant_ID").val();
	if(themeName!="")
	$("#id_li_category_0").text(themeName);
	$.ajax({
		url : getContextPath() + "/purchaseCard/getAllImagesByMerchantIdAndThemeId",
		type : 'POST',
		data:{merchantId:merchantId,themeId:themeId,displayStart:displayStart,displayLength:displayLength},
		dataType : "json",
		success : function(data) {
			if(data.length>0){
			$("#id_img_hover_preview").attr("src",data[0].designUrl);
			var img=getContextPath()+"/"+data[0].designUrl;
			$("#id_div_preview_image_for_display").css("background", 'url("'+img+'")');
			$("#id_div_preview_image_for_display").css("background-size", '100% 100%');
			
			$("#id_div_carousel_images").empty();
			$("#id_div_carousel_images").append('<div class="item  active"><div class="row">');

			$("#products").empty();
			globalData=data;
			for(var j in data){
				
				if(j==0){
					setClickImageDiv("",data[0].cardThemeId,data[0].cardType,data[0].cardCategory,j);
				}
				
				//'<div class="item  active">'+
				//'<div class="row">'+
				var carouselDiv='<div class="col-md-3">'+
						'<a class="thumbnail"><img alt=""'+
						'onclick="setClickImageDiv(this,\''+data[j].cardThemeId+'\',\''+data[j].cardType+'\',\''+data[j].cardCategory+'\',\''+j+'\')" src="'+getContextPath()+"/"+data[j].designUrl+'" alt="" ></a>'+
					'</div>';
				//'</div>'+
			//'</div>';
				
				$("#id_div_carousel_images").append(carouselDiv);
				
				var themeImage='<div class="item  col-xs-12 col-lg-4 col-md-4">'+
		            '<div class="thumbnail img_thumb">'+
		                '<img class="group list-group-image img-responsive"onclick="setClickImageDiv(this,\''+data[j].cardThemeId+'\',\''+data[j].cardType+'\',\''+data[j].cardCategory+'\',\''+j+'\')" src="'+getContextPath()+"/"+data[j].designUrl+'" alt="" />'+            
		            '</div>'+
		        '</div>';
				$("#products").append(themeImage);
			}
			$("#id_div_carousel_images").append('</div></div>');
		}else{
			$("#products").empty();
			$("#products").append('<p> No Themes Available</p>');
		}
		},
								error : function() {
									alert("Exception in getAllThemes" + errorThrown);
								}
							}); 
}
/*
function getImagesByTHemeIdAndMerchantId1(themeId,obj){
	if(obj!=""){
		$(".check").removeClass("active_btn");
		$(".check").addClass("btn-info");
		$(obj).removeClass("btn-info");
		$(obj).addClass("active_btn");
		 displayStart=0;
		 displayLength=4;
		 $("#id_btn_next").prop("disabled",false);
	}
	
	$("#id_hdn_theme_ID").val(themeId);
	var merchantId=$("#id_hdn_merchant_ID").val();
	
	$.ajax({
		url : getContextPath() + "/purchaseCard/getAllImagesByMerchantIdAndThemeId",
		type : 'POST',
		data:{merchantId:merchantId,themeId:themeId,displayStart:displayStart,displayLength:displayLength},
		dataType : "json",
		success : function(data) {
			if(data.length>0){
			$("#id_img_hover_preview").attr("src",data[0].designUrl);
			$("#id_div_carousel_images").empty();
			$("#id_div_carousel_images").append('<div class="item"><div class="row">');
			globalData=data;
			for(var j in data){
				$("#id_div_carousel_images").append('<div class="col-md-3"><a class="thumbnail"><img alt=""class="imgDesign" onmouseout="setSelectedImage()" onclick="setClickImage(this,\''+data[j].cardThemeId+'\',\''+data[j].cardType+'\',\''+data[j].cardCategory+'\',\''+j+'\')" onmouseover="setHoverImage(this)" style="width:130px;height:113px;" src="'+getContextPath()+"/"+data[j].designUrl+'"></a></div>');
			}
			$("#id_div_carousel_images").append('</div></div>');
		}else{
			displayStart=displayStart-4;
			$("#id_btn_next").prop("disabled",true);
		}
		},
								error : function() {
									alert("Exception in getAllThemes" + errorThrown);
								}
							}); 
}
*/
function checkData(){
	if($("#id_friend_name_details").val()!=""&&$("#id_friend_email_details").val()!=""&&$("#id_friend_number").val()!=""){
	//	alert("haii");
		$("#id-personal_message").attr("class","glyphicon glyphicon-ok");
		$("#personal_message").addClass('active');	
	}
	else{
		///alert("hello");
		$("#id-personal_message").removeAttr("class","glyphicon glyphicon-ok");
		$("#personal_message").removeClass('active');		
	}
}
function toggleDiv(obj){
	if($(obj).text()=="More"){
		$(obj).text("Less");
	}else{
		$(obj).text("More");
	}
	$("#hides-show-id").slideToggle(1);
}
function setHoverImage(obj){
	var image=$(obj).attr("src");
	$("#id_img_hover_preview").attr("src",image);
}

function setClickImage(obj,themeId,cardType,cardCat,index){
	var image=$(obj).attr("src");
	selectedImage=$(obj).attr("src");
	$("#id_img_hover_preview").attr("src",image);
	$("#id_hdn_cart_cardThemeId").val(themeId);
	$("#id_hdn_cart_cardType").val(cardType);
	$("#id_hdn_theme_Cat").val(cardCat);
	$("#id_hdn_loggedUser_image_pur").val(globalData[index].designUrlEng);
	console.log("theme id=="+themeId)
	console.log("cardType=="+cardType)
	console.log("cardCat=="+cardCat)
}

function setClickImageDiv(obj,themeId,cardType,cardCat,index){
	if(obj!=""){
	var image=$(obj).attr("src");
	$("#id_div_preview_image_for_display").css("background", 'url("'+image+'")');
	$("#id_div_preview_image_for_display").css("background-size", '100% 100%');
	selectedImage=$(obj).attr("src");
	}
	$("#id_selected_image_tag").attr("src",getContextPath()+"/"+globalData[index].designUrl);
	$("#id_img_hover_preview").attr("src",image);
	$("#id_hdn_cart_cardThemeId").val(themeId);
	$("#id_hdn_cart_cardType").val(cardType);
	$("#id_hdn_theme_Cat").val(cardCat);
	$("#id_hdn_loggedUser_image_pur").val(globalData[index].designUrlEng);
	console.log("theme id=="+themeId)
	console.log("cardType=="+cardType)
	console.log("cardCat=="+cardCat)
}

function setSelectedImage(){
	$("#id_img_hover_preview").attr("src",selectedImage);
}

function onchangeHangle() {
	$("#panel-body_id").slideToggle("slow");
}
function onchangeHangle1() {
	$("#pnel-body_id").slideToggle("slow");
}

function onclickid() {
	$("#menutab-id").removeClass('hidediv');
}

function onclickid1() {
	$("#button-idd").removeClass('hidediv1');//second tab

}
function onclickid2() {
	$("#button-id").hide();
	$("#button-id").addClass('hidediv');

}
function onclickid3() { //second tab
	$("#id-test").hide();
	$("#button-idd").addClass('hidediv1');

}

function setAmount(currentObj){
	$("#id_p_amount_for_image_tag").text("");
	$("#id_p_amount_for_image_tag").text("SAR "+$(currentObj).text());
	$("#id_set_custom_amount").val("");
	$("#id_hdn_cardValue").val($(currentObj).text());
	console.log("amount=="+$(currentObj).text())

	

}

function registerConsumer(){
    best = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{8,}$/;
	var str=$("#id_txt_pwd_signup_pur").val();
    if(!best.test(str)) {
		toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
    }else if($("#id_txt_userId_signup_pur").val()==""){
		toastr.warning("Please Enter Mobile Number");
	}else if($("#id_txt_userName_signup_pur").val()==""){
		toastr.warning("Please Enter Full Name");
	}else if($("#id_txt_emailId_signup_pur").val()==""){
		toastr.warning("Please Enter Email ID");
	}else if($("#id_txt_pwd_signup_pur").val()==""){
		toastr.warning("Please Enter the Password");
	}else if($("#id_txt_cnfpwd_signup_pur").val()==""){
		toastr.warning("Please Enter Confirm Password");
	}else if($("#password-progress-bar").html()=="POOR"){
		toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
	}else if($("#password-progress-bar").html()=="WEAK"){
		toastr.warning("Password Contains: *one letter should be capital, *at least minimum eight letters, *one special character, *Must contains one number.");
	}
	else{
		if($("#id_txt_pwd_signup_pur").val()!=$("#id_txt_cnfpwd_signup_pur").val()){
			toastr.warning("Password and Confirm Password Should Be Same");
		}else
	 $.ajax({
			url : contextPath + "/consumer/registerConsumer",
			type : 'POST',
			data:$("#id_form_pur_register_consumer").serialize(),
			dataType : "json",
			success : function(data) {
				if(data.status=="success"){
					$('#id_form_pur_register_consumer')[0].reset();
					toastr.info(data.message);
				}else{
					toastr.warning(data.message);
				}
			},
									error : function() {
										alert("Exception in registerConsumer" + errorThrown);
									}
								}); 
	}

}

function addToCart(){
	var productImage="";
	var cardValue="";
	var merchantId=$("#id_hdn_merchant_ID").val();
	var themeId=$("#id_hdn_cart_cardThemeId").val();
	var cardType=$("#id_hdn_cart_cardType").val();
	var friendNo=$("#id_hdn_cart_friendNum").val();
	var cardCat=$("#id_hdn_theme_Cat").val();
	var friendName="";
	var guest="";
	
	if($('#id_rad_guest').is(':checked')) {
		guest=$("#id_guest_mobile_no").val();
		friendName=$("#id_friend_name_details").val();
	}
	
	
	if($("#id_set_custom_amount").val()==""){
		cardValue=$("#id_hdn_cardValue").val();
	}else{
		cardValue=$("#id_set_custom_amount").val();
	}
	
	if($("#profilePictureModal").attr("src")!=""){
		 productImage=$("#id_hdn_loggedUser_image_pur").val();
	}else{
		productImage=$("#id_hdn_mergedImageUrl").val();
	}
	
	if(cardValue==""){
		toastr.warning("Please Select Card Amount");
	}else if(themeId=="" || cardType==""){
		toastr.warning("Please Select An Image");
	}else if($("#id_friend_name_details").val()==""){
		toastr.warning("Please Enter Friend Name");
	}else if($("#id_friend_email_details").val()==""){
		toastr.warning("Please Enter Friend Email");
	}else if($("#id_friend_number").val()==""){
		toastr.warning("Please Enter Friend Mobile Number");
	}else{
	$.ajax({
		url : getContextPath() + "/purchaseCard/saveCardCart",
		type : 'POST',
		data:{cardValue:cardValue,themeId:themeId,cardType:cardType,merchantId:merchantId,productImage:productImage,friendNo:friendNo,cardCat:cardCat,guest:guest,friendName:friendName},
		dataType : "json",
		success : function(data) {
			
			if(data.status=="success"){
				toastr.success(data.message);
				/*$("#id_hdn_cardValue").val("");
				$("#id_set_custom_amount").val("");
				$("#id_hdn_cart_cardThemeId").val("");
				$("#id_hdn_loggedUser_image_pur").val("");*/
		/*		var purchaseSummaryArray=[];
				purchaseSummaryArray.push([data.itemNumber,data.giftCardName,data.deliveryDate,data.giftValue,data.serviceFee,data.totalCharge]);*/
				$("#id_hdn_totalCharge").val(data.totalCharge);
				$("#id_hdn_cardValue").val(data.giftValue);
				$("#id_hdn_checkout_merchantID").val(data.itemNumber);
				myCartList();
				getProductListMyCart();
		}else{
			toastr.error(data.message);
		}
		},
								error : function() {
									alert("Exception in checkout" + errorThrown);
								}
							}); 
	
}
}

function cartList(){
	$('#id_table_item_purchase_summary').DataTable().destroy();
$.fn.dataTableExt.sErrMode = 'none';
cartTablePurchase=$('#id_table_item_purchase_summary').DataTable({
			  	"bProcessing": true,
		        "bDeferRender": true,
		        bAutoWidth: false,
		        bServerSide: true,
		        sAjaxSource : contextPath+"/purchaseCard/getAllProductList",
		        "iDisplayLength": 5,
		        "aLengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
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
		                     fnCallback(data);
		                     $("#cart-badge").empty();
		                     $("#cart-badge").append(data.iTotalRecords);
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

function myCartList(){
	$("#id_div_cart_image_loader").show();
	$("#id_div_summary_image_loader").show();
	$.ajax({
		url : getContextPath() + "/purchaseCard/getAllCartList",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_div_cart_image_loader").hide();
			$("#id_div_summary_image_loader").hide();
			$("#id_my_cart_panel").empty();
			$("#id_div_summary_cart").empty();
			
			if(data.length==0){
				$("#id_btn_checkout_div_cart").prop("disabled",true);
			}else{
				$("#id_btn_checkout_div_cart").prop("disabled",false);
			}
			
			for(var i in data){
			var myCartDiv='<div class="row"><div class="col-xs-3"><img style="height: 65px; width: 100px;" src="data:image/png;base64,'+data[i].productImage+'">'+
				'</div>'+
				'<div class="col-xs-6">'+
					'<p class="product-name"><strong>'+data[i].giftCardName+'</strong></p>'+
					'<p class="product-name-sm"><small><b>Delivery: '+data[i].deliveryDate+'</b></small></p>'+
					'<p class="product-name-sm"><small><b>Card Value: '+data[i].giftValue+'</b></small></p>'+
					'<p class="product-name-sm"><small><b>Service Charge: '+data[i].serviceFee+'</b></small></p>'+
				'</div>'+
				'<div class="col-xs-3">'+
					'<div class="col-xs-6 text-right">'+
						'<h6><strong class="red-cart">'+data[i].totalCharge+'</strong></h6>'+
					'</div><br>'+
					'<div class="col-xs-6 text-right">'+data[i].removeProduct+
				'</div>'+
				'</div>'+
				'</div></div><br>';
			var summaryDiv='<div class="right-black-span">'+
			'<span class="pull-left">'+data[i].giftCardName+'</span><span class="pull-right">'+data[i].totalCharge+'</span>'+
			'</div>';
			
			
			
			$("#id_my_cart_panel").append(myCartDiv);
			$("#id_div_summary_cart").append(summaryDiv);
			if(i==(data.length-1)){
				$("#id_label_total_amount").text(data[i].totalAmount);
				
				var checkoutSummaryDiv='<div class="right-black-span">'+
				'<span class="pull-left total">TOTAL</span><span class="pull-right total">'+data[i].totalAmount+'</span>'+
			'</div>'+
			'<a href="#"><div type="button" class="total-check" onclick="proceedToCheckOutPage()">'+
							'Checkout'+
						'</div></a>';
				$("#id_div_summary_cart").append(checkoutSummaryDiv);
				
			}
			}
		},
								error : function() {
									alert("Exception in removeProduct" + errorThrown);
								}
							}); 	
}


function removeProductList(itemNo){
	$.ajax({
		url : getContextPath() + "/purchaseCard/deleteCardCart",
		type : 'POST',
		data:{itemNo:itemNo},
		dataType : "json",
		success : function(data) {
			if(data.status=="success"){
				toastr.success(data.message);
				getProductListMyCart();
				myCartList();
				$("#id_label_total_amount").empty();
		}else{
			toastr.error(data.message);
		}
		},
								error : function() {
									alert("Exception in removeProduct" + errorThrown);
								}
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
function proceedToCheckOutPage(){
	if($('#id_rad_guest').is(':checked')) {
		var guest=$("#id_guest_mobile_no").val();
		window.location.href=getContextPath()+"/home/redirectToCheckOut?guest="+guest;
		}else{
			window.location.href=getContextPath()+"/purchaseCard/checkOut";		
		}
}

function checkDuplicateMobileNumber(){
	var mobileNo=$("#id_guest_mobile_no").val();
if(mobileNo!=""){
	$.ajax({
			url : contextPath + "/home/checkDuplicateMobileNumber",
			type : 'POST',
			data:{mobileNo:mobileNo},
			dataType : "json",
			success : function(data) {
				if(data.status=="found"){
					$("#id_guest_mobile_no").val("");
					$("#id_rad_login").click();
					toastr.warning(data.message);
				}
			},
									error : function() {
										alert("Exception in checkDuplicateMobileNumber" + errorThrown);
									}
								}); 
}
}