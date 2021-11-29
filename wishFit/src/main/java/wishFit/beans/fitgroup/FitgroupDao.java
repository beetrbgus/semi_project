package wishFit.beans.fitgroup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

// 마이페이지 - 작성 글 목록 보기
public class FitgroupDao {
	public List<FitgroupDto> fitgroupMine(String column, String keyword) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from fitgroup where #1 = ? order by fg_no desc";
		
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<FitgroupDto> list = new ArrayList<>();
		while(rs.next()) {
			FitgroupDto fitgroupDto = new FitgroupDto();
			
			fitgroupDto.setFgNo(rs.getInt("fg_no"));
			fitgroupDto.setFgId(rs.getString("fg_id"));
			fitgroupDto.setExcateName(rs.getString("excate_name"));
			fitgroupDto.setFgTitle(rs.getString("fg_title"));
			fitgroupDto.setFgIntro(rs.getString("fg_intro"));
			fitgroupDto.setFgLocation(rs.getString("fg_location"));
			fitgroupDto.setFgOnlyfemale(rs.getString("fg_onlyfemale"));
			fitgroupDto.setFgStarttime(rs.getDate("fg_starttime"));
			fitgroupDto.setFgEndtime(rs.getDate("fg_endtime"));
			
			list.add(fitgroupDto);
		}
		con.close();
		
		return list;
	}
}
