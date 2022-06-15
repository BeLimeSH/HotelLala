package edu.kh.hotellala.member.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
	
	private int memberNo;//회원번호
	private String memberEmail;//회원 아이디
	private String memberName;//회원이름
	private String memberPw;// 비밀번호

	private String memberTel; //전화번호
	private String memberBR;// 생년월일
	
	private String memberAddress; //주소
	private char secessionFlag; //탈퇴여부
	


	
}
