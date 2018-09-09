package com.ddroad.controller;

import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

/**
 * <pre>
 * 공통 Controller
 * 공통 처리를 위한 컨트롤러
 * author N.H.KIM
 * version
 * since 2018. 8. 22. 오후 9:46:37
 * History
 * Date				|	author		| 변경 내용
 * 2018. 8. 22.		|	N.H.KIM		| 신규
 * </pre>
 */
@Controller
public class RestController {
	@Autowired
	HttpServletRequest request;
	
  @RequestMapping(value = "/api/search/restKakaoApi.do")
  public @ResponseBody ObjectNode restKakaoApi()
      throws Exception {
	  
		String queryString = request.getQueryString();
		System.out.println(queryString);

		
		
//		Enumeration params = request.getParameterNames();
//		System.out.println("----------------------------");
//		while (params.hasMoreElements()) {
//			String name = (String) params.nextElement();
//			System.out.println(name + " : " + request.getParameter(name));
//		}

		RestTemplate restTemplate = new RestTemplate();

		SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();

		requestFactory.setConnectTimeout(7000); // set short connect timeout
		requestFactory.setReadTimeout(7000); // set slightly longer read timeout
		restTemplate.setRequestFactory(requestFactory);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		String query = request.getParameter("query");
		if(query != null && !"".equals(query)){
//			query = URLDecoder.decode(query, "UTF-8");
			params.add("query", query);
		}else{
			params.add("query", "동물병원");
		}
		String x = request.getParameter("x");
		if(x != null && !"".equals(x)){
			params.add("x", x);
		}
		String y = request.getParameter("y");
		if(y != null && !"".equals(y)){
			params.add("y", y);
		}
		String radius = request.getParameter("radius");
		if(radius != null && !"".equals(radius)){
			params.add("radius", radius);
		}
		String rect = request.getParameter("rect");
		if(rect != null && !"".equals(rect)){
			params.add("rect", rect);
		}
		String page = request.getParameter("page");
		if(page != null && !"".equals(page)){
			params.add("page", page);
		}
		String size = request.getParameter("size");
		if(size != null && !"".equals(size)){
			params.add("size", size);
		}
		String sort = request.getParameter("sort");
		if(sort != null && !"".equals(sort)){
			params.add("sort", sort);
		}

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "e08db3eb9b45a551a67ebcda59f560de");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String, String>>(params,
				headers);

		ObjectNode responseEntity = restTemplate.postForObject(new URI("https://dapi.kakao.com/v2/local/search/keyword.json"),
				entity, ObjectNode.class);

		System.out.println(responseEntity.toString());
		
		
		
    return responseEntity;
  }


}
