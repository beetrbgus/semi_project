package wishFit.beans.mysmallgroup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.JdbcUtils;

public class MySmallGroupDao {
	public void insert(MySmallGroupDto mySmallGroupDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into mysmallgroup values(mysmallgroup_seq.nextval,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, mySmallGroupDto.getFgNo());
		ps.setString(2, mySmallGroupDto.getMemId());
		ps.execute();
	}

	// 취소
	public boolean delete(int fgNo , String memId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete mysmallgroup where sg_no=? and m_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		ps.setString(2, memId);
		int result = ps.executeUpdate();
		con.close();
		return result > 0;
	}

	// 조회
	public List<MySmallGroupDto> search(int fgNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from mysmallgroup where sg_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		ResultSet rs = ps.executeQuery();
		List<MySmallGroupDto> list = new ArrayList<MySmallGroupDto>();
		while (rs.next()) {
			MySmallGroupDto mySmallGroupDto = new MySmallGroupDto();
			mySmallGroupDto.setFgNo(rs.getInt("sg_no"));
			mySmallGroupDto.setFgJoinNo(rs.getInt("fg_join_no"));
			mySmallGroupDto.setMemId(rs.getString("m_id"));
			list.add(mySmallGroupDto);
		}
		con.close();
		return list;

	}

	// 단일조회
	public MySmallGroupDto detail(int fgNo, String memId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from mysmallgroup where sg_no =? and m_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		ps.setString(2, memId);
		ResultSet rs = ps.executeQuery();
		MySmallGroupDto mySmallGroupDto;
		if (rs.next()) {
			mySmallGroupDto = new MySmallGroupDto();
			mySmallGroupDto.setFgJoinNo(rs.getInt("fg_join_no"));
			mySmallGroupDto.setFgNo(rs.getInt("sg_no"));
			mySmallGroupDto.setMemId(rs.getString("m_id"));
		} else {
			mySmallGroupDto = null;
		}
		con.close();
		return mySmallGroupDto;
	}

}
