package wishFit.beans.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class MemoDao {
	
	// 동시 작성시 중복번호 방지
	public int seq() throws Exception{
	Connection con = JdbcUtils.connect();
	
		String sql = "select adminmemo_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt("nextval");
		
		con.close();
	
		return seq;
	}
	
	// 메모 작성
	public void write(MemoDto memoDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into admin_memo values (?, ?, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, memoDto.getMemoNo());
		ps.setString(2, memoDto.getMemId());
		ps.setString(3, memoDto.getMemoContent());
	}
	
	// 메모 삭제
	public boolean delete(int memoNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "delete admin_memo where memo_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, memoNo);
		
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	// 메모 리스트
	public List<MemoDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from admin_memo order by memo_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemoDto> list = new ArrayList<>(); // 비어있는 List 생성
		
		while(rs.next()) {  // 데이터 개수만큼 반복
			MemoDto memoDto = new MemoDto();
			memoDto.setMemoNo(rs.getInt("memo_no")); 
			memoDto.setMemId(rs.getString("mem_id"));
			memoDto.setMemoContent(rs.getString("memo_content"));
			memoDto.setMemoTime(rs.getString("memo_time"));
			
			list.add(memoDto);
		}
			con.close();
			
			return list;
	}
	
	public List<MemoDto> search(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from admin_memo where instr(#1, ?) > 0 order by memo_no desc";
		sql = sql.replace("#1", column);//정적 바인딩
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<MemoDto> list = new ArrayList<>();
		while(rs.next()) {
			MemoDto memoDto = new MemoDto();
			
			
			list.add(memoDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 페이징 리스트
	public List<MemoDto> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from admin_memo order by memo_no desc"
								+ ")TMP"
						+ ") where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<MemoDto> list = new ArrayList<>();
		
		while(rs.next()) { 
			MemoDto memoDto = new MemoDto();
			memoDto.setMemoNo(rs.getInt("memo_no")); 
			memoDto.setMemId(rs.getString("mem_id"));
			memoDto.setMemoContent(rs.getString("memo_content"));
			memoDto.setMemoTime(rs.getString("memo_time"));
			
			list.add(memoDto);
		}
			con.close();
			
			return list;
	}
	
	//페이징 검색
		public List<MemoDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select * from admin_memo where instr(#1, ?) > 0 order by memo_no desc"
									+ ")TMP"
							+ ") where rn between ? and ?";
			sql = sql.replace("#1", column);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			List<MemoDto> list = new ArrayList<>();
			while(rs.next()) {
				MemoDto memoDto = new MemoDto();
				
				memoDto.setMemoNo(rs.getInt("memo_no"));
				memoDto.setMemId(rs.getString("mem_id"));
				memoDto.setMemoContent(rs.getString("memo_content"));
				memoDto.setMemoTime(rs.getString("memo_time"));
				
				list.add(memoDto);
			}
			
			con.close();
			
			return list;
		}
	
	
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from admin_memo";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int count(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from admin_memo where instr(#1, ?) > 0";
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
