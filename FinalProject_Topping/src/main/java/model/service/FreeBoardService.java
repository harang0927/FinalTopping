package model.service;

import java.sql.SQLException;
import java.util.List;

import model.vo.CommentVO;
import model.vo.FreeBoardListVO;
import model.vo.FreeBoardVO;
import model.vo.PagingFreeBoardVO;

public interface FreeBoardService {

	public FreeBoardListVO getFreeBoardList(String pageNo) throws SQLException;

	public void addPostingToFreeBoard(FreeBoardVO fbvo) throws SQLException;

	public void deletePostingFromFreeBoard(int postingNo) throws SQLException;

	public FreeBoardVO showPositngOnFreeBoard(int postingNo)
			throws SQLException;

	public void updateToPosting(FreeBoardVO fbvo) throws SQLException;

	public void updateHitsOfPosting(int postingNo) throws SQLException;

	public FreeBoardListVO listbyPostingHeader(PagingFreeBoardVO pfbvo)
			throws SQLException;

	// comment
	public void addCommentToFreeBoard(CommentVO commentVO) throws Exception;

	public List<CommentVO> getAllCommentFromFreeBoard(int postingNo)
			throws Exception;

	public void deleteFreeBoardComment(int postingNo) throws Exception;

	public void updateFreeBoardComment(CommentVO cmtvo) throws Exception;
}
