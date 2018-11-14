/*
** Project              	: GiftCard
** Version No           	: v00.01
** Program Name         	: MerchantProfileController
** Author               	: Ramsiya
** Description          	: This program is to update merchant5 profile details and upload merchant profile photo
** Date written         	: Aug 2017
*/
package com.interland.giftcard.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;







import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.interland.giftcard.dto.MerchantDetailsDto;
import com.interland.giftcard.dto.UserDetailsDto;
import com.interland.giftcard.service.MerchantProfileService;

@Controller
@RequestMapping("/merchantProfile")
public class MerchantProfileController {
	private static final Logger logger = Logger.getLogger(MerchantProfileController.class.getName());
    @Autowired
    MerchantProfileService merchantProfileService;
    @Value("${PIC_DIR}")
	private String imagePathDirectory;
    /*@Value("${EMAIL_VER_CONTENT}")
	private String emailVerContent;
    @Value("${VERIFY_FROM_ADDRS}")
	private String verFromAddress;*/
//-----------------------getEmployeeProfileDetails-------------------------------
    
    @RequestMapping(value = "/getMerchantProfileDetails", method = RequestMethod.POST)
	public @ResponseBody String getMerchantProfileDetails(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String merchantId = (String) session.getAttribute("userId");
		String result = "";
		
		try {
			logger.info("Inside getMerchantProfileDetails() in MerchantProfileController"+merchantId+">>>>>>"+merchantId);
			result = merchantProfileService.getMerchantProfileDetails(merchantId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

		}
		//logger.info(clinicId+ " Return from getEmployeeProfileDetails() in EmployeeController to " + result);
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
			//String strUserId = (String) session.getAttribute("userId");
			String strUserId = (String) session.getAttribute("userId");
			try {
					String password=request.getParameter("password");
					logger.info("inside the method checkCurrentPassword() in MerchantProfileController");
			        blStatus=merchantProfileService.checkCurrentPassword(strUserId, password);
			    	if (blStatus) {
						retStatus= "matching";
					} else {
						retStatus= "fail";
					}
			      
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			logger.info(" Returning status="+retStatus+" from MerchantProfileController checkCurrentPassword()");
			return retStatus;
		}	
	   
	   //---------------------updating section one details---------------------------
		
	  	@RequestMapping(value = "/updateMerchantProfile", method = RequestMethod.POST)
	  	public String updateEmployeeProfile(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,MerchantDetailsDto merchantDetailsDto,RedirectAttributes redirectAttributes) {
	  		String strNewPassword=request.getParameter("confirmPassword");
	  		HttpSession session = request.getSession();
	  		
	  		String strUserId = (String) session.getAttribute("userId");
	  		 String strDocName = null;
	  	        boolean blStatus = false;
	  	      	String strDocNameForFolder = null;
	  	        try{
					blStatus = merchantProfileService.updateMerchantProfile(strUserId,strDocName, merchantDetailsDto,strDocNameForFolder,strNewPassword);
	  			logger.info("Inside updateMerchantProfile() in MerchantProfileController");
	  			 String loggedUser=(String)session.getAttribute("userName"); 
	  			if(StringUtils.isEmpty(loggedUser)){
	  				redirectAttributes.addFlashAttribute("loggedUser", "");
			    	 }else{
			    		 redirectAttributes.addFlashAttribute("loggedUser", loggedUser);	 
			    	 }
	  			if (blStatus) {
	  				redirectAttributes.addFlashAttribute("updateStatus", "success");
	  			} else {
	  				redirectAttributes.addFlashAttribute("updateStatus", "fail");
	  			}
	  	      }
	  			
	  		 catch (Exception e) {
	  			logger.error(e.getMessage(), e);
	  		}
	  		logger.info("Return from updateMerchantProfile() in MerchantProfileController to employeeProfile");
	  		return "redirect:/merchantProfile/merchantProfile";
	  	}

	 	/*--------------------------------uploadPhoto-------------------------------------*/
		   @RequestMapping(value = "/uploadPhoto", method = {
					RequestMethod.POST, RequestMethod.GET })
			public String uploadPhoto(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,
		  			@RequestParam CommonsMultipartFile docFile,MerchantDetailsDto merchantDetailsDto,RedirectAttributes redirectAttributes){
		  		HttpSession session = request.getSession();
		  		//String strUserId = "45";
		  			String strUserId = (String) session.getAttribute("userId");
		  	        boolean blStatus = false;
		  	      	String strDocNameForFolder = null;
		  	      String pathToDb=request.getContextPath()+"/resources/users/"+strUserId+"/"+docFile.getOriginalFilename();
		  	      System.out.println(pathToDb+">>>>PATH TO DB");
		  	        try{
		  	      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		  	            if(isMultipart){
		  	                
		  	              String path=imagePathDirectory+"/users/"+strUserId;
	  	                  File fileFolderOfServer=new File(path);//user id 
	  	                   if(!fileFolderOfServer.exists()){
	  	                      fileFolderOfServer.mkdirs();
	  	                     }
	  	                        String fileName= docFile.getOriginalFilename();
	  	                        File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
	  	                        docFile.transferTo(fileToUpload);
	  	                       String filePathToDb=  fileToUpload.getPath();
	  	                      logger.info("File to DB Path:::"+fileToUpload.getPath());
		  	                
		  	              merchantDetailsDto.setProfilePicture(filePathToDb);
		  	            blStatus = merchantProfileService.updatePhoto(strUserId,merchantDetailsDto,strDocNameForFolder);
		  	          String loggedUser=(String)session.getAttribute("userName"); 
			  			if(StringUtils.isEmpty(loggedUser)){
			  				redirectAttributes.addFlashAttribute("loggedUser", "");
					    	 }else{
					    		 redirectAttributes.addFlashAttribute("loggedUser", loggedUser);	 
					    	 }
		  	          if (blStatus) {
		  	        	redirectAttributes.addFlashAttribute("updateStatus", "success");
			  			} else {
			  				redirectAttributes.addFlashAttribute("updateStatus", "fail");
			  			}
			}	
		  	        }
		    catch (Exception e) {
		    	logger.error(e.getMessage(), e);

	  		}
					return "redirect:/merchantProfile/merchantProfile";
		   }
		   
		   @RequestMapping(value = "/merchantProfile", method = RequestMethod.GET)
					public String merchantProfile(Model model,
							HttpServletRequest request) throws Exception {
						HttpSession session = request.getSession();
						String loggedUser = (String) session.getAttribute("userName");
								if (StringUtils.isEmpty(loggedUser)) {
									model.addAttribute("loggedUser", "");
								} else {
									model.addAttribute("loggedUser", loggedUser);
								}
								return "merchantProfile";
							}
}
