package edu.kh.hotellala.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String createDate;
	private String boardContent;
	private String answerContent;
	
}
