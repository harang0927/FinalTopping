package model.vo;

import java.util.List;

public class PagingToppingListVO {
	PagingBean pagingBean;
	List<ToppingListVO> toppingList;
	
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	public List<ToppingListVO> getToppingList() {
		return toppingList;
	}
	public void setToppingList(List<ToppingListVO> toppingList) {
		this.toppingList = toppingList;
	}
	public PagingToppingListVO(PagingBean pagingBean,
			List<ToppingListVO> toppingList) {
		super();
		this.pagingBean = pagingBean;
		this.toppingList = toppingList;
	}
	public PagingToppingListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PagingToppingListVO [pagingBean=" + pagingBean
				+ ", toppingList=" + toppingList + "]";
	}
	
	
}
