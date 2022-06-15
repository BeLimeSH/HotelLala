package edu.kh.hotellala.qna.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static edu.kh.hotellala.common.JDBCTemplate.*;

//import edu.kh.hotellala.member.model.dao.MemberDAO;
import edu.kh.hotellala.qna.model.vo.Qna;

public class QnaDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public QnaDAO() {
		try {
			
			prop = new Properties();
			
			String filePath = QnaDAO.class.getResource("/edu/kh/hotellala/sql/qna-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

	public int qnA(Connection conn, Qna q) throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("qna");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaTitle());
			pstmt.setString(2, q.getQnaContent());
			pstmt.setInt(3, q.getMemberNo());
			pstmt.setInt(4, q.getQnaCd());
			
			result=pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		return result;
	}

}
