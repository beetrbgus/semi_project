package wishFit.beans.image;

public class ImageDto {
	private int imageNo,boardNo;
	private long boardSize;
	private String boardUpload,boardSave,boardType;
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public long getBoardSize() {
		return boardSize;
	}
	public void setBoardSize(long boardSize) {
		this.boardSize = boardSize;
	}
	public String getBoardUpload() {
		return boardUpload;
	}
	public void setBoardUpload(String boardUpload) {
		this.boardUpload = boardUpload;
	}
	public String getBoardSave() {
		return boardSave;
	}
	public void setBoardSave(String boardSave) {
		this.boardSave = boardSave;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	
	

}
