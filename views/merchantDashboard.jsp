<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Welcome Merchant" />
	<tiles:putAttribute name="body">
		<link
			href="${pageContext.request.contextPath}/resources/css/consumerDashboard.css"
			rel="stylesheet">
<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/plugins/chartjs/jquery.canvasjs.min.js"></script>
<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/merchantDashboard.js"></script>
			<style>
			.canvasjs-chart-canvas{
			top:0px!important;
			}
			</style>

<div class="">
		<div class="row merchnt_margn">
		<div class="col-md-10 serboxe">
				<form class="form-inline">
				  <div class="form-group">
				    <label for="exampleInputName2">Transaction Date</label>
				    <input type="text" class="form-control" id="id_transaction_date" placeholder="Jane Doe">
				  </div>
				 
				  <button type="button" class="btn btn-info btn-sm btn_padding" id="id_search_transaction_date">
						<i class="fa fa-search"></i> Search
				  </button>
				
				</form>
				</div>
				</div>
        <div class="col-md-12" style="padding:20px 0px;">
        <div id="chartContainer" style="width:800px; height:300px;"></div>
           </div></div>
           
           
           
           <div class="">
		<div class="row">
		<div class="col-md-10 serboxx">
				<form class="form-inline">
				  <div class="form-group">
				    <label for="exampleInputName2">Date</label>
				    <input type="text" class="form-control" id="id_date" placeholder="Jane Doe">
				  </div>
				 
				  <button type="button" class="btn btn-info btn-sm btn_padding" id="id_search_date">
						<i class="fa fa-search"></i> Search
				  </button>
				
				</form>
				</div>
				</div>
        <div class="col-md-12" style="padding:20px 0px;">
        <div id="pieContainer" style="height: 370px; width: 100%;"></div>
           </div></div>
	</tiles:putAttribute>
</tiles:insertDefinition>




