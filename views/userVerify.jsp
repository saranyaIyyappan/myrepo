<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tiles:insertDefinition name="base.definition">
	<tiles:putAttribute name="title" value="Change Password" />
	<tiles:putAttribute name="body">
		<script	src="${pageContext.request.contextPath}/resources/js/changePassword.js"></script>
       
        <!--body wrapper start-->
        <div class="container">
       <br><br>
         <div class="col-md-4"></div>
          <div class="col-md-4">
                 <form id="confirmPassword-form" action="${pageContext.request.contextPath}/user/userConfirmVerification"
				method="post" autocomplete="off">
                    <div class="price-card">
                    <input type="hidden"id="id-userId" name="userId" value="${userId}"/>
                        <%-- <center> --%>
                             <div class="card-header" style="background-color:#F0AD4E;">
                                <i class="fa fa-child" aria-hidden="true"></i>
                                <h2>Change Password</h2>
                            </div>
                            <div class="card-body">
							   <div>&nbsp;</div>
                               <input type="password" id="id-new-password" name="password" class="form-control" placeholder="New Password">
							   <div>&nbsp;</div>
							   <input type="password" id="id-confirm-password" name="confirmPassword" class="form-control" placeholder="Confirm Password">
							  
                            </div>
							<div>&nbsp;</div>
							<button id="id-verification-btn" type="button" class="btn btn-success btn-green">Submit</button>
							 <br><br>
                           <!--  <a href="#" class="btn btn-success btn-green">Sign in</a>	 -->						
                        <%-- </center> --%>
                    </div>
                    </form>
                </div>
		</div>
<!-- 
 <script type="text/javascript">
$("#id-verification-btn").click(function(){
	var newPassword=$("#id-new-password").val();
	var confirmpassword=$("#id-confirm-password").val();
	if(newPassword==confirmpassword){
		$("#confirmPassword-form").submit();
	}
	else{
		toastr.warning("New password and confirm password should be same");
	}

});

</script>
 -->
	</tiles:putAttribute>
</tiles:insertDefinition>
