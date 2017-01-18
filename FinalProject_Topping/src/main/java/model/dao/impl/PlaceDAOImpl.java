package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.dao.PlaceDAO;
import model.vo.MemberVO;
import model.vo.PlaceVO;
import model.vo.ToppingListVO;

public class PlaceDAOImpl implements PlaceDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/* Place테이블에 있는지 비교하기 */
	public boolean checkPlaceFromBestDestination(PlaceVO vo){
		System.out.println("dao :: "+vo);
		boolean flag = sqlSession.selectOne("checkPlaceFromBestDestination", vo);
		return flag; 	
	}
	/* Place테이블에 없을 때 테이블에 입력 */
	public int addPlaceToBestDestination(PlaceVO vo){
		return sqlSession.insert("addPlaceToBestDestination",vo);
	}
	
	/* ToppingList테이블에 있는지 확인하기 */
	public boolean checkPlaceFromToppingList(ToppingListVO vo){
		boolean flag = false;
		if(sqlSession.selectOne("checkPlaceFromToppingList", vo))
			flag = true;
		return flag;
	}
	/* ToppingList테이블에 없으면 등록 */
	public int addPlaceToTopping(ToppingListVO vo){
		return sqlSession.insert("addPlaceToTopping", vo);
	}
	/* ToppingList테이블에 있으면 삭제 */
	public int deletePlaceFromTopping(ToppingListVO vo){
		return sqlSession.delete("deletePlaceFromTopping", vo);
	}
	/* Place테이블에 있는 ToppingCount자동 수정하기 */
	public int updateToppingCount(ToppingListVO topping){
		return sqlSession.update("updateToppingCount", topping);
	}

	/* (지역이 있다면 해당 지역의) 토핑 많은 순으로 여행지 6개 */
	@Override
	public List<PlaceVO> getBestDestination(String dist) throws SQLException {
		return sqlSession.selectList("getBestDestination", dist);
	}
	/* 토핑 많은 순으로 여행지 3개 */
	@Override
	public List<PlaceVO> getBestDestinationForMain() throws SQLException {
		return sqlSession.selectList("getBestDestinationForMain");
	}

	@Override
	public List<ToppingListVO> selectToppingListByEmail(MemberVO member)
			throws SQLException {
		return sqlSession.selectList("selectToppingListByEmail",member);
	}

	@Override
	public int getCountOfToppingPlaceByEmail(String email) throws SQLException {
		return sqlSession.selectOne("Place.getCountOfToppingPlaceByEmail", email);
	}

	@Override
	public List<ToppingListVO> getListOfToppingPlaceByEmail(
			HashMap<String, String> forMypage) throws SQLException {
		System.out.println(sqlSession.selectList("Place.getListOfToppingPlaceByEmail", forMypage));
		return sqlSession.selectList("Place.getListOfToppingPlaceByEmail", forMypage);
	}

	@Override
	public boolean checkToppingByPlaceId(HashMap<String, String> map)
			throws SQLException {
		return sqlSession.selectOne("Place.checkToppingByPlaceId", map);
	}

	@Override
	public void updatePlaceImg(PlaceVO vo) throws SQLException {
		sqlSession.update("Place.updatePlaceImg", vo);
	}
	
}
