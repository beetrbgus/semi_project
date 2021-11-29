package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class FriendDao {
    // 마이 페이지 -  받은 친구 목록 보기
	Connection conn;
	public List<FriendVo> friendmine(String uid , int begin , int end) throws Exception{
		conn = JdbcUtils.connect();
		
		String sql = 
				  "	select *  from ( "
				  + "    select rownum rn, TMP.* from ( "
				  + "        select fr.no f_no , fr.receiver f_receiver, fr.sender f_sender , "
				  + "		fr.reg_date f_date, m.mem_nick f_nick, m.mem_grade f_grade , "
				  + "		mp.mp_no f_profile_no"
				  + "	 from friend fr "
				  + "            left outer join member m on m.mem_id = fr.sender "
				  + "			   		left outer join member_profile mp on mp.mp_id = m.mem_id "
				  + "					where receiver = ? order by reg_date desc "
				  + "				)TMP) where rn between ? and ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<FriendVo> list = new ArrayList<>();
		while(rs.next()) {
			FriendVo friendVo = new FriendVo();
			
			friendVo.setFriendNo(rs.getInt("f_no"));
			friendVo.setFriendReceiver(rs.getString("f_receiver"));
			friendVo.setFriendSender(rs.getString("f_sender"));
			friendVo.setFriendNick(rs.getString("f_nick"));
			friendVo.setFriendGrade(rs.getString("f_grade"));
			friendVo.setFriendProfile_No(rs.getInt("f_profile_no"));
			friendVo.setFriendDate(rs.getString("f_date"));
			list.add(friendVo);
		}
		conn.close();
		
		return list;
	}

	// 친구일 때 삭제
	public boolean delete(String uid , int friendNo) throws Exception{
		conn = JdbcUtils.connect();
		
		String sql="delete friend where no=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, friendNo);

		int result = ps.executeUpdate();
		
		conn.close();
		return result > 0;
	}
	//친구 추가
	public void plus(FriendVo friendDto) throws Exception{
		conn = JdbcUtils.connect();
		
		String sql = "insert into friend  values("
				+ "friend_seq.nextval, ? , ? , sysdate , ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, friendDto.getFriendReceiver());
		ps.setString(2, friendDto.getFriendSender());
		ps.setString(3, "친구");
		conn.close();
	}
	// 친구 수 구하기
	public int count(String uid) throws Exception{
		conn = JdbcUtils.connect();
		String sql = "select count(*) from friend where receiver = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		
		ResultSet rs = ps.executeQuery();
		int result;
		if(rs.next()) {
			result = rs.getInt(1);
			System.out.println("FreindDao :   result   "  + result);
		}else {
			result = 0;
			System.out.println("엘스가 떠버렸넹");
		}
		
		return result;
	}

	
}
