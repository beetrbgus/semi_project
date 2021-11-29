package wishFit.beans.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import wishFit.util.CommonSql;

public class RecordBoardDao {
	//기록조회파트
	private Connection conn;
	private CommonSql getSeq;
	
	//월별 조회 = 하루치 목록 조회 * 날짜수
	public Map<String, List<BoardDto>> monthlyList(int year, int month,String boardWriter) throws Exception {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, month+1);
		int max = c.getActualMaximum(Calendar.DATE);
		
		Map<String, List<BoardDto>> map = new HashMap<>();
		for(int date = 1; date <= max; date++) {
			String time = "";
			String monthSt = "";
			if(month<10) {//월이 10 미만이라면
				monthSt = "0"+Integer.toString(month);
			}else {
				monthSt = Integer.toString(month);
			}
			if(date < 10) {//날짜가 10 미만이라면 0 붙이기
					time = year + "-" + monthSt + "-" + "0"+date;
			}else {
					time = year + "-" + monthSt + "-" +date;
			}
			
			
			List<BoardDto> list = dailyList(time,boardWriter);
			map.put(time, list);
		}
		return map;
	}
	
	//하루치 목록 조회 메소드
	public List<BoardDto> dailyList(String time,String boardWriter) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "select * from board "
				+ "where board_large_name='기록' and board_date = to_date(?, 'yyyy-mm-dd')  "
				+ "and board_writer=? "
				+ "order by board_middle_name asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, time);
		ps.setString(2, boardWriter);
		
		
		ResultSet rs = ps.executeQuery();
		List<BoardDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardPost(rs.getString("board_post"));
			boardDto.setBoardDate(rs.getString("board_date").substring(0,10));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			boardDto.setBoardRead(rs.getInt("board_read"));
			boardDto.setBoardReply(rs.getInt("board_reply"));
			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
			
			list.add(boardDto);
			
		}
		
		con.close();
		return list;
	}
	//월별 조회2(중분류=> board_middle_name 파라미터존재시) = 하루치 목록 조회 * 날짜수
		public Map<String, List<BoardDto>> monthlyListMiddle(int year, int month,String middleName,String boardWriter) throws Exception {
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			c.add(Calendar.MONTH, month+1);
			int max = c.getActualMaximum(Calendar.DATE);
			
			Map<String, List<BoardDto>> map = new HashMap<>();
			for(int date = 1; date <= max; date++) {
					String time = "";
					String monthSt = "";
					if(month<10) {//월이 10 미만이라면
						monthSt = "0"+Integer.toString(month);
					}else {
						monthSt = Integer.toString(month);
					}
					if(date < 10) {//날짜가 10 미만이라면 0 붙이기
							time = year + "-" + monthSt + "-" + "0"+date;
					}else {
							time = year + "-" + monthSt + "-" +date;
					
					}
					
				List<BoardDto> list = dailyList(time,middleName,boardWriter);
				map.put(time, list);
			}
			return map;
		}
	//하루치 목록 조회 메소드 (middleName 존재시)
		public List<BoardDto> dailyList(String time,String middleName,String boardWriter) throws Exception {
			Connection con = wishFit.util.JdbcUtils.connect();
			String sql = "select * from board "
					+ "where board_large_name='기록' "
					+ "and board_date = to_date(?, 'yyyy-mm-dd') "
					+ "and board_middle_name=? "
					+ "and board_writer = ? "
					+ "order by board_middle_name asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, middleName);
			ps.setString(3, boardWriter);
		
			
			ResultSet rs = ps.executeQuery();
			List<BoardDto> list = new ArrayList<>();
			
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardPost(rs.getString("board_post"));
				boardDto.setBoardDate(rs.getString("board_date").substring(0,10));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				boardDto.setBoardRead(rs.getInt("board_read"));
				boardDto.setBoardReply(rs.getInt("board_reply"));
				boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
				
				list.add(boardDto);
				
			}
			
			con.close();
			return list;
		}
		
		
		
		
}
