 $(document).ready(function() {
	 var contextPath = $('#app-context-path').val();
 		var userListTable = $('#id-portalUserList').DataTable({
						"bProcessing" : true,
						"bDeferRender" : true,
						bAutoWidth : false,
						bServerSide : true,
						sAjaxSource : contextPath+ "/user/portalUserList",
						"iDisplayLength" : 5,
						"aLengthMenu" : [ [ 5, 10, 25, 50, 100 ], [ 5, 10, 25, 50, 100 ] ],
						"sPaginationType" : "full_numbers",
						"bPaginate" : true,
						"fnServerParams" : function(aoData) {
						 
							var userName = $("#id-user-name").val();
							if (userName == null || userName == undefined) {
								userName = "";
							}
							var userId = $("#id-user-id").val();
							if (userId == null || userId == undefined) {
								userId = "";
							}
							var dataString = JSON.stringify({
								userName : userName,
								userId : userId
							});
							aoData.push({
								name : "searchData",
								value : dataString
							});
						},
						"fnServerData" : function(sSource, aoData, fnCallback,oSettings) {
							oSettings.jqXHR = $.ajax({
								"dataType" : 'json',
								"type" : "POST",
								"url" : sSource,
								"data" : aoData,
								"success" : fnCallback,
								"error" : function(e) { 
									console.log(e.message);
								}
							});
						},
						"aaSorting" : [ [ 0, "asc" ] ],
						"sDom" : 'rt<lp>',
						"aoColumns" : [ {
							"mDataProp" : "userId",
							"bSortable" : false,
							"bVisible" : true
						}, {
							"mDataProp" : "userName",
							"bSortable" : false,
							"bVisible" : true
						}, {
							"mDataProp" : "emailId",
							"bSortable" : false,
						}, {
							"mDataProp" : "cellPhone",
							"bSortable" : false,
						}, {
							"mDataProp" : "status",
							"bSortable" : false,
						},  ],
						'columnDefs': [
						              		{
						                		'targets': 0,
						                		'createdCell':  function (td, cellData, rowData, row, col) {
						                   			$(td).attr('data-title', 'User ID'); 
						                		}
						             		},
						             		{
						                		'targets': 1,
						                		'createdCell':  function (td, cellData, rowData, row, col) {
						                   			$(td).attr('data-title', 'User Name'); 
						                		}
						             		},
						             		{
						                		'targets': 2,
						                		'createdCell':  function (td, cellData, rowData, row, col) {
						                   			$(td).attr('data-title', 'Email ID'); 
						                		}
						             		},
						             		{
						                		'targets': 3,
						                		'createdCell':  function (td, cellData, rowData, row, col) {
						                   			$(td).attr('data-title', 'Mobile Number'); 
						                		}
						             		},
						             		{
						                		'targets': 4,
						                		'createdCell':  function (td, cellData, rowData, row, col) {
						                   			$(td).attr('data-title', 'Status'); 
						                		}
						             		}
						          		]
					});
 		
 		var merchantDetails=null;
 		$('#id-portalUserList').on( 'click', 'tr', function() {
 			 if ($(this).hasClass('selected')) {
				  $(this).removeClass('selected');
				  merchantDetails = null;
 			 } else {
 				userListTable.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
				merchantDetails = userListTable.row(this).data();

				}
		 });
 		
 		$("#id_search_user").click(function(){
 			data=null;
 			userListTable.draw();
 		});
 		$("#id_clear_user").click(function(){
 			data=null;
 			$("#id-user-name").val("");
 			$("#id-user-id").val("");
 			userListTable.draw();
 		});
 		
 		$('#id-editUser').click(function() {
 			if(merchantDetails!=null){
 				$('#id-userDetails-edit').modal("show");
 				$('#id-edit-emailId').val(merchantDetails.emailId);
 				$('#id-edit-mobileNumber').val(merchantDetails.cellPhone);
 				$('#id-edit-userName').val(merchantDetails.userName);
 				$('#id-edit-userId').val(merchantDetails.userId);
 			}else{
 				toastr.warning("Please select a row");
 			}
 		  });
 		
 		$('#btn-verify-confirm').click(function() {
 			var userId=merchantDetails.userId
 			if(userId==""||userId==null){
 				toaster.warning("Please Refresh The Page")
 			}else{
 				$.ajax({
 					type : 'POST',
 					url : contextPath +"/user/verifyCorpUser",
 					dataType : "json",
 					data:{userId:userId},
 					success : function(data) {
 			        	if (data.status == 'Success') {
 			        		userListTable.draw();
 							 toastr.success(data.message);
 							$('#id-user-verify-modal').modal("hide");  
 						} else {
 								toastr.warning(data.message);
 						}

 					},
 					error : function(jqXHR, textStatus, errorThrown) {
 						alert("Exception in verifyMerchant" + errorThrown);
 					}
 				});
 			 }
});
 		
 		
 	$('#id-verify-user').click(function() {
 			if(merchantDetails!=null){
 				if(merchantDetails.status=="VERIFIED"){
 					toastr.warning("User is already verified");
 				}else{
 					$('#id-user-verify-modal').modal("show");
 				}
 			}else{
 				toastr.warning("Please select a row");
 			}
 	});
 	
	$('#id-deleteUser').click(function() {
			if(merchantDetails!=null){
				$('#id-user-delete-modal').modal("show");  
			}else{
				toastr.warning("Please select a row");
			}
	});
 	
	
	
		$('#btn-delete-user-confirm').click(function() {
 			var userId=merchantDetails.userId
 			if(userId==""||userId==null){
 				toaster.warning("Please Refresh The Page")
 			}else{
 				$.ajax({
 					type : 'POST',
 					url : contextPath +"/user/deleteCorpUser",
 					dataType : "json",
 					data:{userId:userId},
 					success : function(data) {
 			        	if (data.status == 'Success') {
 			        		userListTable.draw();
 							 toastr.success(data.message);
 							$('#id-user-delete-modal').modal("hide");  
 						} else {
 								toastr.warning(data.message);
 						}

 					},
 					error : function(jqXHR, textStatus, errorThrown) {
 						alert("Exception in verifyMerchant" + errorThrown);
 					}
 				});
 			 }
});
	
 		$('#id-create-user').click(function() {
 			$('#id-userDetails-create').modal("show");
 		  });
  		
 		$('#edit_user_btn').click(function() {
 			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 				if($('#id-edit-userName').val().trim()==""){
					toastr.warning("Please enter the User Name");
				}else if($('#id-edit-mobileNumber').val().trim()==""){
 					toastr.warning("Please enter the Mobile Number");
 				}else if($('#id-edit-emailId').val().trim()==""){
 					 toastr.warning("Please enter Email Id");
 				}else if(regex.test($('#id-edit-emailId').val())==false){
 					toastr.warning("Please enter valid Email Id"); 
 				}else if($('#id-edit-userId').val()!=merchantDetails.userId){
 					toastr.warning("Please refresh the Page");
 				}else{
 					$.ajax({
 						type : 'POST',
 						url :contextPath+"/user/updateCorporateUser",
 						dataType : "json",
 						data:$("#id-form-edit-user").serialize(),
 						success : function(data) {
 							if(data.status=="Success"){
 								toastr.success(data.message);
 								$('#id-userDetails-edit').modal('hide');
 	 							userListTable.draw();
 							}else {
 								toastr.warning(data.message);
 							}
 						},
 						error : function(jqXHR, textStatus, errorThrown) {
 							alert("Exception in Saving file" + errorThrown);
 						}
 					});
 				}
 		
 		});
 		
 		
 		$('#btn-create-cancel-user').click(function() {
 			$('#id-form-create-User')[0].reset();
 		});
 		$('#btn-create-user').click(function() {
 			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 				if($('#id-create-userId').val().trim()==""){
 					toastr.warning("Please enter User ID");
 				}else if($('#id-create-userName').val().trim()==""){
					 toastr.warning("Please enter User Name ");
				}else if($('#id-create-mobileNumber').val().trim()==""){
					toastr.warning("Please enter the Mobile Number");
				}else if($('#id-create-emailId').val().trim()==""){
					toastr.warning("Please enter the Email ID");
				}else if(regex.test($('#id-create-emailId').val())==false) 
					 toastr.warning("Please enter valid Email Id"); 
				 else if($('#id-create-password').val().trim()==""){
					toastr.warning("Please enter Password");
				}else if($('#id-create-confirmPassword').val().trim()==""){
					toastr.warning("Please enter Confirm-Password");
				}else if($('#id-create-password').val()!=$('#id-create-confirmPassword').val()){
					   toastr.warning("Password and Confirm Password are not matching");
				}else{
					$.ajax({
						type : 'POST',
						url :contextPath+"/user/createCorpUser",
						dataType : "json",
						data:$("#id-form-create-User").serialize(),
						success : function(data) {
							if(data.status=="Success"){
								toastr.success(data.message);
								$('#id-userDetails-create').modal('hide');
								$('#id-form-create-User')[0].reset();
	 							userListTable.draw();
							}else {
								toastr.warning(data.message);
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("Exception in Saving file" + errorThrown);
						}
					});
				}
		
		});
	 
 });