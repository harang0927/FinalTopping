package model.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.dao.QnADAO;
import model.vo.PagingQnAVO;
import model.vo.QnAVO;

public class QnADAOImpl implements QnADAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void writeQuestion(QnAVO qnavo) throws SQLException {
		sqlSession.insert("QnA.writeQuestion", qnavo);

	}

	@Override
	public void answerForUserQnA(QnAVO qnavo) throws SQLException {
		sqlSession.insert("QnA.answerForUserQnA", qnavo);

	}

	@Override
	public void deleteQnA(int qnaNo) throws SQLException {
		System.out.println(":: " + getClass().getName() + ".deleteQnA call.. ");
		sqlSession.delete("QnA.deleteQnA", qnaNo);

	}

	@Override
	public List<QnAVO> getListOfAllQnA(String pageNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getListOfMyQnA call.. ");
		System.out.println("dao의 pageno: " + pageNo);
		List<QnAVO> qnaList = sqlSession.selectList("QnA.getListOfAllQnA",
				pageNo);
		for (QnAVO q : qnaList) {
			System.out.println(q);
		}
		return sqlSession.selectList("QnA.getListOfAllQnA", pageNo);
	}

	public int getCountOfMyQnA(String email) throws SQLException {
		System.out.println("getCountOfMyQnA(DAO) :: " + email);
		return sqlSession.selectOne("getCountOfMyQnA", email);
	}

	@Override
	public List<QnAVO> getListOfMyQnA(PagingQnAVO pagingQnAVO)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getListOfMyQnA call.. ");

		return sqlSession.selectList("QnA.getListOfMyQnA", pagingQnAVO);
	}

	@Override
	public QnAVO showQnA(String qnaNo) throws SQLException {
		return sqlSession.selectOne("QnA.showQnA", qnaNo);

	}

	@Override
	public String getWriteDateOfQnA(int qnaNo) throws SQLException {
		return sqlSession.selectOne("QnA.getWriteDateOfQnA", qnaNo);
	}

	@Override
	public int totalCount() throws SQLException {

		return sqlSession.selectOne("QnA.totalCount");
	}

}
