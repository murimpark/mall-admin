package dao;
import java.sql.*;
import commons.DBUtil;
import vo.*;

public class AdminDao {
	public Admin login(Admin admin) throws Exception {
		Admin returnAdmin = null;

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT admin_id FROM admin WHERE admin_id = ? AND admin_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,admin.getAdminId());
		stmt.setString(2,admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getString("admin_id"));
		}
		conn.close();
		return returnAdmin;
	}
}
