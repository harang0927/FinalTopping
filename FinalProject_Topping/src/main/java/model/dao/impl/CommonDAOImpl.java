package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;

import model.dao.CommonDAO;
import model.vo.PlaceVO;

import org.mybatis.spring.SqlSessionTemplate;

public class CommonDAOImpl implements CommonDAO {
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int addPlace(PlaceVO vo) throws SQLException {
		System.out.println(":: " + getClass().getName() + ".addPlace call..");

		return sqlSession.insert("Common.addPlace", vo);
	}

	public int uploadImage(HashMap<String, Object> hm) throws SQLException {
		System.out
				.println(":: " + getClass().getName() + ".uploadimage call..");

		return sqlSession.insert("Common.uploadImage", hm);
	}
}
