/****************************************************************************** 
 * Project                        : GiftCard
 * Version No                     : v2.0
 * Program Name                   : Consumer
 * Author                         : VIGNESH
 * Description                    : This program is about consumer
 * Date written                   : Aug 2017**
 * Modification Log               :
 * Modified by                    :VIGNESH
 * Date of modification           : 28/08/2017                                     
 * Reason for modification        : 
 *******************************************************************************/

package com.interland.giftcard.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.interland.giftcard.dto.UserDetailsDto;
import com.interland.giftcard.service.ConsumerService;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {
	private static final Logger logger = Logger
			.getLogger(ConsumerController.class.getName());
	@Autowired
	ConsumerService consumerService;

	@RequestMapping(value = "/registerConsumer", method = RequestMethod.POST)
	public @ResponseBody String registerConsumer(UserDetailsDto userDetailsDto,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strStatus = "";
		try {
			/*String defaultImagePath=request.getServletContext().getRealPath("")+"/resources/img/user.png";
			userDetailsDto.setProfilePicture(defaultImagePath);*/
			strStatus = consumerService.registerConsumer(userDetailsDto);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return strStatus;
	}

	@RequestMapping(value = "/consumerDashboardScreen", method = RequestMethod.GET)
	public String consumerDashboardScreen(Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		if (StringUtils.isEmpty(loggedUser)) {
			// model.addAttribute("status", "Invalid UserName or Password");
			model.addAttribute("loggedUser", "");
		} else {
			model.addAttribute("loggedUser", loggedUser);
		}
		return "consumerDashboard";
	}

	@RequestMapping(value = "/purchaseCard", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String purchaseCardScreen(Model model, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		String merchantId = request.getParameter("merchantId");
		if (StringUtils.isEmpty(loggedUser)) {
			// model.addAttribute("status", "Invalid UserName or Password");
			model.addAttribute("loggedUser", "");
		} else {
			model.addAttribute("loggedUser", loggedUser);
		}
		model.addAttribute("merchantId", merchantId);
		return "purchaseCard";
	}

	@RequestMapping(value = "/payAMerchantScreen", method = RequestMethod.GET)
	public String payAMerchantScreen(Model model, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");

		if (StringUtils.isEmpty(loggedUser)) {
			// model.addAttribute("status", "Invalid UserName or Password");
			model.addAttribute("loggedUser", "");
		} else {
			model.addAttribute("loggedUser", loggedUser);
		}
		return "payAMerchant";
	}

	@RequestMapping(value = "/payAMerchant", method = RequestMethod.POST)
	public @ResponseBody String payAMerchant(Model model,
			HttpServletRequest request,
			@RequestParam(value = "amount") Integer amount,
			@RequestParam(value = "merchantId") String merchantId)
			throws Exception {
		HttpSession session = request.getSession();
		// String loggedUser=(String)session.getAttribute("userName");
		String strCardDetails = "";
		try {
			String purchaseId = (String) session.getAttribute("userId");
			strCardDetails = consumerService.getCardList(purchaseId, amount,
					merchantId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		System.out
				.println(":::::::::::::::::::::::::::::::::::::::::::::::::::"
						+ strCardDetails);
		return strCardDetails;

	}

	@RequestMapping(value = "/multipleCardPay", method = RequestMethod.POST)
	public @ResponseBody String multipleCardPay(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cardIds") String[] cardIds,
			@RequestParam(value = "purchaseAmounts") String[] purchaseAmounts,
			@RequestParam(value = "cardBalance") String[] cardBalance,
			@RequestParam(value = "merchantId") String merchantId)
			throws Exception {
		HttpSession session = request.getSession();
		// String loggedUser=(String)session.getAttribute("userName");
		String strCardDetails = "";
		try {
			String purchaseId = (String) session.getAttribute("userId");
			strCardDetails = consumerService.multipleCardPay(cardIds,
					purchaseAmounts, cardBalance, merchantId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		System.out
				.println(":::::::::::::::::::::::::::::::::::::::::::::::::::"
						+ strCardDetails);
		return strCardDetails;

	}

	@RequestMapping(value = "/payAmerchantMobile", method = RequestMethod.POST)
	public @ResponseBody String payAmerchantMobile(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cards") String cards,
			@RequestParam(value = "merchantId") String merchantId,
			@RequestParam(value = "mPin") Integer mPin,
			@RequestParam(value = "transactionDetails") String transactionDetails){
		HttpSession session = request.getSession();
		// String loggedUser=(String)session.getAttribute("userName");
		String res = "";
		try {
			String userId = (String) session.getAttribute("userId");
			String userLang=(String) session.getAttribute("userLang");
			System.out.println("======="+userLang);
			
			res = consumerService.cardPayMobile(userId, cards, merchantId, mPin,transactionDetails);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}

		return res;

	}

	@RequestMapping(value = "/transferMoneyMobile", method = RequestMethod.POST)
	public @ResponseBody String transferMoneyMobile(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cards") String cards,
			@RequestParam(value = "benCardId") String benCardId,
			@RequestParam(value = "amount") BigDecimal amount,
			@RequestParam(value = "mPin") Integer mPin, 
			@RequestParam(value = "transactionDetails") String transactionDetails){
		HttpSession session = request.getSession();
		String res = "";
		try {

			String userId = (String) session.getAttribute("userId");
			res = consumerService.transferMoneyMobile(userId,cards,benCardId,amount,mPin,transactionDetails);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}

		return res;

	}
	@RequestMapping(value = "/transferMoneyWeb", method = RequestMethod.POST)
	public @ResponseBody String transferMoneyWeb(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cards") String cards,
			@RequestParam(value = "benCardId") String benCardId,
			@RequestParam(value = "amount") BigDecimal amount) {
		HttpSession session = request.getSession();
		String res = "";
		try {

			String userId = (String) session.getAttribute("userId");
			res = consumerService.transferMoneyWeb(userId,cards, benCardId, amount);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}

		return res;

	}
	@RequestMapping(value = "/getAllBanks", method = RequestMethod.POST)
	public @ResponseBody String getAllBanks(Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		// String loggedUser=(String)session.getAttribute("userName");
		String res = "";
		try {

			String purchaseId = (String) session.getAttribute("userId");
			res = consumerService.getAllBanks();

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}

		return res;

	}
}
