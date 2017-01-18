package model.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dao.ActivityDAO;
import model.vo.ActivityAttendanceVO;
import model.vo.ActivityBoardVO;
import model.vo.CommentVO;
import model.vo.ToppingListVO;
import model.vo.UploadImageVO;

import org.mybatis.spring.SqlSessionTemplate;

public class ActivityDAOImpl implements ActivityDAO {
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int createActivity(ActivityBoardVO abvo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".createActivity call..");

		return sqlSession.insert("Activity.createActivity", abvo);
	}

	@Override
	public List<UploadImageVO> getUploadImageForActivity(int activityNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getUploadImageForActivity call..");
		// 상세보기를 위해 필요한 비즈니스 로직
		return sqlSession.selectList("Activity.getUploadImageForActivity",
				activityNo);

	}

	@Override
	public ActivityBoardVO showActivityByNo(int activityNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".showActivityByNo call..");
		return sqlSession.selectOne("Activity.showActivityByNo", activityNo);
	}

	@Override
	public void updateActivity(int activityNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".updateActivity call..");

		sqlSession.update("Activity.updateActivity", activityNo);
	}

	@Override
	public void deleteActivity(int activityNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivity call..");
		sqlSession.delete("Activity.deleteActivity", activityNo);

	}

	@Override
	public int getCountOfAllActivity() throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getCountOfAllActivity call..");

		return sqlSession.selectOne("Activity.getCountOfAllActivity");
	}

	@Override
	public List<ActivityBoardVO> getActivityList(HashMap<String, Object> map) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityList call..");
		List<ActivityBoardVO> list = sqlSession.selectList("Activity.getActivityList", map);
		for(ActivityBoardVO vo : list)
			System.out.println("vo :: "+vo.getActivityNo());
		return list;
	}

	@Override
	public List<ActivityBoardVO> infiniteScrollDown(HashMap<String, Object> map)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".infiniteScrollDown call..");

		return sqlSession
				.selectList("Activity.infiniteScrollDown", map);
	}

	@Override
	public void deleteActivityImg(int imgNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityImg call..");
		sqlSession.delete("Activity.deleteActivityImg", imgNo);

	}

	@Override
	public void addActivityToToppingList(ToppingListVO tvo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".addActivityToToppingList call..");
		System.out.println("AddDAO :: " + tvo);
		sqlSession.insert("Activity.addActivityToToppingList", tvo);
	}

	@Override
	public int checkActivityFromToppingList(ToppingListVO tvo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".checkActivityFromToppingList call..");
		System.out.println("ChkDAO :: " + tvo);
		return sqlSession.selectOne("Activity.checkActivityFromToppingList", tvo);
	}

	@Override
	public void deleteActivityFromToppingList(ToppingListVO tvo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityFromToppingList call..");
		System.out.println("DelDAO :: " + tvo);
		sqlSession.delete("Activity.deleteActivityFromToppingList", tvo);
	}
	

	@Override
	public int checkFromActivityAttendance(ActivityAttendanceVO aavo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".checkFromActivityAttendance call..");

		return sqlSession.selectOne("Activity.checkFromActivityAttendance",
				aavo);
	}

	@Override
	public void joinActivity(ActivityAttendanceVO aavo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".joinActivity call..");

		sqlSession.insert("Activity.joinActivity", aavo);
	}

	@Override
	public void exitActivity(ActivityAttendanceVO aavo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".exitActivity call..");
		sqlSession.delete("Activity.exitActivity", aavo);
	}

	@Override
	public int checkVacancyOfActivity(ActivityAttendanceVO aavo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".checkVacancyOfActivity call..");
		return sqlSession.selectOne("Activity.checkVacancyOfActivity", aavo);
	}

	@Override
	public int getCountOfActivityByType(String activityType)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getCountOfActivityByType call..");
		return sqlSession.selectOne("Activity.getCountOfActivityByType",activityType);
	}

/*	@Override
	public List<ActivityBoardVO> getActivityByWriter(String nickName)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByWriter call..");
		return sqlSession.selectList("Activity.getActivityByWriter", nickName);
	}*/
/*
	@Override
	public List<ActivityAttendanceVO> getActivityAttendanceList(int activityNo)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityAttendanceList call..");
		return sqlSession
				.selectList("Activity.getActivityByWriter", activityNo);
	}
*/
	@Override
	public int getToppingCount(int activityNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getToppingCount call..");
		return sqlSession.selectOne("Activity.getToppingCount", activityNo);
	}

	@Override
	public List<ActivityBoardVO> getActivityByType(String activityType)
			throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByType call..");
		return sqlSession.selectList("Activity.getActivityByType", activityType);
	}

	@Override
	public void updateActivityAttendance(int activityNo) throws SQLException {
		System.out.println(":: " + getClass().getName()
				+ ".addActivityAttendance call..");
		sqlSession.update("Activity.updateActivityAttendance", activityNo);
	}
	
	

	@Override
	public int getCountOfMyActivity(String email) throws SQLException {
		return sqlSession.selectOne("Activity.getCountOfMyActivity", email);
	}

	@Override
	public List<ActivityBoardVO> getListOfMyActivity(
			HashMap<String, String> forMyActivity) throws SQLException {
		return sqlSession.selectList("Activity.getListOfMyActivity", forMyActivity);
	}

	@Override
	public int getCountOfAttendActivity(String email) throws SQLException {
		return sqlSession.selectOne("Activity.getCountOfAttendActivity", email);
	}

	@Override
	public List<ActivityBoardVO> getListOfAttendActivity(
			HashMap<String, String> forAttendActivity) throws SQLException {
		return sqlSession.selectList("Activity.getListOfAttendActivity", forAttendActivity);
	}

	@Override
	public int getCountOfToppingActivityByEmail(String email)
			throws SQLException {
		return sqlSession.selectOne("Activity.getCountOfToppingActivityByEmail", email);
	}

	@Override
	public List<ToppingListVO> getListOfToppingActivityByEmail(
			HashMap<String, String> forMypage) throws SQLException {
		return sqlSession.selectList("Activity.getListOfToppingActivityByEmail", forMypage);
	}

	@Override
	public List<ActivityBoardVO> getPopularActivity() throws SQLException {
		sqlSession.selectList("Activity.getPopularActivityForMain");
		return sqlSession.selectList("Activity.getPopularActivityForMain");
	}

	@Override
	public boolean checkToppingByNo(HashMap<String, String> map)
			throws SQLException {
		return sqlSession.selectOne("Activity.checkToppingByNo", map);
	}

	
	/* ToppingCount Update */
	public void updateActivityToppingCount(int activityNo) throws SQLException{
		sqlSession.update("Activity.updateActivityToppingCount", activityNo);
	}
	
	public int getCountToppingCountByNo(int activityNo) throws SQLException{
		return sqlSession.selectOne("Activity.getCountToppingCountByNo", activityNo);
	}

	// comment

   @Override
   public void addCommentToActivity(CommentVO commentVO) throws SQLException {
      System.out.println(":: " + getClass().getName()
            + ".addCommentToActivity calls.. ");
      sqlSession.insert("Activity.addCommentToActivity", commentVO);
   }

   @Override
   public List<CommentVO> getAllCommentFromActivityBoard(int activityNo)
         throws SQLException {
      System.out.println(":: " + getClass().getName()
            + ".getAllCommentFromActivityBoard calls.. ");

      return sqlSession.selectList("Activity.getAllCommentFromActivityBoard",
            activityNo);

   }

   @Override
   public void deleteActivityComment(int commentNo) throws SQLException {
      System.out.println(":: " + getClass().getName()
            + ".deleteActivityComment calls.. ");
      sqlSession.delete("Activity.deleteActivityComment", commentNo);
   }

   @Override
   public void updateActivityComment(CommentVO cmtvo) throws SQLException {
      System.out.println(":: " + getClass().getName()
            + ".updateActivityComment calls.. ");
      sqlSession.update("Activity.updateActivityComment", cmtvo);
   }

   @Override
   public int getLatestCommentNo() throws SQLException {
      System.out.println(":: " + getClass().getName()
            + ".getLatestCommentNo calls.. ");
      return sqlSession.selectOne("Activity.getLatestCommentNo");
   }
}

