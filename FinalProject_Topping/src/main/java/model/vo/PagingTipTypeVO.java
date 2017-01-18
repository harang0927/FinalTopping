package model.vo;

public class PagingTipTypeVO {

	String type;
	String pageNo;
	
	
	public PagingTipTypeVO(String type, String pageNo) {
		super();
		this.type = type;
		this.pageNo = pageNo;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getPageNo() {
		return pageNo;
	}


	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}


	@Override
	public String toString() {
		return "PagingTipTypeVO [type=" + type + ", pageNo=" + pageNo + "]";
	}
	
}
