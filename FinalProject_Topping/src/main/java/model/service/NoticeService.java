package model.service;

import model.vo.NoticeListVO;
import model.vo.NoticeVO;

public interface NoticeService {
	public NoticeListVO getNoticeList(String pageNo) throws Exception;

	public void writeNotice(NoticeVO nvo) throws Exception;

	public void deleteNotice(int noticeNo) throws Exception;

	public void updateNotice(NoticeVO nvo) throws Exception;

	public void updateHitsOfNotice(String noticeNo) throws Exception;

	public NoticeVO showNotice(String noticeNo) throws Exception;
}
