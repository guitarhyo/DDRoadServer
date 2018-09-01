package com.ddroad.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.model.UserVO;
import com.ddroad.naverLogin.oauth.bo.NaverLoginBO;
import com.ddroad.service.user.UserServiceImpl;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/app/login")
public class MemberController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired 
	UserServiceImpl service;
	
	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("/loginScript.do")
	public ModelAndView loginPageScript(HttpSession session) {	
		return new ModelAndView("app/member/loginScript");
	}
	
	@RequestMapping("/loginScriptCallback.do")
	public ModelAndView loginPageScriptCallback(HttpSession session) {
		return new ModelAndView("app/member/loginScriptCallback");
	}
	
	@RequestMapping("/login.do")
	public ModelAndView loginPage(HttpSession session) {
		/*네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버 : " + naverAuthUrl);
		System.out.println(session);
		/*생성한 인증 URL을 View로 전달*/
		return new ModelAndView("app/member/login","url",naverAuthUrl);
	}
	
	@RequestMapping(value="/callback.do")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급*/
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println("result : " + apiResult);
		
		return new ModelAndView("app/member/callback","result",apiResult);
	}
	
	@RequestMapping("/join.do")
	public String join(HttpServletRequest request, HttpSession session) throws Exception{
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		UserVO user = new UserVO(id, email, nickname, gender, age);
		service.join(user);
//		System.out.println(id + " " + email + " " + nickname + " " + gender + " " + age);
		return "redirect:/app/login/loginScript.do";
	}
}
