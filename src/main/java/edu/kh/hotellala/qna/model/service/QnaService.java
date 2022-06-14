package edu.kh.hotellala.qna.model.service;

import edu.kh.hotellala.qna.model.dao.QnaDAO;
import edu.kh.hotellala.qna.model.vo.Qna;
import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
public class QnaService {
	private QnaDAO dao = new QnaDAO();
	
	public int qnA(Qna q) throws Exception{
		
		Connection conn = getConnection();
		int result = dao.qnA(conn,q);
		
		if(result>0) commit(conn);
		else		rollback(conn);
		
		close(conn);
		return result;
	}

}
