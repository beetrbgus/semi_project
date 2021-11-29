package wishFit.beans.fitgroup;

import java.sql.Date;

public class FitgroupDto {
	private int fgNo;
	private String fgId, excateName, fgTitle, fgIntro, fgLocation, fgOnlyfemale;
	private Date fgStarttime, fgEndtime;
	public FitgroupDto() {
		super();

	}
	@Override
	public String toString() {
		return "FitgroupDto [fgNo=" + fgNo + ", fgId=" + fgId + ", excateName=" + excateName + ", fgTitle=" + fgTitle
				+ ", fgIntro=" + fgIntro + ", fgLocation=" + fgLocation + ", fgOnlyfemale=" + fgOnlyfemale
				+ ", fgStarttime=" + fgStarttime + ", fgEndtime=" + fgEndtime + "]";
	}
	public int getFgNo() {
		return fgNo;
	}
	public void setFgNo(int fgNo) {
		this.fgNo = fgNo;
	}
	public String getFgId() {
		return fgId;
	}
	public void setFgId(String fgId) {
		this.fgId = fgId;
	}
	public String getExcateName() {
		return excateName;
	}
	public void setExcateName(String excateName) {
		this.excateName = excateName;
	}
	public String getFgTitle() {
		return fgTitle;
	}
	public void setFgTitle(String fgTitle) {
		this.fgTitle = fgTitle;
	}
	public String getFgIntro() {
		return fgIntro;
	}
	public void setFgIntro(String fgIntro) {
		this.fgIntro = fgIntro;
	}
	public String getFgLocation() {
		return fgLocation;
	}
	public void setFgLocation(String fgLocation) {
		this.fgLocation = fgLocation;
	}
	public String getFgOnlyfemale() {
		return fgOnlyfemale;
	}
	public void setFgOnlyfemale(String fgOnlyfemale) {
		this.fgOnlyfemale = fgOnlyfemale;
	}
	public Date getFgStarttime() {
		return fgStarttime;
	}
	public void setFgStarttime(Date fgStarttime) {
		this.fgStarttime = fgStarttime;
	}
	public Date getFgEndtime() {
		return fgEndtime;
	}
	public void setFgEndtime(Date fgEndtime) {
		this.fgEndtime = fgEndtime;
	}
}
