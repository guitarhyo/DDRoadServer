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
import com.ddroad.model.ReplyVO;

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
		return dao.modify(vo);
	}
	
	/**
	 * 댓글 리스트 가져오기
	 * @param boardId
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> getReplyList(String boardId) throws Exception{
		
		List<Map<String, String>> listMap = dao.getReplyList(boardId);
		if(listMap.size()==0) {
			return null;
		}else {
			return listMap;
		}
	}
	
	/**
	 * 댓글 등록
	 * @param vo
	 * @return 성공시 마지막 댓글 번호 리턴, 실패시 0 반환
	 * @throws Exception
	 */
	public String regitReply(ReplyVO vo) throws Exception{
		
		String filterContent = vo.getContents();
		String regex = "[\ud83c\udf00-\ud83d\ude4f]|[\ud83d\ude80-\ud83d\udeff]";
		Pattern emoticons = Pattern.compile(regex, Pattern.UNICODE_CHARACTER_CLASS);
		Matcher emoticonsMatcher = emoticons.matcher(filterContent);
		filterContent = emoticonsMatcher.replaceAll("");
		vo.setContents(filterContent);
		
		
		if(dao.regitReply(vo)==1) {
			return vo.getR_id();
		}else {
			return "failed";
		}
	}
	/**
	 * 댓글 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int modifyReply(ReplyVO vo) throws Exception{
		String filterContent = vo.getContents();
		String regex = "[\ud83c\udf00-\ud83d\ude4f]|[\ud83d\ude80-\ud83d\udeff]";
		Pattern emoticons = Pattern.compile(regex, Pattern.UNICODE_CHARACTER_CLASS);
		Matcher emoticonsMatcher = emoticons.matcher(filterContent);
		filterContent = emoticonsMatcher.replaceAll("");
		vo.setContents(filterContent);
		
		return dao.modifyReply(vo);
	}
	
	/**
	 * 댓글 삭제
	 * @param replyId
	 * @return
	 * @throws Exception
	 */
	public int deleteReply(String r_id) throws Exception {
		return dao.deleteReply(r_id);
	}
}