package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import wishFit.util.JdbcUtils;

public class MemberDao {

	// 회원가입
	
	public void join(MemberDto memberDto) throws Exception{
		Connection con = wishFit.util.JdbcUtils.connect();
		
		String sql = "insert into member( "
				+ "mem_id, mem_pw, mem_nick, mem_birth, mem_gender,,"
				+ "mem_pwQ, mem_pwA, mem_name, mem_phone"
				+ ")"
				+ "values(?,?,?,'YYYY-MM-DD',?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemId());
		ps.setString(2, memberDto.getMemPw());
		ps.setString(3, memberDto.getMemNick());
		ps.setString(4, memberDto.getMemBirth());
		ps.setString(5,memberDto.getMemGrade());
		ps.setString(6,memberDto.getMemPwQ());
		ps.setString(7,memberDto.getMemPwA());
		ps.setString(8, memberDto.getMemName());
		ps.setString(9, memberDto.getMemPhone());
		
		con.close();
	}

	// 로그인
	public MemberDto get(String mem_id) throws Exception{
		Connection con = wishFit.util.JdbcUtils.connect();
		
		String sql = "select * from member where mem_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		MemberDto memberDto;
		
		if(rs.next()) {
			memberDto = new MemberDto();
			
			memberDto.setMemId(rs.getString("mem_id"));
			memberDto.setMemPw(rs.getString("mem_pw"));
			memberDto.setMemNick(rs.getString("mem_nick"));
			memberDto.setMemGrade(rs.getString("mem_grade"));
			memberDto.setMemBirth(rs.getString("mem_birth"));
			memberDto.setMemGender(rs.getString("mem_gender"));
			memberDto.setMemPwQ(rs.getString("mem_pwQ"));
			memberDto.setMemPwA(rs.getString("mem_pwA"));
			memberDto.setMemName(rs.getString("mem_name"));
			memberDto.setMemPhone(rs.getString("mem_phone"));
			memberDto.setMemReport(rs.getInt("mem_report"));
			memberDto.setMemJoin(rs.getDate("mem_join"));
		} else {
			memberDto = null;
		}
		con.close();
		
		return memberDto;
	}
}
