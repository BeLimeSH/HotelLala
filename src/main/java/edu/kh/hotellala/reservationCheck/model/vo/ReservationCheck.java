package edu.kh.hotellala.reservationCheck.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ReservationCheck {

	private int reservationNo;
	private String requestNo;
	private String reservationFl;
	private int paymentNo;
	private int roomNo;
}
