package com.ddroad.service;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddroad.dao.BoardDao;
import com.ddroad.model.BoardVO;

@Service
public class BoardService {
	@Autowired BoardDao dao;
	
	public List<Map<String,String>> selectBoard() throws Exception{
		return dao.selectBoard();
	}
	
	public int write(BoardVO vo,HttpServletResponse response) throws Exception{
		String filterContent = vo.getContents();
		String filterTitle = vo.getTitle();
		
		String regex = "[\ud83c\udf00-\ud83d\ude4f]|[\ud83d\ude80-\ud83d\udeff]";
		
		Pattern emoticons = Pattern.compile(regex, Pattern.UNICODE_CHARACTER_CLASS);
		
		Matcher emoticonsMatcher = emoticons.matcher(filterContent);
		filterContent = emoticonsMatcher.replaceAll("");
		
		emoticonsMatcher = emoticons.matcher(filterTitle);
		filterTitle = emoticonsMatcher.replaceAll("");
		
		vo.setContents(filterContent);
		vo.setTitle(filterTitle);

		return dao.write(vo);
	}
	
	public BoardVO lookupContents(String id) throws Exception{
		return dao.lookupContents(id);
	}
	
	public int delete(String id) throws Exception{
		return dao.delete(id);
	}
	
	public int modify(BoardVO vo) throws Exception{
		return dao.modity(vo);
	}
	
	
}