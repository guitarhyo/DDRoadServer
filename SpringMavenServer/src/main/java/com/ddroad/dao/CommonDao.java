/**<pre>
 * 1. Project Name : LotteCardMall
 * 2. Package Name : com.lottecard.mall.cmmn.dao
 * 3. File Name		: CommonDao.java
 * 4. Date				 : 오후 2:14 2015-01-15
 * 5. Author			 : D.G.Youn
 * 6. Note				 :
 * </pre>
 */
package com.ddroad.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/**
 * <pre>
 * 공통 Dao
 * 공통 처리 Dao
 * @version 1.0
 * @author H.N.KIM
 * @since 2018. 8. 22. 
 * @see
 * @History
 *  Date          |    author    | 변경내용
 *	2018. 8. 22 . |    H.N.KIM   | 신규
 * @Todo
 * </pre>
 */
@Component
public class CommonDao {

	// --------------------------------------------------------------------------
	// # sqlSession 설정
	//	 -- DataSource를 두개 쓰므로 @Resource(name="sqlSession") 사용
	//	 -- 하나만 사용할 경우 @Autowired
	// --------------------------------------------------------------------------
	@Resource(name="sqlSessionComm")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

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
		return sqlSession.selectList("CommonMapper.selectBoard");

	}
	
	

}