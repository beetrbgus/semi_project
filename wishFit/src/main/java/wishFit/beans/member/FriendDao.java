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
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from (select * from friend f"
				+ "inner join Frequest freq"
				+ "on f.friend_no = freq.friend_no) where "
				+ "friend_id = ? and freq.stat = '친구' order by friend_date desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, friendId);
		ResultSet rs = ps.executeQuery();
		
		List<FriendDto> list = new ArrayList<>();
		while(rs.next()) {
			FriendDto friendDto = new FriendDto();
			
			friendDto.setFriendNo(rs.getInt("friend_no"));
			friendDto.setFriendId(rs.getString("friend_id"));
			friendDto.setFriendNick(rs.getString("friend_nick"));
			friendDto.setFriendDate(rs.getString("friend_date"));
			
			list.add(friendDto);
		}
		con.close();
		
		return list;
	}

	// 친구일 때 삭제
	public boolean delete(int friendNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="delete friend where friend_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, friendNo);
		int result = ps.executeUpdate();
		
		con.close();
		return result > 0;
	}
	//친구 추가
	public void plus(FriendDto friendDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into friend ("
				+ "friend_no,";
		
		con.close();
	}
}
