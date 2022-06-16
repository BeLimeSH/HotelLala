package edu.kh.hotellala.reservationCheck.model.dao;

import static edu.kh.hotellala.common.JDBCTemplate.*;
import static edu.kh.hotellala.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.hotellala.reservation.model.dao.ReservationRequestDAO;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservationCheck.model.vo.Refund;
import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;

public class ReservationCheckDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	private Properties prop;
	
	public ReservationCheckDAO() {
		try {

			prop = new Properties();
			
			String filePath = ReservationCheckDAO.class.getResource("/edu/kh/hotellala/sql/reservation-sql-pjh.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	/** 예약 조회 DAO
	 * @param conn 
	 * @param memberNo
	 * @param checkOut 
	 * @param checkIn 
	 * @return list
	 * @throws Exception
	 */
	public List<ReservationRequest> reservationCheck(Connection conn, int memberNo, Date checkIn, Date checkOut)  throws Exception{
		
		List<ReservationRequest> checkList = new ArrayList<ReservationRequest>();
		
		try {
			String sql = prop.getProperty("reservationCheck");

			pstmt = conn.prepareStatement(sql);
					
			pstmt.setInt(1, memberNo);
			pstmt.setDate(2, checkIn);
			pstmt.setDate(3, checkOut);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ReservationRequest reservation = new ReservationRequest();
			
				reservation.setRequestNo(rs.getString(1));
				reservation.setMemberNo(rs.getInt(2));
				reservation.setCheckIn(rs.getDate(3));
				reservation.setCheckOut(rs.getDate(4));
				reservation.setRoomNo(rs.getInt(5));
				//reservation.setFl(rs.getString(6));
				
				checkList.add(reservation);
	
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return checkList;
	}
	
	
	/** 예약 취소(환불) 요청(INSERT) DAO
	 * @param conn
	 * @param refund
	 * @return result
	 * @throws Exception
	 */
	public int insertRefund(Connection conn, Refund refund) throws Exception{
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("reservationCancelRequest");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, refund.getPaymentNo());
			pstmt.setString(2, refund.getRefundReason());
			pstmt.setInt(3, refund.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	/** 예약 취소 내역(환불 처리 내역) 조회 DAO
	 * @param conn
	 * @param requestNo
	 * @return refundList
	 * @throws Exception
	 */
	public List<Refund> refundCheck(Connection conn, String requestNo) throws Exception{
		
		List<Refund> refundList = new ArrayList<Refund>();
		
		try {
			String sql = prop.getProperty("reservationCancelCheck");

			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, requestNo);
			
			if( rs.next() ) {
				Refund refund = new Refund();
				
				refund.setPaymentDate(rs.getDate(1));
				refund.setPaymentAmount(rs.getInt(2));
				refund.setRefundDate(rs.getDate(3));
				refund.setRefundNo(rs.getInt(4));
				refund.setRefundReason(rs.getString(5));
				refund.setRequestNo(rs.getString(6));
			}	
			
		} finally {
			close(pstmt);
			close(rs);
		}		
		return refundList;
	}



}
