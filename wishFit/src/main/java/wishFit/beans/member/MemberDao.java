package wishFit.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import wishFit.beans.JdbcUtils;

public class MemberDao {
	
	PreparedStatement ps;
	ResultSet rs;
	
	// 회원가입
	
	public void join(MemberDto memberDto) throws Exception{
		Connection con = JdbcUtils.connect2();
		
		String sql = "insert into member( "
				+ "mem_id, mem_pw, "
				+ "mem_name, mem_nick, "
				+ "mem_birth, mem_phone, "
				+ "mem_gender,"
				+ "mem_pw_q, mem_pw_a"
				+ ")"
				+ "values(?,?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?,?)";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, memberDto.getMemId());
		ps.setString(2, memberDto.getMemPw());
		ps.setString(3, memberDto.getMemName());
		ps.setString(4, memberDto.getMemNick());
		ps.setString(5, memberDto.getMemBirth());
		ps.setString(6, memberDto.getMemPhone());
		ps.setString(7, memberDto.getMemGender());
		ps.setString(8,memberDto.getMemPwQ());
		ps.setString(9,memberDto.getMemPwA());
		ps.execute();
		
		System.out.print("들어옴");
		con.close();
	}

	// 로그인
	public MemberDto get(String memId) throws Exception{
		Connection con = JdbcUtils.connect2();
		
		String sql = "select * from member where mem_id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, memId);
		rs = ps.executeQuery();
		
		MemberDto memberDto;
		
		if (rs.next()) {
			
			memberDto = new MemberDto();
			
			memberDto.setMemId(rs.getString("mem_id"));
			memberDto.setMemPw(rs.getString("mem_pw"));
			memberDto.setMemNick(rs.getString("mem_nick"));
			memberDto.setMemGrade(rs.getString("mem_grade"));
			memberDto.setMemBirth(rs.getString("mem_birth"));
			memberDto.setMemGender(rs.getString("mem_gender"));
			memberDto.setMemPwQ(rs.getString("mem_pw_q"));
			memberDto.setMemPwA(rs.getString("mem_pw_a"));
			memberDto.setMemName(rs.getString("mem_name"));
			memberDto.setMemPhone(rs.getString("mem_phone"));
			memberDto.setMemReport(rs.getInt("mem_report"));
			memberDto.setMemJoin(rs.getDate("mem_join"));
		}
		else {
			memberDto = null;
		}
		con.close();
		return memberDto;
	}

	// 회원 탈퇴
	public boolean quit(String memId, String memPw) throws Exception {
		Connection con = JdbcUtils.connect2();
		
		String sql="delect member where mem_id=? and mem_pw=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, memId);
		ps.setString(2, memPw);
		
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}

	//정보 수정
	public boolean edit(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect2();
		
		String sql="update member "
				+ "set mem_pw=?,"
				+ "mem_nick=?, mem_phone=? "
				+ "where mem_id=?"; //아이디 기준
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, memberDto.getMemPw());
		ps.setString(2, memberDto.getMemNick());
		ps.setString(3, memberDto.getMemPhone());
		ps.setString(4, memberDto.getMemId());
		
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	// 아이디 찾기 (이름, 전화번호)
	public String findId(MemberDto memberDto) throws Exception{
		Connection con = JdbcUtils.connect2();
		
		String sql = "select mem_id from member where mem_name=? and mem_phone=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemName());
		ps.setString(2, memberDto.getMemPhone());
		rs = ps.executeQuery();
		
		String memId;
		if(rs.next()) {
			memId= rs.getString("mem_id");
		} else {
			memId = null;
		}
		con.close();
		return memId;
	}
	
	// 비밀번호 찾기(아이디, 질문, 답변)
	public String findPw(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect2();
		
		String sql = "select mem_pw from member "
				+ "where mem_id=? and mem_pw_q=? and mem_pw_a=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemId());
		ps.setString(2, memberDto.getMemPwQ());
		ps.setString(3, memberDto.getMemPwA());
		rs = ps.executeQuery();
		
		String memPw;
		if(rs.next()) {
			memPw = rs.getString("mem_pw");
		} else {
			memPw = null;
		}
		con.close();
		return memPw;
	}
}
