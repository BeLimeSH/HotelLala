package edu.kh.hotellala.reservation.model.dao;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.hotellala.member.model.vo.Member;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
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
	public List<RoomType> selectAvailableRoom(Connection conn, int headCount) throws Exception {
		
		List<RoomType> roomList = new ArrayList<RoomType>();
		
		try {
			String sql = prop.getProperty("selectAvailableRoom");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, headCount);
			
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
		
		return result;
	}




}
