/****************************************************************************** 
 * Project                        : GiftCard
 * Version No                     : v2.0
 * Program Name                   : Merchant Sign up&login 
 * Author                         : ANJALI SASI
 * Description                    : This program save merchant details
 * Date written                   : Aug 2017**
 * Modification Log               :
 * Modified by                    :ANJALI SASI
 * Date of modification           : 23/07/2017                                     
 * Reason for modification        : 
 *******************************************************************************/
package com.interland.giftcard.controller;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.interland.giftcard.dto.MailConfigDto;
import com.interland.giftcard.dto.MerchantDetailsDto;
import com.interland.giftcard.exception.ProcessingException;
import com.interland.giftcard.service.MerchantDetailsService;

@Controller
@RequestMapping("/merchant")
public class MerchantDetailsController {
private static final Logger logger = Logger.getLogger(MerchantDetailsController.class.getName());
	@Autowired
	MerchantDetailsService merchantDetailsService;
	@Value("${PIC_PATH}")
	private String picPath;
	
	@Value("${EMAIL_VER_CONTENT}")
	private String emailVerContent;
	
	@Value("${SMTPHOST}")
	private String smtpHost;
	
	@Value("${SMTPPORT}")
	private String smtpPort;
	
	@Value("${FROMMAIL}")
	private String fromMail;
	
	@Value("${MER_CRE_SUB}")
	private String merchantCreationMailSub;
	
	@Value("${MER_CRE_BODY}")
	private String merchantCreationMailBody;
	
	
	@Value("${PASSWORD_CHANGE_EMAIL_VER_CONTENT}")
	private String passwordChangeContent;
	
	@Value("${VERIFY_FROM_ADDRS}")
	private String verFromAddress;
	
	@Value("${USERID_CONTENT}")
	private String userIdContent;
	
	@Value("${PIC_DIR}")
	private String picDirectory;
//------------------------------return merchantDetails-----------------------------------------------//
@RequestMapping(value = "/merchantPageReturn", method ={RequestMethod.GET,RequestMethod.POST}) 
public String merchantDetailsReturn(Model model, HttpServletRequest request,
		HttpServletResponse response) { 
	HttpSession session = request.getSession();
	 String loggedUser=(String)session.getAttribute("userName"); 
	 if(StringUtils.isEmpty(loggedUser)){
	   //  model.addAttribute("status", "Invalid UserName or Password");
	     model.addAttribute("loggedUser", "");
	 }else{
		 model.addAttribute("loggedUser", loggedUser);	 
	 }
	return "merchantDetails";  
	
}
//--------------------------------------------return merchant dashboard-------------------------//
@RequestMapping(value = "/returnMerchantDashboard", method ={RequestMethod.GET,RequestMethod.POST}) 
public String returnMerchantDashboard(Model model, HttpServletRequest request,
		HttpServletResponse response) { 
	HttpSession session = request.getSession();
	 String loggedUser=(String)session.getAttribute("userName"); 
	 
	 if(StringUtils.isEmpty(loggedUser)){
	   //  model.addAttribute("status", "Invalid UserName or Password");
	     model.addAttribute("loggedUser", "");
	 }else{
		 model.addAttribute("loggedUser", loggedUser);	 
	 }
	return "merchantDashboard";  
	
}
//-------------------------------------------------return add new merchant page--------------------------------//
@RequestMapping(value = "/addNewMerchant", method ={RequestMethod.GET,RequestMethod.POST}) 
public String addNewMerchant(Model model, HttpServletRequest request,
		HttpServletResponse response) { 
	HttpSession session = request.getSession();
	 String loggedUser=(String)session.getAttribute("userName"); 
	 String loggedUserId=(String)session.getAttribute("userId"); 
	 if(StringUtils.isEmpty(loggedUser)){
	   //  model.addAttribute("status", "Invalid UserName or Password");
	     model.addAttribute("loggedUser", "");
	 }else{
		 model.addAttribute("loggedUser", loggedUser);	 
	 }
	 model.addAttribute("loggedUserId", loggedUserId);	 
	return "addNewMerchant";  
	
}
//------------------------------------------------------------saveMerchantDetails------------------------------//
	@RequestMapping(value = "/saveMerchantDetails", method = {
			RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody String saveMerchantDetails(
			MerchantDetailsDto merchantDetailsDto, HttpServletRequest request) {
		JSONObject jobjStatus = new JSONObject();
		try {
			String strMerchantId = merchantDetailsDto.getMerchantId();
			String strMerchantName=merchantDetailsDto.getMerchantNameEng();
			MailConfigDto mailConfigDto = new MailConfigDto();
			mailConfigDto.setFromMail(fromMail);
			String messageBody=merchantCreationMailBody;
			messageBody=messageBody.replace("$userIdReplace", merchantDetailsDto.getMerchantId());
			String messageSubject=merchantCreationMailSub;
			messageBody=messageBody.replace("$userIdReplace", merchantDetailsDto.getMerchantId());
			mailConfigDto.setMessage(messageBody);
			mailConfigDto.setSubject(messageSubject);
			mailConfigDto.setSmtpAddresss(smtpHost);
			mailConfigDto.setSmtpPort(smtpPort);
			String defaultImagePath=request.getServletContext().getRealPath("")+"//resources//giftCardHome//images//ANB LOGO.png";
			merchantDetailsDto.setMerchantLogo(defaultImagePath);
			 String path=picDirectory+"users/"+strMerchantId;
             File fileFolderOfServer=new File(path);//user id 
              if(!fileFolderOfServer.exists()){
                 fileFolderOfServer.mkdirs();}
              JSONObject objQrCodeValues=new JSONObject();
  			objQrCodeValues.put("merchantId",strMerchantId);
  			objQrCodeValues.put("merchantName",strMerchantName);
  			//strStatus = merchantDetailsService.generateQRCode(objQrCodeValues.toString(),path,defaultImagePath);
			jobjStatus = merchantDetailsService.saveMerchantDetails(merchantDetailsDto, strMerchantId, mailConfigDto,objQrCodeValues.toString(),path,defaultImagePath);
		   
             
		     }
               catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return jobjStatus.toString();
	}
//------------------------------------------checkForUniqueMail------------------------------------------//
@RequestMapping(value = "/checkForUniqueMail", method = {RequestMethod.POST,RequestMethod.GET})
public @ResponseBody String checkForUniqueMail(HttpServletRequest request)
{
JSONObject jobjStatus=new JSONObject();
	try{
		String strEmailId=request.getParameter("mailId");
 		
		jobjStatus=merchantDetailsService.checkForUniqueMail(strEmailId);
	
	}
	
	catch(Exception e){
		logger.error(e.getMessage(), e);
	}
	logger.info("returns from checkForUniqueMail() in MerchantDetailsController to"+jobjStatus.toString());
	System.out.println(jobjStatus.toString());
	
	return jobjStatus.toString();
}
//------------------------------------------------------------------------------------------------------//
//------------------------------forgotPassword---------------------------------------------------------//
@RequestMapping(value = "/forgotPassword", method = {RequestMethod.POST,RequestMethod.GET})
public @ResponseBody String forgotPassword(HttpServletRequest request)
{
JSONObject jobjStatus=new JSONObject();
	try{
		String strMailId=request.getParameter("emailId");
		String strUserId=request.getParameter("userId");
		String strPassword=request.getParameter("password");
		
	
		 MailConfigDto mailConfigDto=new MailConfigDto();
 		
 		//----
 		mailConfigDto.setFromMail(fromMail);
		mailConfigDto.setSmtpAddresss(smtpHost);
		mailConfigDto.setSmtpPort(smtpPort);
 		//--
 		
 		if(!StringUtils.isEmpty(strUserId)){
 		mailConfigDto.setMessage(passwordChangeContent.replaceAll("userIdReplace", strUserId));
 		}
 		mailConfigDto.setSubject("Password Reset");
 		
		jobjStatus=merchantDetailsService.forgotPassword(strPassword,strUserId,strMailId,mailConfigDto,userIdContent);
	}
	
	catch(Exception e){
		e.printStackTrace();
		logger.error(e.getMessage(), e);
	}
	logger.info("returns from forgotPassword() in MerchantDetailsController to"+jobjStatus.toString());
	System.out.println(jobjStatus.toString());
	
	return jobjStatus.toString();
}
//-----------------------------------------------------------------------------------------------------//
@RequestMapping(value = "/getAllMerchants", method = { RequestMethod.GET,
		RequestMethod.POST })
public @ResponseBody String getAllMerchants(Model model,
		HttpServletRequest request) throws ProcessingException {
	logger.info("inside getAllMerchants() in CardDetailsController");
	HttpSession session = request.getSession();
	JSONObject res = null;


	try {

		res = merchantDetailsService.getAllMerchants(picPath);

	} catch (ProcessingException e) {
		logger.error(e.getMessage(), e);
		throw e;
	}
	return res.toString();
}

@RequestMapping(value = "/getAllCardGroups", method = { RequestMethod.GET,
		RequestMethod.POST })
public @ResponseBody String getAllCardGroups(Model model,
		HttpServletRequest request) throws ProcessingException {
	logger.info("inside getAllMerchants() in CardDetailsController");
	String listCardGroups="";
	try {
		listCardGroups = merchantDetailsService.getAllCardGroups();
	} catch (ProcessingException e) {
		logger.error(e.getMessage(), e);
		throw e;
	}
	return listCardGroups.toString();
}





}
