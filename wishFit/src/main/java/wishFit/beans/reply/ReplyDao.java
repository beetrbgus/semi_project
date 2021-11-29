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
			String sql  ="select * from  (select r.board_no , r.reply_no , m.mem_nick, r.reply_date , r.reply_post , mp.mp_upload,mp.mp_no,r.reply_id from reply r "
					+"left outer join member m on r.reply_id = m.mem_id "
					+"left outer join member_profile mp on m.mem_id= mp.mp_id ) "
					+"where board_no=? order by reply_no desc ";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,boardNo);
			ResultSet rs = ps.executeQuery();
			
			List<ReplyVo> list = new ArrayList<>();
			while(rs.next()) {
				ReplyVo replyVo = new ReplyVo();
				replyVo.setReplyNo(rs.getInt("reply_no"));
				replyVo.setMemNick(rs.getString("mem_nick"));
				replyVo.setReplyPost(rs.getString("reply_post"));
				replyVo.setReplyDate(rs.getString("reply_Date"));
				replyVo.setReplyId(rs.getString("reply_id"));
				replyVo.setMpUpload(rs.getString("mp_upload"));
				replyVo.setMpNo(rs.getInt("mp_no"));
				
				
				
				list.add(replyVo);
			}
			con.close();
			return list;
		}
	//댓글 삭제

		public boolean delete(int replyNo) throws Exception{
			Connection con = JdbcUtils.connect();
			String sql="delete reply where reply_no=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, replyNo);
			
			
			int result = ps.executeUpdate();
			
			con.close();
			return result>0;
		}
	//댓글 수정
		public boolean edit(ReplyDto replyDto) throws Exception{
			Connection con = JdbcUtils.connect();

			String sql = "update reply set reply_post=? where reply_no=?";

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
			String sql = "insert into reply values(reply_seq.nextval,?,?,sysdate,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, replyDto.getReplyId());
			ps.setInt(2, replyDto.getBoardNo());
			ps.setString(3, replyDto.getReplyPost());
			
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
	//전체 댓글 조회(메인페이지)
		public List<ReplyDto> mainList () throws Exception{
			Connection con =JdbcUtils.connect();
			String sql = "select * from(select rownum rn, TMP.* from "
					+ "(select * from Reply order  by reply_no desc)TMP)where rn between 1 and 5";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			List<ReplyDto> list = new ArrayList<>();
			while(rs.next()) {
				ReplyDto replyDto = new ReplyDto();
				replyDto.setReplyNo(rs.getInt("reply_no"));
				replyDto.setReplyId(rs.getString("reply_id"));
				replyDto.setBoardNo(rs.getInt("board_no"));
				replyDto.setReplyDate(rs.getString("reply_date"));
				replyDto.setReplyPost(rs.getString("reply_post"));
				
				list.add(replyDto);
			}
			con.close();
			return list;
		}
		
	
	
}
