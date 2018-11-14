package com.interland.giftcard.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.service.BankDetailsService;


@Controller
@RequestMapping("/bank")
public class BankDetailsController {
 
	private static final Logger logger = Logger.getLogger(BankDetailsController.class.getName());
    @Autowired
    BankDetailsService bankDetailsService;
	
	  
	  @RequestMapping(value = "/getAllBankDetails",method ={RequestMethod.GET,RequestMethod.POST})
		public @ResponseBody String getAllBankDetails(HttpServletRequest request, Model model) {
		  String listBankDetails="";
			try {
				listBankDetails=bankDetailsService.getAllBankDetails();
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			return listBankDetails;
		}
	  
}
