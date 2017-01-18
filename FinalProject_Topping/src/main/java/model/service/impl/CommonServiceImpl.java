package model.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;

import model.dao.impl.CommonDAOImpl;
import model.service.CommonService;
import model.vo.PlaceVO;
import model.vo.UploadImageVO;

public class CommonServiceImpl implements CommonService {
	CommonDAOImpl commonDAO;

	public void setCommonDAO(CommonDAOImpl commonDAO) {
		this.commonDAO = commonDAO;
	}

	@Override
	public void addPlace(PlaceVO vo) throws SQLException {
		System.out.println(":: " + getClass().getName() + ".addPlace call..");

		commonDAO.addPlace(vo);
	}

	@Override
	public void uploadImage(UploadImageVO vo) throws SQLException {
		System.out
				.println(":: " + getClass().getName() + ".uploadimage call..");

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("imgNo", "");
		hm.put("boardNo", vo.getBoardNo());

		hm.put("orgName", vo.getOrgName());
		hm.put("newName", vo.getNewName());
		hm.put("boardType", vo.getBoardType());
		hm.put("savePath", vo.getSavePath());

		commonDAO.uploadImage(hm);// img 통합관리를 위한 테이블에 업로드
	}

	@Override
	public void deleteUploadImg(String newName) throws SQLException {
		// TODO Auto-generated method stub
		File f = new File(newName);// path가 없다...괜챦다.
		System.out.println(newName + " file..delete ok.." + f.delete());
	}
}
