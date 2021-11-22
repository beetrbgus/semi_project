package wishFit.beans.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import wishFit.beans.admin.MemoDao;
import wishFit.beans.admin.MemoDto;

public class Pagination {
	
	
	private int p;   // 페이지 파라미터	
	private int count;   // 글 리스트의 총 개수
	
	// 검색 요소
	private String column;
	private String keyword;
	
	
	public Pagination(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p")); // p는 파라미터로 받아 설정
			if(this.p <= 0) throw new Exception();  // 단, 파라미터 값이 0이거나, 음수 등 이상한 값일 경우 예외처리해서
		}
		catch (Exception e) {
			this.p = 1; 		 //  1페이지로 보내버림.
		}
		this.column = req.getParameter("column");
		this.keyword = req.getParameter("keyword");
	}
	
	private int pageSize = 10;  
	private int blockSize = 10; 
	private int begin, end; 
	private int startBlock, finishBlock, lastBlock;

	private List<MemoDto> list;
	
	
	
	public void calculate() throws Exception{
		
		MemoDao memoDao = new MemoDao();
		if(isSearch()) {
			this.count = memoDao.count(column, keyword);
		}
		else {
			this.count = memoDao.count();
		}
		
		// 로우넘
		this.end = this.p * this.pageSize;
		this.begin = this.end - (this.pageSize - 1);
		
		// 블록
		this.lastBlock = (this.count - 1) / this.pageSize + 1;
		this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
		this.finishBlock = this.startBlock + (this.blockSize - 1);
		
		
		if(this.isSearch()) {
			this.list = memoDao.searchByRownum(column, keyword, begin, end);
		}
		else {
			this.list = memoDao.listByRownum(begin, end);
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
	
	
	public boolean isSearch() {
		return this.column != null && !this.column.equals("") && this.keyword != null && !this.keyword.equals("");
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


	public List<MemoDto> getList() {
		return list;
	}
	
	
}
