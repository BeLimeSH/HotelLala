package edu.kh.hotellala.reservation.model.service;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import edu.kh.hotellala.reservation.model.dao.ReservationRequestDAO;
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

}
