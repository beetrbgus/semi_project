package wishFit.statistics;

public class FitVO {
	private String fitGroup;
	private int total;
	
	public FitVO() {
		super();
	}
	public String getFitGroup() {
		return fitGroup;
	}
	public void setFitGroup(String fitGroup) {
		this.fitGroup = fitGroup;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "FitVO [fitGroup=" + "fitGroup" + ", total=" + total + "]";
	}		
	}

