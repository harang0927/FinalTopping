package model.service;

import java.sql.SQLException;

import model.vo.PlaceVO;
import model.vo.UploadImageVO;

public interface CommonService {
	public void addPlace(PlaceVO vo) throws SQLException;

	public void uploadImage(UploadImageVO vo) throws SQLException;

	public void deleteUploadImg(String newName) throws SQLException;
}
