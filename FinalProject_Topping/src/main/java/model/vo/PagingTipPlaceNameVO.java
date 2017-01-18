package model.vo;

public class PagingTipPlaceNameVO {
	String placeName;
	String pageNo;
	
	
	public PagingTipPlaceNameVO(String placeName, String pageNo) {
		super();
		this.placeName = placeName;
		this.pageNo = pageNo;
	}


	public String getPlaceName() {
		return placeName;
	}


	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}


	public String getPageNo() {
		return pageNo;
	}


	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "PagingTipPlaceVO [placeName=" + placeName + ", pageNo="
				+ pageNo + "]";
	}



	
	
	
}
