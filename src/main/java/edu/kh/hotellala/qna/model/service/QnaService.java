package edu.kh.hotellala.qna.model.service;

import edu.kh.hotellala.common.util;
import edu.kh.hotellala.qna.model.dao.QnaDAO;
import edu.kh.hotellala.qna.model.vo.Qna;
import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
public class QnaService {
	private QnaDAO dao = new QnaDAO();
	
	public int qnA(Qna q) throws Exception{
		
		Connection conn = getConnection();
		q.setQnaTitle(util.XSSHandling(q.getQnaTitle()));
		q.setQnaContent(util.XSSHandling(q.getQnaContent()));
		q.setQnaContent(util.newLineHandling(q.getQnaContent()));
		
				
		int result = dao.qnA(conn,q);
		
		if(result>0) commit(conn);
		else		rollback(conn);
		
		close(conn);
		return result;
	}

}
