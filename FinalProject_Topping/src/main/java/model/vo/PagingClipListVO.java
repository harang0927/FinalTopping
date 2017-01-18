package model.vo;

import java.util.List;

public class PagingClipListVO {
	PagingBean pagingBean;
	List<ClipListVO> clipList;
	
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public List<ClipListVO> getClipList() {
		return clipList;
	}
	public void setClipList(List<ClipListVO> clipList) {
		this.clipList = clipList;
	}
	public PagingClipListVO(PagingBean pagingBean, List<ClipListVO> clipList) {
		super();
		this.pagingBean = pagingBean;
		this.clipList = clipList;
	}
	public PagingClipListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PagingClipListVO [pagingBean=" + pagingBean + ", clipList="
				+ clipList + "]";
	}
}
