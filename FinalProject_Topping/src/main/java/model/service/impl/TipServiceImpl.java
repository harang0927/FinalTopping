package model.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.TipDAO;
import model.service.TipService;
import model.vo.ClipListVO;
import model.vo.CommentVO;
import model.vo.PagingBean;
import model.vo.PagingBeanOfMyPage;
import model.vo.PagingClipListVO;
import model.vo.PagingTipPlaceIdVO;
import model.vo.PagingTipPlaceNameVO;
import model.vo.PagingTipTypeVO;
import model.vo.TipBoardVO;
import model.vo.TipListVO;
import model.vo.UploadImageVO;

public class TipServiceImpl implements TipService{
	private TipDAO tipDAO;
	public void setTipDAO(TipDAO tipDAO) {
		this.tipDAO = tipDAO;
	}
	

	@Override
	public void addTipToTipBoard(TipBoardVO tbvo) throws SQLException {
		tipDAO.addTipToTipBoard(tbvo);
		String date=tipDAO.getWriteDateOfTip(tbvo.getTipNo());
		tbvo.setWriteDate(date);
	}

	@Override
	public void updateTip(TipBoardVO tbvo) throws SQLException {
		tipDAO.updateTip(tbvo);
	}

	@Override
	public TipBoardVO showTipByNo(int tipNo) throws SQLException {
		return tipDAO.showTipByNo(tipNo);
	}

	@Override
	public void deleteFromTipBoard(int tipNo) throws SQLException {
		tipDAO.deleteFromTipBoard(tipNo);
	}

	@Override
	public int getCountOfAllTip() throws SQLException {
		return tipDAO.getCountOfAllTip();
	}

	@Override
	public String getWriteDateOfTip(int tipNo) throws SQLException {
		return tipDAO.getWriteDateOfTip(tipNo);
	}

	@Override
	public TipListVO getTipBoardList(String pageNo) throws SQLException {
		
		if(pageNo==null || pageNo=="") pageNo="1";
		System.out.println("service 이후 1이 되야함 :" + pageNo); //1

		int total=tipDAO.getCountOfAllTip();
		List<TipBoardVO> list=tipDAO.getTipBoardList(pageNo);
		for(int i=0; i< list.size(); i++){
			list.get(i).setImg(
					tipDAO.getUploadImageForTip(
							list.get(i).getTipNo()));
			list.get(i).setClipCount(tipDAO.clipCountByTipNo(list.get(i).getTipNo()));
		}
		
		
		System.out.println(list);
		PagingBean paging = 
				new PagingBean(total, Integer.parseInt(pageNo));
		TipListVO tlvo = new TipListVO(paging, list);
		System.out.println("tlvo :: "+ tlvo);
		return tlvo;
	}

	@Override
	public TipListVO getTipBoardSearchList(HashMap<String, Object> searchMap)
			throws SQLException {
		
		if(searchMap.get("pageNo")==null || searchMap.get("pageNo")=="") searchMap.put("pageNo", 1);
		System.out.println("service 이후 1이 되야함 :" + searchMap.get("pageNo")); //1
	
		int total=tipDAO.getCountOfSearch(searchMap);
		System.out.println("total :: " + total);
		System.out.println("Service :: "+searchMap.get("pageNo"));
		List<TipBoardVO> list=tipDAO.getTipBoardSearchList(searchMap);
		for(int i=0; i< list.size(); i++){
			list.get(i).setImg(
					tipDAO.getUploadImageForTip(
							list.get(i).getTipNo()));
			list.get(i).setClipCount(tipDAO.clipCountByTipNo(list.get(i).getTipNo()));
		}
		
		
		System.out.println("getTipBoardSearchList ::" + list);
		PagingBean paging = 
				new PagingBean(total, Integer.parseInt(String.valueOf(searchMap.get("pageNo"))));
		TipListVO tlvo = new TipListVO(paging, list);
		System.out.println("tlvo :: "+ tlvo);
		return tlvo;
	}
	
	
	@Override
	public TipListVO getTipBoardListByType(PagingTipTypeVO pttvo) throws SQLException {

		if(pttvo.getPageNo()==null || pttvo.getPageNo()==""){
			pttvo.setPageNo("1");
		}
		//System.out.println("service 이후 1이 되야함 :" + pageNo); //1

		int total=tipDAO.getCountOfTipByPlace(pttvo.getType());
		List<TipBoardVO> list=tipDAO.getTipBoardList(pttvo.getPageNo());
		//System.out.println(list);
		PagingTipTypeVO paging = 
				new PagingTipTypeVO(pttvo.getType(), pttvo.getPageNo());
		TipListVO tlvo = new TipListVO(paging, list);
		//System.out.println(qlvo);
		return tlvo;
	}

	@Override
	public TipListVO searchTipBoardListByPlace(PagingTipPlaceNameVO ptpvo)
			throws SQLException {

		if(ptpvo.getPageNo()==null || ptpvo.getPageNo()=="") ptpvo.setPageNo("1");
		//System.out.println("service 이후 1이 되야함 :" + pageNo); //1

		int total=tipDAO.getCountOfTipByPlace(ptpvo.getPlaceName());
		List<TipBoardVO> list=tipDAO.searchTipBoardListByPlace(ptpvo);
		//System.out.println(list);
		PagingTipPlaceNameVO paging = 
				new PagingTipPlaceNameVO(ptpvo.getPlaceName(), ptpvo.getPageNo());
		TipListVO tlvo = new TipListVO(paging, list);
		//System.out.println(qlvo);
		return tlvo;
	}

	@Override
	public void deleteTipImg(int imgNo) throws SQLException {
		tipDAO.deleteTipImg(imgNo);
	}

	@Override
	public void updateTipImg(HashMap<String, Object> hm) throws SQLException {
		tipDAO.updateTipImg(hm);
		
	}


	@Override
	public List<UploadImageVO> getUploadImageForTip(int tipNo)
			throws SQLException {
		return tipDAO.getUploadImageForTip(tipNo);
	}


	@Override
	public TipListVO getTipBoardListByPlaceId(PagingTipPlaceIdVO ptpivo)
			throws SQLException {
		  System.out.println("ptpivo.getPlaceId :: " + ptpivo.getPlaceId());
		  int count = tipDAO.getCountOfPlaceId(ptpivo.getPlaceId());
		  System.out.println("count :: " + count);
	      List<TipBoardVO> list = tipDAO.getTipBoardListByPlaceId(ptpivo);
	      
	      for(int i=0; i< list.size(); i++){
				list.get(i).setImg(
						tipDAO.getUploadImageForTip(
								list.get(i).getTipNo()));
				list.get(i).setClipCount(tipDAO.clipCountByTipNo(list.get(i).getTipNo()));
			}
	      
	      PagingBean pagingBean = new PagingBeanOfMyPage(count, Integer.parseInt(ptpivo.getPageNo()));   
	      TipListVO tlvo = new TipListVO(pagingBean, list);
	      return tlvo;
	}


	@Override
	public boolean changeTipStatus(HashMap<String, String> map) throws SQLException {
		boolean flag = false;
		
		if(tipDAO.clipWhetherCheck(map)){
			tipDAO.deleteClipFromList(map);
			flag = true;
		}else{
			tipDAO.addClipToList(map);
		}
		tipDAO.updateClipCount(Integer.parseInt(map.get("tipNo")));
		
		return flag;
	}


	@Override
	public boolean clipWhetherCheck(HashMap<String, String> checkClip)
			throws SQLException {
		
		return tipDAO.clipWhetherCheck(checkClip);
	}


	@Override
	public void updateClipCount(int tipNo) throws SQLException {
	
		tipDAO.updateClipCount(tipNo);
	}


	@Override
	public int clipCountByTipNo(int tipNo) throws SQLException{
		return tipDAO.clipCountByTipNo(tipNo);
	}


	@Override
	public List<TipBoardVO> getTipBoardListByClipCount() throws SQLException {
		List<TipBoardVO> list = tipDAO.getTipBoardListByClipCount();
		for(int i=0; i< list.size(); i++){
			list.get(i).setImg(
					tipDAO.getUploadImageForTip(list.get(i).getTipNo()));
		}
		
		return list;
	}


	   // comment
	   @Override
	   public void addCommentToTip(CommentVO commentVO) throws Exception {
	      System.out.println(":: " + getClass().getName()
	            + ".addCommentToTip call.. ");
	      /*
	       * int no = activityDao.getLatestCommentNo();
	       * System.out.println("number:: " + no); commentVO.setCommentNo(no);
	       */
	      tipDAO.addCommentToTip(commentVO);

	   }

	   @Override
	   public List<CommentVO> getAllCommentFromTipBoard(int tipNo)
	         throws Exception {
	      System.out.println(":: " + getClass().getName()
	            + ".getAllCommentFromActivityBoard call.. ");
	      return tipDAO.getAllCommentFromTipBoard(tipNo);
	   }

	   @Override
	   public void deleteTipComment(int commentNo) throws Exception {
	      System.out.println(":: " + getClass().getName()
	            + ".deleteActivityComment call.. ");
	      tipDAO.deleteTipComment(commentNo);

	   }

	   @Override
	   public void updateTipComment(CommentVO cmtvo) throws Exception {
	      System.out.println(":: " + getClass().getName()
	            + ".updateTipComment call.. ");
	      tipDAO.updateTipComment(cmtvo);
	   }
	   
	   public PagingClipListVO myClipList(HashMap<String, String> map) throws Exception{
	         int count = tipDAO.getCountOfMyTip(map.get("email"));
	         List<ClipListVO> list = tipDAO.listOfMyClip(map);
	         PagingBean pagingBean = new PagingBeanOfMyPage(count, Integer.parseInt(map.get("pageNo")));
	         
	         return new PagingClipListVO(pagingBean, list);
	      }

}
