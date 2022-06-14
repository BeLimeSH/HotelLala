package edu.kh.hotellala.reservationCheck.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;
import static edu.kh.hotellala.common.JDBCTemplate.close;
import static edu.kh.hotellala.common.JDBCTemplate.commit;
import static edu.kh.hotellala.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;
import edu.kh.hotellala.reservationCheck.model.dao.ReservationCheckDAO;

public class ReservationCheckService{
	
	private ReservationCheckDAO dao = new ReservationCheckDAO();
	

	/** 예약 조회 Service
	 * @return list
	 * @throws Exception
	 */
	public List<ReservationCheck> reservationCheck() throws Exception{
		
		Connection conn = getConnection();
		
		List<ReservationCheck> list = dao.reservationCheck(conn);
		
		close(conn);
		
		return list;
	}


	/** 예약 취소 Service
	 * @param requestNo
	 * @return result
	 * @throws Exception
	 */
	public int reserveCancel(int requestNo) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.reserveCancel(conn, requestNo);
		
		if(result > 0)	  commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}


	
}
