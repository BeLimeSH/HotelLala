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
}
