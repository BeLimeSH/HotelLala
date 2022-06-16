package edu.kh.hotellala.board.model.dao;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.hotellala.board.model.vo.Board;

public class BoardDAO {
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public BoardDAO() {
		try {
			prop = new Properties();
			
			String filePath = BoardDAO.class.getResource("/edu/kh/hotellala/sql/board-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Board> noticeAll(Connection conn) throws Exception{
		List<Board> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("noticeAll");
			stmt = conn.prepareStatement(sql);
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				Board board = new Board();
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				list.add(board);
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	/**FAQ 전체조회
	 * @param conn
	 * @return list
	 * @throws Exception
	 */
	public List<Board> faqAll(Connection conn) throws Exception{
		
		List<Board> list = new ArrayList<Board>();
		
		try {			
			String sql = prop.getProperty("faqAll");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				Board board = new Board();
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				list.add(board);
				
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	
	/** FAQ 카테고리 조회
	 * @param conn
	 * @param cd
	 * @return list
	 * @throws Exception
	 */
	public List<Board> faqCategory(Connection conn, int cd) throws Exception{
		
		List<Board> list = new ArrayList<Board>();
		
		try {
			
			String sql = prop.getProperty("faqCategory");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cd);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Board board = new Board();
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				list.add(board);
				
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/** QNA 답변 조회 DAO
	 * @param conn
	 * @return list
	 * @throws Exception
	 */
	public List<Board> qnaCheck(Connection conn, int memberNo) throws Exception {
		List<Board> list = new ArrayList<Board>();
		
		try {
			
			String sql = prop.getProperty("qnaCheck");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				
				Board board = new Board();
				board.setBoardTitle(rs.getString("QNA_TITLE"));
				board.setBoardContent(rs.getString("QNA_CONTENT"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setAnswerContent(rs.getString("ANSWER_CONTENT"));
				list.add(board);
			}
		}finally{
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
