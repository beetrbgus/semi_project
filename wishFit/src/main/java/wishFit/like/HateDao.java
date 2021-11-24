package wishFit.like;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;



public class HateDao {

	private Connection conn;



	public HateDao() {

		try {

			String dbURL = "jdbc:mysql://localhost:8080/test";

			String dbID = "wishFit";

			String dbPassword = "wishFit";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
	public int hate(String memId, String boardNo) {

		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, memId);

			pstmt.setString(2, boardNo);
			

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; 

	}
}