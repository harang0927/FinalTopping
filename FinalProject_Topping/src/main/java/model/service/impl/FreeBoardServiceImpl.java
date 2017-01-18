package model.service.impl;

import java.sql.SQLException;
import java.util.List;

import model.dao.FreeBoardDAO;
import model.service.FreeBoardService;
import model.vo.CommentVO;
import model.vo.FreeBoardListVO;
import model.vo.FreeBoardVO;
import model.vo.PagingBean;
import model.vo.PagingFreeBoardVO;

public class FreeBoardServiceImpl implements FreeBoardService {

	private FreeBoardDAO freeBoardDAO;

	public void setFreeBoardDAO(FreeBoardDAO freeBoardDAO) {
		this.freeBoardDAO = freeBoardDAO;
	}

	// getFreeBoardList
	@Override
	public FreeBoardListVO getFreeBoardList(String pageNo) throws SQLException {
		System.out.println(getClass().getName() + " 서비스 전 : getFreeBoardList");
		if (pageNo == null || pageNo == "")
			pageNo = "1";

		int total = freeBoardDAO.totalCount();
		List<FreeBoardVO> list = freeBoardDAO.getFreeBoardList(pageNo);

		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		FreeBoardListVO flvo = new FreeBoardListVO(list, paging);
		System.out.println("서비스 후" + flvo);
		return flvo;
	}

	// addPostingToFreeBoard
	@Override
	public void addPostingToFreeBoard(FreeBoardVO fbvo) throws SQLException {
		freeBoardDAO.addPostingToFreeBoard(fbvo);

		String date = freeBoardDAO.selectByNoForDate(fbvo.getPostingNo());
		fbvo.setWriteDate(date);

	}

	// deletePostingFromFreeBoard
	@Override
	public void deletePostingFromFreeBoard(int postingNo) throws SQLException {
		freeBoardDAO.deletePostingFromFreeBoard(postingNo);

	}

	// showPositngOnFreeBoard
	@Override
	public FreeBoardVO showPositngOnFreeBoard(int postingNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".showPositngOnFreeBoard call...");
		return freeBoardDAO.showPositngOnFreeBoard(postingNo);
	}

	// updateToPosting
	@Override
	public void updateToPosting(FreeBoardVO fvo) throws SQLException {
		freeBoardDAO.updateToPosting(fvo);

	}

	@Override
	public void updateHitsOfPosting(int postingNo) throws SQLException {
		freeBoardDAO.updateHitsOfPosting(postingNo);

	}

	@Override
	public FreeBoardListVO listbyPostingHeader(PagingFreeBoardVO pfbvo)
			throws SQLException {
		if (pfbvo.getPageNo() == 0)
			pfbvo.setPageNo(1);
		System.out.println("posting header: " + pfbvo.getPostingHeader());
		int countByPostingHeader = freeBoardDAO.countByPostingHeader(pfbvo
				.getPostingHeader());

		List<FreeBoardVO> fblist = freeBoardDAO.listbyPostingHeader(pfbvo);
		System.out.println("게시물들..fblist: " + fblist);
		PagingBean pb = new PagingBean(countByPostingHeader, pfbvo.getPageNo());
		FreeBoardListVO fblvo = new FreeBoardListVO(fblist, pb);

		return fblvo;
	}

	// comment
	@Override
	public void addCommentToFreeBoard(CommentVO commentVO) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToFreeBoard call.. ");
		/*
		 * int no = activityDao.getLatestCommentNo();
		 * System.out.println("number:: " + no); commentVO.setCommentNo(no);
		 */
		freeBoardDAO.addCommentToFreeBoard(commentVO);

	}

	@Override
	public List<CommentVO> getAllCommentFromFreeBoard(int postingNo)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".getAllCommentFromActivityBoard call.. ");
		return freeBoardDAO.getAllCommentFromFreeBoard(postingNo);
	}

	@Override
	public void deleteFreeBoardComment(int commentNo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityComment call.. ");
		freeBoardDAO.deleteFreeBoardComment(commentNo);

	}

	@Override
	public void updateFreeBoardComment(CommentVO cmtvo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".updateTipComment call.. ");
		freeBoardDAO.updateFreeBoardComment(cmtvo);
	}
}
