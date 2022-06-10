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
			
			
			if(rs.next()) {
				
				int memberNo =rs.getInt("MEMBER_NO");
				String memberEmail =rs.getString("MEMBER_EMAIL");
				String memberName =rs.getString("MEMBER_NM");
				Date birthDay= rs.getDate("BIRTH_DAY");
				char Gender =rs.getString("MEMBER_GENDER").charAt(0);
				String address =rs.getString("ADDRESS");
				String request = rs.getString("REQUEST");
				int membershipNo =rs.getInt("MEMBERSHIP_NO");
				
				
				//6)얻어온 컬럼 값을 이용해 Member 객체를 생성하여 loginMember 변수에 저장하여 하나로 묶는 작업 
				loginMember = new Member();
				loginMember.setMemberNo(memberNo);
				loginMember.setMemberEmail(memberEmail);
				loginMember.setMemberName(memberName);
				loginMember.setGender(Gender);
				loginMember.setAddress(address);
				loginMember.setRequest(request);
				loginMember.setGender(Gender);
				
		
		
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
			pstmt.setString(5, mem.getMemberYear());
			pstmt.setString(6, mem.getMemberMonth());
			pstmt.setString(7, mem.getMemberDay());
			
			result= pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
