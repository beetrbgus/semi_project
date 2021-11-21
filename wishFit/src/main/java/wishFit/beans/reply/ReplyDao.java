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
		String sql  ="select r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload from reply"
				+ "inner join member m on r.reply_id = m.mem_id"
				+ "inner join member_profile mp on m.mem_id= mp.mp_id"
				+ "select * from reply where board_no=? order by reply_no asc";
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
		String sql = "select r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload from reply"
				+ "inner join member m on r.reply_id = m.mem_id"
				+ "inner join member_profile mp on m.mem_id= mp.mp_id;"
				+ "delete reply where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		
		int result = ps.executeUpdate();
		
		con.close();
		return result>0;
	}
	//댓글 수정
	public boolean edit(ReplyDto replyDto) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload from reply"
				+ "inner join member m on r.reply_id = m.mem_id"
				+ "inner join member_profile mp on m.mem_id= mp.mp_id;"
				+ "update set reply_post=? where reply_no=?";
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
		String sql = "select r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload from reply"
				+ "inner join member m on r.reply_id = m.mem_id"
				+ "inner join member_profile mp on m.mem_id= mp.mp_id"
				+ "insert into reply values(reply_seq.nextval,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyId());
		ps.setInt(2, replyDto.getBoardNo());
		ps.setString(3, replyDto.getReplyDate());
		ps.setString(4, replyDto.getReplyPost());
		
		ps.execute();
		con.close();
	}
	
	//댓글 등록할때 번호 부여
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select reply_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
	
	
	
	
	

	
	
	

}
