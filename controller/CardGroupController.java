/****************************************************************************** 
 * Project                        : GiftCard
 * Version No                     : v2.0
 * Program Name                   : CardGroup
 * Author                         : JOSE
 * Description                    : This program is about card group
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

import com.interland.giftcard.dto.CardGroupDto;
import com.interland.giftcard.service.CardGroupService;

@Controller
@RequestMapping("/cardGroupController")
public class CardGroupController {
	private static final Logger logger = Logger.getLogger(CardGroupController.class.getName());
	
	@Autowired
	CardGroupService cardGroupService;
	
	   @RequestMapping(value = "/cardGroupScreen", method ={RequestMethod.GET,RequestMethod.POST})
		public String cardGroupScreen(HttpServletRequest request,Model model) {
		   HttpSession session = request.getSession();
		   	 String loggedUser=(String)session.getAttribute("userName"); 
		   	 
		   	 if(StringUtils.isEmpty(loggedUser)){
		   	     model.addAttribute("loggedUser", "");
		   	 }else{
		   		 model.addAttribute("loggedUser", loggedUser);	 
		   	 }
	    	return "cardGroup";
	    }

	    
	    @RequestMapping(value = "/cardGroupList", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String cardGroupList(HttpServletRequest request) {
	    	System.out.println("inside list of gift cards");
	    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
	        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
	        
	        String sSearch = request.getParameter("sSearch");
	        String searchParam = request.getParameter("searchData");
	    	String listResult="";
	        try {
	        	System.out.println("<<<<<<<<<<<<<<<<<<<insid cardGroup>>>>>>>>>>>>>>");
	        	listResult=cardGroupService.getAllCardGroupList(searchParam, sSearch, displaystart, idisplaylength);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return listResult;
	       }
	    
	    @RequestMapping(value = "/saveCardGroup", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String saveCardGroup(HttpServletRequest request,CardGroupDto cardGroupDto) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardGroupService.saveCardGroup(cardGroupDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	    
	    @RequestMapping(value = "/updateCardGroup", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String updateCardGroup(HttpServletRequest request,CardGroupDto cardGroupDto) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardGroupService.updateCardGroup(cardGroupDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }

	    @RequestMapping(value = "/deleteCardGroup", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String deleteCardGroup(HttpServletRequest request,@RequestParam(value="cardGroup") int cardGroup) {
	    	
	    	String returnStatus="";
	        try {
	        	returnStatus=cardGroupService.deleteCardGroup(cardGroup);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	
}
