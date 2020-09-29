package dao;
import vo.*;
import java.util.*;
import commons.DBUtil;
import java.sql.*;

public class MemberDao {
	public void  deleteMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "DELETE FROM member WHERE member_email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, member.getMemberEmail());
		stmt.executeLargeUpdate();
		conn.close();
	}
	public ArrayList<Member> selectMemberList() throws Exception {
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email, member_pw, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member m = new Member();
			m.setMemberEmail(rs.getString("member_email"));
			m.setMemberPw(rs.getString("member_pw"));
			m.setMemberName(rs.getString("member_name"));
			m.setMemberDate(rs.getString("member_date"));
			list.add(m);
		}
		conn.close();
		return list;
	}
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null; 
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select id from (select memeber_email id from member union select admin_id id from admin) t where id = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
}
