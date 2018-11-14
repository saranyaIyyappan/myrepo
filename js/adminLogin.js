function getContextPath() {
	    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 }

$(document).ready(function() {
//-----------------------------Admin Login----------------------------------------------------------//
	 $("#id-admin-login").click(function(){
		 $.ajax({
				url : getContextPath() + "/user/login",
				type : 'POST',
				data:$("#id_form_admin_login").serialize(),
				dataType : "text",
				success : function(data) {
					
					if(data!="Invalid UserName or Password" && data!="Server Problem"){
						window.location.href= getContextPath() +data;
					}else{
						toastr.warning("Invalid Username or Password")
					}
				},
										error : function() {
											alert("Exception in adminlogin" + errorThrown);
										}
									}); 
	 
	 });
});
//---------adminLoginController/adminLoginScreen