package model.vo;

import java.util.List;

public class SendMessageListVO {
	private int sendMessageCount;
	private List<MessageVO> sendMessageList;
	private PagingBean pagingBean; 
	
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public SendMessageListVO(int sendMessageCount,
			List<MessageVO> sendMessageList, PagingBean pagingBean) {
		super();
		this.sendMessageCount = sendMessageCount;
		this.sendMessageList = sendMessageList;
		this.pagingBean = pagingBean;
	}
	public int getSendMessageCount() {
		return sendMessageCount;
	}
	public void setSendMessageCount(int sendMessageCount) {
		this.sendMessageCount = sendMessageCount;
	}
	public List<MessageVO> getSendMessageList() {
		return sendMessageList;
	}
	public void setSendMessageList(List<MessageVO> sendMessageList) {
		this.sendMessageList = sendMessageList;
	}
	public SendMessageListVO(int sendMessageCount,
			List<MessageVO> sendMessageList) {
		super();
		this.sendMessageCount = sendMessageCount;
		this.sendMessageList = sendMessageList;
	}
	public SendMessageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SendMessageListVO [sendMessageCount=" + sendMessageCount
				+ ", sendMessageList=" + sendMessageList + ", pagingBean="
				+ pagingBean + "]";
	}
	
	
	
	
	
}
