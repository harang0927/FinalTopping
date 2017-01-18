package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.ToppingListVO;
import model.vo.TourCheckListVO;

public interface TourCheckListDAO {
	public void addCheckList(TourCheckListVO tclvo) throws SQLException;
	public void changeStateList(HashMap<String, Object> map) throws SQLException;
	public void deleteCheckList(HashMap<String, Object> map) throws SQLException;
	public List<TourCheckListVO> getCheckList(String email) throws SQLException;
	public List<ToppingListVO> getToppingList(String email) throws SQLException;
	
	public TourCheckListVO getOneOfCheckList(HashMap<String, Object> map) throws SQLException;
}
