package model.vo;

import java.util.List;

public class MessageListVO {
	private int sendMessageCount;
	private List<MessageVO> sendMessageList;
	private int receiveMessageCount;
	private List<MessageVO> receiveMessageList;
	private PagingBean pagingBean;
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
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
	public int getReceiveMessageCount() {
		return receiveMessageCount;
	}
	public void setReceiveMessageCount(int receiveMessageCount) {
		this.receiveMessageCount = receiveMessageCount;
	}
	public List<MessageVO> getReceiveMessageList() {
		return receiveMessageList;
	}
	public void setReceiveMessageList(List<MessageVO> receiveMessageList) {
		this.receiveMessageList = receiveMessageList;
	}
	public MessageListVO(int sendMessageCount, List<MessageVO> sendMessageList,
			int receiveMessageCount, List<MessageVO> receiveMessageList) {
		super();
		this.sendMessageCount = sendMessageCount;
		this.sendMessageList = sendMessageList;
		this.receiveMessageCount = receiveMessageCount;
		this.receiveMessageList = receiveMessageList;
	}
	public MessageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
