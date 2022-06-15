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
public class Payment {
	
	private int paymentNo;
	private Date paymentDate;
	private int paymentAmount;
	private char paymentFlags;
	
	private int memberNo;
	private String requestNo;
	
	private String payType;

}
