package model.service.impl;

import java.util.HashMap;
import java.util.List;

import model.dao.ActivityDAO;
import model.dao.CommonDAO;

import model.service.ActivityService;
import model.vo.ActivityAttendanceVO;
import model.vo.ActivityBoardVO;
import model.vo.CommentVO;
import model.vo.ToppingListVO;
import model.vo.UploadImageVO;

public class ActivityServiceImpl implements ActivityService {

	ActivityDAO activityDao;
	CommonDAO commonDAO;

	public void setActivityDao(ActivityDAO activityDao) {
		this.activityDao = activityDao;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	@Override
	public void createActivity(ActivityBoardVO abvo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".createActivity call..");

		activityDao.createActivity(abvo); // activity 만들기

	}

	@Override
	public ActivityBoardVO showActivityByNo(int activityNo) throws Exception {
		System.out.println(":: " + getClass() + ".showActivityByNo call..");
		ActivityBoardVO vo = activityDao.showActivityByNo(activityNo);
		vo.setImg(activityDao.getUploadImageForActivity(activityNo));

		return activityDao.showActivityByNo(activityNo);
	}

	@Override
	public void updateActivity(int activityNo) throws Exception {
		System.out.println(":: " + getClass() + ".updateActivity call..");

		activityDao.updateActivity(activityNo);
	}

	@Override
	public void deleteActivity(int activityNo) throws Exception {
		System.out.println(":: " + getClass() + ".deleteActivity call..");

		activityDao.deleteActivity(activityNo);

	}

	@Override
	public List<UploadImageVO> getUploadImageForActivity(int imgNo)
			throws Exception {
		System.out.println(":: " + getClass()
				+ ".getUploadImageForActivity call..");
		return activityDao.getUploadImageForActivity(imgNo);
	}

	@Override
	public List<ActivityBoardVO> getActivityList(HashMap<String, Object> map)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityList call.. ");

		List<ActivityBoardVO> list = activityDao.getActivityList(map);

		for (int i = 0; i < list.size(); i++) {
			int activityNo = list.get(i).getActivityNo();
			list.get(i)
					.setToppingCount(activityDao.getToppingCount(activityNo));

		}
		return list;

	}

	@Override
	public List<ActivityBoardVO> infiniteScrollDown(HashMap<String, Object> map)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".infiniteScrollDown call.. ");
		List<ActivityBoardVO> list = activityDao.infiniteScrollDown(map);
		System.out.println("infinite scroll할 list:" + list.size());
		for (int i = 0; i < list.size(); i++) {
			int activityNo = list.get(i).getActivityNo();
			list.get(i)
					.setToppingCount(activityDao.getToppingCount(activityNo));
		}
		return list;

	}

	@Override
	public void deleteActivityImg(int activityNo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityImg call.. ");
		activityDao.deleteActivityImg(activityNo);
	}

	@Override
	public HashMap<String, Object> changeStateOfActivityFromToppingList(
			ToppingListVO tvo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityFromToppingList call.. ");
		int status = activityDao.checkActivityFromToppingList(tvo);
		System.out.println("status: " + status);
		if (status == 1) {
			activityDao.deleteActivityFromToppingList(tvo);
		} else {
			activityDao.addActivityToToppingList(tvo);
		}
		activityDao.updateActivityToppingCount(tvo.getActivityBoardVO()
				.getActivityNo());
		int count = activityDao.getCountToppingCountByNo(tvo
				.getActivityBoardVO().getActivityNo());

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("count", count);

		return map;
	}

	/* 토핑 상태 체크 */
	@Override
	public int checkStateOfActivityFromToppingList(ToppingListVO tvo)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".checkStateOfActivityFromToppingList call.. ");
		int status = activityDao.checkActivityFromToppingList(tvo);
		System.out.println("checkstatus: " + status);

		return status;
	}

	@Override
	public HashMap<String, Object> changeStateOfActivityJoin(
			ActivityAttendanceVO aavo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityJoin call.. ");

		int joinStatus = activityDao.checkFromActivityAttendance(aavo);
		System.out.println("status: " + joinStatus);
		if (joinStatus == 0) {
			activityDao.joinActivity(aavo);
		} else {
			activityDao.exitActivity(aavo);
		}
		activityDao.updateActivityAttendance(aavo.getActivityBoardVO()
				.getActivityNo());

		int nowAttendance = activityDao.checkVacancyOfActivity(aavo);
		// 0: join / 1: exit

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("joinStatus", joinStatus);
		map.put("nowAttendance", nowAttendance);

		return map;
	}

	@Override
	public int checkStateOfActivityJoin(ActivityAttendanceVO aavo)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityJoin call.. ");

		int joinStatus = activityDao.checkFromActivityAttendance(aavo);
		// 0: join / 1: exit

		return joinStatus;
	}

	/*
	 * @Override public List<ActivityAttendanceVO> getActivityAttendanceList(int
	 * activityNo) throws Exception { System.out.println(":: " +
	 * getClass().getName() + ".getActivityAttendanceList call.. ");
	 * 
	 * return activityDao.getActivityAttendanceList(activityNo); }
	 */
	@Override
	public List<ActivityBoardVO> getActivityByType(String activityType)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByType call.. ");

		List<ActivityBoardVO> list = activityDao
				.getActivityByType(activityType);
		for (int i = 0; i < list.size(); i++) {
			int activityNo = list.get(i).getActivityNo();
			list.get(i)
					.setToppingCount(activityDao.getToppingCount(activityNo));
		}

		return list;
	}

	@Override
	public List<ActivityBoardVO> getPopularActivity() throws Exception {
		return activityDao.getPopularActivity();
	}

	@Override
	public boolean checkToppingByNo(HashMap<String, String> map)
			throws Exception {
		return activityDao.checkToppingByNo(map);
	}

	// comment
	@Override
	public void addCommentToActivity(CommentVO commentVO) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".addCommentToActivity call.. ");
		/*
		 * int no = activityDao.getLatestCommentNo();
		 * System.out.println("number:: " + no); commentVO.setCommentNo(no);
		 */
		activityDao.addCommentToActivity(commentVO);

	}

	@Override
	public List<CommentVO> getAllCommentFromActivityBoard(int activityNo)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".getAllCommentFromActivityBoard call.. ");
		return activityDao.getAllCommentFromActivityBoard(activityNo);
	}

	@Override
	public void deleteActivityComment(int commentNo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityComment call.. ");
		activityDao.deleteActivityComment(commentNo);

	}

	@Override
	public void updateActivityComment(CommentVO cmtvo) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".updateActivityComment call.. ");
		activityDao.updateActivityComment(cmtvo);
	}

}
