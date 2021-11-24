package wishFit.servlet.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test2 {
	public static void main(String[] args) throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "wishfit", "wishfit");
		
		String sql = "select mem_id, mem_name from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			System.out.print(rs.getString(1));
			System.out.print(" / ");
			System.out.print(rs.getString(2));
			System.out.println();
		}
		con.close();
	}
}
