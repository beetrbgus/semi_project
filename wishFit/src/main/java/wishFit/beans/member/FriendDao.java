package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.member.FriendVo;
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
					  + "            left outer join member m on m.mem_id = fr.receiver "
					  + "			   		left outer join member_profile mp on mp.mp_id = m.mem_id "
					  + "					where sender = ? or receiver = ?  order by reg_date desc "
					  + "				)TMP) where rn between ? and ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, uid);
			ps.setInt(3, begin);
			ps.setInt(4, end);
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
		public void plus(String friendId,String uid) throws Exception{
			conn = JdbcUtils.connect();
			
			String sql = "insert into friend  values("
					+ "friend_seq.nextval, ? , ? , sysdate , ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, friendId);
			ps.setString(2, uid);
			ps.setString(3, "친구");
			ps.execute();
			conn.close();
		}
		// 친구 수 구하기
		public int count(String uid) throws Exception{
			conn = JdbcUtils.connect();
			String sql = "select count(*) from friend where receiver = ? or sender = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, uid);

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
		public int get(String uid,String mid) throws Exception{
			conn = JdbcUtils.connect();
			String sql = "select * from friend where receiver = ? and sender=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, mid);
			
			int result = ps.executeUpdate();
			
			ps.setString(1, mid);
			ps.setString(2, uid);
			result +=  ps.executeUpdate();
			System.out.println("친구임 ???    : "+result);
			return result;
		}
}
