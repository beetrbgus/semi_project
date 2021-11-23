package wishFit.beans.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.board.BoardDto;
import wishFit.util.JdbcUtils;

public class MarketDao {
	// 판매 목록 조회
	public List<BoardDto> list() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from board where board_middle_name='판매' order by board_no desc";// 최신순
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<BoardDto> list = new ArrayList<>();
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();

			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setBoardDate(rs.getString("board_date"));

			list.add(boardDto);
		}

		con.close();

		return list;
	}

	// 구매 목록 조회
	public List<BoardDto> list2() throws Exception {
		Connection con = JdbcUtils.connect();


		String sql = "select * from board where board_middle_name='구매' order by board_no desc";// 최신순
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<BoardDto> list2 = new ArrayList<>();
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();

			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setBoardDate(rs.getString("board_date"));

			list2.add(boardDto);
		}

		con.close();

		return list2;
	}

	// 상세보기 기능
	public BoardDto get(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();


		String sql = "select * from board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();

		BoardDto boardDto;
		if (rs.next()) {
			boardDto = new BoardDto();

			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_Post"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));

		} else {
			boardDto = null;
		}

		con.close();

		return boardDto;
	}

	// 글 등록 기능
	public void write(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();


		String sql = "insert into board values(?,'마켓',?,?,?,?,sysdate,0,0,0,0)";
			
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2,boardDto.getBoardMiddleName());
		ps.setString(3, boardDto.getBoardWriter());
		ps.setString(4,boardDto.getBoardTitle());
		ps.setString(5,boardDto.getBoardPost());
		ps.execute();

		con.close();
	}
	//글 삭제 기능
	public boolean delete(int boardNo)throws Exception{
		Connection con = JdbcUtils.connect();

		
		String sql =  "delete board where board_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		con.close();
		return result>0;		
		
	}
	//글 등록할 때에 번호 부여

	public int getSequence() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="select board_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
		
		
	}
	//글 수정 기능
	public boolean edit(BoardDto boardDto)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="update board set board_title=?,board_post=?where board_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardDto.getBoardTitle());
		ps.setString(2, boardDto.getBoardPost());
		ps.setInt(3, boardDto.getBoardNo());
		int result= ps.executeUpdate();
		
		con.close();
		
		return result>0;
		
		}
	
}
