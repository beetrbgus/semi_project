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
	
	//게시글 수정 처리 (기록용)
	public boolean recordEdit(BoardDto boardDto) throws Exception{
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

	// 게시글 수정(마켓+커뮤용)
	public boolean edit(BoardDto boardDto) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "update board " 
					+ "set board_title=?, board_post=? , board_date=? , "
					+ "board_large_name=?,board_middle_name=? " 
					+ "where board_no = ?";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, boardDto.getBoardTitle());
		ps.setString(2, boardDto.getBoardPost());
		ps.setString(3, boardDto.getBoardDate());
		ps.setString(4, boardDto.getBoardLargeName());
		ps.setString(5, boardDto.getBoardMiddleName());
		ps.setInt(6, boardDto.getBoardNo());

		int result = ps.executeUpdate();

		conn.close();
		return result > 0;
	}
	
	//게시글 삭제
	
	public Boolean delete(int boardNo) throws Exception{
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
	// 게시글 조회 (카테고리 o, 칼럼/키워드x)/lagName과 midName 분류
	public List<BoardDto> searchByMid(String lagName, String midName) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select * from board where board_large_name=? and board_middle_name=? order by board_no desc";
		PreparedStatement ps = conn.prepareStatement(sql);
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
		conn.close();
		return list;

	}
	
	// 조회수 증가 기능 + 자기 작성글 제외 조회수 증가 기능
	// 댓글 수 갱신 기능
	// 페이징이 가능한 목록(전체 + 조회 종류별로)
	// 페이징에서 마지막 블록을 구하기위하여 게시글 개수를 구하는 기능(전체/검색조회별로)

	// 조회수 증가 기능
	public boolean readUpSelf(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update board set board_read = board_read + 1 where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 자기 작성글 제외 조회수 증가 기능
	public boolean readUp(int boardNo, String memId) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update board " + "set board_read = board_read + 1 " + "where board_no = ? and board_writer != ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.setString(2, memId);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 댓글 수 갱신 기능
	public boolean replyCount(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update board "
				+ "set board_reply = (select (*) count from reply where board_no = ?) where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.setInt(2, boardNo);

		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 페이징이 가능한 목록(전체 + 조회 종류별로)
	public List<BoardDto> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select * from board order by board_no desc"
				+ ")TMP" + ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);

		ResultSet rs = ps.executeQuery();

		List<BoardDto> list = new ArrayList<>();
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();

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

			list.add(boardDto);
		}
		con.close();

		return list;
	}

	// 페이징에서 마지막 블록을 구하기위하여 게시글 개수를 구하는 기능(전체/검색조회별로)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * count(*) from board";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}

	public int count(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select count(*) from board where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}
	// 마이페이지 - 작성 글 목록 보기
	public List<BoardDto> boardMine(String column, String keyword) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board where #1= ? order by board_no desc";
		sql = sql.replace("#1",	 column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
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
}
