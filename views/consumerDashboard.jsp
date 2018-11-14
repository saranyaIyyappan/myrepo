<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="pocket.definition">
	<tiles:putAttribute name="title" value="Welcome Customer" />
	<tiles:putAttribute name="body">
		<link
			href="${pageContext.request.contextPath}/resources/css/consumerDashboard.css"
			rel="stylesheet">
		<!--body wrapper start-->
		<div class="container heightMin">
			<div class="" role="main">
						<div class="row">
						<br>
									<div class="col-md-9">
										<div class="panel panel-success">
											<div class="panel-heading">
												<h2 class="caption" align="center">Welcome Customer</h2>
											</div>
											<div class="panel-body">

												<div class="col-md-12">
													<img class="dashboardGiftcard"
														src="${pageContext.request.contextPath}/resources/img/welcome_Customer.png"
														>
												</div>
											</div>
										</div>
									</div>

						</div>
					
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>