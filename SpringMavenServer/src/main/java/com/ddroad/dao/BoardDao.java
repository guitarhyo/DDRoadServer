package com.ddroad.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ddroad.model.BoardVO;
import com.ddroad.model.ReplyVO;

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
		return sqlSession.selectList("selectBoard");
	}
	
	public int write(BoardVO vo) throws Exception{
		return sqlSession.insert("write", vo);
	}
	public int delete(String id) throws Exception{
		return sqlSession.delete("deleteWriting",id);
	}
	public BoardVO lookupContents(String id) throws Exception{
		return sqlSession.selectOne("lookupContents",id);
	}
	public int modify(BoardVO vo) throws Exception{
		return sqlSession.update("modifyWriting",vo);
	}
	
	public List<Map<String, String>> getReplyList(String boardId) throws Exception{
		return sqlSession.selectList("getReplyList",boardId);
	}
	
	public int regitReply(ReplyVO vo){
		return sqlSession.insert("regitReply",vo);
	}
	
	public int modifyReply(ReplyVO vo) {
		return sqlSession.update("modifyReply",vo);
	}
	
	public int deleteReply(String replyId) {
		return sqlSession.delete("deleteReply",replyId);
	}
}
