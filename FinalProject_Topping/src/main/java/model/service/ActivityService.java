package model.service;

import java.util.HashMap;
import java.util.List;

import model.vo.ActivityAttendanceVO;
import model.vo.ActivityBoardVO;
import model.vo.CommentVO;
import model.vo.ToppingListVO;
import model.vo.UploadImageVO;

public interface ActivityService {

	public void createActivity(ActivityBoardVO abvo) throws Exception;

	public ActivityBoardVO showActivityByNo(int activityNo) throws Exception;

	public void updateActivity(int activityNo) throws Exception;

	public void deleteActivity(int activityNo) throws Exception;

	public List<UploadImageVO> getUploadImageForActivity(int activityNo)
			throws Exception;

	public List<ActivityBoardVO> getActivityList(HashMap<String, Object> map)
			throws Exception;

	public List<ActivityBoardVO> infiniteScrollDown(HashMap<String, Object> map)
			throws Exception;

	public void deleteActivityImg(int imgNo) throws Exception;

	/* Return 타입 변경 */
	public HashMap<String, Object> changeStateOfActivityFromToppingList(
			ToppingListVO tvo) throws Exception;

	/* 추가 */
	public int checkStateOfActivityFromToppingList(ToppingListVO tvo)
			throws Exception;

	/* Return 타입 변경 */
	public HashMap<String, Object> changeStateOfActivityJoin(
			ActivityAttendanceVO aavo) throws Exception;

	/* 추가 */
	public int checkStateOfActivityJoin(ActivityAttendanceVO aavo)
			throws Exception;

	/*
	 * public List<ActivityAttendanceVO> getActivityAttendanceList(int
	 * activityNo) throws Exception;
	 */
	public List<ActivityBoardVO> getActivityByType(String activityType)
			throws Exception;

	public List<ActivityBoardVO> getPopularActivity() throws Exception;

	public boolean checkToppingByNo(HashMap<String, String> map)
			throws Exception;

	// comment
	public void addCommentToActivity(CommentVO commentVO) throws Exception;

	public List<CommentVO> getAllCommentFromActivityBoard(int activityNo)
			throws Exception;

	public void deleteActivityComment(int commentNo) throws Exception;

	public void updateActivityComment(CommentVO cmtvo) throws Exception;
}
