function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function() {
	$('#horizontalTab').easyResponsiveTabs({
		type : 'default', //Types: default, vertical, accordion           
		width : 'auto', //auto or any width like 600px
		fit : true, // 100% fit in a container
		closed : 'accordion', // Start closed if in accordion view
		activate : function(event) { // Callback function if tab is switched
			var $tab = $(this);
			var $info = $('#tabInfo');
			var $name = $('span', $info);
			$name.text($tab.text());
			$info.show();
		}
	});
	getAllThemesAndImages();
	getAllGroupsForCategory();
	getAllMerchantLogo();
	$("#id_btn_viewBalance_dropdown").click(function(){
		if($("#id_hdn_loggeduser").val()==""){
			toastr.warning("Please Login To Continue.....");
			$("#id_login_modal").modal("show");
		}
	});
	
	$("#id_select_group").change(function(){
		if($("#id_select_group").val()!="")
		getCardsByGroup($("#id_select_group option:selected").text(),$("#id_select_group").val());
	});
	$("#id_select_theme").change(function(){
		if($("#id_select_theme").val()!="")
		getCardsByTheme($("#id_select_theme option:selected").text(),$("#id_select_theme").val());
	});
	
});

function getAllThemesAndImages(){
	$.ajax({
		url : getContextPath() + "/home/getCardThemeForHomePage",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_ul_occassions_category").empty();
		   // getCardsByTheme(data[0].cardThmEng,data[0].cardThm);
			$("#id_select_theme").empty();
			$("#id_select_theme").append('<option value="">Search By Occassions</option>')
			for(var i in data){
				$("#id_select_theme").append('<option value="'+data[i].cardThm+'">'+data[i].cardThmEng+'</option>')
				$("#id_ul_occassions_category").append('<li><a href="#id_div_card_view_section" class="category_class nav-link js-scroll-trigger" onclick="getCardsByTheme(\''+data[i].cardThmEng+'\',\''+data[i].cardThm+'\')">'+data[i].cardThmEng+'</a></li>');
			}
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}

function getAllGroupsForCategory(){
	$.ajax({
		url : getContextPath() + "/home/getCardGroupForHomePage",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_ul_group_category").empty();
			$("#id_select_group").empty();
			$("#id_select_group").append('<option value="">Search By Type</option>')
			for(var i in data){
				$("#id_select_group").append('<option value="'+data[i].cardGrp+'">'+data[i].cardGrpEng+'</option>')
				$("#id_ul_group_category").append('<li><a href="#id_div_card_view_section" class="category_class nav-link js-scroll-trigger" onclick="getCardsByGroup(\''+data[i].cardGrpEng+'\',\''+data[i].cardGrp+'\')">'+data[i].cardGrpEng+'</a></li>');
			}
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}

function getCardsByGroup(name,id){
	$("#id_li_category_0").text(name);
	$.ajax({
		url : getContextPath() + "/home/getCardImageByGroupForHomePage",
		type : 'POST',
		data:{group:id},
		dataType : "json",
		success : function(data) {
			console.log(data);
			$("#id_div_get_all_merchantLogo").empty();
var designImageDiv="";
for(var i in data){		
			if(data[i].designImage!="No Image Found"){
			//testImageDiv='<div class="col-md-3"><div class="flipperroundbox"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png" style="padding-bottom: 8px;"><h4 class="fliphead">'+data[i].merchantName+'</h4><div class="flip-container" onClick="purchaseCard('+i+',\''+data[i].merchantId+'\')"><div class="flipper"><div class="front"><img class="img-responsive" src="data:image/png;base64,'+data[i].designImage+'"><p class="pickclr">Shopping Items</p></div><div class="back"><img id="id_img_'+i+'" class="img-responsive" src="data:image/png;base64,'+data[i].designImage+'"><div class="pickcard">Pick This Gift Card</div></div></div></div></div></div>';
			designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
			'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
			'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
				'alt="" title=""></span> <a data-target=".brand-modal"'+
				'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
			'<div class="flipper">'+
				'<figure class="front">'+
					'<div class="block">'+
						'<strong><span>'+data[i].merchantName+'</span></strong> '+
						'<img class="img-responsive" width="100%"src="'+getContextPath()+'/'+data[i].designImage+'" style="width:237px;height:154px;" >'+
					'</div>'+
				'</figure>'+
				'<figure class="back">'+
					'<div class="back-block">'+
						'<span class="col-md-12 p-a-0 title">'+ 
						'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
						'<img class="img-responsive" width="100%" src="'+getContextPath()+'/'+data[i].designImage+'" style="width:277px;height:180px;" >'+
						'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
					'</div>'+
				'</figure>'+
			'</div>'+
		'</div>'+
		'</div>';
			
			}else{
				var defImg=getContextPath()+'/resources/giftCardHome/images/not_found.png';
				designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
				'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
				'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
					'alt="" title=""></span> <a data-target=".brand-modal"'+
					'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
				'<div class="flipper">'+
					'<figure class="front">'+
						'<div class="block">'+
							'<strong><span>'+data[i].merchantName+'</span></strong> '+
							'<img class="img-responsive"width="100%" src="'+defImg+'" style="width:237px;height:154px;">'+
						'</div>'+
					'</figure>'+
					'<figure class="back">'+
						'<div class="back-block">'+
							'<span class="col-md-12 p-a-0 title">'+ 
							'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
							'<img class="img-responsive" width="100%" src="'+defImg+'"  style="width:277px;height:180px;" >'+
							'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
						'</div>'+
					'</figure>'+
				'</div>'+
			'</div>'+
			'</div>';
			}
			$("#img-load-mer-logo").show();
			$("#id_div_get_all_merchantLogo").append(designImageDiv);
			$("#img-load-mer-logo").hide();
			
		}
		},
								error : function() {
									alert("Exception in getCardsByGroup" + errorThrown);
								}
							}); 
}
function getCardsByTheme(name,id){
	
	$("#id_li_category_0").text(name);
	$.ajax({
		url : getContextPath() + "/home/getCardImageByThemeForHomePage",
		type : 'POST',
		data:{theme:id},
		dataType : "json",
		success : function(data) {
			$("#id_div_get_all_merchantLogo").empty();
			/*if(data.length<=0){
				$("#id_li_category_0").hide();
				var noResultsDiv='<div class="col-md-4"></div><div class="col-md-8"><img src="'+getContextPath()+'/resources/giftCardHome/images/not_found.png"></div>';
				noResultsDiv=noResultsDiv+'<div class="col-md-4"></div><div class="col-md-8"><p style="font-size: 26px;font-weight: 500;"> Sorry, no results found! </p></div>';
				
				noResultsDiv=noResultsDiv+'<div class="col-md-3"></div><div class="col-md-9"><p style="color: #878787;font-size: 20px;"> Please check the spelling or try searching for something else </p></div>'
				$("#id_div_img_tab").append(noResultsDiv);
			}else{
				$("#id_li_category_0").show();
			}*/
		//	$("#id_test_images").empty();
		for(var i in data){
			
			/*var dataImg=data[i].arrCategoryImages;
			for(var j in dataImg){
				$("#id_test_images").append('<img src="'+getContextPath()+'/'+dataImg[j].categoryDesignUrl+'" width="150px" height="150px">');
			}*/
			
			
			
			
			var designImageDiv="";
			
			if(data[i].designImage!="No Image Found"){
			designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
			'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
			'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
				'alt="" title=""></span> <a data-target=".brand-modal"'+
				'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
			'<div class="flipper">'+
				'<figure class="front">'+
					'<div class="block">'+
						'<strong><span>'+data[i].merchantName+'</span></strong> '+
						'<img class="img-responsive" width="100%"src="'+getContextPath()+'/'+data[i].designImage+'" style="width:237px;height:154px;" >'+
					'</div>'+
				'</figure>'+
				'<figure class="back">'+
					'<div class="back-block">'+
						'<span class="col-md-12 p-a-0 title">'+ 
						'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
						'<img class="img-responsive" width="100%" src="'+getContextPath()+'/'+data[i].designImage+'" style="width:277px;height:180px;" >'+
						'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
					'</div>'+
				'</figure>'+
			'</div>'+
		'</div>'+
		'</div>';
			
			}else{
				var defImg=getContextPath()+'/resources/giftCardHome/images/not_found.png';
				designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
				'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
				'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
					'alt="" title=""></span> <a data-target=".brand-modal"'+
					'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
				'<div class="flipper">'+
					'<figure class="front">'+
						'<div class="block">'+
							'<strong><span>'+data[i].merchantName+'</span></strong> '+
							'<img class="img-responsive"width="100%" src="'+defImg+'" style="width:237px;height:154px;">'+
						'</div>'+
					'</figure>'+
					'<figure class="back">'+
						'<div class="back-block">'+
							'<span class="col-md-12 p-a-0 title">'+ 
							'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
							'<img class="img-responsive" width="100%" src="'+defImg+'"  style="width:277px;height:180px;" >'+
							'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
						'</div>'+
					'</figure>'+
				'</div>'+
			'</div>'+
			'</div>';
			}
			$("#img-load-mer-logo").show();
			$("#id_div_get_all_merchantLogo").append(designImageDiv);
			$("#img-load-mer-logo").hide();
		}
		//$("#id_mod_cat_img").modal('show'); for test purpose
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}


function getAllMerchantLogo(){
	
	$.ajax({
		url : getContextPath() + "/home/getAllMerchantLogo",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_div_get_all_merchantLogo").empty();
		for(var i in data){
			
			/*var dataImg=data[i].arrCategoryImages;
			for(var j in dataImg){
				$("#id_test_images").append('<img src="'+getContextPath()+'/'+dataImg[j].categoryDesignUrl+'" width="150px" height="150px">');
			}*/
			var designImageDiv="";
			
			if(data[i].designImage!="No Image Found"){
			designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
			'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
			'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
				'alt="" title=""></span> <a data-target=".brand-modal"'+
				'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
			'<div class="flipper">'+
				'<figure class="front">'+
					'<div class="block">'+
						'<strong><span>'+data[i].merchantName+'</span></strong> '+
						'<img class="img-responsive" width="100%"src="'+getContextPath()+'/'+data[i].designImage+'" style="width:237px;height:154px;" >'+
					'</div>'+
				'</figure>'+
				'<figure class="back">'+
					'<div class="back-block">'+
						'<span class="col-md-12 p-a-0 title">'+ 
						'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
						'<img class="img-responsive" width="100%" src="'+getContextPath()+'/'+data[i].designImage+'" style="width:277px;height:180px;" >'+
						'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
					'</div>'+
				'</figure>'+
			'</div>'+
		'</div>'+
		'</div>';
			
			}else{
				var defImg=getContextPath()+'/resources/giftCardHome/images/not_found.png';
				designImageDiv='<div class="col-md-3 col-sm-4 col-xs-6 p-l-0 brand brand-item brand-item-preloaded brand_10">'+
				'<div class="flip-container"ontouchstart="this.classList.toggle("hover");">'+
				'<span class="right">SAR</span> <span class="pin"><img src="'+getContextPath()+'/resources/giftCardHome/images/pin-f1f1f1.png"'+
					'alt="" title=""></span> <a data-target=".brand-modal"'+
					'class="brand-modal-wrapper gtm-brand brand-id-10 gtm-virgin-megastore-10-ae  brand_popup">'+data[i].merchantName+'</a>'+
				'<div class="flipper">'+
					'<figure class="front">'+
						'<div class="block">'+
							'<strong><span>'+data[i].merchantName+'</span></strong> '+
							'<img class="img-responsive"width="100%" src="'+defImg+'" style="width:237px;height:154px;">'+
						'</div>'+
					'</figure>'+
					'<figure class="back">'+
						'<div class="back-block">'+
							'<span class="col-md-12 p-a-0 title">'+ 
							'</span> <strong class="col-md-12 col-sm-12 p-a-0"><span>'+data[i].merchantName+'</span></strong>'+				
							'<img class="img-responsive" width="100%" src="'+defImg+'"  style="width:277px;height:180px;" >'+
							'<span class="btn" onClick="purchaseCardPage(\''+data[i].merchantId+'\')"><i class="icon-arrow-right-1 icon_span"></i> Pick this Gift Card </span>'+
						'</div>'+
					'</figure>'+
				'</div>'+
			'</div>'+
			'</div>';
			}
			$("#img-load-mer-logo").show();
			$("#id_div_get_all_merchantLogo").append(designImageDiv);
			$("#img-load-mer-logo").hide();
		}
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}



function getCardBalance(){
	$.ajax({
		url : getContextPath() + "/home/getCardBalance",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			
				$("#id_btn_viewBalance_dropdown").html("Balance"+"<i class='fa fa-caret-down'></i>");
				$("#id_btn_viewBalance_dropdown").attr("data-toggle","dropdown");
				for(var i in data){
					$("#id_sub_ul_view_balance").append('<li><a href="#">'+data[i].cardId+"(SAR "+data[i].balAmount+")"+' </a></li>');
				}
		
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}

function purchaseCard(image,merchantId){
	$("#id_hdn_previeModal_merchantId").val(merchantId);
	$("#id_preview_image_in_modal").attr("src",$("#id_img_"+image).attr("src"));
	$("#id_preview_modal_purchase").modal("show");
	
}

function purchaseCardPage(merchantId){
	$("#id_hdn_previeModal_merchantId").val(merchantId);
	$("#id_form_purchaseCard").submit();
}

