package wishFit.like;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class File2Dao {
	private Connection conn;
	public int hate(String boardNo) {

		PreparedStatement pstmt = null;

	        try {

			String SQL = "UPDATE boardNo SET boardHate = boardHate + 1 WHERE boardHate = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, boardNo);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;
	}
	}