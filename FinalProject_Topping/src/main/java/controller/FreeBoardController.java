package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.FreeBoardService;
import model.service.MemberService;
import model.vo.CommentVO;
import model.vo.FreeBoardListVO;
import model.vo.FreeBoardVO;
import model.vo.MemberVO;
import model.vo.PagingFreeBoardVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class FreeBoardController extends MultiActionController {

	private FreeBoardService freeBoardService;
	private MemberService memberService;

	public void setFreeBoardService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public ModelAndView getFreeBoardList(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		System.out.println("getFreeBoardList....call....");
		FreeBoardListVO flvo = freeBoardService.getFreeBoardList(request
				.getParameter("pageNo"));
		System.out.println("controller ::" + flvo);
		return new ModelAndView("show_freeboardlist", "flvo", flvo);
	}// getFreeBoardList

	public ModelAndView getFreeBoardListAjax(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		System.out.println("getFreeBoardList....call....");
		FreeBoardListVO flvo = freeBoardService.getFreeBoardList(request
				.getParameter("pageNo"));
		System.out.println("controller ::" + flvo);
		return new ModelAndView("JsonView", "flvo", flvo);
	}// getFreeBoardList

	public ModelAndView addPostingToFreeBoard(HttpServletRequest request,
			HttpServletResponse response, FreeBoardVO fbvo) throws SQLException {
		System.out.println("addPostingToFreeBoard 호출됨");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		if (mvo == null) { // 로그인 안했다.
			return new ModelAndView("redirect:/main01.jsp");
		}
		// write 하기 전에 mvo를 주입해야 한다...fbvo와 mvo의 hasing이 성립
		fbvo.setMemberVO(mvo);
		freeBoardService.addPostingToFreeBoard(fbvo);
		return new ModelAndView("show_content", "fbvo", fbvo);
	}// addPostingToFreeBoard

	public ModelAndView deletePostingFromFreeBoard(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {

		freeBoardService.deletePostingFromFreeBoard(Integer.parseInt(request
				.getParameter("postingNo")));
		FreeBoardListVO flvo = freeBoardService.getFreeBoardList("1");
		return new ModelAndView("show_freeboardlist", "flvo", flvo);
	}// deletePostingFromFreeBoard

	// showPositngOnFreeBoard
	public ModelAndView showPositngOnFreeBoard(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".showPositngOnFreeBoard call...");

		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null)
			return new ModelAndView("redirect:/main01.jsp");

		int postingNo = Integer.parseInt(request.getParameter("postingNo"));

		freeBoardService.updateHitsOfPosting(postingNo);

		FreeBoardVO fbvo = freeBoardService.showPositngOnFreeBoard(postingNo);
		String email = fbvo.getMemberVO().getEmail();
		System.out.println("작성자 이메일:" + email);

		MemberVO member = memberService.showMember(email);
		System.out.println("작성자정보 받아오기.." + member);
		fbvo.setMemberVO(member);
		fbvo.setCommentVO(freeBoardService
				.getAllCommentFromFreeBoard(postingNo));
		return new ModelAndView("show_content", "fbvo", fbvo);
	}// showPositngOnFreeBoard

	// updateView
	public ModelAndView updateView(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws SQLException {

		int postingNo = Integer.parseInt(request.getParameter("postingNo"));
		System.out.println("postingNo" + postingNo);
		FreeBoardVO fbvo = freeBoardService.showPositngOnFreeBoard(postingNo);
		return new ModelAndView("freeboard_update", "fbvo", fbvo);
	}

	// updateToPosting
	public ModelAndView updateToPosting(HttpServletRequest request,
			HttpServletResponse response, FreeBoardVO fbvo) throws SQLException {
		freeBoardService.updateToPosting(fbvo);

		return new ModelAndView("show_content", "fbvo",
				freeBoardService.showPositngOnFreeBoard(fbvo.getPostingNo()));
	}

	// updateView 업데이트 이후 수정된 사항 보여주기
	public ModelAndView updateView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int postingNo = Integer.parseInt(request.getParameter("postingNo"));
		FreeBoardVO fbvo = freeBoardService.showPositngOnFreeBoard(postingNo);

		return new ModelAndView("freeboard_update", "fbvo", fbvo);
	}

	//

	public ModelAndView listbyPostingHeader(HttpServletRequest request,
			HttpServletResponse response, PagingFreeBoardVO pfbvo)
			throws SQLException {
		System.out.println("listbyPostingHeader...call");
		/*
		 * String postingHeader=request.getParameter("postingHeader");
		 * pfbvo.setPostingHeader(postingHeader);
		 */

		FreeBoardListVO flvo = freeBoardService.listbyPostingHeader(pfbvo);

		return new ModelAndView("JsonView", "flvo", flvo);

	}

	// comment
	public ModelAndView addCommentToFreeBoard(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToFreeBoard call..");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		System.out.println("member??" + mvo);

		if (mvo == null)
			return new ModelAndView("main01");
		vo.setMemberVO(mvo);

		freeBoardService.addCommentToFreeBoard(vo);
		System.out.println("vo???" + vo);
		return new ModelAndView("JsonView", "cmtvo", vo);

	}

	public ModelAndView deleteFreeBoardComment(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteFreeBoardComment call..");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		freeBoardService.deleteFreeBoardComment(commentNo);
		return new ModelAndView("JsonView");

	}

	public ModelAndView updateFreeBoardComment(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".updateFreeBoardComment call..");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String content = request.getParameter("content");

		freeBoardService.updateFreeBoardComment(new CommentVO(commentNo,
				content));
		return new ModelAndView("JsonView");

	}
}
