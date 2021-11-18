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

import wishFit.beans.JdbcUtils;

public class BoardDao {
	//기록파트
	
	// 세션 생성
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

	// 게시글 작성
	public void write(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect2();
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
		Connection con = JdbcUtils.connect2();
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
		Connection con = JdbcUtils.connect2();
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

	// 기록 게시글 조회(전체 조회)
//	public List<BoardDto> listByRecord() throws Exception {
//		Connection con = JdbcUtils.connect2();
//		String sql = "select * from board where board_large_name='기록' order by board_no desc";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//		
//		
//		List<BoardDto> list = new ArrayList<>();
//		while (rs.next()) {
//			BoardDto boardDto = new BoardDto();
//			boardDto.setBoardNo(rs.getInt("board_no"));
//			boardDto.setBoardTitle(rs.getString("board_title"));
//			boardDto.setBoardPost(rs.getString("board_post"));
//			boardDto.setBoardDate(rs.getString("board_date"));
//			boardDto.setBoardWriter(rs.getString("board_writer"));
//			boardDto.setBoardRead(rs.getInt("board_read"));
//			boardDto.setBoardReply(rs.getInt("board_reply"));
//			boardDto.setBoardMiddleName(rs.getString("board_middle_name"));
//
//			list.add(boardDto);
//		}
//		con.close();
//		return list;
//
//	}

	// 게시글 조회 (카테고리 o, 칼럼/키워드x)/lagName과 midName 분류
	public List<BoardDto> searchByMid(String lagName, String midName) throws Exception {
		Connection con = JdbcUtils.connect2();
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
		Connection con = JdbcUtils.connect2();
		String sql = "delete board where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		con.close();
		return result > 0;
	}
	// 기록 게시글 조회(전체 조회)/기록용냅두기
	public List<BoardDto> listByRecord(String startDay,String endDay,int lastDay) throws Exception {
		Connection con = JdbcUtils.connect2();
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
	/*
	 * 1. 홈페이지를 열 때. 현재 월의 첫 번째 날짜 / 마지막 날짜를 계산하여 페이지에 전체목록(middleName구분없이) 날짜 순으로 표시.
	 * 2. 그러려면 날짜 순으로 데이터를 저장한  List가 있는지 부터 파악 돼야 한다.
	 * 3. Map의 key 부분을 구하여 첫날 부터 마지막 날 까지 구하고.
	 * 		- Key가 그럼 형식은 아마 'yyyymmdd'or 'yyyy-mm-dd'가 되어야 한다. 그런데 for문을 하려면 Integer로 변환을 해야하지 않은가 싶다.
	 * 4. key(날짜형식)의 날짜로 sql조회를 하여 날짜에 맞는 List가 있다면 map.put 을 진행한다.
	 * 		- 
	 * 5. 이렇게 key를 첫날 부터 마지막 날까지 for문을 사용하여 map.put 을 하고.
	 * 6. 마지막날까지 다 완료 하였다면 jsp에서 표시를 한다.
	 * 7. 표시의 방법은 map.get(i)로 하여 첫 날 부터 마지막날까지 for문을 사용하여 모든 key의 value값을 list로 뽑아낸다.
	 * 
	 * */
	

	
	//월별 조회 = 하루치 목록 조회 * 날짜수
	public Map<String, List<BoardDto>> monthlyList(int year, int month) throws Exception {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int max = c.getActualMaximum(Calendar.DATE);
		
		Map<String, List<BoardDto>> map = new HashMap<>();
		for(int date = 1; date <= max; date++) {
//			String time = year + "-" + month + "-" + date;//ex ) time ="2021-11-1"/...
			String time = "";
			
			if(date < 10) {
				time = year + "-" + month + "-" + "0"+date;
			}else {
				time = year + "-" + month + "-" + date;
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
		Connection con = JdbcUtils.connect2();
//		String sql = "select * from board where board_large_name='기록' and board_date = to_date(?, 'yyyy-mm-dd')";
		String sql = "select * from board where board_large_name='기록' and board_date >= to_date(?, 'yyyy-mm-dd') and board_date < to_date(?, 'yyyy-mm-dd')";
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
	
	
	
	//여기까지 기록
}
