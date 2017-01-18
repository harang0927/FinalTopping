package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.TourCheckListDAO;
import model.vo.ToppingListVO;
import model.vo.TourCheckListVO;

import org.apache.ibatis.session.SqlSession;

public class TourCheckListDAOImpl implements TourCheckListDAO {
	private SqlSession sqlSession;
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addCheckList(TourCheckListVO tclvo) throws SQLException {
		System.out.println(getClass().getName()+"...addCheckList()...."+tclvo);
		sqlSession.insert("CheckList.addCheckList",tclvo);
	}

	@Override
	public void changeStateList(HashMap<String, Object> map)
			throws SQLException {
		sqlSession.update("CheckList.changeStateList",map);
	}

	@Override
	public void deleteCheckList(HashMap<String, Object> map) throws SQLException {
		sqlSession.delete("CheckList.deleteCheckList", map);
	}

	@Override
	public List<TourCheckListVO> getCheckList(String email) throws SQLException {
		return sqlSession.selectList("CheckList.getCheckList", email);
	}
	
	public List<ToppingListVO> getToppingList(String email) throws SQLException{
		return sqlSession.selectList("Topping.getToppingList",email);
	}

	
	public TourCheckListVO getOneOfCheckList(HashMap<String, Object> map) throws SQLException{
		return sqlSession.selectOne("CheckList.getOneOfCheckList", map);
	}
}
