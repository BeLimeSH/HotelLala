package edu.kh.hotellala.reservationCheck.model.dao;

import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;

public class ReservationCheckDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	private Properties prop;
	


	public List<ReservationCheck> reservationCheck(Connection conn)  throws Exception{
		
		List<ReservationCheck> list = new ArrayList<ReservationCheck>();
		
		try {
			String sql = prop.getProperty("selectBoardList");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while( rs.next() ) {
				
				ReservationCheck rsvCheck = new ReservationCheck();
				
				rsvCheck.setReservationNo( rs.getInt(1) );
				rsvCheck.setRequestNo( rs.getString(2) );
				rsvCheck.setReservationFl( rs.getString(3) );
				rsvCheck.setPaymentNo( rs.getInt(4) );
				rsvCheck.setRoomNo( rs.getInt(5) );
					
			}
			
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}
	

}
