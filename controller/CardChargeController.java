package com.interland.giftcard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.dto.CardChargesDto;
import com.interland.giftcard.exception.ProcessingException;
import com.interland.giftcard.service.CardChargesService;

@Controller
@RequestMapping("/cardCharge")
public class CardChargeController {

	Logger logger = Logger.getLogger(CardDetailsController.class.getName());
	@Autowired
	CardChargesService cardChargesService;

	@RequestMapping(value = "/getCardCharge")
	public String getCardCharge(HttpServletRequest request, Model model) {
		logger.info("inside getCardDetails() in CardChargeController");
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		model.addAttribute("loggedUser", loggedUser);
		return "cardCharges";
	}

	@RequestMapping(value = "/cardChargeList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String cardChargeList(Model model,
			HttpServletRequest request) throws ProcessingException {
		logger.info("inside cardDetailsList() in CardChargeController");
		HttpSession session = request.getSession();
		JSONObject res = null;
		int idisplaylength = Integer.parseInt(request
				.getParameter("iDisplayLength"));
		int displaystart = Integer.parseInt(request
				.getParameter("iDisplayStart"));
		String sSearch = request.getParameter("sSearch");
		String searchParam = request.getParameter("searchData");

		try {

			res = cardChargesService.getCardChargesList(searchParam, sSearch,
					displaystart, idisplaylength);

		} catch (ProcessingException e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return res.toString();
	}

	@RequestMapping(value = "/createCardCharge", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String createCardCharge(Model model,
			HttpServletRequest request, CardChargesDto cardChargesDto) {
		logger.info("inside createCardCharge() in CardChargeController");
		HttpSession session = request.getSession();
		JSONObject resultStatus = null;
		logger.info("inside the method  createCardCharge() in CardChargeController");
		try {

			resultStatus = cardChargesService.saveCard(cardChargesDto);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}

		return resultStatus.toString();
	}

	@RequestMapping(value = "/updateCardCharges", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String updateCardCharges(Model model,
			HttpServletRequest request, CardChargesDto cardChargesDto) {
		logger.info("inside updateCardCharges() in CardDetailsController");
		String returnStatus = "";

		try {
			HttpSession session = request.getSession();

			returnStatus = cardChargesService.updateCardCharges(cardChargesDto);

		} catch (Exception e) {

			logger.error(e.getMessage(), e);
			throw (e);
		}
		return returnStatus;
	}

	@RequestMapping(value = "/deleteCardCharges", method = RequestMethod.POST)
	public @ResponseBody String deleteCardCharges(HttpServletRequest request,
			@RequestParam(value = "cardType") String cardType) {
		String blStatus = "";
		// String clinicId="";
		try {
			HttpSession session = request.getSession();
			String clinicId = (String) session.getAttribute("clinicId");

			logger.info("inside the method deleteCards() In Complaints");
			blStatus = cardChargesService.deleteCardCharges(cardType);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		logger.info("Status From deleteCardCharges() In CardDetailsController"
				+ blStatus);
		return blStatus;
	}

	@RequestMapping(value = "/getcardCharges", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String getcardCharges(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cardType") String cardType)
			throws ProcessingException {
		logger.info("inside getcardCharges() in CardChargeController");
		HttpSession session = request.getSession();
		JSONObject res = null;


		try {

			res = cardChargesService.getcardCharges(cardType);

		} catch (ProcessingException e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return res.toString();
	}

}
