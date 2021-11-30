package wishFit.beans.fitgroup;

public class FitImageVO {
	private int fgNo, fgImageNo;
	private String fgId, excateName, fgTitle, fgIntro, fgStarttime, fgEndtime, fgLocation, fgLatitude, fgLongitude,
			fgMkDate, fgImageUpload, fgImageSave, fgImageType;
	private long fgImageSize;

	public int getFgNo() {
		return fgNo;
	}

	public void setFgNo(int fgNo) {
		this.fgNo = fgNo;
	}

	public int getFgImageNo() {
		return fgImageNo;
	}

	@Override
	public String toString() {
		return "FitImageVO [fgNo=" + fgNo + ", fgImageNo=" + fgImageNo + ", fgId=" + fgId + ", excateName=" + excateName
				+ ", fgTitle=" + fgTitle + ", fgIntro=" + fgIntro + ", fgStarttime=" + fgStarttime + ", fgEndtime="
				+ fgEndtime + ", fgLocation=" + fgLocation + ", fgLatitude=" + fgLatitude + ", fgLongitude="
				+ fgLongitude + ", fgMkDate=" + fgMkDate + ", fgImageUpload=" + fgImageUpload + ", fgImageSave="
				+ fgImageSave + ", fgImageType=" + fgImageType + ", fgImageSize=" + fgImageSize + "]";
	}

	public void setFgImageNo(int fgImageNo) {
		this.fgImageNo = fgImageNo;
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

	public String getFgLatitude() {
		return fgLatitude;
	}

	public void setFgLatitude(String fgLatitude) {
		this.fgLatitude = fgLatitude;
	}

	public String getFgLongitude() {
		return fgLongitude;
	}

	public void setFgLongitude(String fgLongitude) {
		this.fgLongitude = fgLongitude;
	}

	public String getFgMkDate() {
		return fgMkDate;
	}

	public void setFgMkDate(String fgMkDate) {
		this.fgMkDate = fgMkDate;
	}

	public String getFgImageUpload() {
		return fgImageUpload;
	}

	public void setFgImageUpload(String fgImageUpload) {
		this.fgImageUpload = fgImageUpload;
	}

	public String getFgImageSave() {
		return fgImageSave;
	}

	public void setFgImageSave(String fgImageSave) {
		this.fgImageSave = fgImageSave;
	}

	public String getFgImageType() {
		return fgImageType;
	}

	public void setFgImageType(String fgImageType) {
		this.fgImageType = fgImageType;
	}

	public long getFgImageSize() {
		return fgImageSize;
	}

	public void setFgImageSize(long fgImageSize) {
		this.fgImageSize = fgImageSize;
	}
}
