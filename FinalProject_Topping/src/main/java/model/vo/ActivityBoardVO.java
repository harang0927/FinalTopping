package model.vo;

/*
 * 작성 일자: 2016.11.25
 * 설명: 자유게시판을 위한 클래스.
 */
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ActivityBoardVO {

	private int activityNo; // seq
	private MemberVO memberVO; // email(FK)
	private String activityTitle; // activity_title
	private String content;
	private String activityType; // activity_type
	private int nowAttendance; // 현재 참석인원
	private int maxAttendance; // 최대 참석인원
	private String writeDate; // 작성일 write_date
	private String startDate; // 시작일 start_date
	private String endDate; // 종료일 end_date
	private PlaceVO placeVO; // placeId(FK)
	private List<UploadImageVO> img; //
	//
	private List<ActivityAttendanceVO> activityAttendanceVO;
	private int toppingCount; // topping_count
	private int activityStatus; // 종료여부 activity_status
	//
	private List<MultipartFile> uploadFile; // index로

	   // comment 받아오려면 comment 도 abvo 에 있어야 됨..
	private List<CommentVO> commentVO;

	public List<CommentVO> getCommentVO() {
		return commentVO;
	}

   public void setCommentVO(List<CommentVO> commentVO) {
      this.commentVO = commentVO;
   }
	public ActivityBoardVO(int activityNo) {
		super();
		this.activityNo = activityNo;
	}

	public ActivityBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}

	public List<UploadImageVO> getImg() {
		return img;
	}

	public void setImg(List<UploadImageVO> img) {
		this.img = img;
	}

	public int getActivityNo() {
		return activityNo;
	}

	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getActivityTitle() {
		return activityTitle;
	}

	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public int getNowAttendance() {
		return nowAttendance;
	}

	public void setNowAttendance(int nowAttendance) {
		this.nowAttendance = nowAttendance;
	}

	public int getMaxAttendance() {
		return maxAttendance;
	}

	public void setMaxAttendance(int maxAttendance) {
		this.maxAttendance = maxAttendance;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public PlaceVO getPlaceVO() {
		return placeVO;
	}

	public void setPlaceVO(PlaceVO placeVO) {
		this.placeVO = placeVO;
	}

	public int getToppingCount() {
		return toppingCount;
	}

	public void setToppingCount(int toppingCount) {
		this.toppingCount = toppingCount;
	}

	public int getActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(int activityStatus) {
		this.activityStatus = activityStatus;
	}

	public List<ActivityAttendanceVO> getActivityAttendanceVO() {
		return activityAttendanceVO;
	}

	public void setActivityAttendanceVO(
			List<ActivityAttendanceVO> activityAttendanceVO) {
		this.activityAttendanceVO = activityAttendanceVO;
	}

	@Override
	public String toString() {
		return "ActivityBoardVO [activityNo=" + activityNo + ", memberVO="
				+ memberVO + ", activityTitle=" + activityTitle + ", content="
				+ content + ", activityType=" + activityType
				+ ", nowAttendance=" + nowAttendance + ", maxAttendance="
				+ maxAttendance + ", writeDate=" + writeDate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", placeVO=" + placeVO
				+ ", img=" + img + ", activityAttendanceVO="
				+ activityAttendanceVO + ", toppingCount=" + toppingCount
				+ ", activityStatus=" + activityStatus + ", uploadFile="
				+ uploadFile + "]";
	}

}
