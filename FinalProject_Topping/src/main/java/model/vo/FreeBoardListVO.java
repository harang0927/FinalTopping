package model.vo;

import java.util.List;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스
 * 
 * @author inst
 *
 */
public class FreeBoardListVO {
	private List<FreeBoardVO> list;
	private PagingBean pagingBean;

	public FreeBoardListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FreeBoardListVO(List<FreeBoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<FreeBoardVO> getList() {
		return list;
	}

	public void setList(List<FreeBoardVO> list) {
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
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}

}
