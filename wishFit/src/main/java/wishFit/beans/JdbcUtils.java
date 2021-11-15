package wishFit.beans;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtils {
		public static Connection connect(String username, String password) throws Exception {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", username, password);

			return con;

		}
		

		private static DataSource ds;

		static {
			try {
				Context ctx = new InitialContext();
				
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			} catch (Exception e) {
				System.err.println("DataSource 생성 오류");
				e.printStackTrace();
			}

		}
		public static Connection connect2() throws Exception{
			return ds.getConnection();
		}
}
