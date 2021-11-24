package wishFit.beans.firgroupimage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import wishFit.util.JdbcUtils;

public class FitgroupImageDao {

	// 작성
	public void insert(FitgroupImageDto fitgroupImageDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into fitgroupimage values(fitgroupimage_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fitgroupImageDto.getFgNo());
		ps.setString(2, fitgroupImageDto.getFgImageUpload());
		ps.setString(3, fitgroupImageDto.getFgImageSave());
		ps.setLong(4, fitgroupImageDto.getFgImageSize());
		ps.setString(5, fitgroupImageDto.getFgImageType());
		ps.execute();

		con.close();
	}

	// 단일조회
	public FitgroupImageDto get(int fgImageNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroupimage where fg_image_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgImageNo);
		ResultSet rs = ps.executeQuery();
		FitgroupImageDto fitgroupImageDto;
		if(rs.next()) {
			fitgroupImageDto = new FitgroupImageDto();
			fitgroupImageDto.setFgNo(rs.getInt("fg_no"));
			fitgroupImageDto.setFgImageNo(rs.getInt("fg_image_no"));
			fitgroupImageDto.setFgImageUpload(rs.getString("fg_image_upload"));
			fitgroupImageDto.setFgImageSave(rs.getString("fg_image_save"));
			fitgroupImageDto.setFgImageSize(rs.getLong("fg_image_size"));
			fitgroupImageDto.setFgImageType(rs.getString("fg_image_type"));
		}else {
			fitgroupImageDto = null;
		}
		con.close();
		return fitgroupImageDto;
	}
	// 단일조회
	public FitgroupImageDto find(int fgNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroupimage where fg_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		ResultSet rs = ps.executeQuery();
		FitgroupImageDto fitgroupImageDto;
		if(rs.next()) {
			fitgroupImageDto = new FitgroupImageDto();
			fitgroupImageDto.setFgNo(rs.getInt("fg_no"));
			fitgroupImageDto.setFgImageNo(rs.getInt("fg_image_no"));
			fitgroupImageDto.setFgImageUpload(rs.getString("fg_image_upload"));
			fitgroupImageDto.setFgImageSave(rs.getString("fg_image_save"));
			fitgroupImageDto.setFgImageSize(rs.getLong("fg_image_size"));
			fitgroupImageDto.setFgImageType(rs.getString("fg_image_type"));
		}else {
			fitgroupImageDto = null;
		}
		con.close();
		return fitgroupImageDto;
	}
}
