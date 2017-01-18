package model.service;

import java.sql.SQLException;
import model.vo.QnAListVO;
import model.vo.QnAVO;

public interface QnAService {
	public void writeQuestion(QnAVO qnavo) throws SQLException;

	public void answerForUserQnA(QnAVO qnavo) throws SQLException;

	public void deleteQnA(int qnaNo) throws SQLException;

	public QnAVO showQnA(String qnaNo) throws SQLException;

	public QnAListVO getListOfAllQnA(String pageNo) throws SQLException;
}
