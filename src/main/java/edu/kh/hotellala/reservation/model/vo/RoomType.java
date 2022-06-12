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
public class RoomType {
	
	private String roomType;
	private int roomRates;
	private int maxNumber;
	private String roomThubnail;

}
