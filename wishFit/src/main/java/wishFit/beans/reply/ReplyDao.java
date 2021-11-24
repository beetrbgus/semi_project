package wishFit.beans.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class ReplyDao {
	//댓글 조회(게시글 번호 참조)
	public List<ReplyDto> list (int boardNo) throws Exception{
		Connection con =JdbcUtils.connect();
		String sql  ="select * from reply where board_no=? order by reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,boardNo);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setBoardNo(rs.getInt("board_no"));
			replyDto.setReplyId(rs.getString("reply_id"));
			replyDto.setReplyPost(rs.getString("reply_post"));
			replyDto.setReplyDate(rs.getString("reply_Date"));
			
			
			list.add(replyDto);
		}
		con.close();
		return list;
	}
	//댓글 삭제
	public boolean delete(int replyNo) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "delete reply where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		
		int result = ps.executeUpdate();
		
		con.close();
		return result>0;
	}
	//댓글 수정
	public boolean edit(ReplyDto replyDto) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "update set reply_post=? where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyPost());
		ps.setInt(2, replyDto.getReplyNo());
		
		int result = ps.executeUpdate();
		con.close();
		return result>0;
		
	}
	//댓글 작성
	public void replyWrite(ReplyDto replyDto) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "insert into reply values(reply_seq.nextval,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyId());
		ps.setInt(2, replyDto.getBoardNo());
		ps.setString(3, replyDto.getReplyDate());
		ps.setString(4, replyDto.getReplyPost());
		
		ps.execute();
		con.close();
	}
	
	// 마이페이지 - 작성 댓글 목록
	public List<ReplyDto> replyMine(String column, String keyword)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from reply where #1 = ? order by reply_date desc";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			
			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setBoardNo(rs.getInt("board_no"));
			replyDto.setReplyId(rs.getString("reply_id"));
			replyDto.setReplyPost(rs.getString("reply_post"));
			replyDto.setReplyDate(rs.getString("reply_Date"));
			
			list.add(replyDto);
		}
		con.close();
		
		return list;
	}
}
