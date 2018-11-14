<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Merchant Sweeping" />
	<tiles:putAttribute name="body">
        <!--body wrapper start-->
    
        	<div>
		  	
		</div>
        
        <div class="col-sm-12 row-1"  id="id_container">
        	<!-- <div class="row serbox">
				<form class="form-inline">
				  <div class="form-group">
				    <label for="exampleInputName2">User ID</label>
				    <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
				  </div>
				  <div class="form-group">
				    <label for="company_id_search">Sweeping Date:</label>
				    <input type="text" class="form-control"  id="id_search_sweepingDate" placeholder="Sweeping Date">
				  </div>
				  <button type="button" class="btn btn-info btn-sm btn_padding" id="id-search">
						<i class="fa fa-search"></i> Search
				  </button>
				<button type="button" class="btn btn-warning btn-sm btn_padding" id="id-clear">
						<i class="fa fa-refresh"></i>&nbsp;&nbsp;Clear&nbsp;&nbsp;
				</button>
				</form>
			</div> -->
			 <div class="row serboxe">
							<div class="col-sm-8">
							<label for="company_id_search" style="    padding-top: 8px;
							 "class="col-sm-4 control-label sweeping">Sweeping Date: </label>
								<div class="col-sm-7">
								<input class="form-control" placeholder="Sweeping Date"
											maxlength="100" type="text" name="" onchange=""
											id="id_search_sweepingDate" />
								</div>
							</div>
							
							<div class="col-sm-4">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm btn_padding"
									id="id-search">
									<i class="fa fa-search" ></i> Search
								</button>
								<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id-clear">
									<i class="fa fa-refresh" ></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button>
                                </div>

						</div> 
        <div class="right_col" role="main">
			<div class="row ">
				<div class="col-md-12 col-sm-12 col-xs-12">
				
				
					<div class="row" id="sweeping_table_div">
					<div class="col-md-12 col-sm-12 col-xs-12 table-div-sub">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt" aria-hidden="true"> Sweeping Results </i></h3>
							 <br><br>
							<!---->
							<div class="col-md-12 table-div-sub-sub" id="no-more-tables">
								<table id="merchant-sweeping-datatable-id"
									class="col-md-12 table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr> 
											<th>Sweep Date</th>
											<th>Transaction Description</th>
											<th>No. Of Transactions</th>
											<th>Sweep Amount</th>
											<th>Charges</th>
											<th>Discounts/Offers</th>
										</tr>
									</thead>

								</table>

							</div>

						</div>
					</div>
				</div>
				<!-- 
				<div class="row row-1" id="transaction_table_div">
					<div class="col-md-12 col-sm-12 col-xs-12 table-div-sub">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Your Transactions</i></h3>
							<div class="col-md-12 table-div-sub-sub">
								<table id="merchant-transaction-datatable-id"
									class="table table-bordered table-hover dataTable responsive">
									<thead>
										<tr>
											<th>Transaction Date</th>
											<th>Transaction Details</th>
											<th>Transaction Amount</th>
										</tr>
									</thead>

								</table>

							</div>

						</div>
					</div>
				</div> -->
				</div>
			</div>
		</div>
   </div><br><br>
   <div class="clear-fix"></div><br clear="all"><br clear="all">
   
    <!-- Transaction modal starts -->
		<div class="modal fade" id="id_modal_transaction_results" data-backdrop="static" 
		                  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content" id="">
									<div id="" class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<b>
												Transactions Results
											</b>
										</h4>
									</div>
									<div class="modal-body">
											<div class="box-body">
											<div class="col-md-12 table-div-sub-sub id="no-more-tables"">
								<table id="merchant-transaction-datatable-id"
									class="col-md-12 table-bordered table-striped table-condensed cf">
								<thead class="cf">
										<tr>
											<th>Transaction Date</th>
											<th>Transaction Details</th>
											<th>Transaction Amount</th>
										</tr>
									</thead>

								</table>

							</div>
											
																							
											</div>
											<div class="modal-footer">
												
											</div>
									</div>
									<!-- /.box -->
				
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->
						</div>
						<!-- /transaction modal ends-->
						<br><br>
   
<script src="${pageContext.request.contextPath}/resources/js/merchantSweeping.js"></script>

		</tiles:putAttribute>
</tiles:insertDefinition>