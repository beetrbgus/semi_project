package wishFit.beans.image;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardImageVO;
import wishFit.util.GetSeq;
import wishFit.util.JdbcUtils;

public class ImageDao {
	private Connection conn;
	private GetSeq getSeq;
	
	public int imageSeq() throws Exception{
		conn = JdbcUtils.connect();
		String sql = "select image_seq.nextval from dual";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		
		
		rs.next();
		//다음 시퀀스 번호를 seq에 저장
		int seq = rs.getInt("nextval");
		
		conn.close();
		
		return seq;
	}
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
	public BoardImageVO search(int imageNo) throws Exception{
		conn=JdbcUtils.connect();
		String sql = "select * from image where image_no=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, imageNo);
		ResultSet rs = ps.executeQuery();
		
		//있는지 확인
		BoardImageVO boardImageVO;
		if(rs.next()) {
			boardImageVO = new BoardImageVO();
			
			boardImageVO.setImageNo(rs.getInt("image_no"));
			boardImageVO.setBoardNo(rs.getInt("board_no"));
			boardImageVO.setBoardUpload(rs.getString("board_upload"));
			boardImageVO.setBoardSave(rs.getString("board_save"));
			boardImageVO.setBoardSize(rs.getLong("board_size"));
			boardImageVO.setBoardType(rs.getString("board_type"));
		}else {
			boardImageVO=null;
		}
		conn.close();
		return boardImageVO;
			
	}
	//이미지 list조회
	public List<BoardImageVO> find(int boardNo) throws Exception{
		conn = JdbcUtils.connect();
		String sql = "select B.*,I.image_no "
				+ "from board B left outer join image I on B.board_no=I.board_no "
				+ "where B.board_no = ? "
				+ "order by B.board_no;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		List<BoardImageVO> list = new ArrayList<>();
		while(rs.next()) {
			BoardImageVO boardImageVO = new BoardImageVO();
			
			boardImageVO.setImageNo(rs.getInt("imageNo"));
			boardImageVO.setBoardNo(rs.getInt("boardNo"));
			boardImageVO.setBoardUpload(rs.getString("boardUpload"));
			boardImageVO.setBoardSave(rs.getString("boardSave"));
			boardImageVO.setBoardSize(rs.getLong("boardSize"));
			boardImageVO.setBoardType(rs.getString("boardType"));
			
			list.add(boardImageVO);
		}
		conn.close();
		return list;
	}
	//파일 삭제 다오(글 삭제 할 때 폴더안에 있는 사진 삭제)
	public boolean deleteImage(int boardNo) throws Exception {
		//파일의 경로
		//파일의 업로드 이름 찾기
		BoardDao boardDao = new BoardDao();
		BoardImageVO boardImageVO = boardDao.detail(boardNo);
		
		String imagePath = "D:/upload/board/"+boardImageVO.getBoardUpload();
		
		File deleteImage = new File(imagePath);
		
		if(deleteImage.exists()) {
			
			//파일을 삭제합니다.
			deleteImage.delete();
		}
		return true;
	}
	public boolean delete(int imageNo) throws Exception{
		conn=JdbcUtils.connect();
		String sql = "delete image where image_no = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, imageNo);
		int result = ps.executeUpdate();
		
		conn.close();
		return result>0;
	}
}
