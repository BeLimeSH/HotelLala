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
public class OptionType {

	private int optionCode;
	private String optionType;
	private int optionPrice;
	
}
