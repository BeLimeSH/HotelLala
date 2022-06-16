package edu.kh.hotellala.reservation.model.dao;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.hotellala.member.model.vo.Member;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservation.model.vo.RoomBoard;
import edu.kh.hotellala.reservation.model.vo.RoomType;

public class ReservationRequestDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public ReservationRequestDAO() {
		try {
			prop = new Properties();
			
			String filePath = ReservationRequestDAO.class.getResource("/edu/kh/hotellala/sql/reservation-sql-ksh.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 이용 가능 객실 조회 DAO
	 * @param conn
	 * @param reservation
	 * @return roomList
	 * @throws Exception
	 */
	public List<RoomType> selectAvailableRoom(Connection conn, int headCount, ReservationRequest reservation) throws Exception {
		
		List<RoomType> roomList = new ArrayList<RoomType>();
		
		try {
			String sql = prop.getProperty("selectAvailableRoom");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, headCount);
			pstmt.setDate(2, reservation.getCheckIn());
			pstmt.setDate(3, reservation.getCheckOut());
			pstmt.setDate(4, reservation.getCheckIn());
			pstmt.setDate(5, reservation.getCheckOut());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				RoomType r = new RoomType();
				
				r.setRoomType(rs.getString(1));
				r.setRoomRates(rs.getInt(2));
				r.setRoomThumbnail(rs.getString(3));
				
				roomList.add(r);
				
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return roomList;
	}

	/**
	 * 객실 가격 받아오기 DAO
	 * @param conn
	 * @param type
	 * @return roomRates
	 * @throws Exception
	 */
	public int selectRates(Connection conn, String type) throws Exception {
		int roomRates = 0;
		
		try {
			String sql = prop.getProperty("selectRates");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				roomRates = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return roomRates;
	}

	/**
	 * 결제 정보 삽입 DAO
	 * @param conn
	 * @param payment
	 * @return result
	 * @throws Exception
	 */
	public int insertPayment(Connection conn, Payment payment) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertPayment");
			
			pstmt = conn.prepareStatement(sql);
			
			//1 가격 2 회원넘버 3 주문번호 4 결제수단
			pstmt.setInt(1, payment.getPaymentAmount());
			pstmt.setInt(2, payment.getMemberNo());
			pstmt.setString(3, payment.getRequestNo());
			pstmt.setString(4, payment.getPayType());
			
			result = pstmt.executeUpdate();
				
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 옵션 주문 정보 삽입 DAO
	 * @param conn
	 * @param count
	 * @param requestNo
	 * @param optionCode
	 * @return result
	 * @throws Exception
	 */
	public int insertOption(Connection conn, int count, String requestNo, int optionCode) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertOption");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, requestNo);
			pstmt.setInt(3, optionCode);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 비어있는 객실 조회하기
	 * @param conn
	 * @param checkNo
	 * @param checkIn
	 * @param checkOut
	 * @return roomNo
	 * @throws Exception
	 */
	public int checkEmptyRoom(Connection conn, int checkNo, Date checkIn, Date checkOut) throws Exception {
		
		int flag = 0;
		
		try {
			String sql = prop.getProperty("checkEmptyRoom");
			
			pstmt = conn.prepareStatement(sql);
			
			//(체크인 체크아웃)*2 룸넘버
			pstmt.setDate(1, checkIn);
			pstmt.setDate(2, checkOut);
			pstmt.setDate(3, checkIn);
			pstmt.setDate(4, checkOut);
			pstmt.setInt(5, checkNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = rs.getInt(1);
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return flag;
	}

	/**
	 * 예약 정보 삽입 DAO
	 * @param conn
	 * @param reservation
	 * @param roomNo
	 * @return result
	 * @throws Exception
	 */
	public int insertReservation(Connection conn, ReservationRequest reservation, int roomNo) throws Exception {

		int result = 0;
		
		try {
			String sql = prop.getProperty("insertReservation");
			
			pstmt = conn.prepareStatement(sql);
			
			//주문번호, 체크인, 체크아웃, 1박, 성인, 어린이, 회원번호, 객실 타입, 추가요청사항, 'Y', 객실 호수
			pstmt.setString(1, reservation.getRequestNo());
			pstmt.setDate(2, reservation.getCheckIn());
			pstmt.setDate(3, reservation.getCheckOut());
			pstmt.setString(4, reservation.getDateRange());
			pstmt.setInt(5, reservation.getAdultCount());
			pstmt.setInt(6, reservation.getChildCount());
			pstmt.setInt(7, reservation.getMemberNo());
			pstmt.setString(8, reservation.getRoomType());
			pstmt.setString(9, reservation.getExtraRequest());
			pstmt.setInt(10, roomNo);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 결제 완료 내역 조회 DAO
	 * @param conn
	 * @param requestNo
	 * @return payment
	 * @throws Exception
	 */
	public Payment selectPayment(Connection conn, String requestNo) throws Exception {
		
		Payment payment = new Payment();
		
		try {
			String sql = prop.getProperty("selectPayment");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, requestNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				payment.setPayType( rs.getString(1) );
				payment.setPaymentDate( rs.getString(2) );
				payment.setRoomRates( rs.getInt(3) );
				payment.setPaymentAmount( rs.getInt(4) );
				
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		return payment;
	}

	/**
	 * 객실 상세 조회 DAO
	 * @param conn
	 * @param type
	 * @return roomBoard
	 * @throws Exception
	 */
	public RoomBoard selectRoomDetail(Connection conn, String type) throws Exception {
		
		RoomBoard roomBoard = new RoomBoard();
		
		try {
			String sql = prop.getProperty("selectRoomDetail");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				roomBoard.setRoomInfo( rs.getString(1) );
				roomBoard.setRoomFloor( rs.getString(2) );
				roomBoard.setBedType( rs.getString(3) );
				roomBoard.setRoomSize( rs.getString(4) );
				roomBoard.setStandardNumber( rs.getString(5) );
				
				roomBoard.setImageOne( rs.getString(6) );
				roomBoard.setImageTwo( rs.getString(7) );
				roomBoard.setImageThree( rs.getString(8) );
				roomBoard.setImageFour( rs.getString(9) );
			}
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return roomBoard;
	}




}
