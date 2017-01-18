package model.vo;
/*
 * 작성 일자: 2016.11.25
 * 설명: 팔로우 VO클래스
 */
public class FollowVO {
	MemberVO followerUser; // 팔로우를 하는 사람
	MemberVO followUser; // 팔로우를 당하는 사람

	public FollowVO() {	}

	public FollowVO(MemberVO followerUser, MemberVO followUser) {
		super();
		this.followerUser = followerUser;
		this.followUser = followUser;
	}

	public MemberVO getFollowerUser() {
		return followerUser;
	}

	public void setFollowerUser(MemberVO followerUser) {
		this.followerUser = followerUser;
	}

	public MemberVO getFollowUser() {
		return followUser;
	}

	public void setFollowUser(MemberVO followUser) {
		this.followUser = followUser;
	}

	@Override
	public String toString() {
		return "FollowVO [followerUser=" + followerUser + ", followUser="
				+ followUser + "]";
	}

}
