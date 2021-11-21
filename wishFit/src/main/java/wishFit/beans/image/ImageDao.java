package wishFit.beans.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import wishFit.util.JdbcUtils;

public class ImageDao {
	//이미지 저장 기능
	public void insert(ImageDto imageDto)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into image values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, imageDto.getImageNo());
		ps.setInt(2, imageDto.getBoardNo());
		ps.setString(3, imageDto.getBoardUpload());
		ps.setString(4, imageDto.getBoardSave());
		ps.setLong(5, imageDto.getBoardSize());
		ps.setString(6, imageDto.getBoardType());
		ps.execute();
		
		con.close();
	}
	//단일 조회
	public ImageDto get(int imageNo) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select * from image where image_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, imageNo);
		ResultSet rs = ps.executeQuery();
		
		ImageDto imageDto;
		
		if(rs.next()) {
			imageDto = new ImageDto();
			
			//copy
			imageDto.setImageNo(rs.getInt("image_no"));
			imageDto.setBoardNo(rs.getInt("board_no"));
			imageDto.setBoardUpload(rs.getString("board_upload"));
			imageDto.setBoardSave(rs.getString("board_save"));
			imageDto.setBoardSize(rs.getLong("board_size"));
			imageDto.setBoardType(rs.getString("board_type"));
			
		}
		else {
			imageDto=null;
		}
		con.close();
		return imageDto;
	}
		
		
		
		//게시글에 해당하는 이미지 목록 조회
		public List<ImageDto> find(int boardNo)throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "select * from  image where board_no = ? order by image_no desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			ResultSet rs = ps.executeQuery();
			
			List<ImageDto>list = new ArrayList<>();
			while(rs.next()) {
				ImageDto imageDto = new ImageDto();
				
				//copy
				imageDto.setImageNo(rs.getInt("image_no"));
				imageDto.setBoardNo(rs.getInt("board_no"));
				imageDto.setBoardUpload(rs.getString("board_upload"));
				imageDto.setBoardSave(rs.getString("board_save"));
				imageDto.setBoardSize(rs.getLong("board_size"));
				imageDto.setBoardType(rs.getString("board_type"));
				
				list.add(imageDto);
			   
			}
			con.close();
			return  list;
			
		}
		//이미지 첨부 할때 번호 부여
		public int getSequence()throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "select image_seq.nextval from dual";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			int seq = rs.getInt(1);
			
			con.close();
			
			return seq;
		}
		
	}
		
		
	
	


