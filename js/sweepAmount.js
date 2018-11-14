$(document).ready(function(){
	$("#id_amnt-calc").hide();
	var context = $("#id-context").val();
	var vat = $("#id_vat-hidn").val();
	var sarie = $("#id_sarie-hidn").val();
	var ata = $("#id_ata-hidn").val();
	console.log(vat+" "+sarie+" "+ata);
	
	$("#id_sweep-amnt").on('input', function() {
		var amount = $("#id_sweep-amnt").val();
		var total = parseFloat(0);
		if(amount.match("^[0-9]+(?:\.[0-9]{1,2})?$") && !amount.match("^[0]+(\.[0]{1,2})?$") && $("#id_transaction-mode").val() != "select"){
			
			var vatAmnt = (parseFloat(vat)*parseFloat(amount))/100;
			total = parseFloat(amount)+vatAmnt;  
			console.log(amount+" "+vatAmnt+" "+total);
			if($("#id_transaction-mode").val() == "SARIE"){
				total = total+parseFloat(sarie);
				$("#id_label-mode").text("SARIE");
				$("#id_mode-amount").text("+ "+sarie);
			}
			if($("#id_transaction-mode").val() == "ATA"){
				total = total+parseFloat(ata);
				$("#id_label-mode").text("ATA");
				$("#id_mode-amount").text("+ "+ata);
			}
			$("#id_vat-amount").text("+ "+vatAmnt);
			$("#id_total-amnt").text(total);
			$("#id_amnt-calc").show();
			console.log("total "+total);
		}else{
			$("#id_amnt-calc").hide();
		}
	});
	$( "#id_transaction-mode" ).change(function() {
		var amount = $("#id_sweep-amnt").val();
		var total = parseFloat(0);
		if(amount.match("^[0-9]+(?:\.[0-9]{1,2})?$") && !amount.match("^[0]+(\.[0]{1,2})?$") && $("#id_transaction-mode").val() != "select"){
			
			var vatAmnt = (parseFloat(vat)*parseFloat(amount))/100;
			total = parseFloat(amount)+vatAmnt;  
			console.log(amount+" "+vatAmnt+" "+total);
			if($("#id_transaction-mode").val() == "SARIE"){
				total = total+parseFloat(sarie);
				$("#id_label-mode").text("SARIE");
				$("#id_mode-amount").text("+ "+sarie);
			}
			if($("#id_transaction-mode").val() == "ATA"){
				total = total+parseFloat(ata);
				$("#id_label-mode").text("ATA");
				$("#id_mode-amount").text("+ "+ata);
			}
			$("#id_vat-amount").text("+ "+vatAmnt);
			$("#id_total-amnt").text(total);
			$("#id_amnt-calc").show();
			console.log("total "+total);
		}else{
			$("#id_amnt-calc").hide();
		}
	});
	$("#id_sweep_amnt_btn").click(function(){
		var amount = $("#id_sweep-amnt").val();
		var remark = "";
		if( $("#id_remarks").val() != ""){
			remark = $("#id_remarks").val();
		}
		
		if($("#id_transaction-mode").val() == "select")
			toastr.warning("Choose a transaction mode");
		else if( amount == "" )
			toastr.warning("Amount can't be empty");
		else if( !amount.match("^[0-9]+(?:\.[0-9]{1,2})?$") )
			toastr.warning("Enter a valid Amount");
		else if( amount.match("^[0]+(\.[0]{1,2})?$") )
			toastr.warning("Enter a valid Amount");
		else if( remark.length > 80 )
			toastr.warning("Description should be with in 80 charactes");
		else{
			$.ajax({
				url: context + "/merchantSweeping/sweepAmountToAccount",
				method: 'post',
				data: {"amount":amount, "transactionMode":$("#id_transaction-mode").val(), "remark":remark},
				dataType: 'json',
				success: function(data){
					if(data.status == "success"){
						toastr.success(data.message);
						$("#id_amount-display").text(data.amount);
						$("#id_sweep-amnt").val("");
						$("#id_transaction-mode").val("select");
						$("#id_amnt-calc").hide();
					}
				},
				error: function(data){
					toastr.error("Exception");
				}
			});
		}
	});
});

