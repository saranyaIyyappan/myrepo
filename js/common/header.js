function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
}
$(document).ready(function() {
	getAllThemesAndImages();
	getAllGroupsForCategory();
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
	paypal.minicart.render({
		action : '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}

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
	$('#verticalTab').easyResponsiveTabs({
		type : 'vertical',
		width : 'auto',
		fit : true
	});

	$().UItoTop({
		easingType : 'easeOutQuart'
	});
	$('.counter').countUp();

	$(".scroll").click(function(event) {
		event.preventDefault();
		$('html,body').animate({
			scrollTop : $(this.hash).offset().top
		}, 1000);
	});


});



function getAllThemesAndImages(){
	
	$.ajax({
		url : getContextPath() + "/home/getCardThemeForHomePage",
		type : 'POST',
		dataType : "json",
		success : function(data) {
			$("#id_ul_occassions_category").empty();
			//getCardsByTheme(data[0].cardThmEng,data[0].cardThm);
			for(var i in data){
				$("#id_ul_occassions_category").append('<li><a href="" class="category_class" onclick="getCardsByTheme(\''+data[i].cardThmEng+'\',\''+data[i].cardThm+'\')">'+data[i].cardThmEng+'</a></li>');
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
			for(var i in data){
			 
				$("#id_ul_group_category").append('<li><a href="" class="category_class" onclick="getCardsByGroup(\''+data[i].cardGrpEng+'\',\''+data[i].cardGrp+'\')">'+data[i].cardGrpEng+'</a></li>');
			}
		},
								error : function() {
									alert("Exception in getAllThemesAndImages" + errorThrown);
								}
							}); 
}
