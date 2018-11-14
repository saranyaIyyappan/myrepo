package com.interland.giftcard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.interland.giftcard.dto.CardDetailsDto;
import com.interland.giftcard.dto.CardDetailsFileUploadDto;
import com.interland.giftcard.exception.ProcessingException;
import com.interland.giftcard.service.CardDetailsService;

@Controller
@RequestMapping("/cardDetails")
public class CardDetailsController {
	Logger logger = Logger.getLogger(CardDetailsController.class.getName());

	@Autowired
	CardDetailsService cardDetailsService;
	@Value("${PIC_PATH}")
	private String picPath;
	
	@RequestMapping(value = "/getCardDetails")
	public String getCardDetails(HttpServletRequest request, Model model) {
		logger.info("inside directCompliants() in CardDetailsController");
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		model.addAttribute("loggedUser", loggedUser);
		return "cardDetails";
	}

	@RequestMapping(value = "/cardDetailsList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String cardDetailsList(Model model,
			HttpServletRequest request) throws ProcessingException {
		logger.info("inside cardDetailsList() in CardDetailsController");
		HttpSession session = request.getSession();
		JSONObject res = null;
		int idisplaylength = Integer.parseInt(request
				.getParameter("iDisplayLength"));
		int displaystart = Integer.parseInt(request
				.getParameter("iDisplayStart"));
		String sSearch = request.getParameter("sSearch");
		String searchParam = request.getParameter("searchData");
		String listResult = "";

		try {

			res = cardDetailsService.getCardDetailst(searchParam, sSearch,
					displaystart, idisplaylength);

		} catch (ProcessingException e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return res.toString();
	}

	@RequestMapping(value = "/createCard", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String createCard(Model model,
			HttpServletRequest request, CardDetailsDto cardDetailsDto) {
		logger.info("inside createCard() in CardDetailsController");
		HttpSession session = request.getSession();
		JSONObject resultStatus = null;
		logger.info("inside the method  createCard() in CardDetails Controller");
		try {

			resultStatus = cardDetailsService.saveCard(cardDetailsDto);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}

		return resultStatus.toString();
	}

	@RequestMapping(value = "/updateCards", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String updateCards(Model model,
			HttpServletRequest request, CardDetailsDto cardDetailsDto) {
		logger.info("inside updateCards() in CardDetailsController");
		String returnStatus = "";

		try {
			HttpSession session = request.getSession();

			returnStatus = cardDetailsService.updateCardDetails(cardDetailsDto);

		} catch (Exception e) {

			logger.error(e.getMessage(), e);
			throw (e);
		}
		return returnStatus;
	}

	@RequestMapping(value = "/deleteCards", method = RequestMethod.POST)
	public @ResponseBody String deleteCards(HttpServletRequest request,
			@RequestParam(value = "cardId") String cardId) {
		String blStatus = "";
		try {
			HttpSession session = request.getSession();

			logger.info("inside the method deleteCards() In Complaints");
			blStatus = cardDetailsService.deleteCard(cardId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		logger.info("Status From deleteComplaints() In CardDetailsController"
				+ blStatus);
		return blStatus;
	}

	@RequestMapping(value = "/getAllCardTheme", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String getAllCardTheme(HttpServletRequest request) {

		String returnStatus = "";
		logger.info("inside getAllCardTheme() in CardDetailsController");
		try {
			returnStatus = cardDetailsService.getAllCardTheme();

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);

		}
		return returnStatus;
	}

	@RequestMapping(value = "/getAllCardCategory", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String getAllCardCategory(HttpServletRequest request,
			@RequestParam(value = "merchantId") String merchantId,
			@RequestParam(value = "cardType") String cardType,
			@RequestParam(value = "cardTheme") String cardTheme) {

		String returnStatus = "";
		logger.info("inside getAllCardCategory() in CardDetailsController");
		try {
			HttpSession session = request.getSession();

			returnStatus = cardDetailsService.getAllCardCategory(merchantId,
					cardType, cardTheme);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);

		}
		return returnStatus;
	}

	@RequestMapping(value = "/getAllCardGroup", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String getAllCardGroup(HttpServletRequest request) {

		String returnStatus = "";
		logger.info("inside getAllCardGroup() in CardDetailsController");
		try {
			HttpSession session = request.getSession();
			// String clinicId = (String) session.getAttribute("clinicId");
			returnStatus = cardDetailsService.getAllCardGroup();

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);

		}
		return returnStatus;
	}

	@RequestMapping(value = "/getMyGiftCards", method = RequestMethod.POST)
	public @ResponseBody String payAMerchant(Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			String purchaseId = (String) session.getAttribute("userId");
			res = cardDetailsService.getCardMobile(purchaseId,picPath);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/getMyGiftCardsMerchant", method = RequestMethod.POST)
	public @ResponseBody String getMyGiftCardsMerchant(Model model,
			HttpServletRequest request,
			@RequestParam(value = "merchantId") String merchantId)
			throws Exception {
		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			String purchaseId = (String) session.getAttribute("userId");
			res = cardDetailsService.getMyGiftCardsMerchant(purchaseId, merchantId,picPath);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/getBenficiaryGiftCards", method = RequestMethod.POST)
	public @ResponseBody String getBenficiaryGiftCards(Model model,
			@RequestParam(value = "benId") String benId,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		JSONObject res = null;
		try {
			// String purchaseId = (String) session.getAttribute("userId");
			res = cardDetailsService.getBenfiaryCardMobile(benId);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/getMerchantsGiftCards", method = RequestMethod.POST)
	public @ResponseBody String getMerchantsGiftCards(Model model,
			HttpServletRequest request,
			@RequestParam(value = "merchantId") String merchantId,
			@RequestParam(value = "cardTheme") String cardTheme)
			throws Exception {
		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			// String purchaseId = (String) session.getAttribute("userId");
			// res =
			// consumerService.getMerchantsCardCategory(merchantId,cardTheme);
			System.out.println("===>" + merchantId + cardTheme+picPath);
			res = cardDetailsService.getMerchantsCardCategory(merchantId,
					cardTheme,picPath);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/getMyGiftCardsTransactions", method = RequestMethod.POST)
	public @ResponseBody String getMyGiftCardsTransactions(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cardId") String cardId) throws Exception {
		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			String userId = (String) session.getAttribute("userId");
			res = cardDetailsService.getMyTransactions(cardId);

			System.out.println("===" + res);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/getMyGiftCardsTransactionsWithDateRange", method = RequestMethod.POST)
	public @ResponseBody String getMyGiftCardsTransactionsWithDateRange(
			Model model, HttpServletRequest request,
			@RequestParam(value = "fromDate") String fromDate,
			@RequestParam(value = "toDate") String toDate,
			@RequestParam(value = "cardId") String cardId) {

		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			String userId = (String) session.getAttribute("userId");
			res = cardDetailsService.getMyGiftCardsTransactionsWithDateRange(
					cardId, fromDate, toDate);

			System.out.println("===" + res);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	@RequestMapping(value = "/loadACard", method = RequestMethod.POST)
	public @ResponseBody String loadAcard(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cardId") String cardId,
			@RequestParam(value = "cardPin") String pin) throws Exception {
		HttpSession session = request.getSession();

		String loggedUser = (String) session.getAttribute("userName");
		JSONObject res = null;
		try {
			String userId = (String) session.getAttribute("userId");

			res = cardDetailsService.loadAcard(cardId, userId, pin);

			System.out.println("===" + res);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw (e);
		}
		return res.toString();

	}

	/*----------------------------------------------------------------file upload--------------------------------------------------------------*/

	/*---------------------------Step 1 : Virus Scan---------------------*/
	@RequestMapping(value = "/excelUploadVirusScan", method = {
			RequestMethod.POST, RequestMethod.GET })
	public String excelUploadVirusScan(RedirectAttributes redirectAttributes,
			ModelMap model, Model model1, HttpSession session,
			HttpServletRequest request,
			@RequestParam CommonsMultipartFile transactionFile)
			throws FileUploadException {

		String strStatus = "fail";
		File convFile = null;
		HttpSession sessionUser = request.getSession();
		String userId = (String) sessionUser.getAttribute("userId");
		try {
			logger.info("inside method  excelUploadVirusScan()");
			String fname = transactionFile.getOriginalFilename();
			String fextns = fname.substring(fname.lastIndexOf(".") + 1,
					fname.length());
			System.out
					.println("------------------------------virus scan-----------------------------");

			boolean status = true;// temp use

			convFile = new File(transactionFile.getOriginalFilename());
			transactionFile.transferTo(convFile);

			if (status) {
				model1.addAttribute("fileUpldStatus", status);
				session.setAttribute("excelFile", transactionFile);
				session.setAttribute("convertedFile", convFile);
				session.setAttribute("fileExtension", fextns);

			} else {
				logger.info("fileUpldStatusStaff is set as" + status);
				model1.addAttribute("fileUpldStatus", status);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		logger.info("returns from excelUploadVirusScan");
		return "cardDetails";
	}

	/*-------------------------------------------------------------------*/
	/*
	 * ===================================== Step 2: mapping check
	 * ============================
	 */
	@RequestMapping(value = "/excelUploadMappingCheck", method = {
			RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String excelUploadMappingCheck(ModelMap model,
			Model model1, HttpSession session, HttpServletRequest request)
			throws FileUploadException {

		String returnStatus = "";
		String status = "";
		try {
			logger.info("inside method  excelUploadMappingCheck()");
			logger.info("excelUploadMappingCheck process");
			File transactionFile = (File) session.getAttribute("convertedFile");

			status = cardDetailsService
					.excelUploadMappingCheck(transactionFile);

			if (status.equals("Data not found")) {
				logger.info("Status from excelUploadMappingCheck() in service is Data not found");

				returnStatus = status;
			} else if (status.equals("not matching")) {
				logger.info("Status from excelUploadMappingCheck() in  service is not matching");
				model1.addAttribute("fileUpldStatusStaff", "mapping required");

				returnStatus = "not matching";
			} else if (status.equals("matching")) {
				logger.info("Status from excelUploadMappingCheck() in  service is  matching");
				returnStatus = "matching";
			} else if (status.equals("column number not matching")) {
				logger.info("Status from excelUploadMappingCheck() in  service is  column number not matching");
				model1.addAttribute("fileUpldStatusStaff",
						"column number not matching");
				returnStatus = "column number not matching";
			}

		} catch (Exception e) {
			logger.error("Exception excelUploadMappingCheck()  "
					+ e.getMessage());
			throw e;
		}
		logger.info("returns the status=" + returnStatus
				+ " of mapping from staffController");
		return returnStatus;

	}

	/*----------------------------------------------------------------------------------------------------*/
	// Step: 3 ---------------------------validate and upload excel data to
	// database without rearranging------------------------------
	@RequestMapping(value = "/validateAndUploadExcelWithOutRearranging", method = {
			RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String validateAndUploadExcelWithOutRearranging(
			ModelMap model, Model model1, HttpSession session,
			HttpServletRequest request) throws FileUploadException {

		String returnVal = "";
		HttpSession sessionUserId = request.getSession();
		String strUserId = (String) sessionUserId.getAttribute("userId");
		try {
			logger.info("inside method  validateAndUploadExcelWithOutRearranging()");
			File transactionFile = (File) session.getAttribute("convertedFile");

		} catch (Exception e) {
			logger.error("Exception validateAndUploadExcelWithOutRearranging() in StaffController "
					+ e.getMessage());
		}
		logger.info("returns status=" + returnVal
				+ " of file upload from staffController");
		return returnVal;
	}

	/*----------------------------------------------------------------------------------------------------*/

	/*-------------------------------------GET COLUMN NAMES FROM DATABASE------------------------------------------*/
	@RequestMapping(value = "/getCardDetailsColumnNames")
	public @ResponseBody String getCardDetailsColumnNames(Model model,
			HttpServletRequest request, HttpSession session) {
		logger.info("inside method  getInsCmpGetColumnNames() in staff controller");
		File transactionFile = (File) session.getAttribute("convertedFile");
		JSONArray arrColumnNames = cardDetailsService
				.getCardDetailsColumnNames(transactionFile);
		// JSONArray arrColumnNames=null;
		session.setAttribute("no_select_boxes", arrColumnNames.size());
		logger.info("converts the JSON array to string and returns result="
				+ arrColumnNames.toString() + " from insuranceContrler");

		return arrColumnNames.toString();
	}

	/*----------------------------------------------------------------------------------------------------*/
	/*--------------------------------------------excelUploadMapping--------------------------------------------------------*/

	@RequestMapping(value = "/excelUploadMapping", method = {
			RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String excelUploadMapping(ModelMap model,
			HttpSession session, HttpServletRequest request,
			CardDetailsFileUploadDto cardDetailsFileUploadDto)
			throws FileUploadException {

		String errors = "";
		// String strUserId = (String) session.getAttribute("userId");
		String userId = (String) session.getAttribute("userId");
		// SchoolDetailsDto
		// schoolDetailsDto=schoolService.getSchooDetailsByUserId(strUserId);
		String noDuplicate = "";
		try {
			logger.info("inside method  excelUploadMapping()");

			noDuplicate = cardDetailsService
					.checkDuplicateEntryInSelectBox(cardDetailsFileUploadDto);

			if (noDuplicate.equals("")) {
				logger.info("if return value of checkDuplicateEntryInSelectBox() of service is null");
				File transactionFile = (File) session
						.getAttribute("convertedFile");

				int NO_OF_SELECT_BOXES = (int) session
						.getAttribute("no_select_boxes");
				String[] strSelectBoxValues = new String[NO_OF_SELECT_BOXES];

				File fileToBeUploaded = cardDetailsService.excelUploadMapping(
						transactionFile, cardDetailsFileUploadDto);

				if (fileToBeUploaded != null) {
					logger.info("if file returned from excelUploadMapping() of service is not null");
					session.removeAttribute("excelFile");
					session.setAttribute("excelFileAfterRearranging",
							fileToBeUploaded);

					List<String> errorMessages = cardDetailsService
							.validateExcel(fileToBeUploaded, userId);
					org.apache.commons.io.FileUtils
							.deleteQuietly(transactionFile);
					org.apache.commons.io.FileUtils
							.deleteQuietly(fileToBeUploaded);

					logger.info("Size of error messages list="
							+ errorMessages.size());
					if (errorMessages.size() != 0) {
						logger.info("if size of error messages obtained from validateExcel() of service is not zero");
						for (int j = 0; j < errorMessages.size(); j++) {
							errors = errors + "\n" + errorMessages.get(j);
						}
					}
				} else {
					errors = "Mapping Error check the values entered in the excel";
				}

			} else {
				errors = noDuplicate.split(":")[1];
			}
		} catch (Exception e) {
			logger.error("Exception excelUploadMapping() in StaffController "
					+ e.getMessage());
		}
		logger.info("returns the status=" + errors
				+ " of excel upload mapping from staffConttroller");
		return errors;

	}

	@RequestMapping(value = "/createCardForFriend", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String createCardForFriend(Model model,
			HttpServletRequest request,
			@RequestParam(value = "cards") String cards,
			@RequestParam(value = "friendNum") String friendNum,
			CardDetailsDto cardDetailsDto,
			@RequestParam(value = "paymentMode") int paymentMode,
			@RequestParam(value = "mPin") Integer mPin) {
		logger.info("inside createCardForFriend() in CardDetailsController");
		HttpSession session = request.getSession();
		JSONObject resultStatus = null;
		logger.info("inside the method  createCardForFriend() in CardDetails Controller");
		try {
			String userId = (String) session.getAttribute("userId");
			cardDetailsDto.setPurchaserId(friendNum);
			resultStatus = cardDetailsService.saveCardFriend(userId,cardDetailsDto,
					paymentMode,cards,mPin);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}

		return resultStatus.toString();
	}

	@RequestMapping(value = "/createCardForFriendWeb", method = {
			RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String createCardForFriendWeb(Model model,
			HttpServletRequest request,

			CardDetailsDto cardDetailsDto,
			@RequestParam(value = "paymentMode") int paymentMode) {
		logger.info("inside createCardForFriend() in CardDetailsController");
		HttpSession session = request.getSession();
		JSONObject resultStatus = null;
		logger.info("inside the method  createCardForFriendWeb() in CardDetails Controller");
		try {
			String purchaseId = (String) session.getAttribute("userId");
			String friendNum = request.getParameter("friendNum");
			String cards = request.getParameter("cards");

			/*if (!StringUtils.isEmpty(friendNum)) {
				cardDetailsDto.setPurchaserId(friendNum);
			} else {
				cardDetailsDto.setPurchaserId(purchaseId);
			}*/
			cardDetailsDto.setPurchaserId(purchaseId);
			resultStatus = cardDetailsService.saveCardFriendWeb(cardDetailsDto,
					paymentMode, cards);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}

		return resultStatus.toString();
	}

}
