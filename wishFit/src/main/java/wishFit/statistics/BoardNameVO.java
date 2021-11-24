package wishFit.statistics;

public class BoardNameVO {

	private String boardMidleName;
	private int total;
	
	public BoardNameVO() {
		super();
	}
	public String getBoardMidleName() {
		return boardMidleName;
	}
	public void setBoardMidleName(String boardMidleName) {
		this.boardMidleName = boardMidleName;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "GenderVO [boardMidleName=" + "boardMidleName" + ", total=" + total + "]";
	}		
	}