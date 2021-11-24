package wishFit.statistics;

public class BoardCountVO {
	private String boardNo;
	private int total;
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public BoardCountVO() {
		super();
	}
	@Override
	public String toString() {
		return "GradeVO [boardNo=" + boardNo + ", total=" + total + "]";
	}

}
