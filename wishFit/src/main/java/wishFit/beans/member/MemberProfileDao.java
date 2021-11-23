package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import wishFit.beans.JdbcUtils;

public class MemberProfileDao {
	public void insert(MemberProfileDto memberProfileDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into member_profile values(mp_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberProfileDto.getMpId());
		ps.setString(2, memberProfileDto.getMpUpload());
		ps.setString(3, memberProfileDto.getMpSave());
		ps.setLong(4, memberProfileDto.getMpSize());
		ps.setString(5, memberProfileDto.getMpType());
		ps.execute();
		con.close();
	}
}
