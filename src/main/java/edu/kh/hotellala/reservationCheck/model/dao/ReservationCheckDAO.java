import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;



public class ReservationCheckDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;	
	private Properties prop;
	
	public ReservationCheckDAO(){
		try {
			prop = new Properties();
			
			String filePath = ReservationCheckDAO.class.getResource("/edu/kh/community/sql/rsvCheck-sql.xml").getPath();
			
			prop.loadFromXML( new FileInputStream(filePath) );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
