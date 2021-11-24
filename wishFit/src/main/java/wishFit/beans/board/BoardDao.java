package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class BoardDao {
	private Connection conn;
	//C U D ;//저거를 조인으로 쓴다라
	//boardNo에 넣을 시퀀스 미리 뽑아서 넣기
	public int boardSeq() throws Exception{
		conn = JdbcUtils.connect();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		
		
		rs.next();
		//다음 시퀀스 번호를 seq에 저장
		int seq = rs.getInt("nextval");
		
		conn.close();
		
		return seq;
	}
	//게시글 등록 처리 / 기록용
	public void recordWrite(BoardDto boardDto) throws Exception{
				
		conn = JdbcUtils.connect();
		String sql = "insert into board values(?,'기록',?,?,?,?,?,0,0,0,0)";
		//?순서 1)board_no(위에서 가져온 시퀀스를 서블릿에서 부여 후 boardDto 로 넣어서 가져옴(board_seq.nextva 사용x)
		// 2)board_large_name  = > 각자의 jsp에서 boardLargeName 을 히든으로 보내야한다.
		// 3)board_middle_name / 4)board_writer / 5)board_title / 6)board_post / 7)board_date
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
//		ps.setString(2,boardDto.getBoardLargeName());
		ps.setString(2, boardDto.getBoardMiddleName());
		ps.setString(3, boardDto.getBoardWriter());//서블릿에서 setBoardWriter로 세션을 집어넣음
		ps.setString(4, boardDto.getBoardTitle());
		ps.setString(5, boardDto.getBoardPost());
		ps.setString(6, boardDto.getBoardDate());
		
		ps.execute();
			
		conn.close();
	}
	
	//게시글 등록 처리 / 커뮤 + 마켓용
	public void write(BoardDto boardDto) throws Exception{
		
		conn = JdbcUtils.connect();
		String sql = "insert into board values(?,?,?,?,?,?,sysdate,0,0,0,0)";
		//?순서 1)board_no(위에서 가져온 시퀀스를 서블릿에서 부여 후 boardDto 로 넣어서 가져옴(board_seq.nextva 사용x)
		// 2)board_large_name  = > 각자의 jsp에서 boardLargeName 을 히든으로 보내야한다.
		// 3)board_middle_name / 4)board_writer / 5)board_title / 6)board_post / 7)board_date
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2,boardDto.getBoardLargeName());
		ps.setString(3, boardDto.getBoardMiddleName());
		ps.setString(4, boardDto.getBoardWriter());//서블릿에서 setBoardWriter로 세션을 집어넣음
		ps.setString(5, boardDto.getBoardTitle());
		ps.setString(6, boardDto.getBoardPost());
		
		ps.execute();
		
		conn.close();
	}
	
	//게시글 수정 처리
	public Boolean recordEdit(BoardDto boardDto) throws Exception{
		conn = JdbcUtils.connect();
		String sql = "update board set board_middle_Name=? , board_title=? , board_post=? , board_date =to_date(?,'yyyy-mm-dd') where board_no=? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,boardDto.getBoardMiddleName());
		ps.setString(2, boardDto.getBoardTitle());
		ps.setString(3, boardDto.getBoardPost());
		ps.setString(4, boardDto.getBoardDate());
		ps.setInt(5, boardDto.getBoardNo());
		
		int result = ps.executeUpdate();
		
		conn.close();
		return result>0;
		
	}
	
	//게시글 삭제
	
	public Boolean delete(int boardNo)throws Exception{
		conn = JdbcUtils.connect();
		String sql = "delete board where board_no=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		conn.close();
		
		return result>0;
	}
	//디테일
	public BoardImageVO detail(int boardNo) throws Exception{
		conn=JdbcUtils.connect();
		String sql = "select B.*,I.* "
				+ "from board B left outer join image I on B.board_no=I.board_no "
				+ "where B.board_no=? "
				+ "order by B.board_no";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		BoardImageVO boardImageVO;
		if(rs.next()) {
			boardImageVO = new BoardImageVO();
			
			boardImageVO.setBoardNo(rs.getInt("board_no"));
			boardImageVO.setBoardTitle(rs.getString("board_title"));
			boardImageVO.setBoardLargeName(rs.getString("board_large_name"));
			boardImageVO.setBoardMiddleName(rs.getString("board_middle_name"));
			boardImageVO.setBoardPost(rs.getString("board_post"));
			boardImageVO.setBoardDate(rs.getString("board_date"));
			boardImageVO.setBoardWriter(rs.getString("board_writer"));
			boardImageVO.setImageNo(rs.getInt("image_no"));
			boardImageVO.setBoardUpload(rs.getString("board_upload"));
			boardImageVO.setBoardSave(rs.getString("board_save"));
			boardImageVO.setBoardSize(rs.getLong("board_size"));
			boardImageVO.setBoardType(rs.getString("board_type"));
			boardImageVO.setBoardRead(rs.getInt("board_read"));
			boardImageVO.setBoardReply(rs.getInt("board_reply"));
			boardImageVO.setBoardHate(rs.getInt("board_hate"));
			boardImageVO.setBoardLike(rs.getInt("board_like"));
			
		}else {
			boardImageVO=null;
			
		}
		conn.close();
		

		return boardImageVO;
		
	}
	//최신글목록 보기 기능 다오
	public List<BoardDto> list () throws Exception{
		conn=JdbcUtils.connect();
		String sql = "select * from"
				+ "(select rownum rn, TMP.* from"
				+ "(select * from board where board_large_name='마켓'or board_large_name='커뮤니티' order by board_no desc)"
				+ "\"TMP\")where rn between 1 and 5";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardLargeName(rs.getString("board_large_name"));
			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardLike(rs.getInt("board_like"));
			boardDto.setBoardHate(rs.getInt("board_hate"));
			
			list.add(boardDto);
		}
		conn.close();
		return list;
	}
	
	
}
