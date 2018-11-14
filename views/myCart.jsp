<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="Wallet Balance" />
	<tiles:putAttribute name="body">
       
        <!--body wrapper start-->
        <div class="container-outer-div">
        <br><br>
        <div class="container">
        <div class="right_col " role="main">
        	<div class="row" id="no-more-tables">
					<table id="id_table_item_purchase_summary_home_myCart"
						class="col-md-12 table-bordered table-striped table-condensed cf">
						<thead class="cf">
							<tr>
								<th>Item Number</th>
								<th>eWallet</th>
								<th>Delivery</th>
								<th>Gift Value</th>
								<th>Service Fee</th>
								<th>Total</th>
								<th>Product Image</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<br>
					<div class="row">
					<div class="col-md-9"></div>
					<div class="col-md-1"></div>
					<!-- 
					<div class="col-md-3"></div> -->
					<div class="col-md-2"><button type="button"
												class="btn btn-default btn-info-full next-step"
												id="id_btn_buy_checkout_mycart">Check out</button>
					</div>
					</div>
					<br>
					<div class="row"></div>
				</div>	
		</div>
		</div>
		</div>
        
<script src="${pageContext.request.contextPath}/resources/js/myCart.js"></script>
		</tiles:putAttribute>
</tiles:insertDefinition>