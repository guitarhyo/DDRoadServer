package com.ddroad.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddroad.dao.BoardDao;

@Service
public class BoardService {
	@Autowired BoardDao dao;
	
	public List<Map<String,String>> selectBoard() throws Exception{
		
		return dao.selectBoard();
	}
}