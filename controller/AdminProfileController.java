/*
** Project              	: GiftCard

** Version No           	: v00.01
** Program Name         	: AdminProfileController
** Author               	: Ramsiya
** Description          	: This program is to update admin profile details and upload admin profile photo
** Date written         	: Aug 2017
*/

package com.interland.giftcard.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.interland.giftcard.dto.UserDetailsDto;
import com.interland.giftcard.service.AdminProfileService;
import com.interland.giftcard.service.AdminProfileServiceImpl;
import com.interland.giftcard.service.ConsumerProfileService;

@Controller
@RequestMapping("/adminProfile")
public class AdminProfileController {
	private static final Logger logger = Logger.getLogger(MerchantProfileController.class.getName());
    @Autowired
    AdminProfileService adminProfileService;
//-----------------------getEmployeeProfileDetails-------------------------------
    
    @RequestMapping(value = "/getAdminProfileDetails", method = RequestMethod.POST)
	public @ResponseBody String getAdminProfileDetails(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		//String merchantId="45";
		String result = "";
		String x=request.getContextPath()+"/resources/users/41/img.png";
		
		try {
			logger.info("Inside getEmployeeProfileDetails() in EmployeeController"+userId+">>>>>>"+userId);
			result = adminProfileService.getAdminProfileDetails(userId,x);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);

		}
		return result;
	}
    
  //---------------------updating section one details---------------------------
	
    /*--------------------------------check current password-------------------------------------*/
	   @RequestMapping(value = "/checkCurrentPassword", method = {
				RequestMethod.POST, RequestMethod.GET })
		public @ResponseBody String checkCurrentPassword(HttpServletRequest request){
		   String retStatus="";
		   boolean blStatus=false;
			HttpSession session = request.getSession();
			String strUserId = (String) session.getAttribute("userId");
			//String strUserId ="45";
			try {
					String password=request.getParameter("password");
					logger.info("inside the method checkCurrentPassword() in UserController");
			       blStatus=adminProfileService.checkCurrentPassword(strUserId, password);
			    	if (blStatus) {
						retStatus= "matching";
					} else {
						retStatus= "fail";
					}
			      
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			logger.info(" Returning status="+retStatus+" from EmployeeController's checkCurrentPassword()");
			return retStatus;
		}	
	   
	   //---------------------updating section one details---------------------------
		
	  	@RequestMapping(value = "/updateAdminProfile", method = RequestMethod.POST)
	  	public ModelAndView updateEmployeeProfile(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,UserDetailsDto userDetailsDto) {
	  		String strNewPassword=request.getParameter("confirmPassword");
	  		HttpSession session = request.getSession();
	  	  boolean blStatus = false;
	  		try
	  		{
	  	String strUserId = (String) session.getAttribute("userId");
	  	              blStatus = adminProfileService.updateConsumerProfileDetails(strUserId,userDetailsDto,strNewPassword);
	  		
	  	                //}
	  	            String loggedUser=(String)session.getAttribute("userName"); 
		  			if(StringUtils.isEmpty(loggedUser)){
				    	   //  model.addAttribute("status", "Invalid UserName or Password");
				    	     model.addAttribute("loggedUser", "");
				    	 }else{
				    		 model.addAttribute("loggedUser", loggedUser);	 
				    	 }
	  	        	
	  			logger.info("Inside updateEmployeeProfile() in EmployeeController");
	  			if (blStatus) {
	  				model.addAttribute("updateStatus", "success");
	  			} else {
	  				model.addAttribute("updateStatus", "fail");
	  			}
	  			modelAndView=new ModelAndView("adminDashboard",model);
	  			
	  		} catch (Exception e) {
	  			logger.error(e.getMessage(), e);
	  		}
	  		logger.info("Return from updateEmployeeProfile() in EmployeeController to employeeProfile");
	  		return modelAndView;
	  	
}
	  	
	  	/*--------------------------------check current password-------------------------------------*/
		   @RequestMapping(value = "/uploadPhoto", method = {
					RequestMethod.POST, RequestMethod.GET })
			public @ResponseBody ModelAndView uploadPhoto(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,
		  			@RequestParam CommonsMultipartFile docFile,UserDetailsDto userDetailsDto){
			   String strNewPassword=request.getParameter("confirmPassword");
		  		HttpSession session = request.getSession();
		  		//String strUserId = "45";
		  		File filePath2 = null;
		  			String strUserId = (String) session.getAttribute("userId");
		  	        boolean blStatus = false;
		  	      	File uploadedMultipartFile;
		  	      	String strDocNameForFolder = null;
		  	      String pathToDb=request.getContextPath()+"/resources/users/"+strUserId+"/"+docFile.getOriginalFilename();
		  	      System.out.println(pathToDb+">>>>PATH TO DB");
		  	        try{
		  	      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		  	            if(isMultipart){
		  	                String filePath= request.getServletContext().getRealPath("");
		  	                System.out.println("File path is "+filePath);
		  	             File file = new File(filePath);
		  	           
		  	             filePath2=new File(file.getCanonicalPath()+"/resources/users/"+strUserId);
		  	                if(!filePath2.exists()){
		  	                	System.out.println("direectory creating...............");
		  	                 filePath2.mkdir();
		  	                String fname = docFile.getOriginalFilename();
		  	              
		  	                uploadedMultipartFile = new File(filePath2+"/"+fname);
		  	              System.out.println(uploadedMultipartFile.getAbsolutePath()+">>>>PATH TO Folder");
		  	                docFile.transferTo(uploadedMultipartFile);
		  	                }else{
		  	                	 String fname = docFile.getOriginalFilename();
		  		  	              
		 	  	                uploadedMultipartFile = new File(filePath2+"/"+fname);
		 	  	              System.out.println(uploadedMultipartFile.getAbsolutePath()+">>>>PATH TO Folder");
		 	  	                docFile.transferTo(uploadedMultipartFile);
		  	                }
		  	              System.out.println(docFile.getOriginalFilename()+">>>>>>>>>>>>>SELECTED FILE NAME::::::::::::::::::::");
		  	                String strDocName=request.getParameter("docName");
		  	              userDetailsDto.setProfilePicture(pathToDb);
		  	            blStatus = adminProfileService.updateConsumerProfileDetails(strUserId,strDocName, userDetailsDto,strDocNameForFolder,strNewPassword);
		  	          String loggedUser=(String)session.getAttribute("userName"); 
			  			if(StringUtils.isEmpty(loggedUser)){
					    	   //  model.addAttribute("status", "Invalid UserName or Password");
					    	     model.addAttribute("loggedUser", "");
					    	 }else{
					    		 model.addAttribute("loggedUser", loggedUser);	 
					    	 }
		  	          if (blStatus) {
			  				model.addAttribute("updateStatus", "success");
			  			} else {
			  				model.addAttribute("updateStatus", "fail");
			  			}
			  			modelAndView=new ModelAndView("adminProfile",model);
			}	
		  	        }
		    catch (Exception e) {
		    	logger.error(e.getMessage(), e);
	  		}
					return modelAndView;
		   }
}
