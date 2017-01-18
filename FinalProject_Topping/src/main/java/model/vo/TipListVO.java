package model.vo;

import java.util.List;

public class TipListVO {
	PagingTipTypeVO pagingTipTypeVO;
	PagingTipPlaceNameVO pagingTipPlaceNameVO;
	PagingTipPlaceIdVO pagingTipPlaceIdVO;
	PagingBean pagingBean;
	List<TipBoardVO> tipList;

	public TipListVO(PagingTipTypeVO pagingTipTypeVO, List<TipBoardVO> tipList) {
		super();
		this.pagingTipTypeVO = pagingTipTypeVO;
		this.tipList = tipList;
	}

	public TipListVO(PagingTipPlaceIdVO pagingTipPlaceIdVO,
			List<TipBoardVO> tipList) {
		super();
		this.pagingTipPlaceIdVO = pagingTipPlaceIdVO;
		this.tipList = tipList;
	}

	public TipListVO(PagingTipPlaceNameVO pagingTipPlaceNameVO,
			List<TipBoardVO> tipList) {
		super();
		this.pagingTipPlaceNameVO = pagingTipPlaceNameVO;
		this.tipList = tipList;
	}

	public TipListVO(PagingBean pagingBean, List<TipBoardVO> tipList) {
		super();
		this.pagingBean = pagingBean;
		this.tipList = tipList;
	}

	public PagingTipTypeVO getPagingTipTypeVO() {
		return pagingTipTypeVO;
	}

	public void setPagingTipTypeVO(PagingTipTypeVO pagingTipTypeVO) {
		this.pagingTipTypeVO = pagingTipTypeVO;
	}

	public PagingTipPlaceNameVO getPagingTipPlaceNameVO() {
		return pagingTipPlaceNameVO;
	}

	public void setPagingTipPlaceNameVO(
			PagingTipPlaceNameVO pagingTipPlaceNameVO) {
		this.pagingTipPlaceNameVO = pagingTipPlaceNameVO;
	}

	public PagingTipPlaceIdVO getPagingTipPlaceIdVO() {
		return pagingTipPlaceIdVO;
	}

	public void setPagingTipPlaceIdVO(PagingTipPlaceIdVO pagingTipPlaceIdVO) {
		this.pagingTipPlaceIdVO = pagingTipPlaceIdVO;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	public List<TipBoardVO> getTipList() {
		return tipList;
	}

	public void setTipList(List<TipBoardVO> tipList) {
		this.tipList = tipList;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "TipListVO [pagingTipTypeVO=" + pagingTipTypeVO
				+ ", pagingTipPlaceNameVO=" + pagingTipPlaceNameVO
				+ ", pagingTipPlaceIdVO=" + pagingTipPlaceIdVO
				+ ", pagingBean=" + pagingBean + ", tipList=" + tipList + "]";
	}

}
