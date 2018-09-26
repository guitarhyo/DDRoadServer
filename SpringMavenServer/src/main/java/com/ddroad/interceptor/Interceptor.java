package com.ddroad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.time.StopWatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ddroad.model.UserVO;

public class Interceptor extends HandlerInterceptorAdapter {

	@Autowired HttpSession session;
	
	/**
	 * preHandle
	 *
	 * controller 호출전
	 */
	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();

		final String reqUri = request.getRequestURI();
		if(!reqUri.startsWith("/resources")) {
			System.out.println(reqUri);
		}
		
		UserVO userVO =	(UserVO) session.getAttribute("DDROAD_USER");
    	String url = "/app/login/loginScript.do";
		if(userVO == null){
			response.sendRedirect(url);
			return false;
		}

		return true;
	}

	/**
	 * postHandle
	 *
	 * controller 호출 후 view 페이지 출력전
	 */
	@Override
	public void postHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final ModelAndView modelAndView) {
	}

	/**
	 * afterCompletion
	 *
	 * controller + view 페이지 모두 출력 후
	 */
	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) {	
	}

}
