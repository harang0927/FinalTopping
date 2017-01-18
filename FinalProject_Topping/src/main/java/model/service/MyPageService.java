package model.service;

import java.util.HashMap;

import model.vo.ActivityListVO;
import model.vo.FollowListVO;
import model.vo.FollowVO;
import model.vo.FreeBoardListVO;
import model.vo.MemberVO;
import model.vo.MessageListVO;
import model.vo.MessageVO;
import model.vo.PagingQnAVO;
import model.vo.PagingToppingListVO;
import model.vo.QnAListVO;
import model.vo.ReceiveMessageListVO;
import model.vo.SendMessageListVO;
import model.vo.TipListVO;
import model.vo.forGetMessageListVO;

public interface MyPageService {

	/* User */
	public void deleteMember(String email) throws Exception;

	public void updateMember(MemberVO mvo) throws Exception;

	public MemberVO showMember(String email) throws Exception;

	public void updateUserImage(MemberVO mvo) throws Exception;

	/* Follow */
	public boolean checkFollow(FollowVO follow) throws Exception;
	
	public String changeFollow(FollowVO followVO) throws Exception;

	public FollowListVO getFollowPageList(MemberVO mvo) throws Exception;

	public void cancelFollow(FollowVO followVO) throws Exception;

	/* AttendActivity */
	public ActivityListVO getListOfAttendActivity(
			HashMap<String, String> forAttendActivity) throws Exception;

	/* Topping */
	public PagingToppingListVO getListOfToppingPlaceByEmail(
			HashMap<String, String> forMypage) throws Exception;

	public PagingToppingListVO getListOfToppingActivityByEmail(
			HashMap<String, String> forMypage) throws Exception;

	/* Message */
	public void sendMessage(MessageVO messageVO) throws Exception;

	public int deleteMessageFromSendTable(int messageNo) throws Exception;

	public int deleteMessageFromReceiveTable(int messageNo) throws Exception;

	public MessageListVO getMessageList(forGetMessageListVO fgmlVO)
			throws Exception;

	public SendMessageListVO getSendMessageList(forGetMessageListVO fgmlVO)
			throws Exception;

	public ReceiveMessageListVO getReceiveMessageList(forGetMessageListVO fgmlVO)
			throws Exception;

	public MessageVO getSendMessageDetail(int messageNo) throws Exception;

	public MessageVO getReceiveMessageDetail(int messageNo) throws Exception;

	/* Q&A */
	public QnAListVO getListOfMyQnA(PagingQnAVO pagingQnAVO) throws Exception;

	public void deleteQnA(int parseInt) throws Exception;

	/* 내가 쓴 글 */
	public ActivityListVO myActivityList(HashMap<String, String> forMyActivity)
			throws Exception;

	public TipListVO myTipList(HashMap<String, String> forMyTip)
			throws Exception;

	public FreeBoardListVO myPostingList(HashMap<String, String> forMyPost)
			throws Exception;
}
