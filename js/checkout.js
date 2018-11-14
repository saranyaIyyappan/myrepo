function openCity(evt, cityName) {
				// Declare all variables
				var i, tabcontent, tablinks;

				// Get all elements with class="tabcontent" and hide them
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}

				// Get all elements with class="tablinks" and remove the class "active"
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}

				// Show the current tab, and add an "active" class to the button that opened the tab
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}
var contextPath = $('#app-context-path').val();

$(document).ready(function() {
	getExpiryYear();
	getAllCardId();
	//getAllCartList();
	getAllBankDetails();
	$("#id_pay_btn_from_credit_card").click(function (){
		$("#id_hdn_paymentMode").val("credit");
		calculateTotalAmount();
	});
	
	$("#id_pay_btn_from_giftcard").click(function (){
		$("#id_hdn_paymentMode").val("giftcard");
		calculateTotalAmount();
	});
	
	$("#id_pay_checkout_btn").click(function(){
		if($("#id_txt_cr_dr_card_number").val()!=""){
		payment();
		}else{
			toastr.warning("Please Enter Card Number to continue");
		}
	});
	getCheckoutDetails();
});

function getTotalCharge(){

	var cardValue=$("#id_hdn_cardValue").val();
	var cardType=$("#id_hdn_cardType").val();
	var paymentMode="giftcard";
$.ajax({
url :contextPath+ "/purchaseCard/calculateTotalCharge",
type : 'POST',
data:{cardValue:cardValue,cardType:cardType,paymentMode:paymentMode},
dataType : "json",
success : function(data) {
$("#id_amount_wish_to_pay").val(data.totalCharge);
$("#id_hdn_activation_date").val(moment().format("YYYY-MM-DD"));
},
				error : function() {
					alert("Exception in checkout" + errorThrown);
				}
			}); 
}

function calculateTotalAmount(){

/*		var cardValue=$("#id_hdn_cardValue").val();
		var cardType=$("#id_hdn_cardType").val();
		var paymentMode=$("#id_hdn_paymentMode").val();
$.ajax({
url :contextPath+ "/purchaseCard/calculateTotalCharge",
type : 'POST',
data:{cardValue:cardValue,cardType:cardType,paymentMode:paymentMode},
dataType : "json",
success : function(data) {
$("#id_txt_totalCharge").val(data.totalCharge);
$("#id_amount_wish_to_pay").val(data.totalCharge);
$("#id_hdn_activation_date").val(moment().add(1, 'days').format("YYYY-MM-DD"));
$("#id_modal_checkout").modal("show");
},
					error : function() {
						alert("Exception in checkout" + errorThrown);
					}
				}); */
}


function payment(){
	var cards="";
	var paymentMode=0;
	var friendNum=$("#id_hdn_friendNum").val();
	
	$.ajax({
		url :contextPath+ "/cardDetails/createCardForFriendWeb",
		type : 'POST',
		data:$("#id_form_checkout_card_purchase").serialize()+"&cards="+cards+"&friendNum="+friendNum+"&paymentMode="+paymentMode,
		dataType : "json",
		success : function(data) {
			
			if(data.status=="Success"){
				toastr.success(data.message+". Redirecting To Home Page.......");
				setTimeout(function() {
					window.location.href =contextPath+"/user/home";
				         }, 3000);
			}else{
				toastr.error(data.message);
			}
		},
								error : function() {
									alert("Exception in checkout" + errorThrown);
								}
							}); 

}

function payment(){
	var crDrCardNumber=$("#id_txt_cr_dr_card_number").val();
	$("#id_modal_checkout").modal("hide");
	var paymentMode=$("#id_hdn_paymentMode").val();
	var totalCharge=$("#id_txt_totalCharge").val();
	var cardId="";
if(paymentMode=="giftcard"){
	cardId=$("#id_select_card_ID").val();
}
	var imagePath=$("#id_hdn_mergedImageUrl").val();
	
	$.ajax({
		url :contextPath+ "/purchaseCard/paymentCard",
		type : 'POST',
		data:$("#id_form_checkout_card_purchase").serialize()+ "&paymentMode=" + paymentMode+"&totalCharge="+totalCharge+"&cardId="+cardId+"&imagePath="+imagePath+"&crDrCardNumber="+crDrCardNumber,
		dataType : "json",
		success : function(data) {
			
			if(paymentMode=="giftcard"){
				if(data.statusTransaction=="Success"){
					toastr.success(data.messageTransaction);
				}else{
					toastr.error(data.messageTransaction);
				}
			}
			
			if(data.status=="Success"){
				toastr.success(data.message+". Redirecting To Home Page.......");
				setTimeout(function() {
					window.location.href =contextPath+"/user/home";
				         }, 3000);
			}else{
				toastr.error(data.message);
			}
		},
								error : function() {
									alert("Exception in checkout" + errorThrown);
								}
							}); 

}

/*function getAllCartList(){
	$.ajax({
		url :contextPath+ "/purchaseCard/getAllCartList",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			var totalAmount=parseFloat(0);
			var arrDataCartList=[];
			for(var i in data){
				totalAmount=totalAmount+data[i].giftValue;
				arrDataCartList.push([data[i].itemNumber,data[i].giftCardName,data[i].deliveryDate,data[i].giftValue,data[i].serviceFee,data[i].totalCharge,data[i].removeProduct]);
			}
			$("#id_hdn_cardValue").val(totalAmount);
			$("#id_amount_wish_to_pay").val(totalAmount);
		},
								error : function() {
									alert("Exception in getAllCartList" + errorThrown);
								}
							}); 

}*/

function getExpiryYear(){
	$("#id_select_credit_expiry_year").empty();
	var year=parseInt(moment().format("YYYY"));
	$("#id_select_credit_expiry_year").append('<option value="">YYYY</option>');
	for(i=0;i<20;i++){
		$("#id_select_credit_expiry_year").append('<option value="'+year+'">'+year+'</option>');
		year++;
	}
	$("#id_select_credit_expiry_year").append('<option value="">')
}

function getAllCardId(){
	$.ajax({
		url :contextPath+ "/myCards/getAllCardId",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_select_card_ID").empty();
			$("#id_select_card_ID").append('<option value="">Select Card ID</option>');
			for(var i in data){
				$("#id_select_card_ID").append('<option value="'+data[i].cardId+'">'+data[i].cardId+'</option>');
			}
		},
		error : function() {
			alert("Exception in checkout" + errorThrown);
		}
	}); 
}


function getAllBankDetails(){
	$.ajax({
		url :contextPath+ "/bank/getAllBankDetails",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_checkout_sadad_bankId").empty();
			$("#id_checkout_sadad_bankId").append('<option value="">Select Bank ID</option>');
			for(var i in data){
				$("#id_checkout_sadad_bankId").append('<option value="'+data[i].bankId+'">'+data[i].bankName+'</option>');
			}
		},
		error : function() {
			alert("Exception in getAllBankDetails" + errorThrown);
		}
	}); 
}

function getCheckoutDetails(){
	var guest="";
	if($("#id_purchaserId_hdn_guest").val()!=""){
		guest=$("#id_purchaserId_hdn_guest").val();
	}
	$.ajax({
		url : getContextPath() + "/purchaseCard/getCheckoutDetails",
		type : 'POST',
		dataType : "json",
		data:{guest:guest},
		success : function(data) {
		//	$("#id-purchase-id").attr("placeholder","Purchaser ID : "+data.purchaseId);
			$("#id-purchase-id").text("Purchaser ID :  "+data.purchaseId);
			$("#id-gift-card-amount").text("Gift Card Amount :  "+data.giftCardValue);
			$("#id_serviceCharge_cr_dr").text("Service Charge(Credit):  "+data.serviceChargeCreditCard);
			$("#id_serviceCharge_sadad_olp").text("Service Charge(OLP) :  "+data.serviceChargeSadadOlp);
			$("#id_serviceCharge_gift_card").text("Service Charge(Giftcard) :  "+data.serviceChargeGiftCard);
			$("#id_total_amount_credit").text("Total Charge(Credit) :  "+data.totalAmountForCreditCard);
			$("#id_total_amount_sadadOLP").text("Total Charge(OLP) :  "+data.totalAmountForSadadOlp);
			$("#id_total_amount_giftcard").text("Total Charge(Giftcard):  "+data.totalAmountForGiftcard);
			
			$("#id_hdn_cardValue").val(data.totalAmountForGiftcard);
			$("#id_amount_wish_to_pay").val(data.totalAmountForGiftcard);
			
			
		},
								error : function() {
									alert("Exception in getCheckoutDetails" + errorThrown);
								}
							}); 
	
}
