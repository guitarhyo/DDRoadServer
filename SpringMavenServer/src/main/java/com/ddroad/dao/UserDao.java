package com.ddroad.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ddroad.model.UserVO;

@Repository
public class UserDao {
	@Autowired
	@Qualifier(value = "sqlSessionComm")
	private SqlSession sqlSession;
	
	public int join(UserVO vo) {
		return sqlSession.insert("join",vo);
	}
	
	public int selectById(String id) {
		return sqlSession.selectOne("selectById",id);
	}
	public UserVO selectByUser(String id) {
		return sqlSession.selectOne("selectByUser",id);
	}
	
	public int selectUserNickname(String nickname) {
		return sqlSession.selectOne("selectUserNickname",nickname);
	}
	public int updateNickName(UserVO vo){
		return sqlSession.update("updateNickName",vo);
	}
	public List<UserVO>selectUserList() {
		return sqlSession.selectList("selectUserList");
	}
	
}
