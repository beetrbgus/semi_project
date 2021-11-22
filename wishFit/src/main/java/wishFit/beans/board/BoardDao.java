package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.JdbcUtils;


public class BoardDao {
	//기록파트
	
	// 세션 생성
	public int getSeq() throws Exception {

		Connection con = JdbcUtils.connect();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		rs.next();
		int seq = rs.getInt("nextval");

		con.close();
		return seq;
	}

	// 게시글 작성
	public void write(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into board values(?,?,?,?,?,?,?,0,0,0,0)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardLargeName());
		ps.setString(3, boardDto.getBoardMiddleName());
		ps.setString(4, boardDto.getBoardWriter());
		ps.setString(5, boardDto.getBoardTitle());
		ps.setString(6, boardDto.getBoardPost());
		ps.setString(7, boardDto.getBoardDate());

		ps.execute();

		con.close();

	}

	// 게시글 단일 조회(상세 페이지) (게시글번호)
	public BoardDto detail(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		BoardDto boardDto;

		if (rs.next()) {
			boardDto = new BoardDto();

			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardLargeName(rs.getString("board_large_name"));
			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardLike(rs.getInt("board_like"));
			boardDto.setBoardHate(rs.getInt("board_hate"));

		} else {
			boardDto = null;
		}

		con.close();
		return boardDto;

	}

	// 게시글 수정
	public boolean edit(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "update board " + "set board_title=?, board_post=? , board_date=? , "
				+ "board_large_name=?,board_middle_name=? " + "where board_no = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardDto.getBoardTitle());
		ps.setString(2, boardDto.getBoardPost());
		ps.setString(3, boardDto.getBoardDate());
		ps.setString(4, boardDto.getBoardLargeName());
		ps.setString(5, boardDto.getBoardMiddleName());
		ps.setInt(6, boardDto.getBoardNo());

		int result = ps.executeUpdate();

		con.close();
		return result > 0;
	}

	// 게시글 조회(전체 조회)/large_name만 분류
	public List<BoardDto> listByRecord() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from board where board_large_name='기록' order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
//			boardDto.setBoardLargeName(rs.getString("board_large_name"));
			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));

			list.add(boardDto);
		}
		con.close();
		return list;

	}

	// 게시글 조회 (카테고리 o, 칼럼/키워드x)/lagName과 midName 분류
	public List<BoardDto> searchByMid(String lagName, String midName) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from board where board_large_name=? and board_middle_name=? order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, lagName);
		ps.setString(2, midName);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardLargeName(rs.getString("board_large_name"));
			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));

			list.add(boardDto);
		}
		con.close();
		return list;

	}

	// 게시글 삭제
	public boolean delete(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete board where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		con.close();
		return result > 0;
	}

	
	//여기까지 기록
}
