package wishFit.beans.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardImageVO;




public class PaginationThumbnail {
	
	
	private int p;   // 페이지 파라미터	
	private int count;   // 글 리스트의 총 개수
	
	// 검색 요소
	private String column;
	private String keyword;
	private String boardLargeName;
	private String boardMiddleName;
	
	public PaginationThumbnail(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p")); // p는 파라미터로 받아 설정
			if(this.p <= 0) throw new Exception();  // 단, 파라미터 값이 0이거나, 음수 등 이상한 값일 경우 예외처리해서
		}
		catch (Exception e) {
			this.p = 1; 		 //  1페이지로 보내버림.
		}
		this.column = req.getParameter("column");
		this.keyword = req.getParameter("keyword");
		this.boardLargeName = req.getParameter("boardLargeName");
		this.boardMiddleName = req.getParameter("boardMiddleName");
	}
	
	private int pageSize = 10;  
	private int blockSize = 10; 
	private int begin, end; 
	private int startBlock, finishBlock, lastBlock;

	private List<BoardImageVO> list;
	
	
	
	public void calculate() throws Exception{
		
		BoardDao boardDao = new BoardDao();
		
		if(isSearch()) { // 완전검색이라면
			this.count = boardDao.count(boardLargeName, boardMiddleName, column, keyword);
		}
		else if(likeList()) {
			this.count = boardDao.likeCount(boardLargeName, boardMiddleName);
		}
		else if(isMiddle()) { // 중분류
			this.count = boardDao.middleCount(boardLargeName, boardMiddleName);
		}
		else if(largeSearch()) { // 대분류에서 검색한거면
			this.count = boardDao.largeSearchCount(boardLargeName, column, keyword);
		}
		else if(isLarge()) { // 대분류만
			this.count = boardDao.largeCount(boardLargeName);
		}
		else if(totalSearch()){ // 전체글에서의 검색이면
			this.count = boardDao.count(column, keyword);
		}
		else { // 전체글
			this.count = boardDao.count();
		}
		
		
		
		// 로우넘
		this.end = this.p * this.pageSize;
		this.begin = this.end - (this.pageSize - 1);
		
		// 블록
		this.lastBlock = (this.count - 1) / this.pageSize + 1;
		this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
		this.finishBlock = this.startBlock + (this.blockSize - 1);
			
		
		if(this.isSearch()) { // 완전검색시
			this.list = boardDao.searchList(boardLargeName, boardMiddleName, column, keyword, begin, end);			
		}
		else if(this.likeList()) { // 추천순

			this.list = boardDao.likeList(boardLargeName, begin, end);
		}
		else if(this.isMiddle()) { // 중분류
			this.list = boardDao.middleList(boardLargeName, boardMiddleName, begin, end);
		}
		else if(this.largeSearch()) { // 대분류+검색
			this.list = boardDao.largeSearchList(boardLargeName, column, keyword, begin, end);
		}
		else if(this.isLarge()){ // 대분류만
			this.list = boardDao.largeList(boardLargeName, begin, end);
		}
		else if(totalSearch()) {
			this.list = boardDao.totalSearchList(column, keyword, begin, end);
		}
		else {
			this.list = boardDao.listByRownum(begin, end);
		}
		
		
	}
	
	
	public int getPage() {
		return p;
	}
	
	public int getCount() {
		return count;
	}
	
	public String getColumn() {
		return column;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public int getBlockSize() {
		return blockSize;
	}
	
	public int getBegin() {
		return begin;
	}
	
	public int getEnd() {
		return end;
	}
	
	public int getStartBlock() {
		return startBlock;
	}
	
	public int getFinishBlock() {
		return finishBlock;
	}
	
	public int getLastBlock() {
		return lastBlock;
	}
	
	public boolean isPrev() {   // 이전 페이지가 있는지 판정
		return this.p > 1;
	}
	
	public boolean isPreAvailable() { // 이전 블록이 있는지 판정
		return this.startBlock > 1;
	}
	
	public boolean isNext() {  // 다음페이지가 있는지 판정
		return this.count > end;
	}
	
	public boolean isNextAvailable() {  // 다음 블록이 있는지 판정
		return this.finishBlock < this.lastBlock;
	}
	
	// 전체글에서 검색
	public boolean totalSearch() {
		return this.column != null && !this.column.equals("") && this.keyword != null && !this.keyword.equals("");
	}
	
	// 중분류까지 설정하고 검색한 경우
	public boolean isSearch() {
		return this.boardLargeName !=null && this.boardMiddleName != null && this.column != null && !this.column.equals("") && this.keyword != null && !this.keyword.equals("");
	}
	
	// 중분류가 골라진 경우
	public boolean isMiddle() {
		return this.boardMiddleName != null;
	}
	// 대분류만
	public boolean isLarge() {
		return this.boardLargeName != null;
	}
	// 대분류 검색
	public boolean largeSearch() {
		return this.boardLargeName != null && this.column != null && !this.column.equals("") && this.keyword != null && !this.keyword.equals("");
	}
	// 추천글 판정?
	public boolean likeList() {
		return this.boardLargeName != null && this.boardMiddleName != null && this.boardMiddleName.equals("추천글");
	}
	
	public int getRealLastBlock() {
		return Math.min(this.finishBlock, this.lastBlock);
	}
	
	public int getPreBlock() {
		return this.startBlock - 1;
	}
	
	
	public int getNextBlock() {
		return this.finishBlock + 1;
	}
	
	public int getBack() {
		return this.p - 1;
	}
	
	public int getFoward() {
		return this.p + 1;
	}
	

	public boolean columnIs(String column) {
		return this.column != null && this.column.equals(column);
	}
	
	public String getKeywordString() {
		if(this.keyword == null) 
			return "";
		else
			return this.keyword;
	}


	@Override
	public String toString() {
		return "Pagination [p=" + p + ", count=" + count + ", column=" + column + ", keyword=" + keyword + ", pageSize="
				+ pageSize + ", blockSize=" + blockSize + ", begin=" + begin + ", end=" + end + ", startBlock="
				+ startBlock + ", finishBlock=" + finishBlock + ", lastBlock=" + lastBlock + "]";
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}


	public List<BoardImageVO> getList() {
		return list;
	}


	public String getBoardLargeName() {
		return boardLargeName;
	}


	public void setBoardLargeName(String boardLargeName) {
		this.boardLargeName = boardLargeName;
	}


	public String getBoardMiddleName() {
		return boardMiddleName;
	}


	public void setBoardMiddleName(String boardMiddleName) {
		this.boardMiddleName = boardMiddleName;
	}
	
	
	
	
}
