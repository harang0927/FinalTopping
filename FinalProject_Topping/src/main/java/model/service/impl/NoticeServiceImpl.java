package model.service.impl;

import java.util.List;

import model.dao.NoticeDAO;
import model.service.NoticeService;
import model.vo.NoticeListVO;
import model.vo.NoticeVO;
import model.vo.PagingBean;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	
	@Override
	public NoticeListVO getNoticeList(String pageNo) throws Exception {
		if(pageNo==null || pageNo=="") pageNo="1";
	      
	      int total=noticeDAO.totalCount();
	      List<NoticeVO> list=noticeDAO.getNoticeList(pageNo);
	      
	      PagingBean paging = 
	            new PagingBean(total, Integer.parseInt(pageNo));
	      NoticeListVO lvo = new NoticeListVO(list, paging);
	      
	      return lvo;
	}

	@Override
	public void writeNotice(NoticeVO nvo) throws Exception {
		noticeDAO.writeNotice(nvo);	
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		noticeDAO.deleteNotice(noticeNo);
		
	}

	@Override
	public void updateNotice(NoticeVO nvo) throws Exception {
		noticeDAO.updateNotice(nvo);
		
	}

	@Override
	public void updateHitsOfNotice(String noticeNo) throws Exception {
		noticeDAO.updateHitsOfNotice(noticeNo);
		
	}

	@Override
	public NoticeVO showNotice(String noticeNo) throws Exception {
		return noticeDAO.showNotice(noticeNo);
	}

}
