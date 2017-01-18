package model.service;

import java.sql.SQLException;

import model.vo.FollowListVO;
import model.vo.FollowVO;
import model.vo.MemberVO;
import model.vo.MessageListVO;
import model.vo.MessageVO;
import model.vo.ReceiveMessageListVO;
import model.vo.SendMessageListVO;
import model.vo.forGetMessageListVO;

public interface MemberService {
	public void registerMember(MemberVO mvo) throws Exception;
	public boolean isNicknameExist(String nickName) throws Exception;
	public boolean isEmailExist(String email) throws Exception;
	public MemberVO login(MemberVO mvo) throws Exception;
	public MemberVO checkAnswerForPassword(MemberVO mvo) throws Exception;
	public void changePassword(MemberVO mvo) throws Exception;
	public MemberVO showMember(String email) throws Exception;
	
	public MemberVO getUserInfoByEmail(String email) throws Exception;
}
