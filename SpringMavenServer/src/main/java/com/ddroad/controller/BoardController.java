package com.ddroad.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.ddroad.model.BoardVO;
import com.ddroad.service.BoardService;
import com.ddroad.service.UserService;

@Controller
@RequestMapping("/app/board")
public class BoardController {
	@Autowired BoardService boardService;
	@Autowired 
	UserService userService;
	
	@Autowired HttpSession session;
	
	@RequestMapping("/boardList.do")
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> inParam) throws Exception {
  
	    ModelAndView mav = new ModelAndView();
	    try {
	    System.out.println("session.getAttribute(\"DDROAD_USER\")===="+session.getAttribute("DDROAD_USER"));
	    
	    mav.addObject("list", boardService.selectBoard());
	    mav.addObject("userList",userService.selectUserList());
	
	  
	    mav.setViewName("app/board/list");
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return mav;
    }
	
	@RequestMapping("/write.do")
	public String write() {
		return "app/board/write";
	}
	
	@RequestMapping("/writeOK.do")
	public String writeOK(BoardVO vo) {
		System.out.println(vo);
		return "app/board/list";
	}
	
}
