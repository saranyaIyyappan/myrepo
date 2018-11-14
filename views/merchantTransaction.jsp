<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Merchant Transaction" />
	<tiles:putAttribute name="body">
		<!--body wrapper start-->

		<div class="right_col" role="main">
			<div class="row-1">
				<div class="">
			<div class="col-sm-12">
		  	<div class="row serboxe">
				<form class="form-inline">
				  <div class="form-group">
				    <label for="id_startDate_search">Start Date:</label>
				    <input type="text" class="form-control " id="id_startDate_search" placeholder="Start Date">
				  </div>
				  <div class="form-group">
				    <label for="id_endDate_search">End Date: </label>
				    <input type="email" class="form-control " id="id_endDate_search" placeholder="End Date">
				  </div>
				  
				  <button type="button" class="btn btn-info btn-sm btn_padding" id="id_search_transaction">
						<i class="fa fa-search"></i> Search
				  </button>
				<button type="button" class="btn btn-warning btn-sm btn_padding" id=id_clear_transaction>
						<i class="fa fa-refresh"></i>&nbsp;&nbsp;Clear&nbsp;&nbsp;
				</button>
				</form>
			</div>
		</div>
					
					</div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 table-div-sub">
							<div class=" control-2">
								<h3>
									<i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Your
										Transactions</i>
								</h3>
								<div class="col-md-12 table-div-sub-sub" id="no-more-tables">
									<table id="merchant-transaction-datatable-id"
										class="col-md-12 table-bordered table-striped table-condensed cf">
										<thead class="cf">
											<tr>
												<!-- <th>Card Category</th> -->
												<th>Transaction Date</th>
												<th>Transaction Details</th>
												<th>Transaction Amount</th>
											</tr>
										</thead>

									</table>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		<link
			href="${pageContext.request.contextPath}/resources/css/merchantTransaction.css"
			rel="stylesheet">
		<script
			src="${pageContext.request.contextPath}/resources/js/merchantTransaction.js"></script>

	</tiles:putAttribute>
</tiles:insertDefinition>