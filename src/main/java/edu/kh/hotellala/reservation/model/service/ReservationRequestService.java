package edu.kh.hotellala.reservation.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.hotellala.member.model.vo.Member;
import edu.kh.hotellala.reservation.model.dao.ReservationRequestDAO;
import edu.kh.hotellala.reservation.model.vo.OptionCount;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservation.model.vo.RoomType;

public class ReservationRequestService {

	ReservationRequestDAO dao = new ReservationRequestDAO();
	
	/**
	 * 이용 가능 객실 조회 Service
	 * @param reservation
	 * @return roomList
	 * @throws Exception
	 */
	public List<RoomType> selectAvailableRoom(ReservationRequest reservation) throws Exception {
		
		// 커넥션 얻어오기
		Connection conn = getConnection();
		
		// 인원 수 세팅
		int headCount = reservation.getAdultCount() + reservation.getChildCount();
		
		//조건에 맞는 roomList
		List<RoomType> roomList = dao.selectAvailableRoom(conn, headCount, reservation);
		
		close(conn);
		
		return roomList;
	}

	/**
	 * 객실 가격 받아오기 Service
	 * @param type
	 * @return roomRates
	 * @throws Exception
	 */
	public int selectRates(String type) throws Exception {
		
		Connection conn = getConnection();
		
		int roomRates = dao.selectRates(conn, type);
		
		close(conn);
		
		return roomRates;
	}

	/**
	 * 예약 결제 정보 삽입 Service
	 * @param reservation
	 * @param payment
	 * @param op
	 * @return result
	 * @throws Exception
	 */
	public int insertReservation(ReservationRequest reservation, Payment payment, OptionCount op) throws Exception {
		
		Connection conn = getConnection();
		
		int result = 0; // 결과값 전달 변수
		int count = 0; // 옵션 개수 담을 변수
		String roomType = reservation.getRoomType();
		String no = "10";
		
		//예약 -> 날짜 사이에 있는 룸 넘버 조회해봐야 함 + extraRequest가 null? !null?
		switch(roomType) {
		
		case "SINGLE" : no = "20"; break;
		case "STANDARD" : no = "30"; break;
		case "DELUX" : no = "40"; break;
		case "SUITE" : no = "50"; break;
		case "FAMILY" : no = "60"; break;
		
		}
		
		int flag = 0;
		int roomNo = 0;
		
		for(int i=1; i<=3; i++) {
			
			//검사할 객실 번호
			int checkNo = Integer.parseInt(no + i);
			System.out.println(checkNo);
			
			flag = dao.checkEmptyRoom(conn, checkNo, reservation.getCheckIn(), reservation.getCheckOut());
			
			if(flag == 0) {
				roomNo = checkNo;
				break;
			}
		}
		
		//예약 정보 삽입
		result = dao.insertReservation(conn, reservation, roomNo);
		
		//결제
		if(result > 0) {
			result = dao.insertPayment(conn, payment);
		}
		
		//옵션
		int optionCode = 0;
		
		// count > 0 일때 옵션 각각 삽입
		if(result > 0 && op.getAdultBreakfast() > 0) {
			optionCode = 1;
			count = op.getAdultBreakfast();
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}
		
		if(result > 0 && op.getChildBreakfast() > 0) {
			optionCode = 2;
			count = op.getChildBreakfast();
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}
		
		if(result > 0 && op.getExtraBed() > 0) {
			optionCode = 3;
			count = op.getExtraBed();
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}

		//트랜잭션 제어
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);

		return result;
	}

	/**
	 * 결제 정보 조회
	 * @param requestNo
	 * @return payment
	 * @throws Exception
	 */
	public Payment selectPayment(String requestNo) throws Exception {
		
		Connection conn = getConnection();
		
		Payment payment = dao.selectPayment(conn, requestNo);
		
		close(conn);
		
		return payment;
	}


}
