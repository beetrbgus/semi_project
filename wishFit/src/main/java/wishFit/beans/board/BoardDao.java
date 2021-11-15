package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class BoardDao {

	//세션 생성
	public int getSeq() throws Exception {
		
		Connection con = JdbcUtils.connect2();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		rs.next();
		int seq = rs.getInt("nextval");

		con.close();
		return seq;
	}
	//게시글 작성
	public void write(BoardDto boardDto) throws Exception{
		Connection con = JdbcUtils.connect2();
		String sql = "insert into board values(?,?,?,?,?,?,?,0,0,0,0)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getLagName());
		ps.setString(3, boardDto.getMidName());
		ps.setString(4, boardDto.getBoardWriter());
		ps.setString(5, boardDto.getBoardTitle());
		ps.setString(6, boardDto.getBoardPost());
		ps.setString(7, boardDto.getBoardDate());
		
		ps.execute();
		
		con.close();

	}
	//게시글 단일 조회(상세 페이지) (게시글번호)
	public BoardDto detail(int boardNo) throws Exception{
		Connection con = JdbcUtils.connect2();
		String sql = "select * from board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		BoardDto boardDto;
		
		if (rs.next()) {
			boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setLagName(rs.getString("board_large_name"));
			boardDto.setMidName(rs.getString("board_middle_name"));
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
	//게시글 수정
		public boolean edit(BoardDto boardDto) throws Exception{
			Connection con  =JdbcUtils.connect2();
			String sql = "update board "
					+ "set board_title=?, board_post=? , board_date=? , "
					+ "board_large_name=?,board_middle_name=? "
					+ "where board_no = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,boardDto.getBoardTitle());
			ps.setString(2, boardDto.getBoardPost());
			ps.setString(3,boardDto.getBoardDate());
			ps.setString(4, boardDto.getLagName());
			ps.setString(5, boardDto.getMidName());
			ps.setInt(6,boardDto.getBoardNo());
			
			int result = ps.executeUpdate();
			
			con.close();
			return result>0;
	}
	//게시글 조회(전체 조회)
	public List<BoardDto> list() throws Exception{
		Connection con = JdbcUtils.connect2();
		String sql = "select * from board order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setLagName(rs.getString("board_large_name"));
			boardDto.setMidName(rs.getString("board_middle_name"));
			
			list.add(boardDto);
		}
		con.close();
		return list;
		
		
	}
	//게시글 조회 (카테고리 o, 칼럼/키워드x)
	public List<BoardDto> searchByMid(String lagName,String midName) throws Exception{
		Connection con = JdbcUtils.connect2();
		String sql = "select * from board where board_large_name=? and board_middle_name=? order by board_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,lagName);
		ps.setString(2, midName);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setLagName(rs.getString("board_large_name"));
			boardDto.setMidName(rs.getString("board_middle_name"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			
			list.add(boardDto);
		}
		con.close();
		return list;
		
		
	}
	//게시글 조회 (카테고리 x , 칼럼/키워드 o)
	public List<BoardDto> searchByKey(String column,String keyword) throws Exception{
		Connection con = JdbcUtils.connect2();
		String sql = "select * from board where instr(#1,?)>0 order by board_no desc";
		sql=sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date"));
			boardDto.setLagName(rs.getString("board_large_name"));
			boardDto.setMidName(rs.getString("board_middle_name"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			
			list.add(boardDto);
		}
		con.close();
		return list;
		
		
	}
	//게시글 조회(카테고리 o , 칼럼/키워드o)
		public List<BoardDto> searchDetail(String lagName, String midName, String column,String keyword) throws Exception{
			Connection con = JdbcUtils.connect2();
			String sql = "select * from (select * from board where board_large_name=? and board_middle_name=?) where instr(#1,?)>0 order by board_no desc";
			sql=sql.replace("#1", column);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, lagName);
			ps.setString(2, midName);
			ps.setString(3, keyword);
			ResultSet rs = ps.executeQuery();
			List<BoardDto> list = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardPost(rs.getString("board_post"));
				boardDto.setBoardDate(rs.getString("board_date"));
				boardDto.setLagName(rs.getString("board_large_name"));
				boardDto.setMidName(rs.getString("board_middle_name"));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				boardDto.setBoardRead(rs.getInt("board_read"));
				boardDto.setBoardReply(rs.getInt("board_reply"));
				
				list.add(boardDto);
			}
			con.close();
			return list;
			
			
		}
	//게시글 삭제
		public boolean delete(int boardNo) throws Exception{
			Connection con = JdbcUtils.connect2();
			String sql = "delete board where board_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			int result = ps.executeUpdate();
			con.close();
			return result>0;
		}
	
		//조회수 증가 기능
		public boolean readUpSelf(int boardNo) throws Exception {
			Connection con = JdbcUtils.connect2();
			
			String sql = "update board set board_read = board_read + 1 where board_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
		
		 //자기 작성글 제외 조회수 증가 기능
		public boolean readUp(int boardNo, String memId) throws Exception {
			Connection con = JdbcUtils.connect2();
			
			String sql = "update board "
								+ "set board_read = board_read + 1 "
								+ "where board_no = ? and board_writer != ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			ps.setString(2, memId);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
		
		
		
		
		//댓글 수 갱신 기능 
		public boolean replyCount(int boardNo) throws Exception{
			Connection con = JdbcUtils.connect2();
			
			String sql = "update board "
					+ "set board_reply = (select (*) count from reply where board_no = ?) where board_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			ps.setInt(2, boardNo);
			
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
		
		//페이징이 가능한 목록(전체 + 조회 종류별로)
		public List<BoardDto> listByRownum(int begin, int end) throws Exception{
			Connection con = JdbcUtils.connect2();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
					+ "select * from board order by board_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			
			ResultSet rs = ps.executeQuery();
			
			List<BoardDto> list = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setLagName(rs.getString("board_large_name"));
				boardDto.setMidName(rs.getString("board_middle_name"));
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
		
		//페이징에서 마지막 블록을 구하기위하여 게시글 개수를 구하는 기능(전체/검색조회별로)
		public int count() throws Exception{
			Connection con = JdbcUtils.connect2();
			
			String sql = "select * count(*) from board";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			
			con.close();
			
			return count;
		}
		
		public int count(String column, String keyword) throws Exception {
			Connection con = JdbcUtils.connect2();
			
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
	
	

}