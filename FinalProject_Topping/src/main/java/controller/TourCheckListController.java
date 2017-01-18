package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.TourCheckListService;
import model.vo.MemberVO;
import model.vo.ToppingListVO;
import model.vo.TourCheckListVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class TourCheckListController extends MultiActionController{
	TourCheckListService tourCheckListService;
	
	public void setTourCheckListService(TourCheckListService tourCheckListService) {
		this.tourCheckListService = tourCheckListService;
	}
	
	public ModelAndView addCheckList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		TourCheckListVO tclvo = new TourCheckListVO();
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");
		ToppingListVO tlvo = new ToppingListVO();
		tlvo.setToppingListNo(Integer.parseInt(request.getParameter("toppingNo")));
		tclvo.setMemberVO(mvo);
		tclvo.setToppingListVO(tlvo);
		tourCheckListService.addCheckList(tclvo);
		
		return new ModelAndView("redirect:checkList.do?command=getCheckList");
	}
	
	public ModelAndView deleteCheckList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		int toppingNo = Integer.parseInt(request.getParameter("toppingNo"));
		String email = ((MemberVO)request.getSession().getAttribute("mvo")).getEmail();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toppingNo", toppingNo);
		map.put("email", email);
		
		tourCheckListService.deleteCheckList(map);
		
		return new ModelAndView("redirect:checkList.do?command=getCheckList");
	}
	
	public ModelAndView changeStateList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String email = ((MemberVO)request.getSession().getAttribute("mvo")).getEmail();
		String toppingNo = request.getParameter("toppingNo");
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("email",email);
		map1.put("toppingNo", toppingNo);
		TourCheckListVO vo = tourCheckListService.getOneOfCheckList(map1);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tourNo", vo.getTourNo());
		map.put("status", vo.isTourStatus());
		
		tourCheckListService.changeStateList(map);
		
		return new ModelAndView("JsonView");
	}
	
	public ModelAndView getCheckList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		String email = ((MemberVO)request.getSession().getAttribute("mvo")).getEmail();
		
		List<TourCheckListVO> list = tourCheckListService.getCheckList(email);
		
		return new ModelAndView("JsonView", "list", list);
	}

	/* Topping */
	public ModelAndView getListOfTopping(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		MemberVO user = (MemberVO) session.getAttribute("mvo");
		if(user.getEmail() == null) return new ModelAndView("redirect:main01.jsp");
		
		List<ToppingListVO> list = tourCheckListService.getToppingList(user.getEmail());
		
		return new ModelAndView("tourlist", "toppingList", list);
	}
}
