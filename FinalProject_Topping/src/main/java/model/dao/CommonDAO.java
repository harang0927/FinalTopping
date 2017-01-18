package model.dao;

import java.sql.SQLException;
import java.util.HashMap;

import model.vo.PlaceVO;

public interface CommonDAO {
	public int addPlace(PlaceVO vo) throws SQLException;

	public int uploadImage(HashMap<String, Object> hm) throws SQLException;
}
