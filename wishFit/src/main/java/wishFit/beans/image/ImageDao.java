package wishFit.beans.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.GetSeq;
import wishFit.util.JdbcUtils;

public class ImageDao {
	private Connection conn;
	private GetSeq getSeq;
	//Image 등록 처리
	public void insert(ImageDto imageDto) throws Exception{
		conn=JdbcUtils.connect();
		String sql = "insert into image values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, imageDto.getImageNo());
		ps.setInt(2, imageDto.getBoardNo());
		ps.setString(3, imageDto.getBoardUpload());
		ps.setString(4, imageDto.getBoardSave());
		ps.setLong(5, imageDto.getBoardSize());
		ps.setString(6, imageDto.getBoardType());
		
		ps.execute();
		
		conn.close();
	}
	//Image 단일 조회
	public ImageDto search(int imageNo) throws Exception{
		conn=JdbcUtils.connect();
		String sql = "select * from image where image_no=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, imageNo);
		ResultSet rs = ps.executeQuery();
		
		//있는지 확인
		ImageDto imageDto;
		if(rs.next()) {
			imageDto = new ImageDto();
			
			imageDto.setImageNo(rs.getInt("imageNo"));
			imageDto.setBoardNo(rs.getInt("boardNo"));
			imageDto.setBoardUpload(rs.getString("boardUpload"));
			imageDto.setBoardSave(rs.getString("boardSave"));
			imageDto.setBoardSize(rs.getLong("boardSize"));
			imageDto.setBoardType(rs.getString("boardType"));
		}else {
			imageDto=null;
		}
		conn.close();
		return imageDto;
			
	}
	public List<ImageDto> find(int boardNo) throws Exception{
		conn = JdbcUtils.connect();
		String sql = "select B.*,I.image_no "
				+ "from board B left outer join image I on B.board_no=I.board_no "
				+ "where B.board_no = ? "
				+ "order by B.board_no;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		List<ImageDto> list = new ArrayList<>();
		while(rs.next()) {
			ImageDto imageDto = new ImageDto();
			
			imageDto.setImageNo(rs.getInt("imageNo"));
			imageDto.setBoardNo(rs.getInt("boardNo"));
			imageDto.setBoardUpload(rs.getString("boardUpload"));
			imageDto.setBoardSave(rs.getString("boardSave"));
			imageDto.setBoardSize(rs.getLong("boardSize"));
			imageDto.setBoardType(rs.getString("boardType"));
			
			list.add(imageDto);
		}
		conn.close();
		return list;
	}
}
