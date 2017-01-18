package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 메세지를 위한 클래스.
 */


public class MessageVO {
	private int messageNo;
	private MemberVO senderEmail; // senderEmail(FK)
	private MemberVO receiverEmail; // receiverEmail(FK)
	private String title;
	private String message;
	private String writeDate; // write_date

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageVO(MemberVO senderEmail, MemberVO receiverEmail,
			String title, String message) {
		super();
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.title = title;
		this.message = message;
	}

	public MessageVO(int messageNo, MemberVO senderEmail,
			MemberVO receiverEmail, String title, String message,
			String writeDate) {
		super();
		this.messageNo = messageNo;
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.title = title;
		this.message = message;
		this.writeDate = writeDate;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public MemberVO getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(MemberVO senderEmail) {
		this.senderEmail = senderEmail;
	}

	public MemberVO getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(MemberVO receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "MessageVO [messageNo=" + messageNo + ", senderEmail="
				+ senderEmail + ", receiverEmail=" + receiverEmail
				+ ", message=" + message + ", writeDate=" + writeDate + "]";
	}

}
