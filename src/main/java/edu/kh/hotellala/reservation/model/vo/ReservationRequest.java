package edu.kh.hotellala.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReservationRequest {
	
	//필드
	private String requestNo;
	private Date checkIn;
	private Date checkOut;
	private String dateRange;
	private int adultCount;
	private int childCount;
	private String extraRequest;
	private char reservationFlags;
	private int roomNo;
	
	private int memberNo;
	private String roomType;
	
	private String reserveDate;

	private String fl;
}
