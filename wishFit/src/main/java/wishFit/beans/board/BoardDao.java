package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import wishFit.util.JdbcUtils;

public class BoardDao {
	//C U D ;//저거를 조인으로 쓴다라
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
	public Boolean edit(BoardDto boardDto) throws Exception{
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
	
}
