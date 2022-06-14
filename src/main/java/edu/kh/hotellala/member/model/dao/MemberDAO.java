package edu.kh.hotellala.member.model.dao;


import static edu.kh.hotellala.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;

import edu.kh.hotellala.member.model.vo.Member;


public class MemberDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	//기본 생성자 
	public MemberDAO() {
		try {
			
			prop = new Properties();
			
			String filePath = MemberDAO.class.getResource("/edu/kh/hotellala/sql/member-sql-pyj.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}

	/**로그인 DAO
	 * @param conn
	 * @param mem
	 * @return loginMember 
	 */
	public Member login(Connection conn, Member mem)throws Exception{
		
		Member loginMember=null;
		
		try {
			//sql얻어오기
			String sql = prop.getProperty("login");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,mem.getMemberEmail());
			pstmt.setString(2, mem.getMemberPw());
			
			rs= pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				int memberNo =rs.getInt("MEMBER_NO");
				String memberEmail =rs.getString("MEMBER_EMAIL");
				String memberName =rs.getString("MEMBER_NM");
				String memberTel= rs.getString("MEMBER_TEL");
				Date birthDay= rs.getDate("MEMBER_BR");
				char gender =rs.getString("GENDER").charAt(0);
				String memberAddress =rs.getString("MEMBER_ADDR");
				String request = rs.getString("REQUEST");
				int membershipNo =rs.getInt("MEMBERSHIP_NO");
				
			
				//6)얻어온 컬럼 값을 이용해 Member 객체를 생성하여 loginMember 변수에 저장하여 하나로 묶는 작업 
				loginMember = new Member();
				loginMember.setMemberNo(memberNo);
				loginMember.setMemberEmail(memberEmail);
				loginMember.setMemberName(memberName);
				loginMember.setMemberTel(memberTel);
				loginMember.setBirthDay(birthDay);
				loginMember.setGender(gender);
				loginMember.setMemberAddress(memberAddress);
				loginMember.setRequest(request);
				loginMember.setMembershipNo(membershipNo);
				
		
		
			}
			
		
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		
		return loginMember;
	}

	/** 회원가입 DAO
	 * @param conn
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Connection conn, Member mem) throws Exception {
		int result=0;
		
		try {
			String sql = prop.getProperty("signUp");

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberEmail());
			pstmt.setString(2, mem.getMemberPw());
			pstmt.setString(3, mem.getMemberName());
			pstmt.setString(4, mem.getMemberTel());
			pstmt.setString(5, mem.getMemberAddress());
			pstmt.setString(6, mem.getMemberYear());
			pstmt.setString(7, mem.getMemberMonth());
			pstmt.setString(8, mem.getMemberDay());
			
			result= pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/** 회원 정보 수정 DAO
	 * @param conn
	 * @param mem
	 * @return result 
	 * @throws Exception
	 */
	public int updateMember(Connection conn, Member mem) throws Exception {
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("updateMember");
			
			System.out.println(mem);
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMemberName());
			pstmt.setString(2, mem.getMemberTel());
			pstmt.setString(3, mem.getMemberAddress());
			pstmt.setInt(4,mem.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	/** 비밀번호 변경 
	 * @param conn
	 * @param currentPw
	 * @param memberNo
	 * @return result 
	 * @throws Exception
	 */
	public int changePw(Connection conn, String currentPw,String newPw, int memberNo) throws Exception {
		
		int result= 0;
		
		// 왜 TRY-FINALLY? 
		// try 구문에서 JDBC 관련 예외가 발생하더라도 
		// 사용중이던 JDBC 객체 자원을 무조건 반환하기 위해서
		try {
			
			String sql = prop.getProperty("changePw");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,newPw);
			pstmt.setInt(2,memberNo);
			pstmt.setString(3,currentPw);
			
			result= pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
			
		}
		return result;
	}

	/** 이메일 중복 검사 DAO
	 * @param conn
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	public int emailDupCheck(Connection conn, String memberEmail) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("emailDupCheck");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		return result;
	}


}
