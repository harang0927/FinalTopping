package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.FreeBoardDAO;
import model.vo.CommentVO;
import model.vo.FreeBoardVO;
import model.vo.PagingFreeBoardVO;

import org.apache.ibatis.session.SqlSession;

public class FreeBoardDAOImpl implements FreeBoardDAO {

	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 게시판 목록 불러오기
	@Override
	public List<FreeBoardVO> getFreeBoardList(String pageNo)
			throws SQLException {
		System.out.println(getClass().getName() + "getFreeBoardList");
		return session.selectList("FreeBoard.getFreeBoardList", pageNo);
	}

	// 글입력
	@Override
	public void addPostingToFreeBoard(FreeBoardVO fbvo) throws SQLException {
		session.insert("FreeBoard.addPostingToFreeBoard", fbvo);
	}

	// 날짜 받아오기
	@Override
	public String selectByNoForDate(int postingNo) throws SQLException {
		return session.selectOne("FreeBoard.selectByNoForDate", postingNo);
	}

	// 글삭제
	@Override
	public void deletePostingFromFreeBoard(int postingNo) throws SQLException {
		session.delete("FreeBoard.deletePostingFromFreeBoard", postingNo);

	}

	// 글읽기(상세보기)
	@Override
	public FreeBoardVO showPositngOnFreeBoard(int postingNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".showPositngOnFreeBoard call...");
		return session.selectOne("FreeBoard.showPositngOnFreeBoard", postingNo);
	}

	// 글수정
	@Override
	public void updateToPosting(FreeBoardVO fbvo) throws SQLException {
		session.update("FreeBoard.updateToPosting", fbvo);

	}

	// 조회수 업데이트updateHitsOfPosting
	@Override
	public void updateHitsOfPosting(int postingNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".updateHitsOfPosting call...");
		session.update("FreeBoard.updateHitsOfPosting", postingNo);

	}

	// 총 게시글 수 불러오기
	@Override
	public int totalCount() throws SQLException {
		return session.selectOne("FreeBoard.totalCount");
	}

	/*
	 * @Override public List<FreeBoardVO> listbyPostingHeader(String
	 * postingHeader) throws SQLException {
	 * System.out.println("DAO :: "+postingHeader); List<FreeBoardVO> list =
	 * session.selectList("FreeBoard.listbyPostingHeader", postingHeader);
	 * for(FreeBoardVO vo : list) System.out.println(vo); return list; }
	 */

	@Override
	public int countByPostingHeader(String postingHeader) throws SQLException {
		return session.selectOne("FreeBoard.countByPostingHeader",
				postingHeader);
	}

	@Override
	public List<FreeBoardVO> listbyPostingHeader(PagingFreeBoardVO pfbvo)
			throws SQLException {
		return session.selectList("FreeBoard.listbyPostingHeader", pfbvo);
	}

	@Override
	public int getCountOfMyPosts(String email) throws SQLException {
		return session.selectOne("FreeBoard.getCountOfMyPosts", email);
	}

	@Override
	public List<FreeBoardVO> getListOfMyPosts(HashMap<String, String> forMyPost)
			throws SQLException {
		return session.selectList("FreeBoard.getListOfMyPosts", forMyPost);
	}

	// comment

	@Override
	public void addCommentToFreeBoard(CommentVO commentVO) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToTip calls.. ");
		session.insert("FreeBoard.addCommentToFreeBoard", commentVO);
	}

	@Override
	public List<CommentVO> getAllCommentFromFreeBoard(int postingNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getAllCommentFromFreeBoard calls.. ");

		return session.selectList("FreeBoard.getAllCommentFromFreeBoard",
				postingNo);

	}

	@Override
	public void deleteFreeBoardComment(int postingNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityComment calls.. ");
		session.delete("FreeBoard.deleteFreeBoardComment", postingNo);
	}

	@Override
	public void updateFreeBoardComment(CommentVO cmtvo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".updateFreeBoardComment calls.. ");
		session.update("FreeBoard.updateFreeBoardComment", cmtvo);
	}

	@Override
	public int getLatestCommentNo() throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getLatestCommentNo calls.. ");
		return session.selectOne("FreeBoard.getLatestCommentNo");
	}
}
