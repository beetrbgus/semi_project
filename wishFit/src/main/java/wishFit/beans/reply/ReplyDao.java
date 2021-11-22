package wishFit.beans.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class ReplyDao {
	//댓글 조회(게시글 번호 참조)
	public List<ReplyVo> list (int boardNo) throws Exception{
		Connection con =JdbcUtils.connect();
		String sql  ="select * from  (select r.board_no , r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload from reply r  "
				+ "inner join member m on r.reply_id = m.mem_id "
				+ "inner join member_profile mp on m.mem_id= mp.mp_id )"
				+ "where board_no=? order by reply_no desc ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,boardNo);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyVo> list = new ArrayList<>();
		while(rs.next()) {
			ReplyVo replyVo = new ReplyVo();
			replyVo.setReplyNo(rs.getInt("reply_no"));
			replyVo.setMemNick(rs.getString("reply_id"));
			replyVo.setReplyPost(rs.getString("reply_post"));
			replyVo.setReplyDate(rs.getString("reply_Date"));
			
			list.add(replyVo);
		}
		con.close();
		return list;
	}
	//댓글 삭제
	public boolean delete(String uid, int replyNo) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="delete reply where reply_no=? and reply_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		ps.setString(2, uid);
		
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
	public void insert(ReplyDto replyDto) throws Exception{
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
