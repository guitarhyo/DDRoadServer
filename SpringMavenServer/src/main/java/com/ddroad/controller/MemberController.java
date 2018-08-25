package com.ddroad.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddroad.service.CommonService;

@Controller
public class MemberController {
	@Autowired CommonService service;
	
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "app/member/loginPage";
	}
}
