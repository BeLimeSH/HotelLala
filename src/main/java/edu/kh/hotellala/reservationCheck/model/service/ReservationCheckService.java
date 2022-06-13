package edu.kh.hotellala.reservationCheck.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;
import edu.kh.hotellala.reservationCheck.model.dao.ReservationCheckDAO;

public class ReservationCheckService{
	
	private ReservationCheckDAO dao = new ReservationCheckDAO();
	

	public List<ReservationCheck> reservationCheck() throws Exception{
		
		Connection conn = getConnection();
		
		List<ReservationCheck> list = dao.reservationCheck(conn);
		
		close(conn);
		
		return list;
	}


	
}
