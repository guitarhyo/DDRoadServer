package com.ddroad.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddroad.service.CommonService;

/**
 * <pre>
 * 공통 Controller
 * 공통 처리를 위한 컨트롤러
 * author N.H.KIM
 * version
 * since 2018. 8. 22. 오후 9:46:37
 * History
 * Date				|	author		| 변경 내용
 * 2018. 8. 22.		|	N.H.KIM		|신규
 * </pre>
 */
@Controller
public class BaseController {

  @Autowired
  private CommonService service;




  @RequestMapping("/boardList.do")
  public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
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



  @RequestMapping(value = "/loginJson.do")
  public @ResponseBody Map<String, String> login(ModelAndView mv, HttpSession session)
      throws Exception {
   String str = "test";
    return null;
  }


}
