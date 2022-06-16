package edu.kh.hotellala.board.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.hotellala.board.model.dao.BoardDAO;
import edu.kh.hotellala.board.model.vo.Board;

public class BoardService {
	private BoardDAO dao = new BoardDAO();

	/** 공지사항 목록조회
	 * @return list
	 * @throws Exception
	 */
	public List<Board> noticeAll() throws Exception{
		Connection conn = getConnection();
		List<Board> list = dao.noticeAll(conn);
		close(conn);
		return list;
	}

	/** FAQ 목록조회
	 * @param cd
	 * @return list
	 * @throws Exception
	 */
	public List<Board> faqAll(int cd) throws Exception{
		Connection conn = getConnection();
		List<Board> list = null;
		if(cd !=99) {
			list = dao.faqCategory(conn,cd);
		}else {
			list = dao.faqAll(conn);
		}
		close(conn);
		return list;
	}

	/**QNA 답변 조회
	 * @return
	 * @throws Exception
	 */
	public List<Board> qnaCheck(int i) throws Exception{
		Connection conn = getConnection();
		List<Board> list = dao.qnaCheck(conn, i);
		close(conn);
		return list;
	}


}
