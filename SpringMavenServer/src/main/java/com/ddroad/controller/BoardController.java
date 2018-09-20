package com.ddroad.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.model.BoardVO;
import com.ddroad.model.UserVO;
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
	    	UserVO userVO =	(UserVO) session.getAttribute("DDROAD_USER");
	    	
			if(userVO.getNickname() == null || "".equals(userVO.getNickname())){
				return new ModelAndView("redirect:/app/login/checkNickNamePage.do");
			}
			
	    mav.addObject("list", boardService.selectBoard());
	    mav.addObject("userList",userService.selectUserList());
	
	  
	    mav.setViewName("app/board/list");
	    } catch (Exception e) {
	      e.printStackTrace();
	      return new ModelAndView("redirect:/");
	    }
	    return mav;
    }
	
	@RequestMapping("/write.do")
	public String write() {
		return "app/board/write";
	}
	
	@RequestMapping("/writeOK.do")
	public String writeOK(BoardVO vo,HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		boardService.write(vo,response);
//		System.out.println(vo);
		return "redirect:/app/board/boardList.do";
	}
	
	@RequestMapping("/lookupContents.do")
	public ModelAndView lookupContents(@RequestParam String id) throws Exception{
		ModelAndView mav = new ModelAndView("app/board/contents");
		mav.addObject("boardVO",boardService.lookupContents(id));
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public String delete(String id, HttpServletResponse response) throws Exception{
		boardService.delete(id);
		return "redirect:/app/board/boardList.do";
	}
	
	@RequestMapping("/modifyView.do")
	public ModelAndView modifyView(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView("/app/board/modify");
		mav.addObject("boardVO", boardService.lookupContents(id));
		return mav;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView modify(@ModelAttribute BoardVO vo) throws Exception{
		System.out.println(vo);
		boardService.modify(vo);
		ModelAndView mav = new ModelAndView("redirect:/app/board/boardList.do");
		mav.addObject("boardVO", boardService.lookupContents(vo.getId()));
		return mav;
	}
}
