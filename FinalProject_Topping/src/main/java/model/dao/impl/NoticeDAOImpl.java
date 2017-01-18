package model.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.dao.NoticeDAO;
import model.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeVO> getNoticeList(String pageNo) throws SQLException {
		return sqlSession.selectList("Notice.getNoticeList", pageNo);
	}

	@Override
	public void writeNotice(NoticeVO nvo) throws SQLException {
		sqlSession.insert("Notice.writeNotice", nvo);

	}

	@Override
	public void deleteNotice(int noticeNo) throws SQLException {
		sqlSession.delete("Notice.deleteNotice", noticeNo);

	}

	@Override
	public void updateNotice(NoticeVO nvo) throws SQLException {
		sqlSession.update("Notice.updateNotice", nvo);

	}

	@Override
	public void updateHitsOfNotice(String noticeNo) throws SQLException {
		sqlSession.update("Notice.updateHitsOfNotice", noticeNo);

	}

	@Override
	public NoticeVO showNotice(String noticeNo) throws SQLException {
		return sqlSession.selectOne("Notice.showNotice", noticeNo);
	}

	@Override
	public int totalCount() throws SQLException {
		return sqlSession.selectOne("Notice.totalCount");
	}

}
