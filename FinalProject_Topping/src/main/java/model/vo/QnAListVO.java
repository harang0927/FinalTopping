package model.vo;

import java.util.List;

/**
 * 게시물 리스트 정보와 
 * 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class QnAListVO {
	private List<QnAVO> list;
	private PagingBean pagingBean;
	
	public QnAListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnAListVO(List<QnAVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<QnAVO> getList() {
		return list;
	}

	public void setList(List<QnAVO> list) {
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
		return "ListQnAVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}










