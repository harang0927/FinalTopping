package model.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.dao.MemberDAO;
import model.vo.FollowVO;
import model.vo.MemberVO;
import model.vo.MessageVO;
import model.vo.forGetMessageListVO;

public class MemberDAOImpl implements MemberDAO{
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void registerMember(MemberVO mvo) throws SQLException {
		sqlSession.insert("Member.registerMember", mvo);
	}

	@Override
	public Object isNicknameExist(String nickName) throws SQLException {
		return sqlSession.selectOne("Member.nickNamecheck", nickName);
	}

	@Override
	public Object isEmailExist(String email) throws SQLException {
		return sqlSession.selectOne("Member.emailcheck", email);
	}

	@Override
	public MemberVO login(MemberVO mvo) throws SQLException {
		return sqlSession.selectOne("Member.login", mvo);
	}

	@Override
	public MemberVO checkAnswerForPassword(MemberVO mvo) throws SQLException {
		return sqlSession.selectOne("Member.checkAnswerForPassword", mvo);
	}

	@Override
	public void changePassword(MemberVO mvo) throws SQLException {
		sqlSession.update("Member.updatePassword", mvo);
	}

	@Override
	public void deleteMember(String email) throws SQLException {
		sqlSession.delete("Member.deleteMember", email);
		
	}

	@Override
	public void updateMember(MemberVO mvo) throws SQLException {
		System.out.println("DAO :: "+mvo);
		sqlSession.update("Member.updateUserInfo", mvo);
	}

	@Override
	public MemberVO showMember(String email) throws SQLException {
		return sqlSession.selectOne("Member.showMember", email);
	}
	/* Follow */
	@Override
	public boolean checkFollow(FollowVO followVO) throws SQLException{
		return sqlSession.selectOne("Member.checkFollow", followVO);
	}
	
	@Override
	public void addFollow(FollowVO followVO) throws SQLException {
		sqlSession.insert("Member.addFollow", followVO);
	}

	@Override
	public void cancelFollow(FollowVO followVO) throws SQLException {
		sqlSession.delete("Member.cancelFollow", followVO);
	}

	@Override
	public int getCountOfFollow(MemberVO mvo) throws SQLException {
		return sqlSession.selectOne("Member.getCountOfFollow", mvo);
	}

	@Override
	public List<FollowVO> getListOfFollow(MemberVO mvo) throws SQLException {
		return sqlSession.selectList("Member.getListOfFollow", mvo);
	}

	@Override
	public int getCountOfMyFollower(MemberVO mvo) throws SQLException {
		return sqlSession.selectOne("Member.getCountOfMyFollower", mvo);
	}

	@Override
	public List<FollowVO> getListOfFollower(MemberVO mvo) throws SQLException {
		return sqlSession.selectList("Member.getListOfFollower", mvo);
	}

	@Override
	public void updateUserImage(MemberVO mvo) throws SQLException {
		sqlSession.update("Member.updateUserImage", mvo);
	}

	@Override
	public void sendMessage(MessageVO messageVO) throws SQLException {
		sqlSession.insert("Member.sendMessageToSendTable", messageVO);
		sqlSession.insert("Member.sendMessageToReceiveTable", messageVO);
	}

	@Override
	public int deleteMessageFromSendTable(int messageNo) throws SQLException {
		System.out.println("DAO :: "+messageNo);
		return sqlSession.delete("Member.deleteMessageFromSendTable", messageNo);
	}
	@Override
	public int deleteMessageFromReceiveTable(int messageNo) throws SQLException {
		return sqlSession.delete("Member.deleteMessageFromReceiveTable", messageNo);
	}
	
	@Override
	public List<MessageVO> getReceiveMessage(forGetMessageListVO fgmlVO)
			throws SQLException {
		return sqlSession.selectList("Member.getReceiveMessage", fgmlVO);
	}

	@Override
	public int getCountOfReceiveMessage(String email) throws SQLException {
		return sqlSession.selectOne("Member.getCountOfReceiveMessage", email);
	}

	@Override
	public List<MessageVO> getSendMessage(forGetMessageListVO fgmlVO)
			throws SQLException {
		return sqlSession.selectList("Member.getSendMessage", fgmlVO);
	}

	@Override
	public int getCountOfSendMessage(String email) throws SQLException {
		return sqlSession.selectOne("Member.getCountOfSendMessage", email);
	}

	@Override
	public MessageVO getSendMessageDetail(int messageNo) throws SQLException {
		return sqlSession.selectOne("Member.getSendMessageDetail", messageNo);
	}
	@Override
	public MessageVO getReceiveMessageDetail(int messageNo) throws SQLException {
		return sqlSession.selectOne("Member.getReceiveMessageDetail", messageNo);
	}
	
	
	public MemberVO getUserInfoByEmail(String email) throws SQLException{
		return sqlSession.selectOne("Member.getUserInfoByEmail", email);
	}
}
