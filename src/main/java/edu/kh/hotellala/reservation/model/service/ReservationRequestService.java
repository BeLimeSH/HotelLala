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
		
		//인원수 조건에 맞는 roomList
		List<RoomType> roomList = dao.selectAvailableRoom(conn, headCount);
		
		
		// 객실 타입 받아와서 날짜 + 객실 호수(객실 타입으로 switch로 지정)를 where절 조건에 넣어서 조회되는 수 카운트 하기
		
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
		
		//예약 -> 날짜 사이에 있는 룸 넘버 조회해봐야 함 + extraRequest가 null? !null?
		
		
		//결제
		if(result > 0) {
			result = dao.insertPayment(conn, payment);
		}
		
		
		//옵션
		int optionCode = 0;
		
		// count != 0 일때 옵션 각각 삽입
		if(result > 0 && op.getAdultBreakfast() > 0) {
			optionCode = 1;
			count = op.getAdultBreakfast();
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}
		
		if(result != 0 && op.getChildBreakfast() != 0) {
			optionCode = 2;
			count = op.getChildBreakfast();
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}
		
		if(result != 0 && op.getExtraBed() != 0) {
			optionCode = 3;
			count = op.getExtraBed();
			
			
			result = dao.insertOption(conn, count, reservation.getRequestNo(), optionCode);
		}
		
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);

		return result;
	}


}
