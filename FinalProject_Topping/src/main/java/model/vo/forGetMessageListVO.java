package model.vo;

public class forGetMessageListVO {
	private int pageNo;
	private String senderEmail;
	private String receiverEmail;
	

	public forGetMessageListVO() {	}
	
	
	public forGetMessageListVO(int pageNo, String senderEmail) {
		super();
		this.pageNo = pageNo;
		this.senderEmail = senderEmail;
	}


	public forGetMessageListVO(int pageNo, String senderEmail,
			String receiverEmail) {
		super();
		this.pageNo = pageNo;
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}

	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	@Override
	public String toString() {
		return "forGetMessageListVO [pageNo=" + pageNo + ", senderEmail="
				+ senderEmail + ", receiverEmail=" + receiverEmail + "]";
	}
	
	
}
