package wishFit.beans;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

public class Pagination {
	
	// 필수값
	private int p;
	private int count;
	
	// 선택값
	private String column;
	private String keyword;
	
	public Pagination(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p"));
			if(this.p <= 0) throw new Exception();
		}
		catch (Exception e) {
			this.p = 1;
		}
		this.column = req.getParameter("column");
		this.keyword = req.getParameter("keyword");
	}
	
	
	private int pageSize = 10;
	private int blockSize = 10;
	private int begin, end;
	private int startBlock, finishBlock, lastBlock;
	private List<BoardDto> list;
	
	public void calculate() throws Exception{
		
		BoardDao boardDao = new BoardDao();
		if(isSearch()) {
			this.count = boardDao.count(column, keyword);
		}
		else {
			this.count = boardDao.count();
		}
		
		this.end = this.p * this.pageSize;
		this.begin = this.end = (this.pageSize - 1);
		
		this.lastBlock = (this.count - 1) / this.pageSize + 1;
		this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
		this.finishBlock = this.startBlock + (this.blockSize - 1);
		
		if(isSearch()) {
			this.list = boardDao.searchByRownum(column, keyword, begin, end);
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
	
	public boolean isPreAvailable() {
		return this.startBlock > 1;
	}
	
	public boolean isNextAvailable() {
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
		return this.finishBlock;
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
	
	public List<BoardDto> getList(){
		return list;
	}
}
