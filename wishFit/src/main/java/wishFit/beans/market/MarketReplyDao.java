package wishFit.beans.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class MarketReplyDao {
	//게시글의 댓글 목록 조회 기능
	public List<MarketReplyDto>list(int boardNo)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from reply where board_no =? order by reply_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		List<MarketReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			MarketReplyDto marketReplyDto = new MarketReplyDto();
			
		   marketReplyDto.setReplyNo(rs.getInt("reply_no"));
		   marketReplyDto.setReplyId(rs.getString("reply_id"));
		   marketReplyDto.setBoardNo(rs.getInt("board_no"));
		   marketReplyDto.setReplyDate(rs.getDate("reply_date"));
		   marketReplyDto.setReplyPost(rs.getString("reply_post"));
		   
		   list.add(marketReplyDto);
		}
		
		con.close();
		
		return list;
	}
	//댓글 등록 기능
	public void insert(MarketReplyDto marketReplyDto)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="insert into reply values(?,?,?,sysdate,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, marketReplyDto.getReplyNo());
		ps.setString(2,marketReplyDto.getReplyId());
		ps.setInt(3,marketReplyDto.getBoardNo());
		ps.setString(4, marketReplyDto.getReplyPost());
		
		ps.execute();
		
		con.close();
	}
	
	//댓글 등록할 때 번호 부여
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
	//댓글 삭제
	public boolean  delete(int replyNo,int boardNo)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "delete reply where reply_no=? and board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		ps.setInt(2, boardNo);
		
		int result= ps.executeUpdate();
		con.close();
		
		return result>0;
		
		
		
	}
	//댓글 수정
	public boolean edit(MarketReplyDto marketReplyDto)throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "update reply set reply_post = ? where reply_no =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, marketReplyDto.getReplyPost());
		ps.setInt(2, marketReplyDto.getReplyNo());
		
		int result = ps.executeUpdate();
		
		con.close();
		return result>0;
	}

}
