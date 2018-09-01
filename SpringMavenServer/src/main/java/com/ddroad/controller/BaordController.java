package com.ddroad.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.service.BoardService;

@Controller
@RequestMapping("/app/board")
public class BaordController {
	@Autowired BoardService service;
	
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
}
