package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.CommonService;
import model.service.TipService;
import model.vo.CommentVO;
import model.vo.MemberVO;
import model.vo.PagingClipListVO;
import model.vo.PagingTipPlaceIdVO;
import model.vo.TipBoardVO;
import model.vo.TipListVO;
import model.vo.UploadImageVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class TipController extends MultiActionController {

	private TipService tipService;
	private CommonService commonService;
	private String path;

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setTipService(TipService tipService) {
		this.tipService = tipService;
	}

	public ModelAndView writeTip(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, TipBoardVO tbvo)
			throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		tbvo.setMemberVO(mvo);

		List<MultipartFile> files = tbvo.getUploadFile();
		List<UploadImageVO> upload = new ArrayList<UploadImageVO>();

		if (!files.isEmpty()) {

			for (int i = 0; i < files.size(); i++) {

				String orgName = files.get(i).getOriginalFilename();
				if (orgName != "") {
					String newName = System.currentTimeMillis() + "_" + orgName;
					String savePath = path + newName;

					System.out.println("orgName: " + orgName + "\nnewName: "
							+ newName + "\nsavePath: " + savePath);

					files.get(i).transferTo(new File(savePath));

					upload.add(new UploadImageVO(orgName, newName, savePath));
				}
			}
		}
		tbvo.setImg(upload);
		tipService.addTipToTipBoard(tbvo);

		int tipNo = tbvo.getTipNo(); // seq 받아오기.
		System.out.println("tipNo: " + tipNo);
		for (UploadImageVO img : upload) { // 관리자가 img 관리하기 위해서
			if (img.getOrgName() != "") {
				img.setBoardNo(tipNo);
				// seqence가 boardNo가 돼서 uploadimage테이블에 저장
				img.setBoardType(1);
				commonService.uploadImage(img);
				System.out.println("uploading:" + img);
			}

			// activity: 0번게시판
		}
		Thread.sleep(5000);
		return new ModelAndView("redirect:tip.do?command=showTipByNo&&tipNo="
				+ tipNo);
	}

	public ModelAndView getTipBoardList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null)
			pageNo = "1";

		TipListVO tlvo = tipService.getTipBoardList(pageNo);

		return new ModelAndView("tip_list", "tlvo", tlvo);
	}

	public ModelAndView changeTipStatus(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		if (mvo == null)
			return new ModelAndView("main01.jsp");
		String email = mvo.getEmail();
		String tipNo = request.getParameter("tipNo");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("tipNo", tipNo);
		boolean flag = tipService.changeTipStatus(map);

		int count = tipService.clipCountByTipNo(Integer.parseInt(tipNo));
		map.put("count", String.valueOf(count));
		map.put("status", String.valueOf(flag));

		return new ModelAndView("JsonView", "map", map);
	}

	public ModelAndView getTipBoardSearchList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ "...getTipBoardSearchList()...call");
		String[] type = null;
		if (request.getParameter("type") != null
				&& request.getParameter("type") != "") {
			type = request.getParameter("type").split(",");
		}
		String title = request.getParameter("title");
		String pageNo = "1";
		if (request.getParameter("pageNo") != null
				&& request.getParameter("pageNo") != "")
			pageNo = request.getParameter("pageNo");
		System.out.println("Controller : " + pageNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		if (type != null)
			map.put("type", type);
		if (title != null)
			map.put("title", title);
		TipListVO list = tipService.getTipBoardSearchList(map);
		System.out.println("map :: " + map);
		System.out.println("list size::" + list.getTipList().size());
		System.out.println("list.tipList : : " + list.getTipList());
		return new ModelAndView("JsonView", "list", list);
	}

	public ModelAndView showTipByNo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, TipBoardVO tbvo)
			throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		int tipNo = Integer.parseInt(request.getParameter("tipNo"));
		tbvo = tipService.showTipByNo(tipNo);
		tbvo.setClipCount(tipService.clipCountByTipNo(tipNo));
		tbvo.setImg(tipService.getUploadImageForTip(tipNo));
		tbvo.setCommentVO(tipService.getAllCommentFromTipBoard(tipNo));
		return new ModelAndView("show_tip", "tbvo", tbvo);
	}

	public ModelAndView deleteTipByNo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, TipBoardVO tbvo)
			throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		int tipNo = Integer.parseInt(request.getParameter("tipNo"));
		tipService.deleteFromTipBoard(tipNo);
		String newName = request.getParameter("newName");
		if (newName != null) {
			commonService.deleteUploadImg(path + newName);
		}
		return new ModelAndView("redirect:tip.do?command=getTipBoardList");
	}

	public ModelAndView deleteTipImg(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		int imgNo = Integer.parseInt(request.getParameter("imgNo"));
		tipService.deleteTipImg(imgNo);
		return new ModelAndView("JsonView", "imgNo", imgNo);
	}

	public ModelAndView updateTipView(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, TipBoardVO tbvo)
			throws Exception {
		int tipNo = Integer.parseInt(request.getParameter("tipNo"));
		tbvo = tipService.showTipByNo(tipNo);
		tbvo.setImg(tipService.getUploadImageForTip(tipNo));

		return new ModelAndView("update_tip", "tbvo", tbvo);
	}

	public ModelAndView updateTip(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, TipBoardVO tbvo)
			throws Exception {
		System.out.println("updateTip_vo :: " + tbvo);

		tipService.updateTip(tbvo);

		return new ModelAndView("show_tip", "tbvo", tipService.showTipByNo(tbvo
				.getTipNo()));
	}

	public ModelAndView getTipBoardListByPlaceId(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		String pageNo = "1";
		String placeId = request.getParameter("placeId");

		PagingTipPlaceIdVO ptpiVO = new PagingTipPlaceIdVO(placeId, pageNo);

		TipListVO tlvo = tipService.getTipBoardListByPlaceId(ptpiVO);

		return new ModelAndView("tip_list", "tlvo", tlvo);
	}

	public ModelAndView clipWhetherCheck(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}

		String email = mvo.getEmail();
		String tipNo = request.getParameter("tipNo");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("tipNo", tipNo);
		boolean flag = tipService.clipWhetherCheck(map);

		HashMap<String, Object> resMap = new HashMap<String, Object>();
		int count = tipService.clipCountByTipNo(Integer.parseInt(tipNo));
		resMap.put("count", String.valueOf(count));
		resMap.put("tipNo", tipNo);
		resMap.put("status", flag);

		return new ModelAndView("JsonView", "resMap", resMap);
	}

	public ModelAndView getTipBoardListByClipCount(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo == null) {
			return new ModelAndView("redirect:/main01.jsp");
		}
		List<TipBoardVO> tbvo = tipService.getTipBoardListByClipCount();

		return new ModelAndView("JsonView", "tbvo", tbvo);
	}

	// comment
	public ModelAndView addCommentToTip(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToTip call..");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		System.out.println("member??" + mvo);

		if (mvo == null)
			return new ModelAndView("main01");
		vo.setMemberVO(mvo);

		tipService.addCommentToTip(vo);
		System.out.println("vo???" + vo);
		return new ModelAndView("JsonView", "cmtvo", vo);

	}

	public ModelAndView deleteTipComment(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteTipComment call..");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		tipService.deleteTipComment(commentNo);
		return new ModelAndView("JsonView");

	}

	public ModelAndView updateTipComment(HttpServletRequest request,
			HttpServletResponse response, CommentVO vo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".updateTipComment call..");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String content = request.getParameter("content");

		tipService.updateTipComment(new CommentVO(commentNo, content));
		return new ModelAndView("JsonView");

	}
	
	public ModelAndView myClipList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      HttpSession session = request.getSession();
	      MemberVO mvo = (MemberVO)session.getAttribute("mvo");
	      String pageNo = "1";
	      if(request.getParameter("pageNo") != null && request.getParameter("pageNo") != "")
	         pageNo = request.getParameter("pageNo");
	      
	      String email = mvo.getEmail();
	      if(request.getParameter("email") != null && request.getParameter("email") != "")
	         email = request.getParameter("email");
	      
	      System.out.println(pageNo+", "+email);
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("pageNo", pageNo);
	      map.put("email", email);
	      
	      PagingClipListVO list = tipService.myClipList(map);
	      
	      return new ModelAndView("JsonView","myClipList", list);
	   }

}
