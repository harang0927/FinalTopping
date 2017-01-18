package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 공지사항을 위한 클래스
 */

public class NoticeVO {
	int noticeNo;
	MemberVO memberVO; // email(FK)
	String noticeContent; // 공지사항 내용
	String writeDate; // write_date //Date -> String
	String title; 
	int hits; // 조회수

	public NoticeVO(MemberVO memberVO, String noticeContent, String title) {
		super();
		this.memberVO = memberVO;
		this.noticeContent = noticeContent;
		this.title = title;
	}
	
	
	//소희&경민... 생성자 추가함...
	public NoticeVO(int noticeNo, MemberVO memberVO, String noticeContent, String title) {
		super();
		this.noticeNo = noticeNo;
		this.memberVO = memberVO;
		this.noticeContent = noticeContent;
		this.title = title;
	}



	public NoticeVO() {	}

	public NoticeVO(int noticeNo, MemberVO memberVO, String noticeContent,
			String writeDate, String title, int hits) {
		super();
		this.noticeNo = noticeNo;
		this.memberVO = memberVO;
		this.noticeContent = noticeContent;
		this.writeDate = writeDate;
		this.title = title;
		this.hits = hits;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	

	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}


	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", memberVO=" + memberVO
				+ ", noticeContent=" + noticeContent + ", writeDate="
				+ writeDate + ", title=" + title + ", hits=" + hits + "]";
	}

	

}
