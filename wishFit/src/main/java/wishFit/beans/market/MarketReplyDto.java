package wishFit.beans.market;

import java.sql.Date;

public class MarketReplyDto {
	private int replyNo;
	private String replyId;
	private int boardNo;
	private Date replyDate;
	private String replyPost;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyPost() {
		return replyPost;
	}
	public void setReplyPost(String replyPost) {
		this.replyPost = replyPost;
	}
	public MarketReplyDto() {
		
	}
	
	
	
	
	
	

}
