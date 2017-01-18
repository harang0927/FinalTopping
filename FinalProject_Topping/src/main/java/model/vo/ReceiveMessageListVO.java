package model.vo;

import java.util.List;

public class ReceiveMessageListVO {
	private int receiveMessageCount;
	private List<MessageVO> receiveMessageList;
	private PagingBean pagingBean; 
	
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public ReceiveMessageListVO(int receiveMessageCount,
			List<MessageVO> receiveMessageList, PagingBean pagingBean) {
		super();
		this.receiveMessageCount = receiveMessageCount;
		this.receiveMessageList = receiveMessageList;
		this.pagingBean = pagingBean;
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
	public ReceiveMessageListVO(int receiveMessageCount,
			List<MessageVO> receiveMessageList) {
		super();
		this.receiveMessageCount = receiveMessageCount;
		this.receiveMessageList = receiveMessageList;
	}
	public ReceiveMessageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "ReceiveMessageListVO [receiveMessageCount="
				+ receiveMessageCount + ", receiveMessageList="
				+ receiveMessageList + ", pagingBean=" + pagingBean + "]";
	}
}
