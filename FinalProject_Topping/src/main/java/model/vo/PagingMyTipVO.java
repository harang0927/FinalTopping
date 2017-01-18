package model.vo;

public class PagingMyTipVO {

	String email;
	String pageNo;


	public PagingMyTipVO(String email, String pageNo) {
		super();
		this.email = email;
		this.pageNo = pageNo;
	}


	public String getemail() {
		return email;
	}


	public void setemail(String email) {
		this.email = email;
	}


	public String getPageNo() {
		return pageNo;
	}


	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}


	@Override
	public String toString() {
		return "PagingTipemailVO [email=" + email + ", pageNo=" + pageNo + "]";
	}
}
