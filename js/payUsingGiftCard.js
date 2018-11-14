function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
var myArray=[];
var dummy=[];
var checkId=[];
var dummyCheckId=[];
var dummyCheckIds=[];
var mydata=[];
var amt=[];
var theme=[];
var card=[];
var cardIds=[];
var purchaseAmounts=[];
var cardBalance=[];
var amount;
var balance;
var cardId;
var sumAmt=0;
jsonObj = [];
//var CardId;
$(document).ready(function(){
	$("#id-div-ref").hide();
	getMerchantId();
	toastr.options = {
			"preventDuplicates" : true,
			"preventOpenDuplicates" : true
		};
//	
			$("#pay_merchant").click(function() {
				/*if ($("#id_merchant_id").val() == null) {
					toastr.warning("Please enter Merchant Id");
				} else */if ($("#id_amount_wish_to_pay").val() .trim() == "") {
					toastr.warning("Please enter Amount");
				} else {
					if ($("#id_amt_to_pay").val() == '') {
						$("#id_amt_to_pay").val($("#id_amount_wish_to_pay") .val());
						amount = $("#id_amount_wish_to_pay") .val();
						payAMerchant();
					} else if ($("#id_amt_to_pay").val() != '' && $("#id_amt_to_pay").val() == $( "#id_amt_in_card").val()) {
					//	multipleCardPay();
					} else {
						amount = $("#id_amount_wish_to_pay") .val();
						payAMerchant();
					}
				}
			});
	$("#id-pick-card").click(function(){
		
		if($("#id_amt_in_card").val()== ''){
			$("#id_amt_in_card").val(0);
			}
		var againNeeded=$("#id_amt_to_pay").val()-$("#id_amt_in_card").val();
		if($("#id_price").text()>againNeeded){
			$("#id_amt_in_card").val(parseInt($("#id_amt_in_card").val())+againNeeded);
			if($("#id_amt_in_card").val()==$("#id_amt_to_pay").val()){			
				$("#myModal6").modal('hide');	
			}
			balance=$("#id_price").text()-againNeeded;
			purchaseAmounts.push(againNeeded);
			cardBalance.push($("#id_price").text()-againNeeded);
			toastr.info("Amount "+againNeeded+" will deduct from this Card");
		}else{
			$("#id_amt_in_card").val($("#id_price").text());
			cardBalance.push(0);
			purchaseAmounts.push($("#id_price").text());
			toastr.info("Amount "+$("#id_amt_in_card").val()+" will deduct from this Card");
		}
		cardId=$("#id_card_id_hidden").val();
		cardIds.push(cardId);
	});
	$("#id-btn-again").click(function(){
		//alert($("#id_card_id_hidden").val());
		//var balance=($("#id_price").text())-($("#id_amount_wish_to_pay").val());
		//var balance=0;
		cardId=$("#id_card_id_hidden").val();
		$("#id_balance_hidden").val(balance);
		if(cardId!=""){
			updateCardBalance();
		}
		payAMerchant();
		});
	$("#pay_merchant_clear").click(function(){
		$("#id_merchant_id").val("");
		//$("#id_amount_wish_to_pay").val("");
		$("#id_amt_to_pay").val("");
		$("#id_amt_in_card").val("");
		$("#id_purpose").val("");
		$("#id-div-ref").hide();
	});
	$(".close").click(function(){
		$("#id_amt_in_card").val("");
		//$("#id_amt_to_pay").val("");
		//$("#id_amount_wish_to_pay").val("");
		cardIds = [];
		purchaseAmounts = [];
		cardBalance = [];
	});
	
	/*$("#selectMyCards").click(function(){
		multipleCardPay();
	});*/
	
	/*$("#id_merchant_id").on('change', function() {
		  var merachantId=this.value;
		  $.ajax({
				type : 'POST',
				url : getContextPath() + "/purchaseCard/getAmount",
				dataType : "json",
				traditional: true,
				data: {merachantId:merachantId},
				success : function(data) {
					if(data[0].status=="Success"){
						$("#id_amount_wish_to_pay").val(data[0].amount)
					}else{
						toastr.warning(data.message);
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
				       toastr.error("Server problem");
				      }
			});
	});*/
});
function getMerchantId(){
	data=null;
	$.ajax({  
		type : 'POST', 
		url : getContextPath() +"/purchaseCard/getMerchantId", 
		dataType : "json",
		success : function(data){  
			$("#id_merchant_id").empty();
			$("#id_merchant_id").append('<option selected disabled>Select Merchant Id</option>');  
			for(var i in data){  
				$("#id_merchant_id").append('<option value="' + data[i].merchantId + '">' + data[i].merchantId+ '</option>'); 
			}     
		},
		error: function(jqXHR, textStatus, errorThrown) {
			toastr.error("Server problem");
		}
	}); 
}
function getSelectedDiv(id){	
	if(amt[id]==0){
		toastr.warning("Card Amount is '0' Select another Card");
	}else{
		var index=dummy.indexOf(id);		
		if(index==-1){
			console.log("FOUND"+mydata[id]);
			$("#id_price").empty();
			$("#id_selected_card").empty();
			$("#id_card_theme").empty();
			$("#id_card_id_hidden").empty();
			$("#id_price").append(''+amt[id]+'');
			$("#id_card_theme").append(''+theme[id]+'');
			$("#id_selected_card").append(''+mydata[id]+'');
			$("#id_card_id_hidden").val(''+card[id]+'');
		}else{
		 console.log(">>>>>Not FOUND"+id);
		}
	}
	
	//$("#id_selected_card").append(id)
}
function payAMerchant(){
	//alert(amount+"inside payAMerchant amount")
	var merchantId=$("#id_merchant_id").val();
	$.ajax({
		url : getContextPath() +"/transferMoney/getAllCardsOfUser",
		type : 'POST',
		data :{amount:amount,merchantId:merchantId},
		dataType : "json",
		success : function(data) {
			//var res = JSON.parse(data);
			$("#id_sample").empty();				
			if(data[0].multipleCard=='yes'){
				
			for ( var i in data) {				
				//var xx="id_"+i;
				dummy.push(i);
				mydata.push(data[i].imagebig);
				amt.push(data[i].cardAmount);
				theme.push(data[i].cardTheme);
				card.push(data[i].cardId);
				checkId.push('id_'+i);
				dummyCheckId.push('id_'+i);
				dummyCheckIds.push('id_'+i);
				$("#id_sample").append('<div class=""><div class="col-md-3" id="idd_'+i+'"><label class="btn btn-primary checkpdng"><img src="'+getContextPath()+"/"+ data[i].imageUrl +'" style="width:150px;height:75px;"class="img-thumbnail img-check"></label><input type="checkbox" name="chk1" class="check-leftbox" value="val1" autocomplete="off" id="id_'+i+'" onclick="selectDivSumy(\''+data[i].cardId + '\',\'' + data[i].cardAmount + '\',\'id_'+i+ '\',\''+i+ '\')""><div class="check-amnt" >'+data[i].cardAmount+'</div></a></div></div>');
			//	$("#id_sample_sumi").append('<div class="form-group"><div class="col-md-3" id="id_'+i+'" onclick="selectDivSumy(\''+data[i].cardId + '\',\'id_'+i+'\')"><label class="btn btn-primary checkpdng">'+ data[i].image +'<input type="checkbox" name="chk1" id="item4" value="val1" class="hidden" autocomplete="off"></label><div class="check-amnt">5000</div></div></div>');
							
				
				//$("#id_sample").append('<div class="col-md-6" style="padding:6px;"><div class="" onclick="getSelectedDiv('+i+')" id="id_'+i+'"><div class="item-img">'+ data[i].image +'</div></div></div>');
				$("#id_price").empty();
				$("#id_selected_card").empty();
				$("#id_card_theme").empty();
				$("#id_card_id_hidden").empty();
			}
			$("#myModal6").modal('show');
			getSelectedDiv(0)
		}else{
			if (data[0].status == 'empty') {
				toastr.warning(data[0].message);
			}
			//$("#content-id").append('SINGLE CARD');
			/*if (data[0].status == 'Success' || data[0].status == 'success') {
				toastr.success(data[0].message);
			} else {
				toastr.warning(data[0].message);
			}*/
		}
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
		       toastr.error("Server problem");
	   }
	});
}

function multipleCardPay(){
	$.ajax({
		type : 'POST',
		url : getContextPath() + "/purchaseCard/multipleCardPay",
		dataType : "json",
		traditional: true,
		data:{'cardIds':cardIds,'purchaseAmounts':purchaseAmounts,'cardBalance':cardBalance},
		success : function(data) {
			$("#card-number").empty();	
			$("#ref-no").empty();	
			$("#balance").empty();	
        	if (data.status == 'success') {
				 toastr.success(data.message+". Redirecting To Home Page.......");
					setTimeout(function() {
						window.location.href =contextPath+"/user/home";
					         }, 8000);
				 $("#myModal6").modal('hide');
				 $("#id-div-ref").show();
				 $(".ref-no").append('<label id="id_ref_no">' + data.refNo + '</label>');
				 for(var i in cardIds){
					 var last4 = cardIds[i].slice(-4);
					 $(".card-number").append('<label id="id_ref_no">XXXX-XXXX-XXXX-' + last4 + '</label><br /><hr />');
					 $(".balance").append('<label id="id_ref_no">' + cardBalance[i] + '</label><br /><hr />');
				 }
				 
				
			} else {
				toastr.warning(data.message);
			}
        	//location.reload();
        	 cardIds = [];
			 purchaseAmounts = [];
			 cardBalance = [];
		},

		error: function(jqXHR, textStatus, errorThrown) {
		       toastr.error("Server problem");
		      }
	});
}

function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Please enter numbers");

    return false;

    } return true;}



//sumy
function selectDivSumy(cardId,cardAmt,iddd,id){
		// alert($("#"+iddd+"").prop("checked"));
		 if($("#"+iddd+"").prop("checked")==true){
			// alert("checked");
			 var AmtInCards =sumAmt;
			 sumAmt=parseInt(sumAmt)+parseInt(cardAmt);
			// alert(sumAmt+"::::sumAmt::::::::::"+cardAmt+":::cardAmt:::::"+amount+"::::::amount:::::");
			   if(amount<=sumAmt){
					//alert("dont allow another card selection");
					var xyz=checkId.indexOf(iddd);
					checkId.splice(xyz, 1);		
					for(var yy in checkId){
						$("#"+checkId[yy]+"").attr("disabled", true);
					}			
					cardIds.push(cardId);
					//alert(amount-AmtInCards);
					purchaseAmounts.push(amount-AmtInCards);
					//alert(cardAmt-(amount-AmtInCards));
					cardBalance.push(cardAmt-(amount-AmtInCards))
				}else{				
					//alert("allow another card selection");				
					for(var yy in dummyCheckId){
					 $("#"+dummyCheckId[yy]+"").removeAttr("disabled");
					}
					//alert(cardId);
					cardIds.push(cardId);
					//alert(cardAmt);
					purchaseAmounts.push(cardAmt);
					cardBalance.push(0);
				}
		 }else{
		 	 $("#"+iddd+"").attr("disabled", false);
			 sumAmt=parseInt(sumAmt)-parseInt(cardAmt);
			 for(var yy in checkId){
					$("#"+checkId[yy]+"").removeAttr("disabled");
				}
			 cardIds.splice(id, 1);
			 purchaseAmounts.splice(id, 1);
			 cardBalance.splice(id, 1);
		 }
	
}
