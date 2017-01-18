package model.vo;

public class PagingTipPlaceIdVO {
	String placeId;
	String pageNo;
	
	
	public PagingTipPlaceIdVO(String placeId, String pageNo) {
		super();
		this.placeId = placeId;
		this.pageNo = pageNo;
	}

	public String getPlaceId() {
		return placeId;
	}

	public void setPlaceId(String placeId) {
		this.placeId = placeId;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}


	@Override
	public String toString() {
		return "PagingTipPlaceIdVO [placeId=" + placeId + ", pageNo=" + pageNo + "]";
	}
	
	
	
}
