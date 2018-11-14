<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="common.definition">
	<tiles:putAttribute name="title" value="My Wallet Balance" />
	<tiles:putAttribute name="body">
       
        <!--body wrapper start-->
        <div class="container" style="min-height: 600px">
        <div class="right_col" role="main">
			<div class="row row-1" style="padding-top: 50px">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="">
						<div class="row" style="padding-top: 20px">
							<div class="col-sm-5">
							<label for="company_id_search" class="col-sm-4 control-label"
									style="margin-top: 3px">Wallet Number: </label>
								<div class="col-sm-7">
								<!-- <input class="form-control awesomplete" id="id_card_no"
											name="cardNo"  placeholder="Card Number" style="width:190px"
											type="text" /> -->
											<select class="form-control column_filter" aria-hidden="true"
										id="id_card_no" name="cardNo" data-column="0" style="height: 30px">
									</select>
								</div>
							</div>
							<div class="col-sm-3">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm btn_padding"
									id="id_card_balance_btn">
									<i class="fa fa-search" style="font-size: 15px"></i> Get Wallet Balance
								</button>
								<button type="button" class="btn btn-warning btn-sm btn_padding"
									id="id_card_balance_clr_btn">
									<i class="fa fa-refresh" style="font-size: 15px"></i> &nbsp;&nbsp;Clear&nbsp;&nbsp;
								</button>
                                </div>

						</div>
					</div>
					<div class="row row-1" style="padding-top: 50px" id="id-div-card-balance-table">
					<div class="col-md-12 col-sm-12 col-xs-12"
						style="padding-top: 20px">
						<div class=" control-2">
							<h3><i class="fa fa-list-alt customHead_Fa" aria-hidden="true">Your last Transations on this Wallet</i></h3>
							<div class="col-md-12" style="padding-top: 20px" id="no-more-tables">
								<table id="card-balance-datatable-id"
									class="col-md-12 table-bordered table-striped table-condensed cf">
								<thead class="cf">
										<tr>
											<th>Date</th>
											<th>Description</th>
											<th>Amount</th>
										</tr>
									</thead>

								</table>
							</div>

						</div>
					</div>
					<div class="row" style="padding-top: 20px">
					<div class="col-md-3"></div>
					<div class="col-md-3"></div>
					<div class="col-md-6" style="font-size:x-large;"><label>Current Balance:</label><span id="id_p_balAmount"></span></div>
					</div>

				</div>
				</div>

			</div> 
		</div>
		</div>
        
<script src="${pageContext.request.contextPath}/resources/js/myCardBalance.js"></script>
		</tiles:putAttribute>
</tiles:insertDefinition>