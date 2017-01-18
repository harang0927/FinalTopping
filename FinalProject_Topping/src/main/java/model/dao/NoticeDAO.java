package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> getNoticeList(String pageNo) throws SQLException;

	public void writeNotice(NoticeVO nvo) throws SQLException;

	public void deleteNotice(int noticeNo) throws SQLException;

	public void updateNotice(NoticeVO nvo) throws SQLException;

	public void updateHitsOfNotice(String noticeNo) throws SQLException;

	public NoticeVO showNotice(String noticeNo) throws SQLException;

	public int totalCount() throws SQLException;
}
