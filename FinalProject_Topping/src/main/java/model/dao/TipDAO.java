package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.ClipListVO;
import model.vo.CommentVO;
import model.vo.PagingTipPlaceIdVO;
import model.vo.PagingTipPlaceNameVO;
import model.vo.PagingTipTypeVO;
import model.vo.TipBoardVO;
import model.vo.UploadImageVO;

public interface TipDAO {
	public void addTipToTipBoard(TipBoardVO tbvo) throws SQLException;

	public void updateTip(TipBoardVO tbvo) throws SQLException;

	public TipBoardVO showTipByNo(int tipNo) throws SQLException;

	public void deleteFromTipBoard(int tipNo) throws SQLException;

	public int getCountOfAllTip() throws SQLException;

	public int getCountOfTipByType(String type) throws SQLException;

	public int getCountOfTipByPlace(String placeName) throws SQLException;

	public int getCountOfPlaceId(String PlaceId) throws SQLException;

	public int getCountOfSearch(HashMap<String, Object> hm) throws SQLException;

	public String getWriteDateOfTip(int tipNo) throws SQLException;

	public List<TipBoardVO> getTipBoardList(String pageNo) throws SQLException;

	public List<TipBoardVO> getTipBoardListByType(PagingTipTypeVO pttvo)
			throws SQLException;

	public List<TipBoardVO> getTipBoardListByPlaceId(PagingTipPlaceIdVO ptpivo)
			throws SQLException;

	public List<TipBoardVO> searchTipBoardListByPlace(PagingTipPlaceNameVO ptpvo)
			throws SQLException;

	public void deleteTipImg(int imgNo) throws SQLException;

	public void updateTipImg(HashMap<String, Object> hm) throws SQLException;

	public List<UploadImageVO> getUploadImageForTip(int boardNo)
			throws SQLException;

	public List<TipBoardVO> getTipBoardSearchList(
			HashMap<String, Object> searchMap) throws SQLException;

	public int getCountOfMyTip(String email) throws SQLException;

	public List<TipBoardVO> getListOfMyTip(HashMap<String, String> forMyTip)
			throws SQLException;

	/* Clip */
	public boolean clipWhetherCheck(HashMap<String, String> checkClip)
			throws SQLException;

	public int addClipToList(HashMap<String, String> checkClip)
			throws SQLException;

	public int deleteClipFromList(HashMap<String, String> checkClip)
			throws SQLException;

	public void updateClipCount(int tipNo) throws SQLException;

	public int clipCountByTipNo(int tipNo) throws SQLException;

	/* MyPage & Clip */
	public int countOfMyClip(String email) throws SQLException;

	public List<ClipListVO> listOfMyClip(HashMap<String, String> myClip)
			throws SQLException;

	// main
	public List<TipBoardVO> getTipBoardListByClipCount() throws SQLException;
	
	
	 // comment
   public void addCommentToTip(CommentVO commentVO) throws SQLException;

   public List<CommentVO> getAllCommentFromTipBoard(int tipNo)
         throws SQLException;

   public void deleteTipComment(int tipNo) throws SQLException;

   public void updateTipComment(CommentVO cmtvo) throws SQLException;

   public int getLatestCommentNo() throws SQLException;
}
