package wishFit.beans.fitgroup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;
import wishFit.beans.firgroupimage.FitgroupImageDao;
import wishFit.beans.firgroupimage.FitgroupImageDto;
//마이페이지 - 작성 글 목록 보기
public class FitgroupDao {
//전체조회
	public List<FitgroupDto> list() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroup where fg_starttime>sysdate";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<FitgroupDto> list = new ArrayList<>();
		while (rs.next()) {
			FitgroupDto fitgroupDto = new FitgroupDto();

			fitgroupDto.setFgNo(rs.getInt("fg_no"));
			fitgroupDto.setFgId(rs.getString("fg_id"));
			fitgroupDto.setExcateName(rs.getString("excate_name"));
			fitgroupDto.setFgTitle(rs.getString("fg_title"));
			fitgroupDto.setFgIntro(rs.getString("fg_intro"));
			fitgroupDto.setFgStarttime(rs.getString("fg_starttime"));
			fitgroupDto.setFgEndtime(rs.getString("fg_endtime"));
			fitgroupDto.setFgLocation(rs.getString("fg_location"));
			fitgroupDto.setFgLatitude(rs.getString("fg_latitude"));
			fitgroupDto.setFgLongtitude(rs.getString("fg_longitude"));
			fitgroupDto.setFgMkdate(rs.getString("fg_mkdate"));

<<<<<<< HEAD
			list.add(fitgroupDto);

		}
		con.close();
		return list;
	}
	//vo를 활용한 전체 조회
	public List<FitImageVO> listAll() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where fg_starttime>sysdate order by fg_starttime asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<FitImageVO> list = new ArrayList<>();
		while (rs.next()) {
			FitImageVO fitImageVO = new FitImageVO();
			fitImageVO.setFgNo(rs.getInt("fg_no"));
			fitImageVO.setFgId(rs.getString("fg_id"));
			fitImageVO.setExcateName(rs.getString("excate_name"));
			fitImageVO.setFgTitle(rs.getString("fg_title"));
			fitImageVO.setFgIntro(rs.getString("fg_intro"));
			fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
			fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
			fitImageVO.setFgLocation(rs.getString("fg_location"));
			fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
			fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
			fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
			fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
			fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
			fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
			fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
			fitImageVO.setFgImageType(rs.getString("fg_image_type"));

			list.add(fitImageVO);

		}
		con.close();
		return list;
	}
	//VO를 활용한 위치 검색 단일 조회
	public List<FitImageVO> detailAll(String fgLocation) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where instr(fg_location,?) >0 and fg_starttime>sysdate order by fg_starttime asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fgLocation);
		ResultSet rs = ps.executeQuery();
		List<FitImageVO> list = new ArrayList<>();
		while (rs.next()) {
			FitImageVO fitImageVO = new FitImageVO();
			fitImageVO.setFgNo(rs.getInt("fg_no"));
			fitImageVO.setFgId(rs.getString("fg_id"));
			fitImageVO.setExcateName(rs.getString("excate_name"));
			fitImageVO.setFgTitle(rs.getString("fg_title"));
			fitImageVO.setFgIntro(rs.getString("fg_intro"));
			fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
			fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
			fitImageVO.setFgLocation(rs.getString("fg_location"));
			fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
			fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
			fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
			fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
			fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
			fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
			fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
			fitImageVO.setFgImageType(rs.getString("fg_image_type"));

			list.add(fitImageVO);

		}
		con.close();
		return list;
	}
//단일조회(기본키)
	public FitgroupDto detail(int fgNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroup where fg_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		ResultSet rs = ps.executeQuery();
		FitgroupDto fitgroupDto;
		if (rs.next()) {
			fitgroupDto = new FitgroupDto();
			fitgroupDto.setFgNo(rs.getInt("fg_no"));
			fitgroupDto.setFgId(rs.getString("fg_id"));
			fitgroupDto.setExcateName(rs.getString("excate_name"));
			fitgroupDto.setFgTitle(rs.getString("fg_title"));
			fitgroupDto.setFgIntro(rs.getString("fg_intro"));
			fitgroupDto.setFgStarttime(rs.getString("fg_starttime"));
			fitgroupDto.setFgEndtime(rs.getString("fg_endtime"));
			fitgroupDto.setFgLocation(rs.getString("fg_location"));
			fitgroupDto.setFgLatitude(rs.getString("fg_latitude"));
			fitgroupDto.setFgLongtitude(rs.getString("fg_longitude"));
			fitgroupDto.setFgMkdate(rs.getString("fg_mkdate"));

		} else {
			fitgroupDto = null;
		}
		con.close();
		return fitgroupDto;
	}

//위치조회(위치)
	public List<FitgroupDto> search(String fgLocation) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from fitgroup where fg_location=? order by fg_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fgLocation);
		ResultSet rs = ps.executeQuery();
		List<FitgroupDto> list = new ArrayList<FitgroupDto>();
		while (rs.next()) {
			FitgroupDto fitgroupDto = new FitgroupDto();

			fitgroupDto.setFgNo(rs.getInt("fg_no"));
			fitgroupDto.setFgId(rs.getString("fg_id"));
			fitgroupDto.setExcateName(rs.getString("excate_name"));
			fitgroupDto.setFgTitle(rs.getString("fg_title"));
			fitgroupDto.setFgIntro(rs.getString("fg_intro"));
			fitgroupDto.setFgStarttime(rs.getString("fg_starttime"));
			fitgroupDto.setFgEndtime(rs.getString("fg_endtime"));
			fitgroupDto.setFgLocation(rs.getString("fg_location"));
			fitgroupDto.setFgLatitude(rs.getString("fg_latitude"));
			fitgroupDto.setFgLongtitude(rs.getString("fg_longitude"));
			fitgroupDto.setFgMkdate(rs.getString("fg_mkdate"));

=======
>>>>>>> refs/remotes/origin/master
			list.add(fitgroupDto);
		}
		con.close();
		return list;
	}
<<<<<<< HEAD

	// 글작성
	public void write(FitgroupDto fitgroupDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into fitgroup(fg_no,fg_id,excate_name,fg_title,fg_intro,fg_starttime,fg_endtime,fg_location,fg_latitude,fg_longitude,fg_mkdate)"
				+ "values(?,?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi'),to_date(?,'yyyy-mm-dd hh24:mi'),?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fitgroupDto.getFgNo());
		ps.setString(2, fitgroupDto.getFgId());
		ps.setString(3, fitgroupDto.getExcateName());
		ps.setString(4, fitgroupDto.getFgTitle());
		ps.setString(5, fitgroupDto.getFgIntro());
		ps.setString(6, fitgroupDto.getFgStarttime());
		ps.setString(7, fitgroupDto.getFgEndtime());
		ps.setString(8, fitgroupDto.getFgLocation());
		ps.setString(9, fitgroupDto.getFgLatitude());
		ps.setString(10, fitgroupDto.getFgLongtitude());
	
		ps.execute();
		con.close();
	}

	// 글수정
	public boolean update(FitgroupDto fitgroupDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "update fitgroup set excate_name=?, fg_title=?, fg_intro=?,fg_starttime=to_date(?,'yyyy-mm-dd hh24:mi'),fg_endtime=to_date(?,'yyyy-mm-dd hh24:mi'),fg_location=?,fg_latitude=?,fg_longitude=? where fg_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fitgroupDto.getExcateName());
		ps.setString(2, fitgroupDto.getFgTitle());
		ps.setString(3, fitgroupDto.getFgIntro());
		ps.setString(4, fitgroupDto.getFgStarttime());
		ps.setString(5, fitgroupDto.getFgEndtime());
		ps.setString(6, fitgroupDto.getFgLocation());
		ps.setString(7, fitgroupDto.getFgLatitude());
		ps.setString(8, fitgroupDto.getFgLongtitude());
		ps.setInt(9, fitgroupDto.getFgNo());

		int result = ps.executeUpdate();
		con.close();
		return result > 0;
	}

	// 글삭제
	public boolean delete(int fgNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete  fitgroup where fg_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fgNo);
		int result = ps.executeUpdate();

		con.close();
		return result > 0;
	}

	//페이지네이션 전체조회
	public List<FitImageVO> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql ="select * from(select rownum rn, TMP.* from(select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where fg_starttime>sysdate order by fg_starttime asc)TMP)where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		List<FitImageVO> list = new ArrayList<>();
		while (rs.next()) {
			FitImageVO fitImageVO = new FitImageVO();
			fitImageVO.setFgNo(rs.getInt("fg_no"));
			fitImageVO.setFgId(rs.getString("fg_id"));
			fitImageVO.setExcateName(rs.getString("excate_name"));
			fitImageVO.setFgTitle(rs.getString("fg_title"));
			fitImageVO.setFgIntro(rs.getString("fg_intro"));
			fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
			fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
			fitImageVO.setFgLocation(rs.getString("fg_location"));
			fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
			fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
			fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
			fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
			fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
			fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
			fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
			fitImageVO.setFgImageType(rs.getString("fg_image_type"));

			list.add(fitImageVO);

		}
		con.close();
		return list;
}
	//페이지 네이션 검색
		public List<FitImageVO> searchByRownum(String fgLocation,int begin, int end) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql ="select rownum rn, TMP.* from(select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where instr(fg_location,?) >0 and fg_starttime>sysdate order by fg_starttime asc)TMP)where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fgLocation);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			List<FitImageVO> list = new ArrayList<>();
			while (rs.next()) {
				FitImageVO fitImageVO = new FitImageVO();
				fitImageVO.setFgNo(rs.getInt("fg_no"));
				fitImageVO.setFgId(rs.getString("fg_id"));
				fitImageVO.setExcateName(rs.getString("excate_name"));
				fitImageVO.setFgTitle(rs.getString("fg_title"));
				fitImageVO.setFgIntro(rs.getString("fg_intro"));
				fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
				fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
				fitImageVO.setFgLocation(rs.getString("fg_location"));
				fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
				fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
				fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
				fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
				fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
				fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
				fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
				fitImageVO.setFgImageType(rs.getString("fg_image_type"));

				list.add(fitImageVO);

			}
			con.close();
			return list;
		}
		//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록 / 검색)
		public int count() throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "select count(*) from fitgroup where fg_starttime>sysdate";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt("count(*)");
			//int count = rs.getInt(1);
			
			con.close();
			
			return count;
		}
		public int count(String fgLocation) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "select count(*) from fitgroup where instr(fg_location, ?) and fg_starttime>sysdate > 0";
	
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fgLocation);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt("count(*)");
			//int count = rs.getInt(1);
			
			con.close();
			
			return count;
		}
=======
	//vo를 활용한 전체 조회
		public List<FitImageVO> listAll() throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where fg_starttime>sysdate order by fg_starttime asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			List<FitImageVO> list = new ArrayList<>();
			while (rs.next()) {
				FitImageVO fitImageVO = new FitImageVO();
				fitImageVO.setFgNo(rs.getInt("fg_no"));
				fitImageVO.setFgId(rs.getString("fg_id"));
				fitImageVO.setExcateName(rs.getString("excate_name"));
				fitImageVO.setFgTitle(rs.getString("fg_title"));
				fitImageVO.setFgIntro(rs.getString("fg_intro"));
				fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
				fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
				fitImageVO.setFgLocation(rs.getString("fg_location"));
				fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
				fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
				fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
				fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
				fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
				fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
				fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
				fitImageVO.setFgImageType(rs.getString("fg_image_type"));

				list.add(fitImageVO);

			}
			con.close();
			return list;
		}
		//VO를 활용한 위치 검색 단일 조회
		public List<FitImageVO> detailAll(String fgLocation) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where instr(fg_location,?) >0 and fg_starttime>sysdate order by fg_starttime asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fgLocation);
			ResultSet rs = ps.executeQuery();
			List<FitImageVO> list = new ArrayList<>();
			while (rs.next()) {
				FitImageVO fitImageVO = new FitImageVO();
				fitImageVO.setFgNo(rs.getInt("fg_no"));
				fitImageVO.setFgId(rs.getString("fg_id"));
				fitImageVO.setExcateName(rs.getString("excate_name"));
				fitImageVO.setFgTitle(rs.getString("fg_title"));
				fitImageVO.setFgIntro(rs.getString("fg_intro"));
				fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
				fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
				fitImageVO.setFgLocation(rs.getString("fg_location"));
				fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
				fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
				fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
				fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
				fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
				fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
				fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
				fitImageVO.setFgImageType(rs.getString("fg_image_type"));

				list.add(fitImageVO);

			}
			con.close();
			return list;
		}
	//단일조회(기본키)
		public FitgroupDto detail(int fgNo) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from fitgroup where fg_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, fgNo);
			ResultSet rs = ps.executeQuery();
			FitgroupDto fitgroupDto;
			if (rs.next()) {
				fitgroupDto = new FitgroupDto();
				fitgroupDto.setFgNo(rs.getInt("fg_no"));
				fitgroupDto.setFgId(rs.getString("fg_id"));
				fitgroupDto.setExcateName(rs.getString("excate_name"));
				fitgroupDto.setFgTitle(rs.getString("fg_title"));
				fitgroupDto.setFgIntro(rs.getString("fg_intro"));
				fitgroupDto.setFgStarttime(rs.getString("fg_starttime"));
				fitgroupDto.setFgEndtime(rs.getString("fg_endtime"));
				fitgroupDto.setFgLocation(rs.getString("fg_location"));
				fitgroupDto.setFgLatitude(rs.getString("fg_latitude"));
				fitgroupDto.setFgLongtitude(rs.getString("fg_longitude"));
				fitgroupDto.setFgMkdate(rs.getString("fg_mkdate"));

			} else {
				fitgroupDto = null;
			}
			con.close();
			return fitgroupDto;
		}

	//위치조회(위치)
		public List<FitgroupDto> search(String fgLocation) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from fitgroup where fg_location=? order by fg_no desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fgLocation);
			ResultSet rs = ps.executeQuery();
			List<FitgroupDto> list = new ArrayList<FitgroupDto>();
			while (rs.next()) {
				FitgroupDto fitgroupDto = new FitgroupDto();

				fitgroupDto.setFgNo(rs.getInt("fg_no"));
				fitgroupDto.setFgId(rs.getString("fg_id"));
				fitgroupDto.setExcateName(rs.getString("excate_name"));
				fitgroupDto.setFgTitle(rs.getString("fg_title"));
				fitgroupDto.setFgIntro(rs.getString("fg_intro"));
				fitgroupDto.setFgStarttime(rs.getString("fg_starttime"));
				fitgroupDto.setFgEndtime(rs.getString("fg_endtime"));
				fitgroupDto.setFgLocation(rs.getString("fg_location"));
				fitgroupDto.setFgLatitude(rs.getString("fg_latitude"));
				fitgroupDto.setFgLongtitude(rs.getString("fg_longitude"));
				fitgroupDto.setFgMkdate(rs.getString("fg_mkdate"));

				list.add(fitgroupDto);
			}
			con.close();
			return list;
		}

		// 글작성
		public void write(FitgroupDto fitgroupDto) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "insert into fitgroup(fg_no,fg_id,excate_name,fg_title,fg_intro,fg_starttime,fg_endtime,fg_location,fg_latitude,fg_longitude,fg_mkdate)"
					+ "values(?,?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi'),to_date(?,'yyyy-mm-dd hh24:mi'),?,?,?,sysdate)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, fitgroupDto.getFgNo());
			ps.setString(2, fitgroupDto.getFgId());
			ps.setString(3, fitgroupDto.getExcateName());
			ps.setString(4, fitgroupDto.getFgTitle());
			ps.setString(5, fitgroupDto.getFgIntro());
			ps.setString(6, fitgroupDto.getFgStarttime());
			ps.setString(7, fitgroupDto.getFgEndtime());
			ps.setString(8, fitgroupDto.getFgLocation());
			ps.setString(9, fitgroupDto.getFgLatitude());
			ps.setString(10, fitgroupDto.getFgLongtitude());

			ps.execute();
			con.close();
		}

		// 글수정
		public boolean update(FitgroupDto fitgroupDto) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "update fitgroup set excate_name=?, fg_title=?, fg_intro=?,fg_starttime=to_date(?,'yyyy-mm-dd hh24:mi'),fg_endtime=to_date(?,'yyyy-mm-dd hh24:mi'),fg_location=?,fg_latitude=?,fg_longitude=? where fg_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fitgroupDto.getExcateName());
			ps.setString(2, fitgroupDto.getFgTitle());
			ps.setString(3, fitgroupDto.getFgIntro());
			ps.setString(4, fitgroupDto.getFgStarttime());
			ps.setString(5, fitgroupDto.getFgEndtime());
			ps.setString(6, fitgroupDto.getFgLocation());
			ps.setString(7, fitgroupDto.getFgLatitude());
			ps.setString(8, fitgroupDto.getFgLongtitude());
			ps.setInt(9, fitgroupDto.getFgNo());

			int result = ps.executeUpdate();
			con.close();
			return result > 0;
		}

		// 글삭제
		public boolean delete(int fgNo) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "delete  fitgroup where fg_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, fgNo);
			int result = ps.executeUpdate();

			con.close();
			return result > 0;
		}

		//페이지네이션 전체조회
		public List<FitImageVO> listByRownum(int begin, int end) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql ="select * from(select rownum rn, TMP.* from(select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where fg_starttime>sysdate order by fg_starttime asc)TMP)where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			List<FitImageVO> list = new ArrayList<>();
			while (rs.next()) {
				FitImageVO fitImageVO = new FitImageVO();
				fitImageVO.setFgNo(rs.getInt("fg_no"));
				fitImageVO.setFgId(rs.getString("fg_id"));
				fitImageVO.setExcateName(rs.getString("excate_name"));
				fitImageVO.setFgTitle(rs.getString("fg_title"));
				fitImageVO.setFgIntro(rs.getString("fg_intro"));
				fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
				fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
				fitImageVO.setFgLocation(rs.getString("fg_location"));
				fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
				fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
				fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
				fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
				fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
				fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
				fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
				fitImageVO.setFgImageType(rs.getString("fg_image_type"));

				list.add(fitImageVO);

			}
			con.close();
			return list;
	}
		//페이지 네이션 검색
			public List<FitImageVO> searchByRownum(String fgLocation,int begin, int end) throws Exception {
				Connection con = JdbcUtils.connect();
				String sql ="select rownum rn, TMP.* from(select * from fitgroup left outer join fitgroupimage on fitgroup.fg_no = fitgroupimage.fg_no where instr(fg_location,?) >0 and fg_starttime>sysdate order by fg_starttime asc)TMP)where rn between ? and ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, fgLocation);
				ps.setInt(2, begin);
				ps.setInt(3, end);
				ResultSet rs = ps.executeQuery();
				List<FitImageVO> list = new ArrayList<>();
				while (rs.next()) {
					FitImageVO fitImageVO = new FitImageVO();
					fitImageVO.setFgNo(rs.getInt("fg_no"));
					fitImageVO.setFgId(rs.getString("fg_id"));
					fitImageVO.setExcateName(rs.getString("excate_name"));
					fitImageVO.setFgTitle(rs.getString("fg_title"));
					fitImageVO.setFgIntro(rs.getString("fg_intro"));
					fitImageVO.setFgStarttime(rs.getString("fg_starttime"));
					fitImageVO.setFgEndtime(rs.getString("fg_endtime"));
					fitImageVO.setFgLocation(rs.getString("fg_location"));
					fitImageVO.setFgLatitude(rs.getString("fg_latitude"));
					fitImageVO.setFgLongitude(rs.getString("fg_longitude"));
					fitImageVO.setFgMkDate(rs.getString("fg_mkdate"));
					fitImageVO.setFgImageNo(rs.getInt("fg_image_no"));
					fitImageVO.setFgImageUpload(rs.getString("fg_image_upload"));
					fitImageVO.setFgImageSave(rs.getString("fg_image_save"));
					fitImageVO.setFgImageSize(rs.getLong("fg_image_size"));
					fitImageVO.setFgImageType(rs.getString("fg_image_type"));

					list.add(fitImageVO);

				}
				con.close();
				return list;
			}
			//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록 / 검색)
			public int count() throws Exception {
				Connection con = JdbcUtils.connect();

				String sql = "select count(*) from fitgroup where fg_starttime>sysdate";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();

				rs.next();

				int count = rs.getInt("count(*)");
				//int count = rs.getInt(1);

				con.close();

				return count;
			}
			public int count(String fgLocation) throws Exception {
				Connection con = JdbcUtils.connect();

				String sql = "select count(*) from fitgroup where instr(fg_location, ?) and fg_starttime>sysdate > 0";

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, fgLocation);
				ResultSet rs = ps.executeQuery();

				rs.next();

				int count = rs.getInt("count(*)");
				//int count = rs.getInt(1);

				con.close();

				return count;
			}
>>>>>>> refs/remotes/origin/master
}
