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

import com.interland.giftcard.service.ConsumerCardBalanaceService;

@Controller
@RequestMapping("/consumerCardBalanace")
public class ConsumerCardBalanaceController {
	private static final Logger logger = Logger.getLogger(ConsumerCardBalanaceController.class.getName());
    @Autowired
    ConsumerCardBalanaceService consumerCardBalanaceService;
    
    @RequestMapping(value = "/myCardBalance", method = RequestMethod.GET)
    public String myCardBalance(Model model,
            HttpServletRequest request)throws Exception {
    	HttpSession session = request.getSession();
   	 String loggedUser=(String)session.getAttribute("userName"); 
   	 
   	 if(StringUtils.isEmpty(loggedUser)){
   	   //  model.addAttribute("status", "Invalid UserName or Password");
   	     model.addAttribute("loggedUser", "");
   	 }else{
   		 model.addAttribute("loggedUser", loggedUser);	 
   	 }
    	return "myCardBalance";
    }
    
    //open card balance
    @RequestMapping(value = "/cardBalance", method = RequestMethod.GET)
    public String cardBalance(Model model,
            HttpServletRequest request)throws Exception {
    	HttpSession session = request.getSession();
   	 String loggedUser=(String)session.getAttribute("userName"); 
   	 
   	 if(StringUtils.isEmpty(loggedUser)){
   	   //  model.addAttribute("status", "Invalid UserName or Password");
   	     model.addAttribute("loggedUser", "");
   	 }else{
   		 model.addAttribute("loggedUser", loggedUser);	 
   	 }
    	return "cardBalance";
    }
    
    @RequestMapping(value = "/getCardBalance", method ={RequestMethod.GET,RequestMethod.POST})
   	public @ResponseBody String getCardBalance(HttpServletRequest request) {
    	
    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
        
        String sSearch = request.getParameter("sSearch");
        String searchParam = request.getParameter("searchData");
    	String listResult="";
        try {
        	// HttpSession session = request.getSession();
       	//  String merchantId=(String)session.getAttribute("userId");
        	listResult=consumerCardBalanaceService.getCardBalance(searchParam, sSearch, displaystart, idisplaylength);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
       	return listResult;
       }
    @RequestMapping(value = "/getCardNumber" , method = RequestMethod.POST)  
	   public @ResponseBody String getCardNumber(Model model,HttpServletRequest request){  
		   String returnStatus="";  
		   try {     
			   HttpSession session = request.getSession();
			   String purchaseId=(String)session.getAttribute("userId"); 
			   returnStatus=consumerCardBalanaceService.getCardNumber(purchaseId);
			   } catch (Exception e) {
				   logger.error(e.getMessage(), e);
				   }     
		   return returnStatus; 
		   }
}
