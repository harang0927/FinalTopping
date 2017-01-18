package model.vo;

import org.springframework.web.multipart.MultipartFile;

/*
 * 작성 일자: 2016.11.25
 * 설명: 회원정보를 다루는 클래스
 */
public class MemberVO {
	String email;
	String nickName;
	String password;
	String passQuestion;
	String passAnswer;
	String gender; //!![경민,소희]boolean->string
	String imgUrl; // 프로필사진 img_url
	int checkAdmin; // 관리자인자 !![경민,소희]boolean->int
	String address; // 주소(필수X)
	String selfIntroduce; // 자기소개글
	MultipartFile uploadImage;

	/* Message 테스트 용 삭제 요망 */
	public MemberVO(String email) {
		super();
		this.email = email;
	}

	
	
	public MemberVO(String email, String nickName, String password,
			String passQuestion, String passAnswer, String gender,
			int checkAdmin, MultipartFile uploadImage) {
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.passQuestion = passQuestion;
		this.passAnswer = passAnswer;
		this.gender = gender;
		this.checkAdmin = checkAdmin;
		this.uploadImage = uploadImage;
	}

	public MemberVO() {	}

	public MemberVO(String email, String nickName, String password,
			String passQuestion, String passAnswer, String gender,
			String imgUrl, int checkAdmin, String address,
			String selfIntroduce, MultipartFile uploadImage) {
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.passQuestion = passQuestion;
		this.passAnswer = passAnswer;
		this.gender = gender;
		this.imgUrl = imgUrl;
		this.checkAdmin = checkAdmin;
		this.address = address;
		this.selfIntroduce = selfIntroduce;
		this.uploadImage = uploadImage;
	}

	public MultipartFile getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassQuestion() {
		return passQuestion;
	}

	public void setPassQuestion(String passQuestion) {
		this.passQuestion = passQuestion;
	}

	public String getPassAnswer() {
		return passAnswer;
	}

	public void setPassAnswer(String passAnswer) {
		this.passAnswer = passAnswer;
	}

	public String isGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getCheckAdmin() {
		return checkAdmin;
	}

	public void setCheckAdmin(int checkAdmin) {
		this.checkAdmin = checkAdmin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSelfIntroduce() {
		return selfIntroduce;
	}

	public void setSelfIntroduce(String selfIntroduce) {
		this.selfIntroduce = selfIntroduce;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", nickName=" + nickName
				+ ", password=" + password + ", passQuestion=" + passQuestion
				+ ", passAnswer=" + passAnswer + ", gender=" + gender
				+ ", imgUrl=" + imgUrl + ", checkAdmin=" + checkAdmin
				+ ", address=" + address + ", selfIntroduce=" + selfIntroduce
				+ "]";
	}

}
