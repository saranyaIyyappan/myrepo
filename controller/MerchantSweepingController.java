package com.interland.giftcard.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.service.MerchantSweepingService;

@Controller
@RequestMapping("/merchantSweeping")
public class MerchantSweepingController {
	
	private static final Logger logger = Logger.getLogger(MerchantSweepingController.class.getName());
	
    @Autowired
    MerchantSweepingService merchantSweepingService;
    
    @Value("${VAT}")
	private String VAT;
    @Value("${ATA}")
	private String ATA;
    @Value("${SARIE}")
	private String SARIE;
    
    @RequestMapping(value = "/getMerchantTransferDetails",method = {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String getProprty(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String merchantId = (String) session.getAttribute("userId");
		JSONObject res = new JSONObject();
		try {
			//res = merchantSweepingService.getAccountNumber(merchantId);
			res = merchantSweepingService.getMerchanDetails(merchantId);
			res.put("vat", VAT);
			res.put("ata", ATA);
			res.put("sarie", SARIE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return res.toJSONString();
	}
    
    @RequestMapping(value = "/merchantSweeping",method ={RequestMethod.GET,RequestMethod.POST})
  		public String myCards(HttpServletRequest request, Model model) {
  			HttpSession session = request.getSession();
  			String loggedUser = (String) session.getAttribute("userName");
  			model.addAttribute("loggedUser", loggedUser);
  			return "merchantSweeping";
  		}
    
    @RequestMapping(value = "/transferMoney",method ={RequestMethod.GET,RequestMethod.POST})
	public String sweepAmount(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		String userId = (String) session.getAttribute("userId");
		try {
			JSONObject merchantData =  merchantSweepingService.getMerchanDetails(userId);
			merchantData.put("vat", VAT);
			merchantData.put("ata", ATA);
			merchantData.put("sarie", SARIE);
			model.addAttribute("loggedUser", loggedUser);
			model.addAttribute("merchantData", merchantData);
			//model.addAttribute("amount", merchantData.get("amount"));
			//model.addAttribute("accountNumber", merchantData.get("accountNumber"));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "sweepAmount";
	}
    
    @RequestMapping(value = "/merchantSweepingList", method ={RequestMethod.GET,RequestMethod.POST})
   	public @ResponseBody String merchantSweepingList(HttpServletRequest request) {
    	
    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
        
        String sSearch = request.getParameter("sSearch");
        String searchParam = request.getParameter("searchData");
    	String listResult="";
        try {
        	HttpSession session = request.getSession();
  			String merchantId = (String) session.getAttribute("userId");
        	listResult=merchantSweepingService.merchantSweepingList(searchParam, sSearch, displaystart, idisplaylength, merchantId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
       	return listResult;
       	
       }
    
    @RequestMapping(value = "/merchantTransactionList", method ={RequestMethod.GET,RequestMethod.POST})
   	public @ResponseBody String merchantTransactionList(HttpServletRequest request) {
    	
    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
        
        String sSearch = request.getParameter("sSearch");
        String searchParam = request.getParameter("searchData");
    	String listResult="";
        try {
        	HttpSession session = request.getSession();
  			String merchantId = (String) session.getAttribute("userId");
        	listResult=merchantSweepingService.merchantTransactionList(searchParam, sSearch, displaystart, idisplaylength,merchantId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
       	return listResult;
       	
    }
    
    @RequestMapping(value = "/sweepAmountToAccount", method ={RequestMethod.GET,RequestMethod.POST})
   	public @ResponseBody String sweepAmountToAccount(HttpServletRequest request) {
    	String result="";
        try {
        	BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        	String transactionMode = request.getParameter("transactionMode");
        	String remark = request.getParameter("remark");
        	String modeValue = "";
        	if(transactionMode.equals("SARIE")) 
        		modeValue = SARIE;
        	else if(transactionMode.equals("ATA"))
        		modeValue = ATA;
        	HttpSession session = request.getSession();
  			String merchantId = (String) session.getAttribute("userId");
        	result = merchantSweepingService.sweepAmountToAccount(merchantId, amount, VAT, transactionMode, modeValue, remark);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
       	return result;
       	
    }
    

}
