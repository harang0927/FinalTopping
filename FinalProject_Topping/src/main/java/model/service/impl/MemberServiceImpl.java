package model.service.impl;

import java.util.List;

import model.dao.MemberDAO;
import model.service.MemberService;
import model.vo.FollowListVO;
import model.vo.FollowVO;
import model.vo.MemberVO;
import model.vo.MessageListVO;
import model.vo.MessageVO;
import model.vo.PagingBean;
import model.vo.ReceiveMessageListVO;
import model.vo.SendMessageListVO;
import model.vo.forGetMessageListVO;

public class MemberServiceImpl implements MemberService{
	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void registerMember(MemberVO mvo) throws Exception {
		memberDAO.registerMember(mvo);
	}

	@Override
	public MemberVO showMember(String email) throws Exception {
		return memberDAO.showMember(email);
	}

	@Override
	public boolean isNicknameExist(String nickName) throws Exception {
		boolean result = false;
		if(memberDAO.isNicknameExist(nickName)!=null)
			result = true;
		return result;
	}

	@Override
	public boolean isEmailExist(String email) throws Exception {
		boolean result = false;
		if(memberDAO.isEmailExist(email)!=null)
			result = true;
		return result;
	}

	@Override
	public MemberVO login(MemberVO mvo) throws Exception {
		return memberDAO.login(mvo);
	}

	@Override
	public MemberVO checkAnswerForPassword(MemberVO mvo) throws Exception {
		return memberDAO.checkAnswerForPassword(mvo);
	}

	@Override
	public void changePassword(MemberVO mvo) throws Exception {
		memberDAO.changePassword(mvo);
	}

	
	public MemberVO getUserInfoByEmail(String email) throws Exception{
		return memberDAO.getUserInfoByEmail(email);
	}
}
