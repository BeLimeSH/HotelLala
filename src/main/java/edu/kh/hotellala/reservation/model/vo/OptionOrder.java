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
public class OptionOrder {
	
	private int optionNo;
	private int optionCount;
	private String requestNo;
	private int optionCode;

}
