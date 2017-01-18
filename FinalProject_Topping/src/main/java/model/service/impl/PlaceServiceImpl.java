package model.service.impl;

import java.util.HashMap;
import java.util.List;

import model.dao.PlaceDAO;
import model.service.PlaceService;
import model.vo.MemberVO;
import model.vo.PlaceVO;
import model.vo.ToppingListVO;

public class PlaceServiceImpl implements PlaceService {
	PlaceDAO placeDAO;
	public void setPlaceDAO(PlaceDAO placeDAO) {
		this.placeDAO = placeDAO;
	}

	@Override
	public void checkPlaceFromBestDestination(PlaceVO placeVO) throws Exception {
		if(!placeDAO.checkPlaceFromBestDestination(placeVO)){
			placeDAO.addPlaceToBestDestination(placeVO);
		}else{
			placeDAO.updatePlaceImg(placeVO);
		}
	}

	@Override
	public String changeStateOfPlaceFromToppingList(ToppingListVO topping)
			throws Exception {
		String resultStr = "Nothing";
		if(!placeDAO.checkPlaceFromToppingList(topping)){
			placeDAO.addPlaceToTopping(topping);
			resultStr = "add Topping Success";
		}else{
			placeDAO.deletePlaceFromTopping(topping);
			resultStr = "delete Topping Success";
		}
		placeDAO.updateToppingCount(topping);
		
		return resultStr;
	}

	@Override
	public List<ToppingListVO> selectToppingListByEmail(MemberVO member)
			throws Exception {
		return placeDAO.selectToppingListByEmail(member);
	}

	@Override
	public List<PlaceVO> getBestDestination(String dist) throws Exception {
		return placeDAO.getBestDestination(dist);
	}

	@Override
	public List<PlaceVO> getBestDestinationForMain() throws Exception {
		return placeDAO.getBestDestinationForMain();
	}

	@Override
	public boolean checkToppingByPlaceId(HashMap<String, String> map)
			throws Exception {
		return placeDAO.checkToppingByPlaceId(map);
	}

	
}
