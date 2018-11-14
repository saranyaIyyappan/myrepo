package com.interland.giftcard.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.interland.giftcard.dto.CardCategoryDto;
import com.interland.giftcard.service.CardCategoryService;

@Controller
@RequestMapping("/cardCategory")
public class CardCategoryController {
	private static final Logger logger = Logger.getLogger(CardCategoryController.class.getName());
	  @Autowired
	  CardCategoryService cardCategoryService;
	  
	  @RequestMapping(value = "/cardCategoryScreen", method ={RequestMethod.GET,RequestMethod.POST})
			public String cardCategoryScreen(HttpServletRequest request,Model model) {
		  HttpSession session = request.getSession();
		  String loggedUser=(String)session.getAttribute("userName");
		  model.addAttribute("loggedUser", loggedUser);
		   return "cardCategory";
		    }
		    @RequestMapping(value = "/cardCategoryList", method ={RequestMethod.GET,RequestMethod.POST})
		   	public @ResponseBody String cardCategoryList(HttpServletRequest request) {
		    	
		    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
		        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
		        
		        String sSearch = request.getParameter("sSearch");
		        String searchParam = request.getParameter("searchData");
		    	String listResult="";
		        try {
		        	listResult=cardCategoryService.getAllCardCategoryList(searchParam, sSearch, displaystart, idisplaylength);
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
		       	return listResult;
		       }
		    
		    @RequestMapping(value = "/saveCardCategory", method ={RequestMethod.GET,RequestMethod.POST})
		   	public String saveCardCategory(Model model,HttpServletRequest request,CardCategoryDto cardCategoryDto,@RequestParam CommonsMultipartFile docFile,RedirectAttributes redirectAttributes) {
		    	
		    	//String returnStatus="";
		    	JSONObject returnStatus=new JSONObject();
		        try {
		        	 HttpSession session = request.getSession();
	                 String userId = (String) session.getAttribute("userId");
	                 if(!docFile.isEmpty()){
	                	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	 		            if(isMultipart){
	 			             File fileFromRequest = new File(request.getServletContext().getRealPath(""));
	 			             File fileFolderOfServer=new File(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId);//user id 
	 			             System.out.println(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId+">>>>>>>>>>>>>>>>VIKKKI");
	 			                if(!fileFolderOfServer.exists()){
	 			                	fileFolderOfServer.mkdir();
	 			                }
	 			 		                String fileName= docFile.getOriginalFilename();
	 			 		                File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
	 			 		                docFile.transferTo(fileToUpload);
	 			 		                
	 			 		              String filePathToDb= request.getContextPath()+"/resources/users/"+userId+"/"+fileName;
	 			 		              cardCategoryDto.setDesignUrlEng(filePathToDb);
	 		            }
	                 }
		        	    returnStatus=cardCategoryService.saveCardCategory(cardCategoryDto);
		        	    redirectAttributes.addFlashAttribute("status", returnStatus.get("status"));
		        	    redirectAttributes.addFlashAttribute("message", returnStatus.get("message"));
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
		      // return "redirect:/cardCategory/cardCategoryScreen";
		       	return "redirect:/cardCategory/cardCategoryScreen";
		       }
		    
		    @RequestMapping(value = "/updateCardCategory", method ={RequestMethod.GET,RequestMethod.POST})
		   	public String updateCardCategory(Model model,HttpServletRequest request,CardCategoryDto cardCategoryDto,@RequestParam CommonsMultipartFile docFileEdit,RedirectAttributes redirectAttributes) {
		    	JSONObject returnStatus=new JSONObject();
		        try {
		        	String merchantId=request.getParameter("merchantIdHidden");
		        	String cardType=request.getParameter("cardTypeHidden");
		        	String cardTheme=request.getParameter("cardThmHidden");
		        	 HttpSession session = request.getSession();
	                 String userId = (String) session.getAttribute("userId");
	                 if(!docFileEdit.isEmpty()){
	                	 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	 		            if(isMultipart){
	 			             File fileFromRequest = new File(request.getServletContext().getRealPath(""));
	 			             File fileFolderOfServer=new File(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId);//user id 
	 			             System.out.println(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId+">>>>>>>>>>>>>>>>VIKKKI");
	 			                if(!fileFolderOfServer.exists()){
	 			                	fileFolderOfServer.mkdir();
	 			                }
	 			 		                String fileName= docFileEdit.getOriginalFilename();
	 			 		                File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
	 			 		              docFileEdit.transferTo(fileToUpload);
	 			 		                
	 			 		              String filePathToDb= request.getContextPath()+"/resources/users/"+userId+"/"+fileName;
	 			 		              cardCategoryDto.setDesignUrlEng(filePathToDb);
	 		            }
	                 }
		        	
		        	returnStatus=cardCategoryService.updateCardCategory(cardCategoryDto,merchantId,cardType,cardTheme);
		        	redirectAttributes.addFlashAttribute("status", returnStatus.get("status"));
		        	redirectAttributes.addFlashAttribute("message", returnStatus.get("message"));
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
		       	return  "redirect:/cardCategory/cardCategoryScreen";
		       }

		    @RequestMapping(value = "/deleteCardCategory", method ={RequestMethod.GET,RequestMethod.POST})
		   	public @ResponseBody String deleteCardCategory(HttpServletRequest request,@RequestParam(value = "cardCategoryId") String cardCategoryId
		   			,@RequestParam(value = "merchantIdHidden") String merchantIdHidden
		   			,@RequestParam(value = "cardType") String cardType
		   			,@RequestParam(value = "cardTheme") String cardTheme) {
		    	
		    	String returnStatus="";
		    /*	String merchantId=request.getParameter("merchantIdHidden");
	        	String cardType=request.getParameter("cardTypeHidden");
	        	String cardTheme=request.getParameter("cardThmHidden");*/
		        try {
		        	returnStatus=cardCategoryService.deleteCardCategory(merchantIdHidden,cardType,cardTheme,cardCategoryId);
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
		       	return returnStatus;
		       }
		    @RequestMapping(value = "/getMerchantId" , method = RequestMethod.POST)  
			   public @ResponseBody String getMerchantId(Model model){  
				   String returnStatus="";  
				   try {     
					   returnStatus=cardCategoryService.getMerchantId();
					   } catch (Exception e) {
						   logger.error(e.getMessage(), e);
						   }     
				   return returnStatus; 
				   }
		    @RequestMapping(value = "/getCardTheme" , method = RequestMethod.POST)  
			   public @ResponseBody String getCardTheme(Model model){  
				   String returnStatus="";  
				   try {     
					   returnStatus=cardCategoryService.getCardTheme();
					   
					   } catch (Exception e) {
						   logger.error(e.getMessage(), e);
						   }     
				   return returnStatus; 
				   }
		    /*
		    @RequestMapping(value = "/uploadDocument", method = RequestMethod.POST)
		    public String uploadDocument(Model model,RedirectAttributes redirectAttributes,HttpServletRequest request,@RequestParam CommonsMultipartFile docFile) {
		        String documentId="";
		        String strIncomingPage=""; 
		        String strReturnPage="";
		        try{
		     //    strIncomingPage=request.getParameter("pageName");
		      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		            if(isMultipart){
		        //     documentId=request.getParameter("documentId");
		         //    String path = request.getServletContext().getRealPath("/");
		        //     String prjId=request.getParameter("projectId");
		                String pathCheck = request.getServletContext().getRealPath("");
		             File file = new File(pathCheck);
		             String fullPathToYourWebappRoot = file.getCanonicalPath();
		             File filePath2=new File(fullPathToYourWebappRoot+"/"+prjId);//user id 
		                if(!filePath2.exists()){
		                 filePath2.mkdir();
		                }
		                
		                String fname = docFile.getOriginalFilename();
		       String fextns = fname.substring(fname.lastIndexOf(".") + 1,
		         fname.length());
		       fname=fname.replaceAll("."+fextns,"");
		                String strDocNameForFolder= docFile.getOriginalFilename();
		                File uploadedMultipartFile = new File(filePath2+"/"+strDocNameForFolder);
		                docFile.transferTo(uploadedMultipartFile);
		                String strDocPath=fullPathToYourWebappRoot;
		                String strDocName=request.getParameter("docName");
		       
		       JSONObject jsonObjUploads=escProjectDocumentService.saveOrUpdateDocumentByPK(prjId, strDocName, documentId, strDocNameForFolder, strDocPath);
		       
		                }
		            if(strIncomingPage.equals("project")){
		              GroupScreenBean groupScreen = userService.getButtonPermission(userId, buttonProjectContact);
		                 model.addAttribute("groupScreenPermission", groupScreen);
		                 model.addAttribute("screenId",buttonProjectContact);
		                 model.addAttribute("currentTab","document");
		             strReturnPage="escProject";
		            }else if(strIncomingPage.equals("fund request form")){
		             GroupScreenBean groupScreen = userService.getButtonPermission(userId, buttonFundReqForm);
		                model.addAttribute("groupScreenPermission", groupScreen);
		                model.addAttribute("screenId",buttonFundReqForm);
		                model.addAttribute("currentTab","fund req");
		            strReturnPage="fundRequestForm";
		            }else if(strIncomingPage.equals("fund req exception")){
		             GroupScreenBean groupScreen = userService.getButtonPermission(userId, buttonFundReqFormException);
		                model.addAttribute("groupScreenPermission", groupScreen);
		                model.addAttribute("screenId",buttonFundReqFormException);
		                model.addAttribute("currentTab","fund req exception");
		            strReturnPage="fundRequestException";
		            }else if(strIncomingPage.equals("project activation")){
		             GroupScreenBean groupScreen = userService.getButtonPermission(userId, buttonPrjActivation);
		                model.addAttribute("groupScreenPermission", groupScreen);
		                model.addAttribute("screenId",buttonPrjActivation);
		                model.addAttribute("currentTab","project activation");
		             strReturnPage="escProjectActivation";
		            }else{
		             GroupScreenBean groupScreen = userService.getButtonPermission(userId, buttonClosureWorkFlow);
		                model.addAttribute("groupScreenPermission", groupScreen);
		                model.addAttribute("screenId",buttonClosureWorkFlow);
		                model.addAttribute("currentTab","closure work flow");
		             strReturnPage="closureWorkFlow";
		            }
		     }catch(Exception e){
		      logger.info(e.getMessage(),e);
		     }
		     return strReturnPage;
		 }*/
		    
}
