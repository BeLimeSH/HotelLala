package edu.kh.hotellala.reservationCheck.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;
import static edu.kh.hotellala.common.JDBCTemplate.close;
import static edu.kh.hotellala.common.JDBCTemplate.commit;
import static edu.kh.hotellala.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import edu.kh.hotellala.reservationCheck.model.vo.Refund;
import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservationCheck.model.dao.ReservationCheckDAO;

public class ReservationCheckService{
	
	private ReservationCheckDAO dao = new ReservationCheckDAO();
	

	/** 예약 조회 Service
	 * @param reservation
	 * @param checkOut 
	 * @param checkIn 
	 * @return checkList
	 * @throws Exception
	 */
	public List<ReservationRequest> reservationCheck(ReservationRequest reservation, Date checkIn, Date checkOut) throws Exception{
		
		Connection conn = getConnection(); 
		
		int memberNo = reservation.getMemberNo();
		
		List<ReservationRequest> checkList = dao.reservationCheck(conn, memberNo, checkIn, checkOut);
		
		close(conn);
		
		return checkList;
	}


	
	/** 예약 취소 요청 Service
	 * @param refund
	 * @return result
	 * @throws Exception
	 */
	public int insertRefund(Refund refund) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.insertRefund(conn, refund);
		
		if(result > 0)	  commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}



//	/** 예약 취소 내역(환불 내역) 조회 Service
//	 * @param refund 
//	 * @param refundReason
//	 * @return cancelCheckList
//	 * @throws Exception
//	 */
//	public List<Refund> reservationCancelCheck(Refund refund, String refundReason) throws Exception{
//		
//		Connection conn = getConnection(); 
//		
//		int memberNo = refund.getMemberNo();
//		int paymentNo = refund.getPaymentNo();
//		
//		List<Refund> cancelCheckList = dao.reservationCancelCheck(conn, paymentNo, memberNo, refundReason);
//		
//		close(conn);
//		
//		return cancelCheckList;
//	}



	public List<Refund> refundCheck(Refund refund) throws Exception{
		
		Connection conn = getConnection(); 
		
		String requestNo = refund.getRequestNo();
		
		List<Refund> refundList = dao.refundCheck(conn, requestNo);
		
		close(conn);
		
		return refundList;
	}


	
}
