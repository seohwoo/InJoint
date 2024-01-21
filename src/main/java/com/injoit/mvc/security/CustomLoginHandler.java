package com.injoit.mvc.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(au -> {
			roleNames.add(au.getAuthority());
		});
		String rdir = "/emp/all";
		if(roleNames.contains("ROLE_ADMIN")) {
			rdir = "/emp/admin";
		}else if(roleNames.contains("ROLE_MEMBER")) {
			rdir = "/emp/worker";
		}
		//if(request.getSession().getAttribute("url_prior") != null) {
		//	rdir = (String)request.getSession().getAttribute("url_prior");
		//}
		response.sendRedirect(rdir);
	}
}
