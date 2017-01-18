package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.vo.PagingQnAVO;
import model.vo.QnAVO;

public interface QnADAO {

	public void writeQuestion(QnAVO qnavo) throws SQLException;

	public void answerForUserQnA(QnAVO qnavo) throws SQLException;

	public String getWriteDateOfQnA(int qnaNo) throws SQLException;

	public void deleteQnA(int qnaNo) throws SQLException;

	public QnAVO showQnA(String qnaNo) throws SQLException;

	public List<QnAVO> getListOfAllQnA(String pageNo) throws SQLException;

	public List<QnAVO> getListOfMyQnA(PagingQnAVO pagingQnAVO)
			throws SQLException;

	public int getCountOfMyQnA(String email) throws SQLException;

	public int totalCount() throws SQLException;
}
