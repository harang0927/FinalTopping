package model.vo;

import java.util.List;

public class ActivityListVO {
	private List<ActivityBoardVO> list;
	private PagingBean pagingBean;

	public List<ActivityBoardVO> getList() {
		return list;
	}

	public ActivityListVO(List<ActivityBoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public void setList(List<ActivityBoardVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ActivityListVO [list=" + list + ", pagingBean=" + pagingBean
				+ "]";
	}

}
