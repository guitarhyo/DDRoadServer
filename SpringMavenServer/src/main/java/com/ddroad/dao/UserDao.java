package com.ddroad.dao;

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
}
