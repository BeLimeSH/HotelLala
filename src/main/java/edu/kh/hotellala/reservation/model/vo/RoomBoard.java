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
public class RoomBoard {
	
	private int roomBoardNo;
	private String roomInfo;
	private String roomFloor;
	private String bedType;
	private String roomSize;
	private String standardNumber;
	private String roomType;
	
	private String imageOne;
	private String imageTwo;
	private String imageThree;
	private String imageFour;

}
