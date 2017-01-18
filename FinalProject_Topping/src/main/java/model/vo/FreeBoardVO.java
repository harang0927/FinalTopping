package model.vo;

/*
 * 작성 일자: 2016.11.25
 * 설명: 자유게시판을 위한 클래스.
 */
import java.util.List;

public class FreeBoardVO {
	int postingNo; // 글 번호
	MemberVO memberVO; // email(FK)
	String postingTitle; // posting_title 제목
	String content; // 글 내용
	String writeDate; // write_date 작성 일자
	int hits; // 조회수

	String postingHeader; // posting_header
	private List<CommentVO> commentVO;

	public List<CommentVO> getCommentVO() {
		return commentVO;
	}

	public void setCommentVO(List<CommentVO> commentVO) {
		this.commentVO = commentVO;
	}

	public FreeBoardVO(MemberVO memberVO, String postingTitle, String content,
			String postingHeader) {
		this.memberVO = memberVO;
		this.postingTitle = postingTitle;
		this.content = content;
		this.postingHeader = postingHeader;
	}

	public FreeBoardVO() {
	}

	public FreeBoardVO(int postingNo, MemberVO memberVO, String postingTitle,
			String content, String writeDate, int hits,
			List<CommentVO> commentVO, String postingHeader) {
		super();
		this.postingNo = postingNo;
		this.memberVO = memberVO;
		this.postingTitle = postingTitle;
		this.content = content;
		this.writeDate = writeDate;
		this.hits = hits;
		this.commentVO = commentVO;
		this.postingHeader = postingHeader;
	}

	public int getPostingNo() {
		return postingNo;
	}

	public void setPostingNo(int postingNo) {
		this.postingNo = postingNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getPostingTitle() {
		return postingTitle;
	}

	public void setPostingTitle(String postingTitle) {
		this.postingTitle = postingTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getPostingHeader() {
		return postingHeader;
	}

	public void setPostingHeader(String postingHeader) {
		this.postingHeader = postingHeader;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [postingNo=" + postingNo + ", memberVO=" + memberVO
				+ ", postingTitle=" + postingTitle + ", content=" + content
				+ ", writeDate=" + writeDate + ", hits=" + hits
				+ ", commentVO=" + commentVO + ", postingHeader="
				+ postingHeader + "]\n";
	}

}
