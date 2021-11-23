package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class BoardDao {
	   private Connection conn;
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
	      ps.setString(2,boardDto.getBoardLargeName());
	      ps.setString(3, boardDto.getBoardMiddleName());
	      ps.setString(4, boardDto.getBoardWriter());//서블릿에서 setBoardWriter로 세션을 집어넣음
	      ps.setString(5, boardDto.getBoardTitle());
	      ps.setString(6, boardDto.getBoardPost());
	      ps.setString(7, boardDto.getBoardDate());
	      
	      ps.execute();
	      
	      conn.close();
	   }
	   //게시글 등록 처리 / 커뮤 + 마켓용
	   public void  write(BoardDto boardDto) throws Exception{
	      
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
	 //게시글 수정 처리(커뮤,마켓)
	   public Boolean edit(BoardDto boardDto) throws Exception{
	      conn = JdbcUtils.connect();
	      String sql = "update board set board_middle_Name=? , board_title=? , board_post=?  where board_no=? ";
	      PreparedStatement ps = conn.prepareStatement(sql);
	      
	      ps.setString(1,boardDto.getBoardMiddleName());
	      ps.setString(2, boardDto.getBoardTitle());
	      ps.setString(3, boardDto.getBoardPost());
	      ps.setInt(4, boardDto.getBoardNo());
	      
	      int result = ps.executeUpdate();
	      
	      conn.close();
	      return result>0;
	      
	   }
	   
	   //게시글 수정 처리(기록용)
	   public Boolean recordEdit(BoardDto boardDto) throws Exception{
	      conn = JdbcUtils.connect();
	      String sql = "update board set board_middle_Name=? , board_title=? , board_post=? , board_date = ? where board_no=? ";
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
	// 목록 조회
		public List<BoardDto> list(String boardLargeName, String boardMiddleName) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from board where board_large_name=?and board_middle_name=? order by board_no desc";// 최신순
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ps.setString(1, boardLargeName);
			ps.setString(2, boardMiddleName);

			List<BoardDto> list = new ArrayList<>();
			while (rs.next()) {
				BoardDto boardDto = new BoardDto();

				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setBoardLargeName(rs.getString("board_large_name"));
				boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardPost(rs.getString("board_post"));
				boardDto.setBoardRead(rs.getInt("board_read"));
				boardDto.setBoardReply(rs.getInt("board_reply"));
				boardDto.setBoardDate(rs.getString("board_date"));
				boardDto.setBoardLike(rs.getInt("board_like"));
				boardDto.setBoardHate(rs.getInt("board_hate"));

				list.add(boardDto);
			}

			con.close();

			return list;
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
				boardDto.setBoardLargeName(rs.getString("board_large_name"));
				boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				boardDto.setBoardDate(rs.getString("board_date"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardPost(rs.getString("board_Post"));
				boardDto.setBoardRead(rs.getInt("board_read"));
				boardDto.setBoardReply(rs.getInt("board_reply"));
				boardDto.setBoardLike(rs.getInt("board_like"));
				boardDto.setBoardHate(rs.getInt("board_hate"));
				

			} else {
				boardDto = null;
			}

			con.close();

			return boardDto;
		}

}
