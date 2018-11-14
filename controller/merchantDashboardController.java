/*
** added by         	 	: Ramsiy (getSweapDetailsForChart())
** Date of modification  	: 10/18/2017                                     

*/

package com.interland.giftcard.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.service.MerchantDetailsService;
import com.interland.giftcard.service.MerchantDashboardService;

@Controller
@RequestMapping("/merchantDashboard")
public class merchantDashboardController {
	private static final Logger logger = Logger.getLogger(MerchantDetailsController.class.getName());
	@Autowired
	MerchantDashboardService merchantDashboardService;
	  @RequestMapping(value = "/getAllTransactionList", method = RequestMethod.POST)
			public @ResponseBody String getAllTransactionList(Model model,
					HttpServletRequest request) throws Exception {
				HttpSession session = request.getSession();
				// String loggedUser=(String)session.getAttribute("userName");
				String strCardDetails = "";
				try {
					String strMerchantId = (String) session.getAttribute("userId");
					String strFromDate=request.getParameter("fromDate");
					String strToDate=request.getParameter("toDate");		
					strCardDetails = merchantDashboardService.getAllTransactionList(strMerchantId,strFromDate,strToDate);
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
					throw (e);
				}
				return strCardDetails;

			}
	  
	  
	  /*********************Ramsiya*************************/
	  @RequestMapping(value = "/getSweapDetailsForChart", method = RequestMethod.POST)
			public @ResponseBody String getSweapDetailsForChart(Model model,
					HttpServletRequest request) throws Exception {
				HttpSession session = request.getSession();
				String sweepingDetails = "";
				try {
					String date=request.getParameter("date");
					String strMerchantId = (String) session.getAttribute("userId");
					sweepingDetails = merchantDashboardService.getSweapDetailsForChart(strMerchantId,date);
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
					throw (e);
				}
				//logger.info("sweepSum",+sweepingDetails);
				System.out.println("sweepSum"+sweepingDetails);
				return sweepingDetails;

			}
	  /*********************Ramsiya*************************/

}
