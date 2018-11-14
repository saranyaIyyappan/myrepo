package com.interland.giftcard.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.interland.giftcard.dto.CardCartDto;
import com.interland.giftcard.dto.CardThemeDto;
import com.interland.giftcard.dto.MerchantDiscountDto;
import com.interland.giftcard.service.CardThemeService;
import com.interland.giftcard.service.MerchantDiscountService;


@Controller
@RequestMapping("/merchantDiscount")
public class MerchantDiscountController {

	Logger logger = Logger.getLogger(MerchantDiscountController.class.getName());

	@Autowired
	MerchantDiscountService merchantDiscountService;
	 @Value("${PIC_DIR}")
		private String imagePathDirectory;
	
	@RequestMapping(value = "/merchantDiscount")
	public String merchantDiscount(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("userName");
		model.addAttribute("loggedUser", loggedUser);
		return "merchantDiscount";
	}

	 @RequestMapping(value = "/saveMerchantDiscount", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String saveMerchantDiscount(HttpServletRequest request,MerchantDiscountDto merchantDiscountDto) {
		
	    	String returnStatus="";
	        try {
	        	  CommonsMultipartFile docFile=null;
	        	  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        	  docFile = (CommonsMultipartFile) multipartRequest.getFile("docFile");
	        	 HttpSession session = request.getSession();      
	    		 String userId = (String) session.getAttribute("userId");	
	    		 merchantDiscountDto.setMerchantId(userId);
	    		 
	    		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		            if(isMultipart){
			            /* File fileFromRequest = new File(request.getServletContext().getRealPath(""));
			             File fileFolderOfServer=new File(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId);//user id 
			             System.out.println(fileFromRequest.getCanonicalPath()+"/resources/users/"+userId+">>>>>>>>>>>>>>>>VIKKKI");
			                if(!fileFolderOfServer.exists()){
			                	fileFolderOfServer.mkdir();
			                }
			 		                String fileName= docFile.getOriginalFilename();
			 		                File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
			 		                docFile.transferTo(fileToUpload);
			 		                
			 		              String filePathToDb= request.getContextPath()+"/resources/users/"+userId+"/"+fileName;*/
			 		             String path=imagePathDirectory+"/users/"+userId;
			  	                  File fileFolderOfServer=new File(path);//user id 
			  	                   if(!fileFolderOfServer.exists()){
			  	                      fileFolderOfServer.mkdirs();
			  	                     }
			  	                        String fileName= docFile.getOriginalFilename();
			  	                        File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
			  	                        docFile.transferTo(fileToUpload);
			  	                       String filePathToDb=  fileToUpload.getPath();
			  	                      logger.info("File to DB Path:::"+fileToUpload.getPath());
			 		             merchantDiscountDto.setDiscountLogo(filePathToDb);
			 		              }	    		 
	        	returnStatus=merchantDiscountService.saveMerchantDiscount(merchantDiscountDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	    @RequestMapping(value = "/updateMerchantDiscount", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String updateMerchantDiscount(HttpServletRequest request,MerchantDiscountDto merchantDiscountDto) {
	    	
	    	String returnStatus="";
	        try {
	        	 
	        	  HttpSession session = request.getSession();      
		    		 String userId = (String) session.getAttribute("userId");	
		    		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			            if(isMultipart){
			            	CommonsMultipartFile docFile=null;
				        	  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				        	  docFile = (CommonsMultipartFile) multipartRequest.getFile("docFile");
				        	  if(docFile!=null){
				        		  String path=imagePathDirectory+"/users/"+userId;
			  	                  File fileFolderOfServer=new File(path);//user id 
			  	                   if(!fileFolderOfServer.exists()){
			  	                      fileFolderOfServer.mkdirs();
			  	                     }
			  	                        String fileName= docFile.getOriginalFilename();
			  	                        File fileToUpload = new File(fileFolderOfServer+"/"+fileName);
			  	                        docFile.transferTo(fileToUpload);
			  	                       String filePathToDb=  fileToUpload.getPath();
			  	                      logger.info("File to DB Path:::"+fileToUpload.getPath());
			 		             merchantDiscountDto.setDiscountLogo(filePathToDb);
			            }
				 		              }	    	
	        	returnStatus=merchantDiscountService.updateMerchantDiscount(merchantDiscountDto);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	    @RequestMapping(value = "/deleteMerchantDiscount", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String deleteMercantdiscount(HttpServletRequest request,@RequestParam(value="couponCode") String coupenCode) {
	    	
	    	String returnStatus="";
	        try {
				returnStatus=merchantDiscountService.deleteMerchantDiscount(coupenCode);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return returnStatus;
	       }
	    


	    @RequestMapping(value = "/merchantDiscountList", method ={RequestMethod.GET,RequestMethod.POST})
	   	public @ResponseBody String merchantDiscountList(HttpServletRequest request) {
	    	
	    	int idisplaylength = Integer.parseInt(request.getParameter("iDisplayLength"));
	        int displaystart = Integer.parseInt(request.getParameter("iDisplayStart"));
	        
	        String sSearch = request.getParameter("sSearch");
	        String searchParam = request.getParameter("searchData");
	    	String listResult="";
	        try {
	        	HttpSession session = request.getSession();
	    		String merchantId = (String) session.getAttribute("userId");
	        	listResult=merchantDiscountService.getAllMerchantDiscountList(searchParam, sSearch, displaystart, idisplaylength, merchantId);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
	       	return listResult;
	       	
	       }
	
}
