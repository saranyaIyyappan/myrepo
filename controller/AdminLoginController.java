package com.interland.giftcard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

	
	//------------------------------return admin login screen-----------------------------------------------//
	@RequestMapping(value = "/adminLogin", method ={RequestMethod.GET,RequestMethod.POST}) 
	public String adminLoginScreen(Model model, HttpServletRequest request,
			HttpServletResponse response) { 
		HttpSession session = request.getSession();
		 String loggedUser=(String)session.getAttribute("userName"); 
		 if(StringUtils.isEmpty(loggedUser)){
		   //  model.addAttribute("status", "Invalid UserName or Password");
		     model.addAttribute("loggedUser", "");
		 }else{
			 model.addAttribute("loggedUser", loggedUser);	 
		 }
		return "adminLogin";  
		
}
	
	//------------------------------return admin dashboard-----------------------------------------------//
		@RequestMapping(value = "/adminDashboardScreen", method ={RequestMethod.GET,RequestMethod.POST}) 
		public String adminDashboardScreen(Model model, HttpServletRequest request,
				HttpServletResponse response) { 
			HttpSession session = request.getSession();
		   	 String loggedUser=(String)session.getAttribute("userName"); 
		   	 
		   	 if(StringUtils.isEmpty(loggedUser)){
		   	   //  model.addAttribute("status", "Invalid UserName or Password");
		   	     model.addAttribute("loggedUser", "");
		   	 }else{
		   		 model.addAttribute("loggedUser", loggedUser);	 
		   	 }
			return "adminDashboard";  
			
	}
}