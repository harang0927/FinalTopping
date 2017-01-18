package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 각 회원이 클립한 팁게시글 확인 VO
 */
public class ClipListVO {
	private int clipNo;
	private MemberVO memberVO; // email(FK)
	private TipBoardVO tipBoardVO; // tipNo(FK)

	public ClipListVO() { }

	public ClipListVO(int clipNo, MemberVO memberVO, TipBoardVO tipBoardVO) {
		this.clipNo = clipNo;
		this.memberVO = memberVO;
		this.tipBoardVO = tipBoardVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public TipBoardVO getTipBoardVO() {
		return tipBoardVO;
	}

	public void setTipBoardVO(TipBoardVO tipBoardVO) {
		this.tipBoardVO = tipBoardVO;
	}

	public int getClipNo() {
		return clipNo;
	}

	public void setClipNo(int clipNo) {
		this.clipNo = clipNo;
	}

	@Override
	public String toString() {
		return "ClipListVO [clipNo=" + clipNo + ", memberVO=" + memberVO
				+ ", tipBoardVO=" + tipBoardVO + "]";
	}

	
}
