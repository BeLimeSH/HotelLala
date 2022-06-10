package edu.kh.hotellala.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {

	private String memberEmail;
	private String memberPw;
	private String memberName;
	private String memberTel;
	private String memberYear;
	private String memberMonth;
	private String memberDay;
	
}
