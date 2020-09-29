package commons;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public Connection getConnection() throws Exception {
		String dbAddr = "jdbc:mariadb://localhost:3306/mall";
		String dbId = "root";
		String dbPw = "java1004";
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbAddr,dbId,dbPw);
		return conn;
	}
}
