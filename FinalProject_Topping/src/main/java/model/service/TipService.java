package model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.CommentVO;
import model.vo.PagingClipListVO;
import model.vo.PagingTipPlaceIdVO;
import model.vo.PagingTipPlaceNameVO;
import model.vo.PagingTipTypeVO;
import model.vo.TipBoardVO;
import model.vo.TipListVO;
import model.vo.UploadImageVO;

public interface TipService {

	public void addTipToTipBoard(TipBoardVO tbvo) throws SQLException;
	public void updateTip(TipBoardVO tbvo) throws SQLException;
	public TipBoardVO showTipByNo(int tipNo) throws SQLException;
	public void deleteFromTipBoard(int tipNo) throws SQLException;
	public int getCountOfAllTip() throws SQLException;
	public String getWriteDateOfTip(int tipNo) throws SQLException;
	public TipListVO getTipBoardList(String pageNo) throws SQLException;
	public TipListVO getTipBoardListByType(PagingTipTypeVO pttvo) throws SQLException;
	public TipListVO getTipBoardListByPlaceId(PagingTipPlaceIdVO ptpivo) throws SQLException;
	public TipListVO searchTipBoardListByPlace(PagingTipPlaceNameVO ptpvo) throws SQLException;
	public TipListVO getTipBoardSearchList(HashMap<String, Object> searchMap) throws SQLException; 

	public void deleteTipImg(int imgNo) throws SQLException;
	public void updateTipImg(HashMap<String,Object> hm) throws SQLException;
	public List<UploadImageVO> getUploadImageForTip(int boardNo) throws SQLException;
	
	//clip 
	public boolean changeTipStatus(HashMap<String, String> map) throws SQLException;
	public boolean clipWhetherCheck(HashMap<String, String> checkClip) throws SQLException;
	public void updateClipCount(int tipNo) throws SQLException;
	public int clipCountByTipNo(int tipNo) throws SQLException;
	public PagingClipListVO myClipList(HashMap<String, String> map) throws Exception;
	//main
	public List<TipBoardVO> getTipBoardListByClipCount() throws SQLException;
	
	// comment
	   public void addCommentToTip(CommentVO commentVO) throws Exception;

	   public List<CommentVO> getAllCommentFromTipBoard(int tipNo)
	         throws Exception;

	   public void deleteTipComment(int tipNo) throws Exception;

	   public void updateTipComment(CommentVO cmtvo) throws Exception;
}
