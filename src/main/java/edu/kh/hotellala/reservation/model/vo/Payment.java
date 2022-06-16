package edu.kh.hotellala.reservation.model.vo;

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
public class Payment {
	
	//결제 수단, 객실 가격, 결제일, 결제 금액
	
	private int paymentNo;
	private String paymentDate;
	private int paymentAmount;
	private char paymentFlags;
	
	private int memberNo;
	private String requestNo;
	
	private String payType;
	
	private int roomRates;

}
