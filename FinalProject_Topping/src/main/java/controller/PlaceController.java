package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.PlaceService;
import model.vo.MemberVO;
import model.vo.PlaceVO;
import model.vo.ToppingListVO;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class PlaceController extends MultiActionController{
	PlaceService placeService;
	
	public void setPlaceService(PlaceService placeService) {
		this.placeService = placeService;
	}


	public ModelAndView toppingPlace(HttpServletRequest request, HttpServletResponse response, PlaceVO placeVO) throws Exception{
		if(placeVO.getPlaceImgUrl()== null)
			placeVO.setPlaceImgUrl("./images/noImage.jpg");
		placeService.checkPlaceFromBestDestination(placeVO);
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("mvo");
		ToppingListVO topping = new ToppingListVO(mvo, placeVO);
		String result = placeService.changeStateOfPlaceFromToppingList(topping);
		return new ModelAndView("JsonView", "result", result);
	}
	
	public ModelAndView getBestPlace(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<PlaceVO> list = placeService.getBestDestination("");
		for(PlaceVO p : list){
			System.out.println(p);
		}
		return new ModelAndView("showBestDestination","bestPlace",list);
	}
	
	public ModelAndView getBestPlaceForMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<PlaceVO> list = placeService.getBestDestinationForMain();
		return new ModelAndView("JsonView","bestPlace",list);
	}
	
	public ModelAndView getMyToppingPlace(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("mvo");
		List<ToppingListVO> list = placeService.selectToppingListByEmail(vo);
		
		return new ModelAndView("showMyTopping","toppingList",list);
	}
	
	public ModelAndView getMyToppingPlaceList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("mvo");
		List<ToppingListVO> list = placeService.selectToppingListByEmail(vo);
		
		return new ModelAndView("JsonView","toppingList",list);
	}
	
	public ModelAndView checkToppingByPlaceId(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		String email = ((MemberVO)session.getAttribute("mvo")).getEmail();
		String placeId = request.getParameter("placeId");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("placeId", placeId);
		boolean flag = placeService.checkToppingByPlaceId(map);
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("flag", flag);
		resMap.put("placeId", placeId);
		
		return new ModelAndView("JsonView", "resMap", resMap);
	}
}
