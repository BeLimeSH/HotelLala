package edu.kh.hotellala.member.model.service;


import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.hotellala.member.model.dao.MemberDAO;
import edu.kh.hotellala.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();


	/** 로그인 Service 
	 * @param mem
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member mem) throws Exception {
		Connection conn = getConnection();
		
		Member loginMember=dao.login(conn,mem);
		
		close(conn);
		
		return loginMember ;
	}


	/** 회원가입 Service
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member mem) throws Exception {
		
		Connection conn = getConnection();
		int result = dao.signUp(conn,mem);
		
		if(result>0) commit(conn);
		else		rollback(conn);
		
		close(conn);
		return result;
	}

	/**회원 정보 수정 
	 * @param mem
	 * @return result 
	 * @throws Exception
	 */
	public int updateMember(Member mem) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.updateMember(conn,mem);
		
		if(result>0)  commit(conn);
		else		  rollback(conn);
		
		close(conn);
		
		return result;
	}

	/**비밀번호 변경 
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result 
	 * @throws Exception
	 */
	public int changePw(String currentPw, String newPw, int memberNo) throws Exception {
	
		Connection conn = getConnection();
		
		int result = dao.changePw(conn, currentPw, newPw, memberNo);
		
		if(result>0) commit(conn);
		else 		 rollback(conn);
		
		close(conn);
		
		return result;
	}


	/** 이메일 중복 검사 Service
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	public int emailDupCheck(String memberEmail) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.emailDupCheck(conn, memberEmail);
		
		close(conn);
		
		return result;
	}


	/** 인증 번호 DB 추가 Service
	 * @param inputEmail
	 * @param cNumber
	 * @return
	 */
	public int insertCertification(String inputEmail, String cNumber) throws Exception {
		
		Connection conn = getConnection();
		int result = dao.updateCertification(conn, inputEmail, cNumber);
		
		if(result==0) {
			result = dao.insertCertification(conn, inputEmail, cNumber);
			
		}
		
		if(result>0) commit(conn);
		else		 rollback(conn);
		return result;
	}


	/** 인증번호 확인 Service
	 * @param inputEmail
	 * @param cNumber
	 * @return
	 * @throws Exception
	 */
	public int checkNumber(String inputEmail, String cNumber) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.checkNumber(conn, inputEmail, cNumber);
		
		close(conn);
		
		return result;
	}


}
