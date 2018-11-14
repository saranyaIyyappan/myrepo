function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
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
var sumAmt=0;
var cardId;
jsonObj = [];
var cardBalance;
$(document).ready(function(){
	$("#img-load").hide();
	$("#id-div-ref").hide();
	$("#selectMyCards").hide();
	toastr.options = {
			"preventDuplicates" : true,
			"preventOpenDuplicates" : true
		};

	$("#pay_merchant").click(function(){
		if($("#id_ben_mobile_number").val().trim()==""){
			toastr.warning("Please enter Mobile Number");
		}else if($("#id_ben_card_id").val().trim()==""){
			toastr.warning("Please enter Beneficiary Card ID");
		} else if($("#id_amount_wish_to_pay").val().trim()==""){
			toastr.warning("Please enter Amount");
		}else{		
			   if ($("#id_amt_to_pay").val() == '') {
					$("#id_amt_to_pay").val($("#id_amount_wish_to_pay") .val());
					amount = $("#id_amount_wish_to_pay") .val();
					getCardImagesForUser();
			} else if ($("#id_amt_to_pay").val() != '' && $("#id_amt_to_pay").val() == $( "#id_amt_in_card").val()) {
				multipleCardPay();
			} else {
				amount = $("#id_amount_wish_to_pay") .val();
				getCardImagesForUser();
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
				$("#id_modalImage_card").modal('hide');	
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
		
		cardId=$("#id_card_id_hidden").val();
		$("#id_balance_hidden").val(balance);
		getCardImagesForUser();
		});
	$("#pay_merchant_clear").click(function(){
		$("#id_merchant_id").val("");
		$("#id_amount_wish_to_pay").val("");
		$("#id_amt_to_pay").val("");
		$("#id_amt_in_card").val("");
		$("#id_purpose").val("");
		$("#id-div-ref").hide();
	});
	$(".close").click(function(){
		$("#id_amt_in_card").val("");
		$("#id_amt_to_pay").val("");
		$("#id_amount_wish_to_pay").val("");
		cardIds = [];
		purchaseAmounts = [];
		cardBalance = [];
	});
	$("#selectMyCards").click(function(){
		$("#id-confirm-modal").modal('show');
	});
	$("#id_confirm").click(function(){
		multipleCardPay();
	});
	$("#id_confirm_cancel").click(function(){
		$("#id_modalImage_card").modal('hide');
		for(var yy in dummyCheckId){
			 $("#"+dummyCheckId[yy]+"").attr('checked', false);
			// $('#myCheckbox').attr('checked', false);
			}
	});
});

function getBenCardId(){
	var benUserId=$("#id_ben_mobile_number").val();
	$.ajax({  
		type : 'POST', 
		url : getContextPath() +"/transferMoney/getAllCardId", 
		dataType : "json",
		data:{benUserId:benUserId},
		
		beforeSend: function(msg){
			$("#img-load").show();
          },
		success : function(data){  
			$("#img-load").hide();
			if(data[0].status=="failed"){
				$("#id_ben_card_id").empty();
				$("#id_ben_card_id").append('<option value selected disabled>Select Card</option>');  
				  $('#id_ben_card_id').prop('disabled', true);
				toastr.error(data[0].message);
			}else{
			$("#id_ben_card_id").empty();
			$('#id_ben_card_id').prop('disabled', false);
		$("#id_ben_card_id").append('<option selected value>Select Card</option>');  
		for(var i in data){  
			$("#id_ben_card_id").append('<option value="' + data[i].cardId + '">' + data[i].cardId+ '</option>'); 
			} 
		}},
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
}

function getCardImagesForUser(){
	$.ajax({
		url : getContextPath() +"/transferMoney/getAllCardsOfUser",
		type : 'POST',
		data :{},
		dataType : "json",
		
		beforeSend: function(msg){
			$("#img-load").show();
          },
		success : function(data) {
			$("#img-load").hide();
			$("#id_sample_sumi").empty();				
			if(data[0].multipleCard=='yes'){
			for ( var i in data) {		
				dummy.push(i);
				mydata.push(data[i].imagebig);
				amt.push(data[i].cardAmount)
				theme.push(data[i].cardTheme)
				card.push(data[i].cardId)
				checkId.push('id_'+i);
				dummyCheckId.push('id_'+i);
				dummyCheckIds.push('id_'+i);
				$("#id_sample_sumi").append('<div class=""><div class="col-md-3" id="idd_'+i+'"><label class="btn btn-primary checkpdng"><img src="'+getContextPath()+"/"+ data[i].imageUrl +'" style="width:150px;height:75px;"class="img-thumbnail img-check"></label><input type="checkbox" name="chk1" class="check-leftbox" value="val1" autocomplete="off" id="id_'+i+'" onclick="selectDivSumy(\''+data[i].cardId + '\',\'' + data[i].cardAmount + '\',\'id_'+i+ '\',\''+i+ '\')""><div class="check-amnt" >'+data[i].cardAmount+'</div></a></div></div>');
			//	$("#id_sample").append('<div class="col-md-6" style="padding:6px;"><div class="" onclick="getSelectedDiv('+i+')" id="id_'+i+'"><div class="item-img">'+ data[i].image +'</div></div></div>');
				$("#id_price").empty();
				$("#id_selected_card").empty();
				$("#id_card_theme").empty();
				$("#id_card_id_hidden").empty();
			}
			$("#id_modalImage_card").modal('show');
			getSelectedDiv(0)
		}else{
			toastr.warning("ANB cards not found");
		}
		},
		error: function(jqXHR, textStatus, errorThrown) {
		       toastr.error("Server problem");
		      }
	});
}

function multipleCardPay(){
	var jsarr=[];
	for(var i in cardIds){
		jsarr.push({cardId:cardIds[i],amount:purchaseAmounts[i].toString()});
	}
	var cards=JSON.stringify({"cards":jsarr});
	var benCardId=$("#id_ben_card_id").val();
	var amount=$("#id_amount_wish_to_pay").val();
	$.ajax({
		type : 'POST',
		url : getContextPath()+"/consumer/transferMoneyWeb",
		data:{cards:cards,benCardId:benCardId,amount:amount},
		dataType : "json",
		
		beforeSend: function(msg){
			$("#img-load").show();
          },
		success : function(data) {
			$("#img-load").hide();
			if(data.status=="Success"){
				toastr.success(data.message);
				$("#id-confirm-modal").modal('hide');
				$("#id_modalImage_card").modal('hide');
				$("#id_ben_card_id").val("");
				$("#id_ben_mobile_number").val("");
				$("#id_amount_wish_to_pay").val("");
			}else{
				toastr.warning(data.message);
				$("#id-confirm-modal").modal('hide');
			}
			 cardIds = [];
			 purchaseAmounts = [];
			 cardBalance = [];
		},
		error: function(jqXHR, textStatus, errorThrown) {
		       toastr.error("Server problem");
		      }
	});

}
function validateFloatKeyPress(el, evt) {
	
    var charCode = (evt.which) ? evt.which : event.keyCode;   
 var number = el.value.split('.'); 
   if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;    }  
 if(number.length>1 && charCode == 46){
         return false;    }   
 var caratPos = getSelectionStart(el);  
  var dotPos = el.value.indexOf(".");    
if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){ 
       return false;    } 
   return true;
   }

function getSelectionStart(o) {
	if (o.createTextRange) {
		var r = document.selection.createRange().duplicate()
		r.moveEnd('character', o.value.length)
		if (r.text == '') return o.value.length
		return o.value.lastIndexOf(r.text)
	} else return o.selectionStart
}

function precisionAndScaleCheck(inputNumber,obj){
	if(inputNumber!=""){
	var status;
	if(inputNumber.indexOf('.')!=-1){
	status=inputNumber.search(/\b\d{1,8}\.\d{1,2}\b/) == 0 ? true : false;
	 if(status==false){
	    	toastr.warning("Amount should be maximum of 8 digits Before decimal point and maximum of two digits after decimal");
			$(obj).val("");
	    }
	}else{
		status=inputNumber.search(/\b\d{1,8}\b/) == 0 ? true : false;
		 if(status==false){
		    	toastr.warning("Amount should be maximum of 8 digits");
				$(obj).val("");
		    }
	}
	}
   
}
function isNumber(evt) {

    evt = (evt) ? evt : window.event;

    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {

    toastr.warning("Please enter numbers");

    return false;

    } return true;}

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
				cardBalance.push(cardAmt-(amount-AmtInCards));
				$("#selectMyCards").show();
				
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
		 $("#selectMyCards").hide();
	 }
	
}
