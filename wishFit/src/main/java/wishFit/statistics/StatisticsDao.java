package wishFit.statistics;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;
//총 회원수
public class StatisticsDao {
	public List<MemVO> member() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from member";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemVO> list = new ArrayList<>();
		while(rs.next()) {
			MemVO vo = new MemVO();
			vo.setMember(rs.getString("member"));
			vo.setTotal(rs.getInt("total"));
			list.add(vo);
		}
		
		con.close();
		
		return list;
	}
	//회원 등급별 회원수
	public List<GradeVO> memberByGrade() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select memGrade, count(memId) total from member "
									+ "group by memGrade order by total desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<GradeVO> list = new ArrayList<>();
		while(rs.next()) {
			GradeVO vo = new GradeVO();
			vo.setMemGrade(rs.getString("memberGrade"));
			vo.setTotal(rs.getInt("total"));
			list.add(vo);
		}
		
		con.close();
		
		return list;
	}
	//회원 성별 회원수
	public List<GenderVO> memberByGender() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select memGender, count(memId) total from member "
									+ "group by memGender order by total desc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<GenderVO> list = new ArrayList<>();
		while(rs.next()) {
			GenderVO vo = new GenderVO();
			vo.setMemGender(rs.getString("memberGender"));
			vo.setTotal(rs.getInt("total"));
			list.add(vo);
		}
		
		con.close();
		
		return list;
	}
//연령별 회원수
public List<AgeVO> memberByAge() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql = "select * from member where to_date(sysdate,'yyyy')-"
			+ "extract(year from memBirth) between 40and 59";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<AgeVO> list = new ArrayList<>();
	while(rs.next()) {
		AgeVO vo = new AgeVO();
		vo.setMemBirth(rs.getString("memBirth"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
//소모임 수
public List<FitVO> FitGroupByfgNo() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql =  "select count(*) from fitGroup";
		
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<FitVO> list = new ArrayList<>();
	while(rs.next()) {
		FitVO vo = new FitVO();
		vo.setFitGroup(rs.getString("fitGroup"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
//소모임 카테고리별 모임수
public List<FitNameVO> FitGroupByExcateName() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql =  "select excateName, count(fgNo) total from FitGroup  "
			+ "group by excateName order by total desc";
		
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<FitNameVO> list = new ArrayList<>();
	while(rs.next()) {
		FitNameVO vo = new FitNameVO();
		vo.setExcateName(rs.getString("excateName"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
//커뮤니티 게시물수
public List<BoardCountVO> boardCount() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql =  "select count(*) from boardNo ";
			
		
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<BoardCountVO> list = new ArrayList<>();
	while(rs.next()) {
		BoardCountVO vo = new BoardCountVO();
		vo.setBoardNo(rs.getString("boardNo"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
//커뮤니티 카테고리별 게시글수
public List<BoardNameVO> commuByboard() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql =  "select boardMidleName, count(boardNo) total from board  "
			+ " group by boardMidleName order by total desc;";
		
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<BoardNameVO> list = new ArrayList<>();
	while(rs.next()) {
		BoardNameVO vo = new BoardNameVO();
		vo.setBoardMidleName(rs.getString("boardMidleName"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
//게시판 댓글수
public List<BoardLeplyVO> boardByLeply() throws Exception {
	Connection con = JdbcUtils.connect();
	
	String sql =  " select count(*) from replyNo ";
			
		
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<BoardLeplyVO> list = new ArrayList<>();
	while(rs.next()) {
		BoardLeplyVO vo = new BoardLeplyVO();
		vo.setReplyNo(rs.getString("replyNo"));
		vo.setTotal(rs.getInt("total"));
		list.add(vo);
	}
	
	con.close();
	
	return list;
}
}
