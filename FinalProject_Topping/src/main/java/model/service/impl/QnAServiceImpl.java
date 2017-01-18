package model.service.impl;

import java.sql.SQLException;
import java.util.List;

import model.dao.QnADAO;
import model.service.QnAService;
import model.vo.PagingBean;
import model.vo.QnAListVO;
import model.vo.QnAVO;

public class QnAServiceImpl implements QnAService {
	private QnADAO qnaDAO;

	public void setQnaDAO(QnADAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public void writeQuestion(QnAVO qnavo) throws SQLException {
		qnaDAO.writeQuestion(qnavo);
		String date = qnaDAO.getWriteDateOfQnA(qnavo.getQnaNo());
		qnavo.setWriteDate(date);
	}

	@Override
	public void answerForUserQnA(QnAVO qnavo) throws SQLException {
		// System.out.println("answerForUserQnA 서비스 전: " + qnavo);
		qnaDAO.answerForUserQnA(qnavo);
		String date = qnaDAO.getWriteDateOfQnA(qnavo.getQnaNo());
		qnavo.setWriteDate(date);
		// System.out.println("answerForUserQnA 서비스 후: " + qnavo);
	}

	@Override
	public void deleteQnA(int qnaNo) throws SQLException {
		System.out.println("deleteQnA 서비스 전: " + qnaNo);
		qnaDAO.deleteQnA(qnaNo);
		System.out.println("deleteQnA 서비스 후: " + qnaNo);
	}

	@Override
	public QnAListVO getListOfAllQnA(String pageNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getListOfMyQnA call.. ");

		if (pageNo == null || pageNo == "")
			pageNo = "1";
		// System.out.println("service 이후 1이 되야함 :" + pageNo); //1

		int total = qnaDAO.totalCount();
		List<QnAVO> list = qnaDAO.getListOfAllQnA(pageNo);
		// System.out.println(list);
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		QnAListVO qlvo = new QnAListVO(list, paging);
		// System.out.println(qlvo);
		return qlvo;

	}

	@Override
	public QnAVO showQnA(String qnaNo) throws SQLException {
		// System.out.println(":: " + getClass().getName() +
		// ".showQnA call.. ");

		return qnaDAO.showQnA(qnaNo);

	}
}
