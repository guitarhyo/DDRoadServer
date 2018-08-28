package com.ddroad.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddroad.dao.UserDao;
import com.ddroad.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao dao;

	@Override
	public void join(UserVO vo) throws Exception {
		if(dao.join(vo)==0) {
			System.out.println("insert error");
		}
	}
	
		
}
