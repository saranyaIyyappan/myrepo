<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="My QR Code" />
	<tiles:putAttribute name="body">
		<link
			href="${pageContext.request.contextPath}/resources/css/myQRCode.css"
			rel="stylesheet">
		<!--body wrapper start-->
		<div class="">
			<div class="" role="main">
				<div class="row row-1">
				
					<div class="col-md-offset-1 col-md-8 text-center">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h2 class="captionn" align="center">Scan To Pay</h2>
							</div>
							<div class="panel-body panel-pdng">
								<div class="row">
							


									<div class="col-md-12">
										<button type="button" id="id_btn_image_card"
											data-toggle="tooltip" title="Click To Download QR Code">
											<img class="qrcode" id="id_image_qr_code" src=""
												class="downloadable" width="200px" height="400px">
										</button>
									</div>




									<div class="col-sm-3">&nbsp;</div>


									<%-- <div class="col-md-9">
													<!-- <button type="button" id="id_btn_image_card"> -->
													<img class="qrcodeGiftcard"
														src="${pageContext.request.contextPath}/resources/img/giftcardCode.jpg"
														>
													<!-- </button> -->
						
												</div> --%>

								</div>
								<div class="row">

									<div class="col-md-12 col-sm-12 text-center">
										<button type="button" class="btn btn-success"
											id="id_print_btn_qrcode">print</button>
									
										<button type="button" class="btn btn-success"
											id="id_share_btn_qrcode">share</button>
									</div>

								</div>
							</div>

						</div>
					</div>




				</div>


			</div>
		</div>

		<script
			src="${pageContext.request.contextPath}/resources/js/myQRCode.js"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>