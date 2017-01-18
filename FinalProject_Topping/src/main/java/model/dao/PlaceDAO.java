package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.MemberVO;
import model.vo.PlaceVO;
import model.vo.ToppingListVO;

public interface PlaceDAO {
	public boolean checkPlaceFromBestDestination(PlaceVO vo) throws SQLException;
	public int addPlaceToBestDestination(PlaceVO vo) throws SQLException;
	
	public void updatePlaceImg(PlaceVO vo) throws SQLException;
	
	public boolean checkPlaceFromToppingList(ToppingListVO vo) throws SQLException;
	public int addPlaceToTopping(ToppingListVO vo) throws SQLException;
	public int deletePlaceFromTopping(ToppingListVO vo) throws SQLException;
	public int updateToppingCount(ToppingListVO topping) throws SQLException;
	public List<ToppingListVO> selectToppingListByEmail(MemberVO member) throws SQLException;
	
	/* 6개 */
	public List<PlaceVO> getBestDestination(String dist) throws SQLException;
	/* 3개 */
	public List<PlaceVO> getBestDestinationForMain() throws SQLException;
	public boolean checkToppingByPlaceId(HashMap<String, String> map) throws SQLException;
	
	/* GetTopping */
	public int getCountOfToppingPlaceByEmail(String email) throws SQLException;
	public List<ToppingListVO> getListOfToppingPlaceByEmail(HashMap<String,String> forMypage) throws SQLException;
}
