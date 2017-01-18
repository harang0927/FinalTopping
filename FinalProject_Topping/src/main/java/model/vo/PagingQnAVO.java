package model.vo;

public class PagingQnAVO {

	private String email;
	private String pageNo;
	
	public PagingQnAVO(String email, String pageNo) {
		super();
		this.email = email;
		this.pageNo = pageNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	
	
	
	
}
