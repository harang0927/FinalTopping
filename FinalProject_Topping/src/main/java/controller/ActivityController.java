package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.ActivityService;
import model.service.CommonService;
import model.vo.ActivityAttendanceVO;
import model.vo.ActivityBoardVO;
import model.vo.CommentVO;
import model.vo.MemberVO;
import model.vo.ToppingListVO;
import model.vo.UploadImageVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class ActivityController extends MultiActionController {

	ActivityService activityService;
	CommonService commonService;
	String path;

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public ModelAndView createActivity(HttpServletRequest request,
			HttpServletResponse response, ActivityBoardVO abvo)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".createActivity call..");
		System.out.println("abvo:: " + abvo);

		System.out.println("placeid: " + abvo.getPlaceVO().getPlaceId());
		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO) session.getAttribute("mvo");

		if (mvo == null) // 로그인 안했다.
			return new ModelAndView("redirect:/main01.jsp");
		else
			abvo.setMemberVO(mvo); // activityVO에 작성자 등록
		System.out.println("작성자: " + mvo);
		List<MultipartFile> files = abvo.getUploadFile();

		List<UploadImageVO> upload = new ArrayList<UploadImageVO>();

		// String[] nameList = new String[files.size()];
		if (!files.isEmpty()) {

			for (int i = 0; i < files.size(); i++) {

				String orgName = files.get(i).getOriginalFilename();
				if (orgName != "") {
					String newName = System.currentTimeMillis() + "_" + orgName;
					String savePath = path + newName;

					System.out.println("orgName: " + orgName + "\nnewName: "
							+ newName + "\nsavePath: " + savePath);

					files.get(i).transferTo(new File(savePath));

					upload.add(new UploadImageVO(orgName, newName, savePath));
				}
			}
		}

		abvo.setImg(upload);
		System.out.println("upload?" + upload.size());
		Thread.sleep(5000);
		activityService.createActivity(abvo);

		int activityNo = abvo.getActivityNo(); // seq 받아오기.
		System.out.println("activityNo: " + activityNo);
		for (UploadImageVO img : upload) { // 관리자가 img 관리하기 위해서
			if (img.getOrgName() != "") {
				img.setBoardNo(activityNo);
				// seqence가 boardNo가 돼서 uploadimage테이블에 저장
				img.setBoardType(0);
				commonService.uploadImage(img);
				System.out.println("uploading:" + img);
			}

			// activity: 0번게시판
		}
		Thread.sleep(5000);
		return new ModelAndView(
				"redirect:activity.do?command=showActivityByNo&&activityNo="
						+ activityNo);
	}
	public ModelAndView getActivityList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: "+getClass().getName()+".....call");
		String type2 = request.getParameter("type2");
		String[] type1 = request.getParameterValues("type1");
		String title = request.getParameter("title");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(type1 != null)
			map.put("type1", type1);
		if(title != null)
			map.put("title", title);
		if(type2 == null)
			type2 = "recently";
		map.put("type2", type2);
		List<ActivityBoardVO> list = activityService.getActivityList(map);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setImg(
					activityService.getUploadImageForActivity(list.get(i).getActivityNo()));
		}

		return new ModelAndView("activity_list", "list", list);
	}
	public ModelAndView getActivityListByType(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: "+getClass().getName()+"...getActivityListByType()...call");
		String type2 = request.getParameter("type2");
		String[] type1 = null;
		if(request.getParameter("type1") != null && request.getParameter("type1") != ""){
			type1 = request.getParameter("type1").split(",");
		}
		String title = request.getParameter("title");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(type1 != null)
			map.put("type1", type1);
		if(title != null)
			map.put("title", title);

		map.put("type2", type2);
		List<ActivityBoardVO> list = activityService.getActivityList(map);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setImg(
					activityService.getUploadImageForActivity(list.get(i).getActivityNo()));
		}

		return new ModelAndView("JsonView", "list", list);
	}

	public ModelAndView infiniteScrollDown(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int scrollStart = Integer.parseInt(request.getParameter("scrollStart"));
		/* 추가 */
		String type2 = request.getParameter("type2");
		String[] type1 = null;
		if(request.getParameter("type1") != null && request.getParameter("type1") != ""){
			type1 = request.getParameter("type1").split(",");
		}
		String title = request.getParameter("title");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(type1 != null)
			map.put("type1", type1);
		if(title != null)
			map.put("title", title);

		map.put("type2", type2);
		map.put("scrollStart", scrollStart);
		/* 여기까지 */
		System.out.println("starting...: " + scrollStart);
		/* 변경 Service 인자값 scrollStart -> map */
		List<ActivityBoardVO> list = activityService.infiniteScrollDown(map);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setImg(
					activityService.getUploadImageForActivity(list.get(i).getActivityNo()));
		}

		return new ModelAndView("JsonView", "list", list);
	}

	public ModelAndView showActivityByNo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".showActivityByNo call..");

		int activityNo = Integer.parseInt((String) request
				.getParameter("activityNo"));

		System.out.println(activityNo);
		ActivityBoardVO abvo = activityService.showActivityByNo(activityNo);
		abvo.setImg(activityService.getUploadImageForActivity(activityNo));
/*		abvo.setActivityAttendanceVO(activityService
				.getActivityAttendanceList(activityNo));
		List<ActivityAttendanceVO> list = activityService
				.getActivityAttendanceList(activityNo);*/

/*		System.out.println("list: " + list);*/
		abvo.setCommentVO(activityService.getAllCommentFromActivityBoard(activityNo));
		return new ModelAndView("activity_content", "abvo", abvo);
	}

	public ModelAndView updateActivityView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int activityNo = Integer.parseInt((String) request
				.getParameter("activityNo"));
		ActivityBoardVO abvo = activityService.showActivityByNo(activityNo);
		abvo.setImg(activityService.getUploadImageForActivity(activityNo));

		return new ModelAndView("activity_update", "abvo", abvo);
	}

	public ModelAndView updateActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".updateActivity call..");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));

		activityService.updateActivity(activityNo);
		// 관련 이미지도 uploadimage테이블에서 수정해 됨
		return new ModelAndView("show_deatiled", "vo",
				activityService.showActivityByNo(activityNo));

	}

	public ModelAndView deleteActivity(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivity call..");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		System.out.println("activityNo: " + activityNo);
		activityService.deleteActivity(activityNo);
		// 관련 이미지도 uploadimage테이블에서 삭제해야 됨
		if(request.getParameter("newName") != null && request.getParameter("newName") != ""){
			String[] newName = request.getParameter("newName").split(",");
			for(int i=0;i<newName.length;i++){
				commonService.deleteUploadImg(path + newName[i]);
			}
		}
		return new ModelAndView("redirect:activity.do?command=getActivityList");

	}

	public ModelAndView deleteActivityImg(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".deleteActivityImg call..");
		int imgNo = Integer.parseInt(request.getParameter("imgNo"));

		activityService.deleteActivityImg(imgNo);

		return new ModelAndView("JsonView", "imgNo", imgNo);

	}

	public ModelAndView changeStateOfActivityFromToppingList(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityFromToppingList call..");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));

		ToppingListVO tvo = new ToppingListVO(mvo, new ActivityBoardVO(activityNo));

		HashMap<String, Object> map = activityService.changeStateOfActivityFromToppingList(tvo);

		return new ModelAndView("JsonView", "map", map);

	}
	
	/* Topping 상태 확인 */
	public ModelAndView checkStateOfActivityFromToppingList(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".checkStateOfActivityFromToppingList call..");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));

		ToppingListVO tvo = new ToppingListVO(mvo, new ActivityBoardVO(
				activityNo));
		
		int status = activityService.checkStateOfActivityFromToppingList(tvo);
		
		return new ModelAndView("JsonView", "status", status);

	}

	public ModelAndView changeStateOfActivityJoin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityJoin call..");

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));

		/*
		 * 1. 우선 activity가 신청가능한 상태인지 확인( view에서 hidden처리할지?) 어차피 사용자가 신청안했을때도
		 * 비활성화되는 로직 필요함 
		 * 2. 사용자가 이 activity에 신청한적이있으면 취소가 돼야하고, 없으면 신청이
		 * 되야한다.(status값으로 ajax로 처리..)
		 */
		System.out.println(mvo.getEmail()+", "+activityNo);
		
		ActivityAttendanceVO aavo = new ActivityAttendanceVO(new MemberVO(
				mvo.getEmail()), new ActivityBoardVO(activityNo));
		

		HashMap<String, Object> map = activityService.changeStateOfActivityJoin(aavo);
		// request.getSession().setAttribute("joinStatus", joinStatus);
		return new ModelAndView("JsonView", "map", map);

	}
	/* 추가 */
	public ModelAndView checkStateOfActivityJoin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivityJoin call..");

		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));

		/*
		 * 1. 우선 activity가 신청가능한 상태인지 확인( view에서 hidden처리할지?) 어차피 사용자가 신청안했을때도
		 * 비활성화되는 로직 필요함 
		 * 2. 사용자가 이 activity에 신청한적이있으면 취소가 돼야하고, 없으면 신청이
		 * 되야한다.(status값으로 ajax로 처리..)
		 */
		System.out.println(mvo.getEmail()+", "+activityNo);
		
		ActivityAttendanceVO aavo = new ActivityAttendanceVO(new MemberVO(
				mvo.getEmail()), new ActivityBoardVO(activityNo));
		
		

		int joinStatus = activityService.checkStateOfActivityJoin(aavo);
		
		return new ModelAndView("JsonView", "joinStatus", joinStatus);
	}

	public ModelAndView getLatestActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getLatestActivity call..");

		return new ModelAndView();

	}

	public ModelAndView getCloseToDeadLineActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getCloseToDeadLineActivity call..");

		return new ModelAndView();

	}

	public ModelAndView getMostLikedActivityByDistrict(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getMostLikedActivityByDistrict call..");

		return new ModelAndView();

	}

	public ModelAndView getActivityByType(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByType call..");
		String activityType = request.getParameter("activityType");
		List<ActivityBoardVO> list = activityService
				.getActivityByType(activityType);
		System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setImg(
					activityService.getUploadImageForActivity(list.get(i).getActivityNo()));
		}
		return new ModelAndView("JsonView", "list", list);

	}

	public ModelAndView getCountOfAllActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getCountOfAllActivity call..");

		return new ModelAndView();

	}

	public ModelAndView getCountOfActivityByType(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getCountOfActivityByType call..");

		return new ModelAndView();

	}

	public ModelAndView getCountOfActivityByDistrict(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getCountOfActivityByDistrict call..");

		return new ModelAndView();

	}

	public ModelAndView getActivityByWriter(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByWriter call..");

		return new ModelAndView();

	}

	public ModelAndView getActivityByTitle(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByTitle call..");

		return new ModelAndView();

	}

	public ModelAndView getActivityByContent(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".getActivityByContent call..");

		return new ModelAndView();

	}

	public ModelAndView checkStateOfActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".checkStateOfActivity call..");

		return new ModelAndView();

	}

	public ModelAndView changeStateOfActivity(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".changeStateOfActivity call..");

		return new ModelAndView();

	}

	public ModelAndView addActivityToLikeList(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".addActivityToLikeList call..");

		return new ModelAndView();

	}

	public ModelAndView cancelActivityFromLikeList(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".cancelActivityFromLikeList call..");

		return new ModelAndView();

	}

	public ModelAndView addPlaceToBestDestination(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println(":: " + getClass().getName()
				+ ".addPlaceToBestDestination call..");

		return new ModelAndView();

	}

	public ModelAndView getPopularActivity(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		if(session.getAttribute("mvo") == null)
			return new ModelAndView("redirect:main01.jsp");
		
		List<ActivityBoardVO> list = activityService.getPopularActivity();
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setImg(
					activityService.getUploadImageForActivity(list.get(i).getActivityNo()));
		}
		for(ActivityBoardVO vo : list)
			System.out.println(vo);
		return new ModelAndView("JsonView", "actList",list);
	}
	
	public ModelAndView checkToppingByNo(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		boolean flag = false;
		if(session.getAttribute("mvo") == null)
			return new ModelAndView("redirect:main01.jsp");
		
		String email = ((MemberVO)session.getAttribute("mvo")).getEmail();
		String actNo = request.getParameter("actNo");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("actNo", actNo);
		flag = activityService.checkToppingByNo(map);
		System.out.println("flag :: "+flag);
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("flag", flag);
		res.put("actNo", actNo);
		
		return new ModelAndView("JsonView", "map", res);
	}

	  // comment
   public ModelAndView addCommentToActivity(HttpServletRequest request,
         HttpServletResponse response, CommentVO vo) throws Exception {
      System.out.println(":: " + getClass().getName()
            + ".addCommentToActivity call..");
      MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
      System.out.println("member??" + mvo);

      if (mvo == null)
         return new ModelAndView("main01");
      vo.setMemberVO(mvo);

      activityService.addCommentToActivity(vo);
      System.out.println("vo???" + vo);
      return new ModelAndView("JsonView", "cmtvo", vo);

   }

   public ModelAndView deleteActivityComment(HttpServletRequest request,
         HttpServletResponse response, CommentVO vo) throws Exception {
      System.out.println(":: " + getClass().getName()
            + ".deleteActivityComment call..");
      int commentNo = Integer.parseInt(request.getParameter("commentNo"));
      activityService.deleteActivityComment(commentNo);
      return new ModelAndView("JsonView");

   }

   public ModelAndView updateActivityComment(HttpServletRequest request,
         HttpServletResponse response, CommentVO vo) throws Exception {
      System.out.println(":: " + getClass().getName()
            + ".updateActivityComment call..");
      int commentNo = Integer.parseInt(request.getParameter("commentNo"));
      String content = request.getParameter("content");

      activityService
            .updateActivityComment(new CommentVO(commentNo, content));
      return new ModelAndView("JsonView");

   }
}
