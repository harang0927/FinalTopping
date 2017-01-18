package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.dao.TipDAO;
import model.vo.ClipListVO;
import model.vo.CommentVO;
import model.vo.PagingTipPlaceIdVO;
import model.vo.PagingTipPlaceNameVO;
import model.vo.PagingTipTypeVO;
import model.vo.TipBoardVO;
import model.vo.UploadImageVO;

public class TipDAOImpl implements TipDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addTipToTipBoard(TipBoardVO tbvo) throws SQLException {
		sqlSession.insert("TipBoard.addTipToTipBoard", tbvo);

	}

	@Override
	public void updateTip(TipBoardVO tbvo) throws SQLException {
		sqlSession.update("TipBoard.updateTip", tbvo);
	}

	@Override
	public TipBoardVO showTipByNo(int tipNo) throws SQLException {
		TipBoardVO vo = sqlSession.selectOne("TipBoard.showTipByNo", tipNo);
		System.out.println("vo :: " + vo);
		return vo;
	}

	@Override
	public void deleteFromTipBoard(int tipNo) throws SQLException {
		sqlSession.delete("TipBoard.deleteFromTipBoard", tipNo);
	}

	@Override
	public int getCountOfAllTip() throws SQLException {
		return sqlSession.selectOne("TipBoard.getCountOfAllTip");
	}

	@Override
	public String getWriteDateOfTip(int tipNo) throws SQLException {
		return sqlSession.selectOne("TipBoard.getWriteDateOfTip", tipNo);
	}

	@Override
	public List<TipBoardVO> getTipBoardList(String pageNo) throws SQLException {
		return sqlSession.selectList("TipBoard.getTipBoardList", pageNo);
	}

	@Override
	public List<TipBoardVO> getTipBoardListByType(PagingTipTypeVO pttvo)
			throws SQLException {
		return sqlSession.selectList("TipBoard.getTipBoardListByType", pttvo);
	}

	@Override
	public List<TipBoardVO> searchTipBoardListByPlace(PagingTipPlaceNameVO ptpvo)
			throws SQLException {

		return sqlSession.selectList("TipBoard.searchTipBoardListByPlace",
				ptpvo);
	}

	@Override
	public void deleteTipImg(int imgNo) throws SQLException {
		sqlSession.delete("TipBoard.deleteTipImg", imgNo);
	}

	@Override
	public void updateTipImg(HashMap<String, Object> hm) throws SQLException {
		sqlSession.update("TipBoard.updateTipImg", hm);
	}

	@Override
	public int getCountOfTipByType(String type) throws SQLException {
		return sqlSession.selectOne("TipBoard.getCountOfTipByType", type);
	}

	@Override
	public int getCountOfTipByPlace(String placeName) throws SQLException {
		return sqlSession.selectOne("TipBoard.getCountOfTipByPlace", placeName);
	}

	@Override
	public List<UploadImageVO> getUploadImageForTip(int boardNo)
			throws SQLException {
		return sqlSession.selectList("TipBoard.getUploadImageForTip", boardNo);
	}

	@Override
	public int getCountOfPlaceId(String placeId) throws SQLException {

		System.out.println("getCountOfPlaceId :: "
				+ sqlSession.selectOne("TipBoard.getCountOfPlaceId", placeId));
		return sqlSession.selectOne("TipBoard.getCountOfPlaceId", placeId);
	}

	@Override
	public List<TipBoardVO> getTipBoardListByPlaceId(PagingTipPlaceIdVO ptpivo)
			throws SQLException {
		return sqlSession.selectList("TipBoard.getTipBoardListByPlaceId",
				ptpivo);
	}

	@Override
	public int getCountOfMyTip(String email) throws SQLException {
		return sqlSession.selectOne("TipBoard.getCountOfMyTip", email);
	}

	@Override
	public List<TipBoardVO> getListOfMyTip(HashMap<String, String> forMyTip)
			throws SQLException {
		return sqlSession.selectList("TipBoard.getListOfMyTip", forMyTip);
	}

	@Override
	public void updateClipCount(int tipNo) throws SQLException {
		sqlSession.selectOne("TipBoard.updateClipCount", tipNo);
	}

	/* Clip */
	@Override
	public boolean clipWhetherCheck(HashMap<String, String> checkClip)
			throws SQLException {
		return sqlSession.selectOne("TipBoard.clipWhetherCheck", checkClip);
	}

	@Override
	public int addClipToList(HashMap<String, String> checkClip)
			throws SQLException {
		return sqlSession.insert("TipBoard.addClipToList", checkClip);
	}

	@Override
	public int deleteClipFromList(HashMap<String, String> checkClip)
			throws SQLException {
		return sqlSession.delete("TipBoard.deleteClipFromList", checkClip);
	}

	/* Clip & MyPage */
	@Override
	public int countOfMyClip(String email) throws SQLException {
		return sqlSession.selectOne("TipBoard.countOfMyClip", email);
	}

	@Override
	public List<ClipListVO> listOfMyClip(HashMap<String, String> myClip)
			throws SQLException {
		return sqlSession.selectList("TipBoard.listOfMyClip", myClip);
	}

	@Override
	public int clipCountByTipNo(int tipNo) throws SQLException {
		return sqlSession.selectOne("TipBoard.clipCountByTipNo", tipNo);
	}

	@Override
	public List<TipBoardVO> getTipBoardListByClipCount() throws SQLException {

		return sqlSession.selectList("TipBoard.getTipBoardListByClipCount");
	}

	@Override
	public List<TipBoardVO> getTipBoardSearchList(
			HashMap<String, Object> searchMap) throws SQLException {
		System.out.println("pageNo :: " + searchMap.get("pageNo"));
		return sqlSession.selectList("TipBoard.getTipBoardSearchList",
				searchMap);
	}

	@Override
	public int getCountOfSearch(HashMap<String, Object> hm) throws SQLException {
		int count = sqlSession.selectOne("TipBoard.getCountOfSearch", hm);
		System.out.println("검색 count:: " + count);
		return count;
	}

	// comment

	@Override
	public void addCommentToTip(CommentVO commentVO) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToTip calls.. ");
		sqlSession.insert("TipBoard.addCommentToTip", commentVO);
	}

	@Override
	public List<CommentVO> getAllCommentFromTipBoard(int tipNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getAllCommentFromTipBoard calls.. ");

		return sqlSession.selectList("TipBoard.getAllCommentFromTipBoard",
				tipNo);

	}

	@Override
	public void deleteTipComment(int tipNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityComment calls.. ");
		sqlSession.delete("TipBoard.deleteTipComment", tipNo);
	}

	@Override
	public void updateTipComment(CommentVO cmtvo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".updateTipComment calls.. ");
		sqlSession.update("TipBoard.updateTipComment", cmtvo);
	}

	@Override
	public int getLatestCommentNo() throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getLatestCommentNo calls.. ");
		return sqlSession.selectOne("TipBoard.getLatestCommentNo");
	}

}
