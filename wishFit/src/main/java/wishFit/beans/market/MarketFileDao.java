package wishFit.beans.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;


public class MarketFileDao {
	//파일 정보 저장 기능
		public void insert(MarketFileDto marketFileDto) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "insert into image values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, marketFileDto.getImageNo());
			ps.setInt(2, marketFileDto.getBoardNo());
			ps.setString(3, marketFileDto.getBoardUpload());
			ps.setString(4, marketFileDto.getBoardSave());
			ps.setLong(5, marketFileDto.getBoardSize());
			ps.setString(6, marketFileDto.getBoardType());
			ps.execute();
			
			con.close();
		}

		//단일조회
		public MarketFileDto get(int imageNo) throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "select * from image where image_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, imageNo);
			ResultSet rs = ps.executeQuery();
			
			MarketFileDto marketFileDto;
			if(rs.next()) {
				marketFileDto = new MarketFileDto();
				
				//copy
			    marketFileDto.setImageNo(rs.getInt("image_no"));
				marketFileDto.setBoardNo(rs.getInt("board_no"));
				marketFileDto.setBoardUpload(rs.getString("board_upload"));
				marketFileDto.setBoardSave(rs.getString("board_save"));
				marketFileDto.setBoardSize(rs.getLong("board_size"));
				marketFileDto.setBoardType(rs.getString("board_type"));
			}
			else {
				marketFileDto = null;
			}
			
			con.close();
			
			return marketFileDto;
		}
		
		//게시글에 해당하는 파일목록 조회
		public List<MarketFileDto> find(int boardNo) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "select * from  image where board_no = ? order by image_no desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			ResultSet rs = ps.executeQuery();
			
			List<MarketFileDto> list = new ArrayList<>();
			while(rs.next()) {
				MarketFileDto marketFileDto = new MarketFileDto();
				
				//copy
				marketFileDto.setImageNo(rs.getInt("image_no"));
				marketFileDto.setBoardNo(rs.getInt("board_no"));
				marketFileDto.setBoardUpload(rs.getString("board_upload"));
				marketFileDto.setBoardSave(rs.getString("board_save"));
				marketFileDto.setBoardSize(rs.getLong("board_size"));
				marketFileDto.setBoardType(rs.getString("board_type"));
				
				list.add(marketFileDto);
			}
			
			con.close();
			
			return list;
		}
		//이미지 첨부 할때 번호 부여
		public int getSequence()throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "select image_seq.nextval from dual";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			
			rs.next();
			int seq = rs.getInt(1);
			
			con.close();
			
			return seq;
		
		}

}
