package wishFit.beans.fitgroup;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class Pagination {
	private int p;
	private int count;

	private String fgLocation;

	public Pagination(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p"));
			if (this.p <= 0)
				throw new Exception();
		} catch (Exception e) {
			this.p = 1;
		}
		this.fgLocation = req.getParameter("fgLoaction");
	}

	private int pageSize = 10;
	private int blockSize = 10;
	private int begin, end;
	private int startBlock, finishBlock, lastBlock;
	private List<FitImageVO> list;

	public void calculate() throws Exception {
	//count 계산
	FitgroupDao fitgroupDao = new FitgroupDao();
	if(isSearch()) {
		this.count = fitgroupDao.count(fgLocation);
	}
	else {
		this.count = fitgroupDao.count();
	}
	
//rownum계산
this.end = this.p * this.pageSize;
this.begin = this.end - (this.pageSize - 1);

//block 계산
this.lastBlock = (this.count - 1) / this.pageSize + 1;
this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
this.finishBlock = this.startBlock + (this.blockSize - 1);

//list계산
	if(this.isSearch())

	{
		this.list = fitgroupDao.searchByRownum(fgLocation, begin, end);
	}else
	{
		this.list = fitgroupDao.listByRownum(begin, end);// 일반
		// this.list = fitgroupDao.listByTreeSort(begin, end);//계층형
	}

}
	

public int getPage() {
	return p;
}

	public int getCount() {
		return count;
	}

	public String getfgLocation() {
		return fgLocation;
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

//추가 : 이전이 존재하나요?
	public boolean isPreviousAvailable() {
		return this.startBlock > 1;
	}

//추가 : 다음이 존재하나요?
	public boolean isNextAvailable() {
		return this.finishBlock < this.lastBlock;
	}

//추가 : 검색모드인가요?
	public boolean isSearch() {
		return this.fgLocation != null && !this.fgLocation.equals("");
	}

//추가 : 진짜 마지막 블록 번호 반환
	public int getRealLastBlock() {
		return Math.min(this.finishBlock, this.lastBlock);
	}

//추가 : 이전을 누르면 나오는 블록 번호
	public int getPreviousBlock() {
		return this.startBlock - 1;
	}

//추가 : 다음을 누르면 나오는 블록 번호
	public int getNextBlock() {
		return this.finishBlock + 1;
	}



//추가 : null을 제거한 keyword 반환 메소드
	public String getfgLocationString() {
		if (this.fgLocation == null)
			return "";
		else
			return this.fgLocation;
	}

	@Override
	public String toString() {
		return "Pagination [p=" + p + ", count=" + count + ", fgLocation=" + fgLocation + ", pageSize="
				+ pageSize + ", blockSize=" + blockSize + ", begin=" + begin + ", end=" + end + ", startBlock="
				+ startBlock + ", finishBlock=" + finishBlock + ", lastBlock=" + lastBlock + "]";
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public List<FitImageVO> getList() {
		return list;
	}
}