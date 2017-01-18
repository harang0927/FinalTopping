package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.MemberService;
import model.vo.MemberVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class MemberController extends MultiActionController {
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public ModelAndView register(HttpServletRequest request,
			HttpServletResponse response, MemberVO pvo) throws Exception {
		memberService.registerMember(pvo);
		return new ModelAndView("result_before_login", "mvo", pvo);
	}

	public ModelAndView emailCheck(HttpServletRequest request,
			HttpServletResponse response, MemberVO pvo) throws Exception {
		String email = request.getParameter("email");

		boolean flag = memberService.isEmailExist(email);
		System.out.println(flag);

		return new ModelAndView("JsonView", "flag", flag);
	}

	public ModelAndView nickNameCheck(HttpServletRequest request,
			HttpServletResponse response, MemberVO pvo) throws Exception {
		String nickName = request.getParameter("nickName");

		boolean flag = memberService.isNicknameExist(nickName);
		return new ModelAndView("JsonView", "flag", flag);
	}

	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, MemberVO pvo)
			throws Exception {
		String path = "login_fail";
		MemberVO rvo = memberService.login(pvo);

		if (rvo != null) {
			session.setAttribute("mvo", rvo);
			path = "main02";
		}

		return new ModelAndView(path);
	}

	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		if (session.getAttribute("mvo") != null)
			session.invalidate();

		return new ModelAndView("redirect:/main01.jsp");
	}

	// passupdateMember
	public ModelAndView passsearchMember(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, MemberVO pvo)
			throws Exception {
		String path = "passsearch_fail";
		MemberVO rvo = memberService.checkAnswerForPassword(pvo);

		if (rvo != null) {
			session.setAttribute("mvo", rvo);
			path = "passupdate";
		}

		return new ModelAndView(path);
	}

	// passupdateMember
	public ModelAndView passupdateMember(HttpServletRequest request,
			HttpServletResponse response, MemberVO pvo) throws Exception {
		memberService.changePassword(pvo);
		return new ModelAndView("result_before_login", "mvo", pvo);
	}

	
	public ModelAndView getUserInfoByEmail(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String email = request.getParameter("email");
		MemberVO vo = memberService.getUserInfoByEmail(email);
		System.out.println("userInfo :: "+vo);
		return new ModelAndView("JsonView", "userInfo", vo);
	}
}
