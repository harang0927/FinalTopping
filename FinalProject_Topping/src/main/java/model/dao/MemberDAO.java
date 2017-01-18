package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.vo.FollowVO;
import model.vo.MemberVO;
import model.vo.MessageVO;
import model.vo.forGetMessageListVO;

public interface MemberDAO {
	public void registerMember(MemberVO mvo) throws SQLException;
	public Object isNicknameExist(String nickName) throws SQLException;
	public Object isEmailExist(String email) throws SQLException;
	public MemberVO login(MemberVO mvo) throws SQLException;
	public MemberVO checkAnswerForPassword(MemberVO mvo) throws SQLException;
	public void changePassword(MemberVO mvo) throws SQLException;
	public void deleteMember(String email)throws SQLException;
	public void updateMember(MemberVO mvo) throws SQLException;
	public MemberVO showMember(String email) throws SQLException;
	
	public void updateUserImage(MemberVO mvo) throws SQLException;
	
	/* Follow */
	public boolean checkFollow(FollowVO followVO) throws SQLException;
	public void addFollow(FollowVO followVO) throws SQLException;
	public void cancelFollow(FollowVO followVO) throws SQLException;
	public int getCountOfFollow(MemberVO mvo) throws SQLException;
	public List<FollowVO> getListOfFollow(MemberVO mvo) throws SQLException;
	public int getCountOfMyFollower(MemberVO mvo) throws SQLException;
	public List<FollowVO> getListOfFollower(MemberVO mvo) throws SQLException;
	
	/* Message */
	public void sendMessage(MessageVO messageVO) throws SQLException;
	public int deleteMessageFromSendTable(int messageNo) throws SQLException;
	public int deleteMessageFromReceiveTable(int messageNo) throws SQLException;
	
	public List<MessageVO> getReceiveMessage(forGetMessageListVO fgmlVO) throws SQLException;
	public int getCountOfReceiveMessage(String email) throws SQLException;
	public List<MessageVO> getSendMessage(forGetMessageListVO fgmlVO) throws SQLException;
	public int getCountOfSendMessage(String email) throws SQLException;
	public MessageVO getSendMessageDetail(int messageNo) throws SQLException;
	public MessageVO getReceiveMessageDetail(int messageNo) throws SQLException;
	
	public MemberVO getUserInfoByEmail(String email) throws SQLException;
}
