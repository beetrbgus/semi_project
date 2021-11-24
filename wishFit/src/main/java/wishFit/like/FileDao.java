package wishFit.like;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class FileDao {
	private Connection conn;
	public int like(String boardNo) {

		PreparedStatement pstmt = null;

	        try {

			String SQL = "UPDATE boardNo SET boardLike = boardLike + 1 WHERE boardLike = ?";

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