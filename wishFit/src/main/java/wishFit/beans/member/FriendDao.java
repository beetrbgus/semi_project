package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class FriendDao {
 // 마이 페이지 - 친구 목록 보기
	public List<FriendDto> friendmine(String friendId) throws Exception{
		Connection con = JdbcUtils.connect2();
		
		String sql = "select * from friend where friend_id =? order by friend_date";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, friendId);
		ResultSet rs = ps.executeQuery();
		
		List<FriendDto> list = new ArrayList<>();
		while(rs.next()) {
			FriendDto friendDto = new FriendDto();
			
			friendDto.setFriendNo(rs.getInt("friend_no"));
			friendDto.setFriendId(rs.getString("friend_id"));
			friendDto.setFriendNick(rs.getString("friend_nick"));
			friendDto.setFriendDate(rs.getDate("friend_date"));
			
			list.add(friendDto);
		}
		con.close();
		
		return list;
	}
}
