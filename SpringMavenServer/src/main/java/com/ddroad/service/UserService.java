package com.ddroad.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddroad.dao.UserDao;
import com.ddroad.model.UserVO;

@Service
public class UserService{
	@Autowired private UserDao dao;

	public void join(UserVO vo) throws Exception {
		/*아이디가 저장 되어있지 않을 때만 저장*/
		if(selectById(vo.getId())==0) {
			dao.join(vo);
		}else{
			vo = dao.selectByUser(vo.getId());
		}
	}

	/*중복 아이디 존재 여부 확인*/
	public int selectById(String id) throws Exception {
		return dao.selectById(id);
	}
	public UserVO selectByUser(String id) throws Exception {
		return dao.selectByUser(id);
	}
	public int selectUserNickname(String nickname) throws Exception {
		return dao.selectUserNickname(nickname);
	}
	public int updateNickName(UserVO vo) throws Exception {
		return dao.updateNickName(vo);
	}
	
	public List<UserVO> selectUserList()throws Exception {
		return dao.selectUserList();
	}
}