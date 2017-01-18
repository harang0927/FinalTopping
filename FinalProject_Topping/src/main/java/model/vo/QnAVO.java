package model.vo;


/*
 * 작성 일자: 2016.11.25
 * 설명: QnA게시판을 위한 클래스.
 */


public class QnAVO {
	int qnaNo; // 글 번호
	MemberVO memberVO; // email(FK) 질문자 이메일
	int questionNo; // 운영자가 답글을 달 때, 어떤 질문글의 답글인지 판별하기 위한 번호
	String admin; // 운영자가 답변했을 때 운영자 닉네임이나 이메일
	String title;//질문 제목
	String content; // 질문 내용
	String writeDate;
	
     
	
	// 사용자가 질문글을 올렸을 때
	public QnAVO(MemberVO memberVO,String title, String content) {
		super();
		this.memberVO = memberVO;
		this.title= title;
		this.content = content;
	}
	// 운영자가 답글을 올렸을 때
	public QnAVO(MemberVO memberVO, int questionNo,String admin, String title,String content) {
		super();
		this.memberVO = memberVO;
		this.questionNo = questionNo;
		this.admin = admin;
		this.title= title;
		this.content = content;
	}
	
	public QnAVO() { }

	public QnAVO(int qnaNo, MemberVO memberVO, String admin, String title,String content,
			String writeDate) {
		this.qnaNo = qnaNo;
		this.memberVO = memberVO;
		this.admin = admin;
		this.title= title;
		this.content = content;
		this.writeDate = writeDate;
	}

	
	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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

	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", memberVO=" + memberVO
				+ ", questionNo=" + questionNo + ", admin=" + admin
				+ ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + "]";
	}
	
	
	
}
