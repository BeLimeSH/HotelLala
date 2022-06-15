package edu.kh.hotellala.qna.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Qna {
	private String qnaTitle;
	private int qnaCd;
	private String qnaContent;
	private int memberNo;
	
	
}
