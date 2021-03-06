package wishFit.beans.board;

import java.sql.Date;

public class BoardDto {
	private int boardNo;
	private int boardReply;
	private int boardRead;
	private int boardLike;
	private int boardHate;
	private String boardMiddleName;
	private String boardLargeName;
	private String boardWriter;
	private String boardTitle;
	private String boardPost;
	private String boardDate;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardReply() {
		return boardReply;
	}
	public void setBoardReply(int boardReply) {
		this.boardReply = boardReply;
	}
	public int getBoardRead() {
		return boardRead;
	}
	public void setBoardRead(int boardRead) {
		this.boardRead = boardRead;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public int getBoardHate() {
		return boardHate;
	}
	public void setBoardHate(int boardHate) {
		this.boardHate = boardHate;
	}
	public String getBoardMiddleName() {
		return boardMiddleName;
	}
	public void setBoardMiddleName(String boardMiddleName) {
		this.boardMiddleName = boardMiddleName;
	}
	public String getBoardLargeName() {
		return boardLargeName;
	}
	public void setBoardLargeName(String boardLargeName) {
		this.boardLargeName = boardLargeName;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardPost() {
		return boardPost;
	}
	public void setBoardPost(String boardPost) {
		this.boardPost = boardPost;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public BoardDto() {
		super();
	}

}