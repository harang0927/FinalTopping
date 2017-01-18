package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.QnAService;
import model.vo.QnAListVO;
import model.vo.MemberVO;
import model.vo.QnAVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class QnAController extends MultiActionController {

	private QnAService qnaService;

	public void setQnaService(QnAService qnaService) {
		this.qnaService = qnaService;
	}

	public ModelAndView writeQuestion(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, QnAVO qnavo)
			throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/index.jsp");
		}
		qnavo.setMemberVO(mvo);
		qnaService.writeQuestion(qnavo);
		System.out.println(qnavo.getWriteDate());
		return new ModelAndView("show_qna", "qnavo", qnavo);
	}

	public ModelAndView answerForUserQnA(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, QnAVO qnavo)
			throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo.getCheckAdmin() != 2) {
			return new ModelAndView("redirect:/index.jsp");
		}
		mvo.setEmail(qnavo.getMemberVO().getEmail());
		qnavo.setMemberVO(mvo);
		System.out.println("answerForUserQnA 전 :: " + qnavo);
		qnaService.answerForUserQnA(qnavo);
		qnavo.setQuestionNo(Integer.parseInt(request.getParameter("questionNo")));
		System.out.println("answerForUserQnA 후 ::  " + qnavo);
		return new ModelAndView("show_qna", "qnavo", qnavo);
	}

	public ModelAndView qnaAdminList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo.getCheckAdmin() != 2) {
			return new ModelAndView("redirect:/index.jsp");
		}
		// System.out.println(mvo.getCheckAdmin()+" "+mvo.getEmail());
		QnAListVO qlvo = qnaService.getListOfAllQnA(request
				.getParameter("pageNo"));
		// System.out.println("pageNo: "+request.getParameter("pageNo")); // ""
		// System.out.println("qlvo: "+qlvo);
		return new ModelAndView("list_allqna", "qlvo", qlvo);
	}

	public ModelAndView showQnA(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, QnAVO qnavo)
			throws Exception {

		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null)
			return new ModelAndView("redirect:/index.jsp");
		qnavo = qnaService.showQnA(request.getParameter("qnaNo"));

		return new ModelAndView("show_qna", "qnavo", qnavo);
	}
	/*
	 * public ModelAndView showMemberQnA(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception{
	 * 
	 * MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");
	 * if(mvo==null) return new ModelAndView("redirect:/index.jsp"); QnAVO qvo =
	 * qnaService.showQnA(request.getParameter("qnaNo"));
	 * 
	 * return new ModelAndView("show_qna","qvo",qvo); }
	 */
	
	public ModelAndView showMyQnA(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, QnAVO qnavo)
			throws Exception {

		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null)
			return new ModelAndView("redirect:/index.jsp");
		qnavo = qnaService.showQnA(request.getParameter("qnaNo"));

		return new ModelAndView("JsonView", "qnavo", qnavo);
	}

}
