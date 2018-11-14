/*
** Project              	: GiftCard
** Version No           	: v00.01
** Program Name         	: ConsumerProfileController
** Author               	: Ramsiya
** Description          	: This program is to update consumer profile details and upload consumer profile photo
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
import com.interland.giftcard.service.ConsumerProfileService;
import com.interland.giftcard.service.MerchantProfileService;

@Controller
@RequestMapping("/consumerProfile")
public class ConsumerProfileController {
	private static final Logger logger = Logger.getLogger(ConsumerProfileController.class.getName());
    @Autowired
    ConsumerProfileService consumerProfileService;
    @Value("${PIC_DIR}")
	private String imagePathDirectory;
    @Value("${PIC_REP_PATH}")
	  private String imageReplacePath;
    
//-----------------------getConsumerProfileDetails-------------------------------
    
    @RequestMapping(value = "/getConsumerProfileDetails", method = RequestMethod.POST)
	public @ResponseBody String getConsumerProfileDetails(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String result = "";
		
		try {
			logger.info("Inside getConsumerProfileDetails() in ConsumerProfileController"+userId+">>>>>>"+userId);
			result = consumerProfileService.getConsumerProfileDetails(userId,imageReplacePath);
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
					logger.info("inside the method checkCurrentPassword() in ConsumerProfileController");
			       blStatus=consumerProfileService.checkCurrentPassword(strUserId, password);
			    	if (blStatus) {
						retStatus= "matching";
					} else {
						retStatus= "fail";
					}
			      
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			logger.info(" Returning status="+retStatus+" from ConsumerProfileController checkCurrentPassword()");
			return retStatus;
		}	
	   
	   //---------------------updating section one details---------------------------
		
	  	@RequestMapping(value = "/updateConsumertProfile", method = RequestMethod.POST)
	  	public String updateConsumertProfile(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,UserDetailsDto userDetailsDto,RedirectAttributes redirectAttributes) {
	  		String strNewPassword=request.getParameter("confirmPassword");
	  		HttpSession session = request.getSession();
	  	  boolean blStatus = false;
	  		try
	  		{
	  	String strUserId = (String) session.getAttribute("userId");
	  	              blStatus = consumerProfileService.updateConsumerProfileDetails(strUserId,userDetailsDto,strNewPassword);
	  			logger.info("Inside updateConsumertProfile() in EmployeeController");
	  			 String loggedUser=(String)session.getAttribute("userName"); 
		  			if(StringUtils.isEmpty(loggedUser)){
				    	   //  model.addAttribute("status", "Invalid UserName or Password");
		  				redirectAttributes.addFlashAttribute("loggedUser", "");
				    	 }else{
				    		 redirectAttributes.addFlashAttribute("loggedUser", loggedUser);	 
				    	 }
	  			if (blStatus) {
	  				redirectAttributes.addFlashAttribute("updateStatus", "success");
	  			} else {
	  				redirectAttributes.addFlashAttribute("updateStatus", "fail");
	  			}
	  			
	  		} catch (Exception e) {
	  			logger.error(e.getMessage(), e);

	  		}
	  		logger.info("Return from updateConsumertProfile() in ConsumerProfileController to updateConsumertProfile");
	  		return "redirect:/consumerProfile/consumerProfile";
	  	
}
	  	
	  	/*--------------------------------check current password-------------------------------------*/
		   @RequestMapping(value = "/uploadPhoto", method = {
					RequestMethod.POST, RequestMethod.GET })
			public String uploadPhoto(HttpServletRequest request,ModelAndView modelAndView,ModelMap model,RedirectAttributes redirectAttributes,
		  			@RequestParam CommonsMultipartFile docFile,UserDetailsDto userDetailsDto){
			   String strNewPassword=request.getParameter("confirmPassword");
		  		HttpSession session = request.getSession();
		  		//String strUserId = "45";
		  		File filePath2 = null;
		  			String strUserId = (String) session.getAttribute("userId");
		  	        boolean blStatus = false;
		  	      	File uploadedMultipartFile;
		  	      	String strDocNameForFolder = null;
		  	      String pathToDb=imagePathDirectory+"/users/"+strUserId+"/"+docFile.getOriginalFilename();
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
		
		  	                userDetailsDto.setProfilePicture(filePathToDb);
		  	                blStatus = consumerProfileService.updateConsumerProfileDetails(strUserId,fileName, userDetailsDto,strDocNameForFolder,strNewPassword);
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
					return "redirect:/consumerProfile/consumerProfile";
		   }
		   
		   @RequestMapping(value = "/consumerProfile", method = RequestMethod.GET)
			public String consumerProfile(Model model,
					HttpServletRequest request) throws Exception {
				HttpSession session = request.getSession();
				String loggedUser = (String) session.getAttribute("userName");
						if (StringUtils.isEmpty(loggedUser)) {
							model.addAttribute("loggedUser", "");
						} else {
							model.addAttribute("loggedUser", loggedUser);
						}
						return "consumerProfile";
					}
}
