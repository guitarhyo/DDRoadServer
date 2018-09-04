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

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ddroad.model.UserVO;


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
@Repository
public class CommonDao {
//	private static final String NS = CommonDao.class.getSimpleName() + ".";
//	@Autowired
//	@Qualifier(value = "sqlSessionComm")
//	private SqlSession sqlSession;
//	/**
//	 * <pre>
//	 *  리스트조회
//	 * @param 
//	 * @return List<>
//	 * @throws Exception
//	 * @since 2018. 8. 22. 
//	 * @author H.N.KIM
//	 * @비고
//	 *
//	 * </pre>
//	 */
//	public List<Map<String,String>> selectBoard() throws Exception {
//		return sqlSession.selectList(NS +"selectBoard");
//	}

	
	//테스트용
//	public static void main(String[] args) {
//		//http://hyeonstorage.tistory.com/111  -참고
//		 	String url = "jdbc:mysql://127.0.0.1:3306/ddroad"; // url 형식
//	        Connection conn = null;//DB연결
//	        PreparedStatement pstmt = null;//쿼리전송
//	        ResultSet rs = null;//결과값
//	        try{
//	            Class.forName("com.mysql.jdbc.Driver"); // JDBC 드라이버 로드
////	            Class.forName("com.mysql.jdbc.Driver") 처럼 특정 클래스를 로딩하면 자동으로 객체가 생성되고 DriverManager에 등록된다.
////	            드라이버 클래스를 찾지 못할 경우 forName() 메소드는 ClassNotFoundException 예외를 발생시키므로 반드시 예외 처리를 해야 한다.
////	            http://javacan.tistory.com/entry/1 - 참고
//	            
//	            conn = DriverManager.getConnection(url, "username", "passwd"); // 데이터베이스 연결(id/pw)
//	            if(conn==null){
//	                System.out.println("연결실패");
//	            }else{
//	                System.out.println("연결성공");
//	                // 출력 준비
//	                String sql = "SELECT * FROM board";
//	               
//	                pstmt = conn.prepareStatement(sql);
//	                rs = pstmt.executeQuery();
//	                
//	                // 출력
//	                while(rs.next()){ // boolean 값을 던짐
//	                    String t_id = rs.getString(1); // 바인딩
//	                    String team_name = rs.getString(2);
//	                    String id = rs.getString(3);
//	                    String name = rs.getString(4);
//	                    String age = rs.getString(5);
//	                    System.out.println(t_id+", "+team_name+", "+id+", "+name+", "+age);
//	                }
//	            }
//	        }catch(ClassNotFoundException ce){
//	            ce.printStackTrace();            
//	        }catch(SQLException se){
//	            se.printStackTrace();    
//	        }catch(Exception e){
//	            e.printStackTrace();
//	        }finally{
//	            System.out.println("나 finally");
//	            try{ // 연결 해제(한정돼 있으므로)
//	                if(rs!=null){        rs.close();            }
//	                if(pstmt!=null){    pstmt.close();        }
//	                if(conn!=null){    conn.close();        }
//	            }catch(SQLException se2){
//	                se2.printStackTrace();
//	            }            
//	        }
//	}
}