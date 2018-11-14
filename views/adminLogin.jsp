<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="Merchant Details" />
	<tiles:putAttribute name="body">
		
		<link
			href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css"
			rel="stylesheet">
			<link
			href="${pageContext.request.contextPath}/resources/css/adminLogin.css"
			rel="stylesheet">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/adminLogin.js"></script>

		<div class="row admin-login">
		<div class="container">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <form class="form-signin" id="id_form_admin_login">
                <input type="text" class="form-control" id="id_userId" name="userId" placeholder="UserId" required autofocus>
                &nbsp;
                <input type="password" class="form-control" id="id_pasword" name="password" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="button" id="id-admin-login">
                    Sign in</button>
                    <input type="hidden" name="groupId" value="4">
                <a href="#" class="pull-right need-help">Forgot Password? </a><span class="clearfix"></span>
                </form>
            </div>
        </div>
    </div>
</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
