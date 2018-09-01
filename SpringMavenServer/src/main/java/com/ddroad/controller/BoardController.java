package com.ddroad.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.model.BoardVO;
import com.ddroad.service.BoardService;

@Controller
@RequestMapping("/app/board")
public class BoardController {
	@Autowired BoardService service;
//	@Autowired Session session;
	
	@RequestMapping("/boardList.do")
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> inParam) throws Exception {
  
	    ModelAndView mav = new ModelAndView();
	    try {
	     
	
	    mav.addObject("list", service.selectBoard());
	    mav.addObject("testdata", "Hello World!! spring");
	
	  
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
