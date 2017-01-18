package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.vo.ActivityAttendanceVO;
import model.vo.ActivityBoardVO;
import model.vo.CommentVO;
import model.vo.ToppingListVO;
import model.vo.UploadImageVO;

public interface ActivityDAO {
	public int createActivity(ActivityBoardVO abvo) throws SQLException;

	public List<UploadImageVO> getUploadImageForActivity(int activityNo)
			throws SQLException;

	public ActivityBoardVO showActivityByNo(int activityNo) throws SQLException;

	public void updateActivity(int activityNo) throws SQLException;

	public void deleteActivity(int activityNo) throws SQLException;

	public int getCountOfAllActivity() throws SQLException;

	public List<ActivityBoardVO> getActivityList(HashMap<String, Object> map)
			throws SQLException;

	public List<ActivityBoardVO> infiniteScrollDown(HashMap<String, Object> map)
			throws SQLException;

	public void deleteActivityImg(int imgNo) throws SQLException;

	public void addActivityToToppingList(ToppingListVO tvo) throws SQLException;

	public int checkActivityFromToppingList(ToppingListVO tvo)
			throws SQLException;

	public void deleteActivityFromToppingList(ToppingListVO tvo)
			throws SQLException;

	public int checkFromActivityAttendance(ActivityAttendanceVO aavo)
			throws SQLException;

	public void joinActivity(ActivityAttendanceVO aavo) throws SQLException;

	public void exitActivity(ActivityAttendanceVO aavo) throws SQLException;

	public int checkVacancyOfActivity(ActivityAttendanceVO aavo)
			throws SQLException;

	public int getCountOfActivityByType(String activityType)
			throws SQLException;

	/*
	 * public List<ActivityBoardVO> getActivityByWriter(String nickName) throws
	 * SQLException;
	 *//*
		 * public List<ActivityAttendanceVO> getActivityAttendanceList(int
		 * activityNo) throws SQLException;
		 */
	public int getToppingCount(int activityNo) throws SQLException;

	public List<ActivityBoardVO> getActivityByType(String activityType)
			throws SQLException;

	public void updateActivityAttendance(int activityNo) throws SQLException;

	public int getCountOfMyActivity(String email) throws SQLException;

	public List<ActivityBoardVO> getListOfMyActivity(
			HashMap<String, String> forMyActivity) throws SQLException;

	public int getCountOfAttendActivity(String email) throws SQLException;

	public List<ActivityBoardVO> getListOfAttendActivity(
			HashMap<String, String> forAttendActivity) throws SQLException;

	public int getCountOfToppingActivityByEmail(String email)
			throws SQLException;

	public List<ToppingListVO> getListOfToppingActivityByEmail(
			HashMap<String, String> forMypage) throws SQLException;

	public List<ActivityBoardVO> getPopularActivity() throws SQLException;

	public boolean checkToppingByNo(HashMap<String, String> map)
			throws SQLException;

	/* ToppingCount Update */
	public void updateActivityToppingCount(int activityNo) throws SQLException;

	public int getCountToppingCountByNo(int activityNo) throws SQLException;

	// comment

	public void addCommentToActivity(CommentVO commentVO) throws SQLException;

	public List<CommentVO> getAllCommentFromActivityBoard(int activityNo)
			throws SQLException;

	public void deleteActivityComment(int commentNo) throws SQLException;

	public void updateActivityComment(CommentVO cmtvo) throws SQLException;

	public int getLatestCommentNo() throws SQLException;

}
