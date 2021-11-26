package wishFit.beans.fitgroup;

public class FitgroupDto {
	private int fgNo;
	private String fgId, excateName, msgReceiver, fgTitle, fgIntro, fgStarttime, fgEndtime, fgLocation, fgonlyFemale,
			fgMkdate,
	 fgLatitude, fgLongtitude;

	public int getFgNo() {
		return fgNo;
	}

	public void setFgNo(int fgNo) {
		this.fgNo = fgNo;
	}

	public String getFgId() {
		return fgId;
	}

	public String getFgMkdate() {
		return fgMkdate;
	}

	public void setFgMkdate(String fgMkdate) {
		this.fgMkdate = fgMkdate;
	}

	public String getFgLatitude() {
		return fgLatitude;
	}

	public void setFgLatitude(String fgLatitude) {
		this.fgLatitude = fgLatitude;
	}

	public String getFgLongtitude() {
		return fgLongtitude;
	}

	public void setFgLongtitude(String fgLongtitude) {
		this.fgLongtitude = fgLongtitude;
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

	public String getMsgReceiver() {
		return msgReceiver;
	}

	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
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

	public String getFgStarttime() {
		return fgStarttime;
	}

	public void setFgStarttime(String fgStarttime) {
		this.fgStarttime = fgStarttime;
	}

	public String getFgEndtime() {
		return fgEndtime;
	}

	public void setFgEndtime(String fgEndtime) {
		this.fgEndtime = fgEndtime;
	}

	public String getFgLocation() {
		return fgLocation;
	}

	public void setFgLocation(String fgLocation) {
		this.fgLocation = fgLocation;
	}

	public String getFgonlyFemale() {
		return fgonlyFemale;
	}

	public void setFgonlyFemale(String fgonlyFemale) {
		this.fgonlyFemale = fgonlyFemale;
	}

	@Override
	public String toString() {
		return "FitgroupDto [fgNo=" + fgNo + ", fgId=" + fgId + ", excateName=" + excateName + ", msgReceiver="
				+ msgReceiver + ", fgTitle=" + fgTitle + ", fgIntro=" + fgIntro + ", fgStarttime=" + fgStarttime
				+ ", fgEndtime=" + fgEndtime + ", fgLocation=" + fgLocation + ", fgonlyFemale=" + fgonlyFemale
				+ ", fgMkdate=" + fgMkdate + ", fgLatitude=" + fgLatitude + ", fgLongtitude=" + fgLongtitude + "]";
	}

}
