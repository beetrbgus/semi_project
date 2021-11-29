package wishFit.beans.fitgroupimage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class FitgroupImageDao {

	// 작성
	public void insert(FitgroupImageDto fitgroupImageDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into fitgroupimage values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fitgroupImageDto.getFgImageNo());
		ps.setInt(2, fitgroupImageDto.getFgNo());
		ps.setString(3, fitgroupImageDto.getFgImageUpload());
		ps.setString(4, fitgroupImageDto.getFgImageSave());
		ps.setLong(5, fitgroupImageDto.getFgImageSize());
		ps.setString(6, fitgroupImageDto.getFgImageType());
		System.out.println("fitImageNo    :"+fitgroupImageDto.getFgImageNo());
		System.out.println("fgNo    :"+fitgroupImageDto.getFgNo());
		System.out.println("fitsave    :"+fitgroupImageDto.getFgImageSave());
		
		ps.execute();
		System.out.println("fitImageNo    :"+fitgroupImageDto.getFgImageNo());
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
	// 단일조회 인덱스 표시용
		public List<FitgroupImageDto> findIndex() throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from("
					+ "select rownum rn,TMP.* from("
					+ "select * from fitgroup fg "
					+ "inner join fitgroupimage fgimg on  fg.fg_no = fgimg.fg_no  order by fg.fg_no desc)TMP) "
					+ "where rn between 1 and 9";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			List<FitgroupImageDto> list= new ArrayList<>();;
			while(rs.next()) {
				FitgroupImageDto fitgroupImageDto = new FitgroupImageDto();
				
				fitgroupImageDto.setFgNo(rs.getInt("fg_no"));
				fitgroupImageDto.setFgImageNo(rs.getInt("fg_image_no"));
				fitgroupImageDto.setFgImageUpload(rs.getString("fg_image_upload"));
				fitgroupImageDto.setFgImageSave(rs.getString("fg_image_save"));
				fitgroupImageDto.setFgImageSize(rs.getLong("fg_image_size"));
				fitgroupImageDto.setFgImageType(rs.getString("fg_image_type"));
				
				list.add(fitgroupImageDto);
			}
			con.close();
			return list;
		}
}
