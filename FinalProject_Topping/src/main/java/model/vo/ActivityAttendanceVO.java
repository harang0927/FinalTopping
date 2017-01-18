package model.vo;

/*
 * 작성 일자: 2016.11.25
 * 설명: 자유게시판을 위한 클래스.
 */
public class ActivityAttendanceVO {
	MemberVO memberVO; // email(FK)
	ActivityBoardVO activityBoardVO; // activityNo(FK)

	public ActivityAttendanceVO(MemberVO memberVO,
			ActivityBoardVO activityBoardVO) {
		super();
		this.memberVO = memberVO;
		this.activityBoardVO = activityBoardVO;
	}

	public ActivityAttendanceVO() {
		super();
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "ActivityAttendanceVO [memberVO=" + memberVO
				+ ", activityBoardVO=" + activityBoardVO + "]";
	}

}
