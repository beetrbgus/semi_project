package wishFit.like;

public class HateDto {
	String memId;

	String boardNo;

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public HateDto(String memId, String boardNo) {
		super();
		this.memId = memId;
		this.boardNo = boardNo;
	}
}