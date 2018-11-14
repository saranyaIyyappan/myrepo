/*
 * Licensed Materials - Property of Business Intelligence Professionals
 *
 * Copyright 2016 Business Intelligence Professionals Pvt. Ltd.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Business Intelligence Professionals Pvt. Ltd. ("Confidential Information").
 * You shall not disclose such Confidential Information and shall use it only
 * in accordance with the terms of the license agreement you entered into with
 * Business Intelligence Professionals Pvt. Ltd.
 */

package com.interland.giftcard.controller;

/**
 *
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Authentication filter javadoc goes here.
 *
 */
public class AuthenticationFilter implements Filter {
	private static final Logger logger = Logger
			.getLogger(AuthenticationFilter.class.getName());
	private ServletContext context;

	public void init(final FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		logger.info("AuthenticationFilter initialized");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		HttpSession session = req.getSession(false);
		logger.info("URI : " + uri);

		if (uri.indexOf("/user/login") >= 0 || uri.indexOf("/admin") >= 0
				|| uri.indexOf("/home") >= 0
				|| uri.indexOf("/purchaseCard") >= 0
				|| uri.indexOf("/user/verifyUser") >= 0
				|| uri.indexOf("/userConfirmVerification") >= 0
				|| uri.indexOf("/consumer/registerConsumer") >= 0
				|| uri.indexOf("/admin/adminLogin") >= 0
				|| uri.indexOf("/merchant/merchantPageReturn") >= 0
			    || uri.indexOf("/merchant/forgotPassword") >= 0
				|| uri.indexOf("/merchant/checkForUniqueMail") >= 0
				|| uri.indexOf("/merchant/saveMerchantDetails") >= 0
				|| uri.indexOf("/consumer/purchaseCard") >= 0
				|| uri.indexOf("/cardCategory/getCardTheme") >= 0
				|| uri.indexOf("/merchant/getAllCardGroups") >= 0
				|| uri.indexOf("/consumerCardBalanace/cardBalance") >= 0
				|| uri.indexOf("/consumerCardBalanace/getCardBalance") >= 0
				|| uri.indexOf("/files/") >= 0
				|| (session != null && session.getAttribute("userId") != null)
				|| uri.contains("resource")) {
			if (uri.equals("/GiftCard/")
					&& session.getAttribute("userId") != null) {
				req.getRequestDispatcher((String) session.getAttribute("home"))
						.forward(request, response);

			} else {
				chain.doFilter(request, response);
			}
			
		} else {
			res.setStatus(401);
			logger.info("Unauthorized access request");
			req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(
					request, res);
		}
	}

	@Override
	public void destroy() {
		// close any resources here
	}
}
