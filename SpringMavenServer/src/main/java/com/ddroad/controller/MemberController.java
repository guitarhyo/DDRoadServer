package com.ddroad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.model.UserVO;
import com.ddroad.service.UserService;

@Controller
@RequestMapping("/app/login")
public class MemberController {
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;
	@Autowired 
	UserService service;
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
//	@Autowired
//	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}
	
	@RequestMapping("/loginScript.do")
	public ModelAndView loginPageScript(HttpSession session) {	
		return new ModelAndView("app/member/loginScript");
	}
	
	@RequestMapping("/loginScriptCallback.do")
	public ModelAndView loginPageScriptCallback(HttpSession session) {
		return new ModelAndView("app/member/loginScriptCallback");
	}
	
//	@RequestMapping("/login.do")
//	public ModelAndView loginPage(HttpSession session) {
//		/*네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출*/
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		System.out.println("네이버 : " + naverAuthUrl);
//		System.out.println(session);
//		/*생성한 인증 URL을 View로 전달*/
//		return new ModelAndView("app/member/login","url",naverAuthUrl);
//	}
//	
//	@RequestMapping(value="/callback.do")
//	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
//		
//		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급*/
//		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		apiResult = naverLoginBO.getUserProfile(oauthToken);
//		System.out.println("result : " + apiResult);
//		
//		return new ModelAndView("app/member/callback","result",apiResult);
//	}
	
	@RequestMapping("/join.do")
	public String join(final UserVO vo) throws Exception{
		UserVO userVO = service.join(vo);
		
		session.setAttribute("DDROAD_USER", userVO);
	
//		System.out.println(id + " " + email + " " + nickname + " " + gender + " " + age);
		return "redirect:/app/login/loginScript.do";
	}
	
	@RequestMapping("/checkNickNamePage.do")
	public String checkNickNamePage() throws Exception{
		UserVO userVO =	(UserVO) session.getAttribute("DDROAD_USER");
    	
		if(userVO == null){
			return "redirect:/";
		}
		request.setAttribute("userId", userVO.getId());
		
		return "app/member/loginCheck";
	}
	
	@RequestMapping("/checkNickName.do")
	public @ResponseBody String checkNickName(final UserVO vo) throws Exception{
		int ret = service.selectUserNickname(vo.getNickname());
		
		if(ret > 0){
			return "F";
		}else{

			ret = service.updateNickName(vo);
			if(ret > 0){
				UserVO userVO =	(UserVO) session.getAttribute("DDROAD_USER");
		    	
				if(userVO == null){
					return "R";
				}
				
				userVO.setNickname(vo.getNickname());
				session.removeAttribute("DDROAD_USER");
				session.setAttribute("DDROAD_USER", userVO);
			}
			return "S";
		}
	}
	
}
