package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 회원의 투어체크리스트를 확인하는 VO
 */
public class TourCheckListVO {
	int tourNo;
	MemberVO memberVO; // email(FK)
	ToppingListVO toppingListVO; // toppingListNo(FK)
	boolean tourStatus; // tour_status  1 = true, 0 = false!!!

	//체크리스트 목록에 추가할 때 사용하는 생성자
	public TourCheckListVO(MemberVO memberVO, ToppingListVO toppingListVO,
			boolean tourStatus) {
		super();
		this.memberVO = memberVO;
		this.toppingListVO = toppingListVO;
		this.tourStatus = tourStatus;
	}

	public TourCheckListVO() {	}

	// 테이블에서 체크리스트 목록을 불러올 때 사용하는 생성자
	public TourCheckListVO(int tourNo, MemberVO memberVO,
			ToppingListVO toppingListVO, boolean tourStatus) {
		this.tourNo = tourNo;
		this.memberVO = memberVO;
		this.toppingListVO = toppingListVO;
		this.tourStatus = tourStatus;
	}

	public int getTourNo() {
		return tourNo;
	}

	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}


	public boolean isTourStatus() {
		return tourStatus;
	}

	public void setTourStatus(boolean tourStatus) {
		this.tourStatus = tourStatus;
	}

	public ToppingListVO getToppingListVO() {
		return toppingListVO;
	}

	public void setToppingListVO(ToppingListVO toppingListVO) {
		this.toppingListVO = toppingListVO;
	}

	@Override
	public String toString() {
		return "TourCheckListVO [tourNo=" + tourNo + ", memberVO=" + memberVO
				+ ", toppingListVO=" + toppingListVO + ", tourStatus="
				+ tourStatus + "]";
	}


}
