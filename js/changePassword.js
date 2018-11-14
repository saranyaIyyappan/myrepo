
$(document).ready(function() {
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
});