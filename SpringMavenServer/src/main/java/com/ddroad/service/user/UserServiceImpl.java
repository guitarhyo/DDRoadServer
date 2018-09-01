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
		/*아이디가 저장 되어있지 않을 때만 저장*/
		if(selectById(vo.getId())==0) {
			dao.join(vo);
		}
	}

	/*중복 아이디 존재 여부 확인*/
	@Override
	public int selectById(String id) throws Exception {
		return dao.selectById(id);
	}
	
		
}
