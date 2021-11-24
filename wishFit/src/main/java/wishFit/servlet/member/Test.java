package wishFit.servlet.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test {
	public static void main(String[] args) throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "wishfit", "wishfit");
		
		String sql = "select mem_id from member where mem_name = ? and mem_phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "khmaster");
		ps.setString(2, "01088882222  ");
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			System.out.println(rs.getString(1));
		}
		else {
			System.out.println("없음");
		}
		
		con.close();
	}
}
