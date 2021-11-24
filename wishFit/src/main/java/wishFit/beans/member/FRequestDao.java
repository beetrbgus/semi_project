package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import wishFit.util.JdbcUtils;

public class FRequestDao {
	
	// 친구 상태 변경
	public boolean edit(FRequestDto fRequestDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "update frequest set stat =? where friend_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fRequestDto.getStat());
		ps.setInt(2, fRequestDto.getFriendNo());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	// 친구 요청 보낸 상태에서 취소 / 거절
		public boolean delete(int friendNo) throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "delete frequest where friend_no =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, friendNo);
			int result = ps.executeUpdate();
			
			con.close();
			return result > 0;
		}
}
