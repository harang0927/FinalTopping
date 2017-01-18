package model.vo;

import java.util.List;

public class FollowListVO {
	int followCount;
	List<FollowVO> followList;
	int followerCount;
	List<FollowVO> followerList;
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	public List<FollowVO> getFollowList() {
		return followList;
	}
	public void setFollowList(List<FollowVO> followList) {
		this.followList = followList;
	}
	public int getFollowerCount() {
		return followerCount;
	}
	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}
	public List<FollowVO> getFollowerList() {
		return followerList;
	}
	public void setFollowerList(List<FollowVO> followerList) {
		this.followerList = followerList;
	}
	public FollowListVO(int followCount, List<FollowVO> followList,
			int followerCount, List<FollowVO> followerList) {
		super();
		this.followCount = followCount;
		this.followList = followList;
		this.followerCount = followerCount;
		this.followerList = followerList;
	}
	public FollowListVO() {
	}
}
