
function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
//alert(getContextPath+"getContextPath");
var qrCode;
var qrCodeabc;
$(document).ready(function(){
	$.ajax({
        url: getContextPath()+"/myQRCode/getQRCode",
        type: 'POST',
        dataType: "json",
        success: function(data) {
        	//qrCode=data.qrCode;
        	/*$("#id_image_qr_code").attr("src","data:image/png;base64," + data.qrCode);
        	qrCodeabc=Convert.ToBase64String($("#id_image_qr_code").attr("src","data:image/png;base64," + data.qrCode));*/
        	
        	$("#id_image_qr_code").attr("src",getContextPath()+"/"+data.path);
       
        },
        error: function() {
        	
        }
    });
	
	  $('#id_btn_image_card').click(function(){
	        var a = $("<a>").attr("href", $("#id_image_qr_code").attr('src')).attr("download", "QR Code.png").appendTo("body");
	        a[0].click();
	    });
	  
	  $("#id_print_btn_qrcode").click(function(){
		var  qrcode=$("#id_image_qr_code").attr("src");
			window.location.href=getContextPath()+"/myQRCode/printQrCode";
	  });
});