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
	private String memberPhone; //전화번호
	private Date birthDay;// 생년월일
	private char gender;//성별
	
	private String address; //주소
	private String request;//고객 요청
	private char secessionFlag; //탈퇴여부
	private int membershipNo;//멤버십 번호 
	


	private String memberTel;
	private String memberYear;
	private String memberMonth;
	private String memberDay;
	
}
