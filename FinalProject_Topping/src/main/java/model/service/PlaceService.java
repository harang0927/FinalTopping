package model.service;

import java.util.HashMap;
import java.util.List;

import model.vo.MemberVO;
import model.vo.PlaceVO;
import model.vo.ToppingListVO;

public interface PlaceService {
	public void checkPlaceFromBestDestination(PlaceVO placeVO) throws Exception;
	public String changeStateOfPlaceFromToppingList(ToppingListVO topping) throws Exception;
	public List<ToppingListVO> selectToppingListByEmail(MemberVO member) throws Exception;
	public List<PlaceVO> getBestDestination(String dist) throws Exception;
	public List<PlaceVO> getBestDestinationForMain() throws Exception;
	
	public boolean checkToppingByPlaceId(HashMap<String, String> map) throws Exception;
}
