package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 팁게시판을 위한 클래스.
 */

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class TipBoardVO {
	int tipNo;
	private MemberVO memberVO; // email(FK)
	private String type;
	private String title;
	private String content;
	private String writeDate; // write_date
	private PlaceVO placeVO; // placeId, placeName, placeDistrict
	private List<UploadImageVO> img; // 사용자가 올리는 사진 img_url
	private List<MultipartFile> uploadFile;
	private int clipCount; // 클립수

	private List<CommentVO> commentVO;

	   public List<CommentVO> getCommentVO() {
	      return commentVO;
	   }

	   public void setCommentVO(List<CommentVO> commentVO) {
	      this.commentVO = commentVO;
	   }
	
	
	
	// 사용자가 이미지를 올릴 때의 생성자
	public TipBoardVO(MemberVO memberVO, String type, String title,  String content,
			PlaceVO placeVO, List<UploadImageVO> img) {
		super();
		this.memberVO = memberVO;
		this.type = type;
		this.title = title;
		this.content = content;
		this.placeVO = placeVO;
		this.img = img;
	}
	// 사용자가 이미지를 올리지 않을 때의 생성자
	public TipBoardVO(MemberVO memberVO, String type,String title, String content,
			PlaceVO placeVO) {
		super();
		this.memberVO = memberVO;
		this.type = type;
		this.title = title;
		this.content = content;
		this.placeVO = placeVO;
	}

	public TipBoardVO() {	}

	// 상세정보를 가져올 때 사용할 생성자
	public TipBoardVO(int tipNo, MemberVO memberVO, String type,String title,
			String content, String writeDate, PlaceVO placeVO,
			List<UploadImageVO> img, int clipCount) {
		this.tipNo = tipNo;
		this.memberVO = memberVO;
		this.type = type;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.placeVO = placeVO;
		this.img = img;
		this.clipCount = clipCount;
	}
	
	
	/*업데이트용 생성자 */
	public TipBoardVO(int tipNo, String type, String title,
			String content, PlaceVO placeVO) {
		super();
		this.tipNo = tipNo;
		this.type = type;
		this.title = title;
		this.content = content;
		this.placeVO = placeVO;
	}
	
	
	

	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public PlaceVO getPlaceVO() {
		return placeVO;
	}
	public void setPlaceVO(PlaceVO placeVO) {
		this.placeVO = placeVO;
	}
	public List<UploadImageVO> getImg() {
		return img;
	}
	public void setImg(List<UploadImageVO> img) {
		this.img = img;
	}
	public int getClipCount() {
		return clipCount;
	}
	public void setClipCount(int clipCount) {
		this.clipCount = clipCount;
	}
	
	
	@Override
	public String toString() {
		return "TipBoardVO [tipNo=" + tipNo + ", memberVO=" + memberVO
				+ ", type=" + type + ", title=" + title + ", content="
				+ content + ", writeDate=" + writeDate + ", placeVO=" + placeVO
				+ ", img=" + img + ", clipCount="
				+ clipCount + "]";
	}

	

	

}
