/****************************************************************************** 
 * Project                        : GiftCard
 * Version No                     : v2.0
 * Program Name                   : CardTheme
 * Author                         : JOSE
 * Description                    : This program is about card theme
 * Date written                   : Aug 2017**
 * Modification Log               :
 * Modified by                    : JOSE
 * Date of modification           : 25/08/2017                                     
 * Reason for modification        : 
 *******************************************************************************/


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.dto.CardThemeDto;
import com.interland.giftcard.service.CardThemeService;

@Controller
@RequestMapping("/cardThemeController")
public class CardThemeController {
private static final Logger logger = Logger.getLogger(CardGroupController.class.getName());
	
	@Autowired
	CardThemeService cardThemeService;
	
	   @RequestMapping(value = "/cardThemeScreen", method ={RequestMethod.GET,RequestMethod.POST})
		public String cardThemeScreen(HttpServletRequest request,Model model) {
		   HttpSession session = request.getSession();
		   	 String loggedUser=(String)session.getAttribute("userName"); 
		   	 
		   	 if(StringUtils.isEmpty(loggedUser)){
		   	     model.addAttribute("loggedUser", "");
		   	 }else{
		   		 model.addAttribute("loggedUser", loggedUser);	 
		   	 }
	    	return "cardTheme";
	    }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   @RequestMapping(value = "/test", method ={RequestMethod.GET,RequestMethod.POST})
		public String test(HttpServletRequest request,Model model) {
	    	return "makeAppointment";
	    }

	   
	  
	    @RequestMapping(value = "/cardThemeList", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String cardThemeList(HttpServletRequest request) {
	    	
	    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
	        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
	        
	        String sSearch = request.getParameter("sSearch");
	        String searchParam = request.getParameter("searchData");
	    	String listResult="";
	        try {
	        	listResult=cardThemeService.getAllCardThemeList(searchParam, sSearch, displaystart, idisplaylength);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return listResult;
	       }
	    
	    @RequestMapping(value = "/saveCardTheme", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String saveCardTheme(HttpServletRequest request,CardThemeDto cardThemeDto) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardThemeService.saveCardTheme(cardThemeDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	    
	    @RequestMapping(value = "/updateCardTheme", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String updateCardTheme(HttpServletRequest request,CardThemeDto cardThemeDto) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardThemeService.updateCardTheme(cardThemeDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }

	    @RequestMapping(value = "/deleteCardTheme", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String deleteCardTheme(HttpServletRequest request,@RequestParam(value="cardTheme") int cardTheme) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardThemeService.deleteCardTheme(cardTheme);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
}
