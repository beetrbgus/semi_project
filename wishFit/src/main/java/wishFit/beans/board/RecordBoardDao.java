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
	//기록파트
	
	// 세션 생성
	public int getSeq() throws Exception {

		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		rs.next();
		int seq = rs.getInt("nextval");

		con.close();
		return seq;
	}

	// 기록 게시글 작성
	public void write(BoardDto boardDto) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "insert into board values(?,'기록',?,?,?,?,?,0,0,0,0)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardMiddleName());
		ps.setString(3, boardDto.getBoardWriter());
		ps.setString(4, boardDto.getBoardTitle());
		ps.setString(5, boardDto.getBoardPost());
		ps.setString(6, boardDto.getBoardDate());

		ps.execute();

		con.close();

	}

	// 게시글 단일 조회(상세 페이지) (게시글번호)
	public BoardDto detail(int boardNo,String boardWriter) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
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
		Connection con = wishFit.util.JdbcUtils.connect();
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

	// 게시글 조회 (카테고리 o, 칼럼/키워드x)/lagName과 midName 분류
	public List<BoardDto> searchByMid(String lagName, String midName) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "select * from board where board_large_name='기록' and board_middle_name=? order by board_no desc";
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
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "delete board where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		con.close();
		return result > 0;
	}
	// 기록 게시글 조회(전체 조회)/기록용냅두기
	public List<BoardDto> listByRecord(String startDay,String endDay,int lastDay) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "select * from board where board_large_name='기록' and board_date=to_date(?,'YYYY-MM-DD') order by board_date asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, startDay);// ? 안에 map의 key부분이 들어가야한다.
											//예시 : 2021-11-01 / 2021-11-02 ... or 20211101 / 20211102 /. ....
		
		ResultSet rs = ps.executeQuery();
		
		
		List<BoardDto> list = new ArrayList<>();
		
			
		while (rs.next()) {
			
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
	
	//월별 조회 = 하루치 목록 조회 * 날짜수
	public Map<String, List<BoardDto>> monthlyList(int year, int month) throws Exception {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		c.add(Calendar.MONTH, month-1);
		int max = c.getActualMaximum(Calendar.DATE);
		
		Map<String, List<BoardDto>> map = new HashMap<>();
		for(int date = 1; date <= max; date++) {
			String time = "";
			String monthSt = "";
			if(month<10) {//월이 10 미만이라면
				monthSt = "0"+month;
			}else {
				monthSt = Integer.toString(month);
			}
			if(date < 10) {//날짜가 10 미만이라면 0 붙이기
					time = year + "-" + monthSt + "-" + "0"+date;
			}else {
					time = year + "-" + monthSt + "-" +date;
			}
			//내일날짜 구하기
			Date timeToDate = sdf.parse(time);
			c.setTime(timeToDate);
			c.add(Calendar.DATE, 1);
			String resultDate = sdf.format(c.getTime());
			String nextYear = resultDate.substring(0,5);
			String nextMonth = resultDate.substring(5,7);
			String nextDay = resultDate.substring(7,10);
			String nextTime = nextYear+nextMonth+nextDay;
			
			List<BoardDto> list = dailyList(time,nextTime);
			map.put(time, list);
		}
		return map;
	}
	
	//하루치 목록 조회 메소드
	public List<BoardDto> dailyList(String time,String nextTime) throws Exception {
		Connection con = wishFit.util.JdbcUtils.connect();
		String sql = "select * from board "
				+ "where board_large_name='기록' and board_writer=? and board_date >= to_date(?, 'yyyy-mm-dd') and board_date < to_date(?, 'yyyy-mm-dd') "
				+ "order by board_middle_name asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, time);
		ps.setString(2, nextTime);
		
		
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
		public Map<String, List<BoardDto>> monthlyListMiddle(int year, int month,String middleName) throws Exception {
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			c.add(Calendar.MONTH, month-1);
			int max = c.getActualMaximum(Calendar.DATE);
			
			Map<String, List<BoardDto>> map = new HashMap<>();
			for(int date = 1; date <= max; date++) {
				String time = "";
				
				if(date < 10) {
					if(month<10) {
						time = year + "-0" + month + "-" + "0"+date;
					}else {
						time = year + "-" + month + "-" + "0"+date;
					}
				}else {
					if(month<10) {
						time = year + "-0" + month + "-" +date;
					}else {
						time = year + "-" + month + "-" +date;
					}
				}
				//내일날짜 구하기
				Date timeToDate = sdf.parse(time);
				c.setTime(timeToDate);
				c.add(Calendar.DATE, 1);
				String resultDate = sdf.format(c.getTime());
				String nextYear = resultDate.substring(0,5);
				String nextMonth = resultDate.substring(5,7);
				String nextDay = resultDate.substring(7,10);
				String nextTime = nextYear+nextMonth+nextDay;
					
				List<BoardDto> list = dailyList(time,nextTime,middleName);
				map.put(time, list);
			}
			return map;
		}
	//하루치 목록 조회 메소드 (middleName 존재시)
		public List<BoardDto> dailyList(String time,String nextTime,String middleName) throws Exception {
			Connection con = wishFit.util.JdbcUtils.connect();
			String sql = "select * from board "
					+ "where board_large_name='기록' "
					+ "and board_date >= to_date(?, 'yyyy-mm-dd') and board_date < to_date(?, 'yyyy-mm-dd') "
					+ "and board_middle_name=? "
					+ "order by board_middle_name asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, nextTime);
			ps.setString(3, middleName);
		
			
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
		//월별 조회 = 하루치 목록 조회 * 날짜수(11-22 변경중)
		public Map<String, List<BoardDto>> monthlyList(String year, String month) throws Exception {
			Calendar c = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			c.add(Calendar.MONTH, month-1);
			int max = c.getActualMaximum(Calendar.DATE);
			
			Map<String, List<BoardDto>> map = new HashMap<>();
			for(int date = 1; date <= max; date++) {
				String time = "";
				String monthSt = "";
				if(month<10) {//월이 10 미만이라면
					monthSt = "0"+month;
				}else {
					monthSt = Integer.toString(month);
				}
				if(date < 10) {//날짜가 10 미만이라면 0 붙이기
						time = year + "-" + monthSt + "-" + "0"+date;
				}else {
						time = year + "-" + monthSt + "-" +date;
				}
				//내일날짜 구하기
				Date timeToDate = sdf.parse(time);
				c.setTime(timeToDate);
				c.add(Calendar.DATE, 1);
				String resultDate = sdf.format(c.getTime());
				String nextYear = resultDate.substring(0,5);
				String nextMonth = resultDate.substring(5,7);
				String nextDay = resultDate.substring(7,10);
				String nextTime = nextYear+nextMonth+nextDay;
				
				List<BoardDto> list = dailyList(time,nextTime);
				map.put(time, list);
			}
			return map;
		}
		
		//하루치 목록 조회 메소드
		public List<BoardDto> dailyList(String time,String nextTime) throws Exception {
			Connection con = wishFit.util.JdbcUtils.connect();
			String sql = "select * from board "
					+ "where board_large_name='기록' and board_writer=? and board_date >= to_date(?, 'yyyy-mm-dd') and board_date < to_date(?, 'yyyy-mm-dd') "
					+ "order by board_middle_name asc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, time);
			ps.setString(2, nextTime);
			
			
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
