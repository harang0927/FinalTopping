package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.NoticeService;
import model.vo.MemberVO;
import model.vo.NoticeListVO;
import model.vo.NoticeVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class NoticeController extends MultiActionController {
	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	//
	public ModelAndView getNoticeList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoticeListVO lvo = noticeService.getNoticeList(request
				.getParameter("pageNo"));
		System.out.println(lvo);
		return new ModelAndView("notice", "lvo", lvo);
	}

	public ModelAndView writeNotice(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, NoticeVO nvo)
			throws Exception {
		// String email=request.getParameter("email");
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");

		nvo.setMemberVO(mvo);

		noticeService.writeNotice(nvo);
		return new ModelAndView("shownotice", "nvo", nvo);
	}

	// showContent
	public ModelAndView showNotice(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");

		noticeService.updateHitsOfNotice(request.getParameter("noticeNo"));

		NoticeVO nvo = noticeService.showNotice(request
				.getParameter("noticeNo"));
		return new ModelAndView("shownotice", "nvo", nvo);
	}

	// updateNoticeView
	public ModelAndView updateNoticeView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String noticeNo = request.getParameter("noticeNo");
		NoticeVO nvo = noticeService.showNotice(noticeNo);

		return new ModelAndView("update_notice", "nvo", nvo);
	}

	// updateBoard
	public ModelAndView updateNotice(HttpServletRequest request,
			HttpServletResponse response, NoticeVO nvo) throws Exception {

		noticeService.updateNotice(nvo);

		return new ModelAndView("shownotice", "nvo",
				noticeService.showNotice(request.getParameter("noticeNo")));
	}

	// deleteNotice
	public ModelAndView deleteNotice(HttpServletRequest request,
			HttpServletResponse response, NoticeVO nvo) throws Exception {

		noticeService.deleteNotice(nvo.getNoticeNo());
		NoticeListVO lvo = noticeService.getNoticeList(request
				.getParameter("pageNo"));

		return new ModelAndView("notice", "lvo", lvo);
	}
}
