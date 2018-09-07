package com.ddroad.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ddroad.model.BoardVO;

@Repository
public class BoardDao {
	private static final String NS = CommonDao.class.getSimpleName() + ".";
	@Autowired
	@Qualifier(value = "sqlSessionComm")
	private SqlSession sqlSession;

	/**
	 * <pre>
	 *  리스트조회
	 * @param 
	 * @return List<>
	 * @throws Exception
	 * @since 2018. 8. 22. 
	 * @author H.N.KIM
	 * @비고
	 *
	 * </pre>
	 */
	public List<Map<String,String>> selectBoard() throws Exception {
		return sqlSession.selectList(NS +"selectBoard");
	}
	
	public int write(BoardVO vo) throws Exception{
		return sqlSession.insert("write", vo);
	}
	public int delete(String id) throws Exception{
		return sqlSession.delete("deleteWriting",id);
	}
}
