package model.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.TourCheckListDAO;
import model.service.TourCheckListService;
import model.vo.ToppingListVO;
import model.vo.TourCheckListVO;

public class TourCheckListServiceImpl implements TourCheckListService {
	TourCheckListDAO tourCheckListDAO;
	
	public void setTourCheckListDAO(TourCheckListDAO tourCheckListDAO) {
		this.tourCheckListDAO = tourCheckListDAO;
	}

	
	@Override
	public void addCheckList(TourCheckListVO tclvo) throws SQLException {
		tourCheckListDAO.addCheckList(tclvo);
	}

	@Override
	public void changeStateList(HashMap<String, Object> map)
			throws SQLException {
		tourCheckListDAO.changeStateList(map);
	}

	@Override
	public void deleteCheckList(HashMap<String, Object> map) throws SQLException {
		tourCheckListDAO.deleteCheckList(map);
	}

	@Override
	public List<TourCheckListVO> getCheckList(String email) throws SQLException {
		return tourCheckListDAO.getCheckList(email);
	}

	public List<ToppingListVO> getToppingList(String email) throws SQLException{
		return tourCheckListDAO.getToppingList(email);
	}
	
	public TourCheckListVO getOneOfCheckList(HashMap<String, Object> map) throws SQLException{
		return tourCheckListDAO.getOneOfCheckList(map);
	}
}
