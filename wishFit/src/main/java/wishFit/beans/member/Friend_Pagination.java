package wishFit.beans.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class Friend_Pagination {
	//필수 데이터
	private String uid;
	private int p;
	private int count;
	
	//선택 데이터
	private String column; // sender , receiver , readtime
	private String keyword;
	
	//생성자를 이용하여 필수 데이터를 설정하도록 구현
	public Friend_Pagination(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p"));
			if(this.p <= 0) throw new Exception();
			this.uid = (String)req.getSession().getAttribute("uid");
			System.out.println("Msg_pagination    "+p);
		}
		catch(Exception e) {
			this.p = 1;
			
		}
		this.column = req.getParameter("column");
		this.keyword = req.getParameter("keyword");

	}
	
	//계산 메소드
	private int pageSize = 10;
	private int blockSize = 10;
	private int begin, end;
	private int startBlock, finishBlock, lastBlock;
	private List<FriendVo> list;
	public void calculate() throws Exception {
		
		//count 계산
		FriendDao friendDao = new FriendDao();

		this.count = friendDao.count(uid);
		
		//rownum 계산
		this.end = this.p * this.pageSize;
		this.begin = this.end - (this.pageSize - 1);
		
		//block 계산
		this.lastBlock = (this.count - 1) / this.pageSize + 1;
		this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
		this.finishBlock = this.startBlock + (this.blockSize - 1);
		
		//list 계산
		this.list = friendDao.friendmine(uid, this.begin, this.end);
		System.out.println("count    : " + count);
		System.out.println("end    : " + end);
		System.out.println("begin    : " + begin);
		System.out.println("lastBlock    : " +lastBlock);
		System.out.println("startBlock    : " + startBlock);
		System.out.println("finishBlock    : " + finishBlock);
		System.out.println("isNextAvailable   : " + isNextAvailable() );
		System.out.println("isNextAvailable   : " + isPreviousAvailable() );
	}
	
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
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
	
	//추가 : 이전이 존재하나요?
	public boolean isPreviousAvailable() {
		return this.startBlock > 1;
	}
	//추가 : 다음이 존재하나요?
	public boolean isNextAvailable() {
		return this.finishBlock < this.lastBlock; 
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
	public List<FriendVo> getList() {
		return list;
	}
}
