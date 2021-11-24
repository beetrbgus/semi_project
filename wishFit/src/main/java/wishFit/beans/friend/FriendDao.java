package wishFit.beans.friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class FriendDao {
	private Connection conn;
	private PreparedStatement ps;
	// 친구 테이블에 등록.
	public void friendRequest(FriendDto friendDto) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "insert into friend values(friend_seq.nextval,?,?,sysdate ,'수락대기중')";
		ps = conn.prepareStatement(sql);
		ps.setString(1, friendDto.getReceiver());
		ps.setString(2, friendDto.getSender());
		
		ps.executeUpdate();
		conn.close();
		
	}
	//친구 요청 거절하기 , 삭제 
	public void friendDenied(String friendId) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "delete from friend where sender= ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, friendId);
		ps.executeUpdate();
		conn.close();
	}
	// 친구 아이디 , 닉네임 , 등록일 , 친구 상태 목록 뽑아옴. 
	public List<FriendListVo> getFriendList(String uid , String stat) throws Exception {
		conn = JdbcUtils.connect();
		String sql = 
					"select sender,mem_nick, reg_date,stat from("
				+ "		select  f.receiver,f.sender,"
				+ "		m.mem_nick, f.reg_date,f.stat "
				+ "    from friend f inner join member m on f.receiver =m.mem_id)"
				+ "    where receiver = ? and stat= ?";
		ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<FriendListVo> list = new ArrayList<>();
		while(rs.next()) {
			FriendListVo fListVo = new FriendListVo();
			fListVo.setSender(rs.getString("sender"));
			fListVo.setNickName(rs.getString("mem_nick"));
			fListVo.setReg_date(rs.getString("reg_date"));
			fListVo.setStat(rs.getString("stat"));
			list.add(fListVo);
		}
		conn.close();
		
		return list;
	}

}
