
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Wallet</title>
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/css/responsive.dataTables.min.css">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<%-- <link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/font-awesome.css"
	rel="stylesheet"> --%>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet">
    
	
	
	<link href="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/giftCardHome/css/easy-responsive-tabs.css"
	rel='stylesheet' type='text/css' />
	<link
	href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css"
	rel='stylesheet' type='text/css' />
    <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css">
   <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
<style>
.dd-select {
	width: 30px;
}

.dd-selected-image {
	width: 30px;
	height: 30px;
}

.dd-option-image {
	width: 30px;
	height: 30px;
}

.dd-selected-text {
	height: 2px;
	/*width: 100px;*/
}
</style>	
	
	</head>
	<body>
	<input type="hidden" id="app-context-path"
		value="${pageContext.request.contextPath}" />
	<input type="hidden" id="app-session-out-time"
		value="${pageContext.session.maxInactiveInterval}" />

	<!-- header main start -->
	<div class="container-fluid topbg">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-6 topph">
					<i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898 <span
						class="left"><i class="fa fa-envelope-o" aria-hidden="true"></i>
						<a href="mailto:info@example.com">info@example.com</a></span>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="right">
						<a class="fifty" href="#"><img
							src="${pageContext.request.contextPath}/resources/img/eng_1.png"
							width="15px" height="15px"> English</a> <a class="fifty"
							href="#"><img
							src="${pageContext.request.contextPath}/resources/img/arab_flag.png"
							width="18px" height="15px"> Arabic</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header main end -->

	<div class="">
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/GiftCard/user/home"><img
						src="/GiftCard/resources/giftCardHome/images/ANB LOGO.png"
						width="140px" height="60px"></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">


					<ul class="nav navbar-nav navbar-right">
<!-- ----- -->
<c:if test="${group==2}">
						<li class=""><a class=""
							href="${pageContext.request.contextPath}/consumerCardBalanace/cardBalance">View
								Balance<span class="sr-only">(current)</span>
						</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Categories <span
								class="fa fa-caret-down"></span>
						</a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="agile_inner_drop_nav_info">
									<div class="col-sm-5 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">By Type</h4>
										<ul class="multi-column-dropdown" id="id_ul_group_category">

										</ul>
									</div>
									<div class="col-sm-6 multi-gd-img">
										<h4 style="color: black; font-weight: bold;">Occassions</h4>
										<ul class="multi-column-dropdown"
											id="id_ul_occassions_category">

										</ul>
									</div>

									<div class="clearfix"></div>
								</div>
							</ul></li>
						<li class=" "><a class="nav-link js-scroll-trigger"
							href="/GiftCard/user/home">Most popular</a></li>
						<li class=""><a class="nav-link js-scroll-trigger"
							href="/GiftCard/user/home">Buy Wallet</a></li>
</c:if>
<!-- ---------- -->
						<li class="dropdown"><a href="#"
									class="loginDropDown" data-toggle="dropdown">${loggedUser}
										<i class='fa fa-caret-down'></i>
								</a> 
									<ul  class="dropdown-menu multi-column mystyle">
										<div class="col-sm-12">
											<ul class="multi-column-dropdown">
												<li><a
													href="${pageContext.request.contextPath}/user/myProfile">Profile</a></li>
												<li><a
													href="${pageContext.request.contextPath}/user/logout"
													>Logout</a></li>
											</ul>
										</div>
									</ul></li>
							<c:if test="${group==2}">		
						<li><a href="#"><i class="fa fa-2x fa-shopping-cart" id="id_Cart"></i>
							<lavel id="cart-badge" class="badge badge-warning"></lavel>
							</a>
                        </li>
						</c:if>
						
						
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

	</div>
	
	<!----------------------------------------modal cart data------------  -->
	<div class="modal fade" id="id_card_results_" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" id="">
				<div id="" class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<b> Your Orders </b>
					</h4>
				</div>
				<div class="row" id="no-more-tables">
					<table id="id_table_item_purchase_summary_home"
						class="col-md-12 table-bordered table-striped table-condensed cf">
						<thead class="cf">
							<tr>
								<th>Item Number</th>
								<th>eWallet</th>
								<th>Delivery</th>
								<th>Wallet Value</th>
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
					<div class="col-md-9"></div>
					<div class="col-md-1"></div>
					<!-- 
					<div class="col-md-3"></div> -->
					<div class="col-md-2"><button type="button"
												class="btn btn-default btn-info-full next-step"
												id="id_btn_buy_checkout_modal">Check out</button>
					</div>
					<br>
					<div class="row"></div>

				</div>
				<!-- /.box -->

			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-------------------------------------------------------------------  -->


	<input type="hidden" id="app-context-path"
		value="${pageContext.request.contextPath}" />
	<input type="hidden" id="app-session-out-time"
		value="${pageContext.session.maxInactiveInterval}" />




	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.easing.min.js"></script>
		
	            <script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.js"></script>
	             <script src="${pageContext.request.contextPath}/resources/plugins/select2/select2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/modernizr.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/minicart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/jquery.countup.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/move-top.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/giftCardHome/js/easy-responsive-tabs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/data-table-1.10.9/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		 <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/moment/min/moment.min.js"></script>
     <%-- <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>  --%>
    <script src="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    	<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css">

  	 <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	</body>
	</html>