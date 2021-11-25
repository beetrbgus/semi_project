package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import wishFit.util.JdbcUtils;

public class MemberProfileDao {
	Connection conn;
	public void insert(MemberProfileDto memberProfileDto) throws Exception {
		conn = JdbcUtils.connect();
		
		String sql = "insert into member_profile values(mp_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, memberProfileDto.getMpId());
		ps.setString(2, memberProfileDto.getMpUpload());
		ps.setString(3, memberProfileDto.getMpSave());
		ps.setLong(4, memberProfileDto.getMpSize());
		ps.setString(5, memberProfileDto.getMpType());
		ps.execute();
		conn.close();
	}

	public MemberProfileDto get(int mpNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from member_profile where mp_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, mpNo);
		ResultSet rs = ps.executeQuery();
		
		MemberProfileDto memberProfileDto;
		boolean result = rs.next();
		if(result) {
			memberProfileDto = new MemberProfileDto();
			memberProfileDto.setMpNo(rs.getInt("mp_no"));
			memberProfileDto.setMpId(rs.getString("mp_id"));
			memberProfileDto.setMpUpload(rs.getString("mp_upload"));
			memberProfileDto.setMpSave(rs.getString("mp_save"));
			memberProfileDto.setMpSize(rs.getLong("mp_size"));
			memberProfileDto.setMpType(rs.getString("mp_type"));
		} else {
			memberProfileDto = null;
		}
		con.close();
		
		return memberProfileDto;
	}
	
	public MemberProfileDto get(String mpId) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from member_profile where mp_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mpId);
		ResultSet rs = ps.executeQuery();
		
		MemberProfileDto memberProfileDto;
		if(rs.next()) {
			memberProfileDto = new MemberProfileDto();
			memberProfileDto.setMpNo(rs.getInt("mp_no"));
			memberProfileDto.setMpId(rs.getString("mp_id"));
			memberProfileDto.setMpUpload(rs.getString("mp_upload"));
			memberProfileDto.setMpSave(rs.getString("mp_save"));
			memberProfileDto.setMpSize(rs.getLong("mp_size"));
			memberProfileDto.setMpType(rs.getString("mp_type"));
		} else {
			memberProfileDto = null;
		}
		con.close();
		
		return memberProfileDto;
	}
}