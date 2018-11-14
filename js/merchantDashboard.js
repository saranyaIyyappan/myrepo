


/*	
window.onload = function() {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title: {
			text: "Desktop Search Engine Market Share - 2016"
		},
		data: [{
			type: "pie",
			startAngle: 240,
			yValueFormatString: "##0.00\"%\"",
			indexLabel: "{label} {y}",
			dataPoints: [
				{y: 79.45, label: "Google"},
				{y: 7.31, label: "Bing"},
				{y: 7.06, label: "Baidu"},
				{y: 4.91, label: "Yahoo"},
				{y: 1.26, label: "Others"}
			]
		}]
	});
	chart.render();

	}*/
/**
 * 
 */
function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
$(document).ready(function(){
	getTransctionChart();
	getSweepChart();
	$('input[id="id_transaction_date"]').daterangepicker(
{
    locale: {
      format: 'YYYY-MM-DD'
    }
}

);
	

	$("#id_search_transaction_date").click(function(){
		getTransctionChart();
	});
	$("#id_search_date").click(function(){
		getSweepChart();
	});

	/*window.onload = function() {
	var date=$("#id_date").val();
	$.ajax({
        url: getContextPath()+"/merchantDashboard/getSweapDetailsForChart",
        type: 'POST',
        //contentType: "image/png",
        dataType: "json",
    	data:{date:date},
        success: function(d) {
        	alert(d.sweepSum);


    		var chart = new CanvasJS.Chart("pieContainer", {
    			animationEnabled: true,
    			title: {
    				text: "Sweep Details"
    			},
    			data: [{
    				type: "pie",
    				startAngle: 240,
    				yValueFormatString: "##0.00\"%\"",
    				indexLabel: "{label} {y}",
    				dataPoints: [
    					{y: d.sweepSum, label: "Google"},
    					{y: d.discountSum,label: "Bing"},
    					//{y: 7.06, label: "Baidu"},
    					//{y: 4.91, label: "Yahoo"},
    					//{y: 1.26, label: "Others"}
    				]
    			}]
    		});
    		chart.render();

    		
        	
        },
        error: function() {
        	alert("error in getEmployeeDetails");
        }
    });
	}*/
		
	$('#id_date').datetimepicker({
		format: 'YYYY-MM-DD',
		//maxDate:moment(),
	});

	
});
function getTransctionChart(){
	var date=$("#id_transaction_date").val();
	var dates=date.split(" ");
	var fromDate=dates[0];
	var toDate=dates[2];
	$
	.ajax({
		url : getContextPath() + "/merchantDashboard/getAllTransactionList",
		type : 'POST',
	 	datatype:"json",
		data:{fromDate:fromDate,toDate:toDate},
		success : function(data) {
		
			 d=JSON.parse(data);
		
			var arr=[];
			for(var i in d){
				arr.push({y:parseInt(d[i].count),x:new Date(parseInt(d[i].year),parseInt(d[i].month),parseInt(d[i].date))});
				}
		
			var options = {
					exportEnabled: true,
					animationEnabled: true,
					title: {
						text: "Datewise Transaction Details"
					},
					
					data: [{        
						type: "line",
						dataPoints:arr
						}]
					
				};
			$("#chartContainer").CanvasJSChart(options);
		}
			,
		error : function() {
			$("#id-card-charges-modal").modal('hide');

		}
		
	
	
	
	
	
	});
}
/*********************Ramsiya*************************/
function getSweepChart(){
	var date=$("#id_date").val();
	$.ajax({
        url: getContextPath()+"/merchantDashboard/getSweapDetailsForChart",
        type: 'POST',
        //contentType: "image/png",
        dataType: "json",
    	data:{date:date},
        success: function(d) {
    		var chart = new CanvasJS.Chart("pieContainer", {
    			animationEnabled: true,
    			title: {
    				text: "Sweep Details"
    			},
    			data: [{
    				type: "pie",
    				startAngle: 240,
    				yValueFormatString: "##0.00\"%\"",
    				indexLabel: "{label} {y}",
    				dataPoints: [
    					{y: d.sweepSum, label: "Google"},
    					{y: d.discountSum,label: "Bing"},
    					//{y: 7.06, label: "Baidu"},
    					//{y: 4.91, label: "Yahoo"},
    					//{y: 1.26, label: "Others"}
    				]
    			}]
    		});
    		chart.render();

    		
        	
        },
        error: function() {
        	alert("error in getEmployeeDetails");
        }
    });
}
/*********************Ramsiya*************************/
