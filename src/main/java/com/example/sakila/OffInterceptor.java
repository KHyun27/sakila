package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor{

	// 특정 컨트롤러 실행전에 request와 response를 가로채어 먼저 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		log.debug(request.getRequestURL().toString() + " 요청 OffInterceptor");
		
		// 로그인이 되어 있다면 session.getAttribute("loginStaff")
		HttpSession session = request.getSession();
		if (session.getAttribute("loginStaff") != null) {
			response.sendRedirect(request.getContextPath() + "/on/sakilaMain"); // /on/sakilaMain.jsp
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
