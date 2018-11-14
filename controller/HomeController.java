package com.interland.giftcard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.interland.giftcard.service.HomeService;


@Controller
@RequestMapping("/home")
public class HomeController {

	private static final Logger logger = Logger.getLogger(HomeController.class.getName());
	  @Autowired
	  HomeService homeService;
	  
	    @RequestMapping(value = "/getCardThemeForHomePage" , method = RequestMethod.POST)  
		   public @ResponseBody String getCardThemeForHomePage(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   returnStatus=homeService.getCardThemeForHomepage();
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
	   
	    @RequestMapping(value = "/getCardGroupForHomePage" , method = RequestMethod.POST)  
		   public @ResponseBody String getCardGroupForHomePage(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   returnStatus=homeService.getCardGroupForHomepage();
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
	    
	    @RequestMapping(value = "/getCardImageByGroupForHomePage" , method = RequestMethod.POST)  
		   public @ResponseBody String getCardImageByGroupForHomePage(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   String strGroup=request.getParameter("group");
				   returnStatus=homeService.getMerchantLogoByGroup(strGroup);
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
	    @RequestMapping(value = "/getCardImageByThemeForHomePage" , method = RequestMethod.POST)  
		   public @ResponseBody String getCardImageByThemeForHomePage(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   String strTheme=request.getParameter("theme");
				   returnStatus=homeService.getMerchantLogoByTheme(strTheme);
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
	    
	    @RequestMapping(value = "/getCardBalance" , method = RequestMethod.POST)  
		   public @ResponseBody String getCardBalance(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				     HttpSession session = request.getSession();
			    	 String userId=(String)session.getAttribute("userId"); 
				   returnStatus=homeService.getAllCardBalance(userId);
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
	    
		
		@RequestMapping(value = "/test")
		public String test(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			String loggedUser = (String) session.getAttribute("userName");

			if (StringUtils.isEmpty(loggedUser)) {
				// model.addAttribute("status", "Invalid UserName or Password");
				model.addAttribute("loggedUser", "");
			} else {
				model.addAttribute("loggedStatus", "true");
				model.addAttribute("loggedUser", loggedUser);
			}
			return "test";
		}
		
		@RequestMapping(value = "/getAllMerchantLogo" , method = RequestMethod.POST)  
		   public @ResponseBody String getAllMerchantLogo(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   returnStatus=homeService.getAllMerchantLogo();
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
		@RequestMapping(value = "/redirectToCheckOut" ,  method = {RequestMethod.GET,RequestMethod.POST})  
		   public String redirectToCheckOut(HttpServletRequest request,RedirectAttributes redirectAttributes){  
			   try {     
				   redirectAttributes.addFlashAttribute("userType", "guest");
				   redirectAttributes.addFlashAttribute("guestId", request.getParameter("guest"));
				   HttpSession session = request.getSession();
				  session.setAttribute("guest", request.getParameter("guest"));
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return "redirect:/purchaseCard/checkOut";
			   }
		
		@RequestMapping(value = "/checkDuplicateMobileNumber" , method = RequestMethod.POST)  
		   public @ResponseBody String checkDuplicateMobileNumber(Model model,HttpServletRequest request){  
			   String returnStatus="";  
			   try {     
				   String mobileNo=request.getParameter("mobileNo");
				   returnStatus=homeService.checkDuplicateMobileNumber(mobileNo);
				   } catch (Exception e) {
					   logger.error(e.getMessage(), e);
					   }     
			   return returnStatus; 
			   }
}
