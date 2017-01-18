package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 회원이 토핑한 리스트
 */
public class ToppingListVO {
	int toppingListNo;
	MemberVO memberVO; // email(FK)
	ActivityBoardVO activityBoardVO; // activityNo(FK)
	PlaceVO placeVO; // placeId(FK)
	//테스트용 생성자
		public ToppingListVO(int toppingListNo, MemberVO memberVO, PlaceVO placeVO) {
			super();
			this.toppingListNo = toppingListNo;
			this.memberVO = memberVO;
			this.placeVO = placeVO;
		}
	// 여행지를 토핑했을 때
	public ToppingListVO(MemberVO memberVO, PlaceVO placeVO) {
		this.memberVO = memberVO;
		this.placeVO = placeVO;
	}
	// 액티비티를 토핑했을 때
	public ToppingListVO(MemberVO memberVO, ActivityBoardVO activityBoardVO) {
		this.memberVO = memberVO;
		this.activityBoardVO = activityBoardVO;
	}
	
	public ToppingListVO() {	}
	
	// 테이블에서 전체 리스트 가져올 때
	public ToppingListVO(int toppingListNo, MemberVO memberVO,
			ActivityBoardVO activityBoardVO, PlaceVO placeVO) {
		this.toppingListNo = toppingListNo;
		this.memberVO = memberVO;
		this.activityBoardVO = activityBoardVO;
		this.placeVO = placeVO;
	}

	public int getToppingListNo() {
		return toppingListNo;
	}

	public void setToppingListNo(int toppingListNo) {
		this.toppingListNo = toppingListNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public ActivityBoardVO getActivityBoardVO() {
		return activityBoardVO;
	}

	public void setActivityBoardVO(ActivityBoardVO activityBoardVO) {
		this.activityBoardVO = activityBoardVO;
	}

	public PlaceVO getPlaceVO() {
		return placeVO;
	}

	public void setPlaceVO(PlaceVO placeVO) {
		this.placeVO = placeVO;
	}

	@Override
	public String toString() {
		return "ToppingListVO [toppingListNo=" + toppingListNo + ", memberVO="
				+ memberVO + ", activityBoardVO=" + activityBoardVO
				+ ", placeVO=" + placeVO + "]";
	}

}
