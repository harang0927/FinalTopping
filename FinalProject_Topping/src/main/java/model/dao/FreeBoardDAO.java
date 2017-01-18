package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.CommentVO;
import model.vo.FreeBoardVO;
import model.vo.PagingFreeBoardVO;

public interface FreeBoardDAO {

	public List<FreeBoardVO> getFreeBoardList(String pageNo)
			throws SQLException;

	public void addPostingToFreeBoard(FreeBoardVO fbvo) throws SQLException;

	public String selectByNoForDate(int postingNo) throws SQLException;

	public void deletePostingFromFreeBoard(int postingNo) throws SQLException;

	public FreeBoardVO showPositngOnFreeBoard(int postingNo)
			throws SQLException;

	public void updateToPosting(FreeBoardVO fbvo) throws SQLException;

	public void updateHitsOfPosting(int postingNo) throws SQLException;

	public int totalCount() throws SQLException;

	public List<FreeBoardVO> listbyPostingHeader(PagingFreeBoardVO pfbvo)
			throws SQLException;

	public int countByPostingHeader(String postingHeader) throws SQLException;

	public int getCountOfMyPosts(String email) throws SQLException;

	public List<FreeBoardVO> getListOfMyPosts(HashMap<String, String> forMyPost)
			throws SQLException;

	// comment
	public void addCommentToFreeBoard(CommentVO commentVO) throws SQLException;

	public List<CommentVO> getAllCommentFromFreeBoard(int postingNo)
			throws SQLException;

	public void deleteFreeBoardComment(int postingNo) throws SQLException;

	public void updateFreeBoardComment(CommentVO cmtvo) throws SQLException;

	public int getLatestCommentNo() throws SQLException;
}