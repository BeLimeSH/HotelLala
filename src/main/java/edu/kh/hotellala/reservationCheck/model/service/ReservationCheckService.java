import static edu.kh.hotellala.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;
import edu.kh.hotellala.reservationCheck.model.dao.ReservationCheckDAO;

public class ReservationCheckService{
	
	private ReservationCheckDAO dao = new ReservationCheckDAO();
	
	public ReservationCheck reserveCheck(int reservationNo) throws Exception{
		
		Connection conn = getConnection();
		
		//ReservationCheck rsvCheck = dao.reserveCheck(conn, reservationNo);
		
		
		
		
		
		return null;
		
		
	}


	
}
