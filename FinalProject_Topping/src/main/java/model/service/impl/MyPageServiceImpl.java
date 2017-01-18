package model.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.ActivityDAO;
import model.dao.FreeBoardDAO;
import model.dao.MemberDAO;
import model.dao.PlaceDAO;
import model.dao.QnADAO;
import model.dao.TipDAO;
import model.service.MyPageService;
import model.vo.ActivityBoardVO;
import model.vo.ActivityListVO;
import model.vo.FollowListVO;
import model.vo.FollowVO;
import model.vo.FreeBoardListVO;
import model.vo.FreeBoardVO;
import model.vo.MemberVO;
import model.vo.MessageListVO;
import model.vo.MessageVO;
import model.vo.PagingBean;
import model.vo.PagingBeanOfMyPage;
import model.vo.PagingQnAVO;
import model.vo.PagingToppingListVO;
import model.vo.QnAListVO;
import model.vo.QnAVO;
import model.vo.ReceiveMessageListVO;
import model.vo.SendMessageListVO;
import model.vo.TipBoardVO;
import model.vo.TipListVO;
import model.vo.ToppingListVO;
import model.vo.forGetMessageListVO;

public class MyPageServiceImpl implements MyPageService {
	MemberDAO memberDAO;
	ActivityDAO activityDAO;
	FreeBoardDAO freeBoardDAO;
	TipDAO tipBoardDAO;
	PlaceDAO placeDAO;

	public void setPlaceDAO(PlaceDAO placeDAO) {
		this.placeDAO = placeDAO;
	}

	public void setActivityDAO(ActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
	}

	public void setFreeBoardDAO(FreeBoardDAO freeBoardDAO) {
		this.freeBoardDAO = freeBoardDAO;
	}

	public void setTipBoardDAO(TipDAO tipBoardDAO) {
		this.tipBoardDAO = tipBoardDAO;
	}

	QnADAO qnaDAO;

	public void setQnaDAO(QnADAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void deleteMember(String email) throws Exception {
		memberDAO.deleteMember(email);

	}

	@Override
	public MemberVO showMember(String email) throws Exception {
		return memberDAO.showMember(email);
	}

	@Override
	public void updateMember(MemberVO mvo) throws Exception {
		memberDAO.updateMember(mvo);

	}

	@Override
	public void updateUserImage(MemberVO mvo) throws Exception {
		memberDAO.updateUserImage(mvo);
	}

	/* Follow */
	@Override
	public boolean checkFollow(FollowVO followVO) throws Exception{
		return memberDAO.checkFollow(followVO);
	}
	@Override
	public String changeFollow(FollowVO followVO) throws Exception{
		if(memberDAO.checkFollow(followVO)){
			memberDAO.cancelFollow(followVO);
			return "UnFollow";
		}else{
			memberDAO.addFollow(followVO);
			return "Follow";
		}
	}
	
	@Override
	public FollowListVO getFollowPageList(MemberVO mvo) throws Exception {
		FollowListVO listVO = new FollowListVO();

		listVO.setFollowCount(memberDAO.getCountOfFollow(mvo));
		listVO.setFollowList(memberDAO.getListOfFollow(mvo));
		listVO.setFollowerCount(memberDAO.getCountOfMyFollower(mvo));
		listVO.setFollowerList(memberDAO.getListOfFollower(mvo));
		for (FollowVO vo : listVO.getFollowList()) {
			System.out.println(vo);
		}

		return listVO;
	}


	@Override
	public void cancelFollow(FollowVO followVO) throws Exception {
		memberDAO.cancelFollow(followVO);
	}

	/* AttendActivity */
	public ActivityListVO getListOfAttendActivity(
			HashMap<String, String> forAttendActivity) throws Exception {
		int count = activityDAO.getCountOfAttendActivity(forAttendActivity
				.get("email"));
		List<ActivityBoardVO> list = activityDAO
				.getListOfAttendActivity(forAttendActivity);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forAttendActivity.get("pageNo")));

		return new ActivityListVO(list, pagingBean);
	}

	/* Message */
	@Override
	public void sendMessage(MessageVO messageVO) throws Exception {
		memberDAO.sendMessage(messageVO);
	}

	/* 방법1. 보낸 메시지 / 받은 메시지 모두 가져오기 */
	@Override
	public MessageListVO getMessageList(forGetMessageListVO fgmlVO)
			throws Exception {
		int sendMessageCount = memberDAO.getCountOfSendMessage(fgmlVO
				.getSenderEmail());
		List<MessageVO> sendMessageList = memberDAO.getSendMessage(fgmlVO);
		int receiveMessageCount = memberDAO.getCountOfReceiveMessage(fgmlVO
				.getReceiverEmail());
		List<MessageVO> receiveMessageList = memberDAO
				.getReceiveMessage(fgmlVO);
		MessageListVO mListVO = new MessageListVO(sendMessageCount,
				sendMessageList, receiveMessageCount, receiveMessageList);

		return mListVO;
	}

	@Override
	public MessageVO getSendMessageDetail(int messageNo) throws Exception {
		return memberDAO.getSendMessageDetail(messageNo);
	}

	public MessageVO getReceiveMessageDetail(int messageNo) throws Exception {
		return memberDAO.getReceiveMessageDetail(messageNo);
	}

	/* 방법2. 보낸 메시지와 받은 메시지 따로 가져오기 */
	@Override
	public SendMessageListVO getSendMessageList(forGetMessageListVO fgmlVO)
			throws Exception {
		int sendMessageCount = memberDAO.getCountOfSendMessage(fgmlVO
				.getSenderEmail());
		List<MessageVO> sendMessageList = memberDAO.getSendMessage(fgmlVO);
		PagingBean pagingBean = new PagingBeanOfMyPage(sendMessageCount,
				fgmlVO.getPageNo());
		SendMessageListVO sendMessageListVO = new SendMessageListVO(
				sendMessageCount, sendMessageList, pagingBean);

		return sendMessageListVO;
	}

	@Override
	public ReceiveMessageListVO getReceiveMessageList(forGetMessageListVO fgmlVO)
			throws Exception {
		int receiveMessageCount = memberDAO.getCountOfReceiveMessage(fgmlVO
				.getReceiverEmail());
		List<MessageVO> receiveMessageList = memberDAO
				.getReceiveMessage(fgmlVO);

		PagingBean pagingBean = new PagingBeanOfMyPage(receiveMessageCount,
				fgmlVO.getPageNo());
		ReceiveMessageListVO receiveMessageListVO = new ReceiveMessageListVO(
				receiveMessageCount, receiveMessageList, pagingBean);

		return receiveMessageListVO;
	}

	@Override
	public int deleteMessageFromSendTable(int messageNo) throws Exception {
		return memberDAO.deleteMessageFromSendTable(messageNo);
	}

	@Override
	public int deleteMessageFromReceiveTable(int messageNo) throws Exception {
		return memberDAO.deleteMessageFromReceiveTable(messageNo);
	}

	/* Q&A */
	@Override
	public QnAListVO getListOfMyQnA(PagingQnAVO pagingQnAVO)
			throws SQLException {
		// System.out.println(":: " + getClass().getName() +
		// ".getListOfMyQnA call.. ");
		int count = qnaDAO.getCountOfMyQnA(pagingQnAVO.getEmail());
		List<QnAVO> list = qnaDAO.getListOfMyQnA(pagingQnAVO);
		int pageNo = Integer.parseInt(pagingQnAVO.getPageNo());
		QnAListVO qaListVO = new QnAListVO(list, new PagingBeanOfMyPage(count,
				pageNo));

		// System.out.println(list);
		return qaListVO;
	}

	@Override
	public void deleteQnA(int parseInt) throws Exception {
		qnaDAO.deleteQnA(parseInt);
	}

	@Override
	public ActivityListVO myActivityList(HashMap<String, String> forMyActivity)
			throws Exception {
		int count = activityDAO
				.getCountOfMyActivity(forMyActivity.get("email"));
		List<ActivityBoardVO> list = activityDAO
				.getListOfMyActivity(forMyActivity);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forMyActivity.get("pageNo")));

		return new ActivityListVO(list, pagingBean);
	}

	@Override
	public TipListVO myTipList(HashMap<String, String> forMyTip)
			throws Exception {
		int count = tipBoardDAO.getCountOfMyTip(forMyTip.get("email"));
		List<TipBoardVO> tipList = tipBoardDAO.getListOfMyTip(forMyTip);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forMyTip.get("pageNo")));

		return new TipListVO(pagingBean, tipList);
	}

	@Override
	public FreeBoardListVO myPostingList(HashMap<String, String> forMyPost)
			throws Exception {

		int count = freeBoardDAO.getCountOfMyPosts(forMyPost.get("email"));
		List<FreeBoardVO> list = freeBoardDAO.getListOfMyPosts(forMyPost);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forMyPost.get("pageNo")));

		return new FreeBoardListVO(list, pagingBean);
	}

	@Override
	public PagingToppingListVO getListOfToppingPlaceByEmail(
			HashMap<String, String> forMypage) throws Exception {
		int count = placeDAO.getCountOfToppingPlaceByEmail(forMypage
				.get("email"));
		List<ToppingListVO> list = placeDAO
				.getListOfToppingPlaceByEmail(forMypage);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forMypage.get("pageNo")));

		return new PagingToppingListVO(pagingBean, list);
	}

	@Override
	public PagingToppingListVO getListOfToppingActivityByEmail(
			HashMap<String, String> forMypage) throws Exception {
		int count = activityDAO.getCountOfToppingActivityByEmail(forMypage
				.get("email"));
		List<ToppingListVO> list = activityDAO
				.getListOfToppingActivityByEmail(forMypage);
		PagingBean pagingBean = new PagingBeanOfMyPage(count,
				Integer.parseInt(forMypage.get("pageNo")));

		return new PagingToppingListVO(pagingBean, list);
	}

}
