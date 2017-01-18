package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 자유게시판을 위한 클래스.
 */
import java.util.Date;

/*
 * 작성 일자: 2016.11.25
 * 설명: 댓글 위한 클래스.
 */
public class CommentVO {
	int commentNo;
	MemberVO memberVO; // email(FK) 작성자
	TipBoardVO tipBoardVO; // 팁 게시판 tipNo
	FreeBoardVO freeBoardVO; // 자게 
	ActivityBoardVO activityBoardVO; // 액티비티
	int depth; 
	int orderNo; // 대댓글이 시작된 최초 댓글의 commentNo
	int parentReplyNo; // parent_reply_no
	String content; // 댓글내용
	Date writeDate; // 작성일시 write_date

	//자유게시판 댓글일 때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO,
			FreeBoardVO freeBoardVO,
			String content, Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.freeBoardVO = freeBoardVO;
		this.content = content;
		this.writeDate = writeDate;
	}

	//액티비티 댓글일 때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO,
			ActivityBoardVO activityBoardVO, String content, Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.activityBoardVO = activityBoardVO;
		this.content = content;
		this.writeDate = writeDate;
	}

	//팁게시판 댓글일 때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO, TipBoardVO tipBoardVO,
			String content, Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.tipBoardVO = tipBoardVO;
		this.content = content;
		this.writeDate = writeDate;
	}

	
	
	
	public CommentVO(int commentNo, String content) {
		super();
		this.commentNo = commentNo;
		this.content = content;
	}

	//기본 생성자
	public CommentVO() { }

	//팁게시판 대댓글일때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO, TipBoardVO tipBoardVO,
			int depth, int orderNo, int parentReplyNo, String content,
			Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.tipBoardVO = tipBoardVO;
		this.depth = depth;
		this.orderNo = orderNo;
		this.parentReplyNo = parentReplyNo;
		this.content = content;
		this.writeDate = writeDate;
	}

	//자유게시판 대댓글일때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO,
			FreeBoardVO freeBoardVO,
			int depth, int orderNo, int parentReplyNo, String content,
			Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.freeBoardVO = freeBoardVO;
		this.depth = depth;
		this.orderNo = orderNo;
		this.parentReplyNo = parentReplyNo;
		this.content = content;
		this.writeDate = writeDate;
	}

	//액티비티 대댓글일때의 생성자
	public CommentVO(int commentNo, MemberVO memberVO,
			ActivityBoardVO activityBoardVO,
			int depth, int orderNo, int parentReplyNo, String content,
			Date writeDate) {
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.activityBoardVO = activityBoardVO;
		this.depth = depth;
		this.orderNo = orderNo;
		this.parentReplyNo = parentReplyNo;
		this.content = content;
		this.writeDate = writeDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public FreeBoardVO getFreeBoardVO() {
		return freeBoardVO;
	}

	public void setFreeBoardVO(FreeBoardVO freeBoardVO) {
		this.freeBoardVO = freeBoardVO;
	}

	public ActivityBoardVO getActivityBoardVO() {
		return activityBoardVO;
	}

	public void setActivityBoardVO(ActivityBoardVO activityBoardVO) {
		this.activityBoardVO = activityBoardVO;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getParentReplyNo() {
		return parentReplyNo;
	}

	public void setParentReplyNo(int parentReplyNo) {
		this.parentReplyNo = parentReplyNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getwriteDate() {
		return writeDate;
	}

	public void setwriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", memberVO=" + memberVO
				+ ", tipBoardVO=" + tipBoardVO + ", freeBoardVO=" + freeBoardVO
				+ ", activityBoardVO=" + activityBoardVO + ", depth=" + depth
				+ ", orderNo=" + orderNo + ", parentReplyNo=" + parentReplyNo
				+ ", comment=" + content + ", writeDate=" + writeDate + "]";
	}

}
