package model.vo;

public class PagingFreeBoardVO {
	private String postingHeader;
	private int pageNo;
	
	public String getPostingHeader() {
		return postingHeader;
	}
	public void setPostingHeader(String postingHeader) {
		this.postingHeader = postingHeader;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public PagingFreeBoardVO(String postingHeader, int pageNo) {
		super();
		this.postingHeader = postingHeader;
		this.pageNo = pageNo;
	}
	public PagingFreeBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PagingFreeBoardVO [postingHeader=" + postingHeader
				+ ", pageNo=" + pageNo + "]";
	}
	
	 
}
