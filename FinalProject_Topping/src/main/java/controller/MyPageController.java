package controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import model.service.MyPageService;
import model.vo.ActivityListVO;
import model.vo.FollowListVO;
import model.vo.FollowVO;
import model.vo.FreeBoardListVO;
import model.vo.MemberVO;
import model.vo.MessageVO;
import model.vo.PagingQnAVO;
import model.vo.PagingToppingListVO;
import model.vo.QnAListVO;
import model.vo.ReceiveMessageListVO;
import model.vo.SendMessageListVO;
import model.vo.TipListVO;
import model.vo.forGetMessageListVO;

public class MyPageController extends MultiActionController{
   MyPageService myPageService;
   String userImagePath;
   

   public void setUserImagePath(String userImagePath) {
      this.userImagePath = userImagePath;
   }

   public void setMyPageService(MyPageService myPageService) {
      this.myPageService = myPageService;
   }

   /* Member */
   /////////////////추가사항.../////////////////
   //updateMember
   public ModelAndView updateUserInfo(HttpServletRequest request,HttpServletResponse response,
         MemberVO pvo)throws Exception{
      myPageService.updateMember(pvo);
      HttpSession session=request.getSession();

      session.setAttribute("mvo", myPageService.showMember(((MemberVO)session.getAttribute("mvo")).getEmail()));
      return new ModelAndView("JsonView");
   }

   public ModelAndView deleteMember(HttpServletRequest request,HttpServletResponse response, HttpSession session, MemberVO pvo)throws Exception{
      myPageService.deleteMember(pvo.getEmail());

      if(session.getAttribute("mvo")!=null)
         session.invalidate();

      return new ModelAndView("index");
   }
   /* ImageUpload */
   public ModelAndView uploadUserImage(HttpServletRequest request, HttpServletResponse response, MemberVO rvo) throws Exception{
      MemberVO vo = (MemberVO)request.getSession().getAttribute("mvo");
      if(vo == null)
         return new ModelAndView("index");
      MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
      MultipartFile uploadFile = multi.getFile("uploadImage");//jsp 페이지에서 input type="file"의 파라미터명
      if(vo.getImgUrl() != null){
         File delFile = new File(userImagePath+vo.getImgUrl());
         System.out.println("del :: "+userImagePath+vo.getImgUrl());
         delFile.delete();
      }
      String saveUrl="";   

      if(uploadFile!=null){
         long nowTime = System.currentTimeMillis();
         String originName = uploadFile.getOriginalFilename();
         String newName = nowTime+"_"+originName;
         File file = new File(userImagePath+newName);
         System.out.println("originName :: "+uploadFile.getOriginalFilename());
         System.out.println("filePath :: "+userImagePath+newName);
         uploadFile.transferTo(file);
         saveUrl = newName;

         MemberVO mvo = new MemberVO();
         mvo.setEmail(vo.getEmail());
         mvo.setImgUrl(saveUrl);

         myPageService.updateUserImage(mvo);
         vo.setImgUrl(newName);
         System.out.println("vo :: "+vo);
         request.getSession().setAttribute("mvo", vo);
      }

      Thread.sleep(5000);
      return new ModelAndView("JsonView", "imgUrl", "./images/UserImages/"+saveUrl); 
   }

   /* Follow */
   public ModelAndView changeFollow(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   HttpSession session = request.getSession();
	      MemberVO user2 = new MemberVO();
	      user2.setEmail(request.getParameter("email"));
	      FollowVO followVO = new FollowVO((MemberVO)session.getAttribute("mvo"), user2);
	      String result = myPageService.changeFollow(followVO);
	      
	      return new ModelAndView("JsonView", "result",user2.getEmail()+" "+result+" Success");
   }
   public ModelAndView checkFollow(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   HttpSession session = request.getSession();
	      MemberVO user2 = new MemberVO();
	      user2.setEmail(request.getParameter("email"));
	      FollowVO followVO = new FollowVO((MemberVO)session.getAttribute("mvo"), user2);
	      boolean flag = myPageService.checkFollow(followVO);
	      
	      return new ModelAndView("JsonView", "flag", flag);
   }
   

   public ModelAndView getFollowList(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO user = (MemberVO)request.getSession().getAttribute("mvo");
      if(request.getParameter("email") != null && request.getParameter("email") != ""){
    	  user = new MemberVO(request.getParameter("email"));
    	  
      }
      FollowListVO fList = myPageService.getFollowPageList(user);

      return new ModelAndView("JsonView","fList",fList);
   }

   /* Topping */
   public ModelAndView getListOfToppingPlaceByEmail(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      MemberVO user = (MemberVO) session.getAttribute("mvo");
      if(user.getEmail() == null) return new ModelAndView("redirect:main01.jsp");
      
      String pageNo = "1";
      if(request.getParameter("pageNo") != null)
         pageNo = request.getParameter("pageNo");
      String email = user.getEmail();
      if(request.getParameter("email") != null && request.getParameter("email") != "")
         email = request.getParameter("email");
      
      HashMap<String,String> forMypage = new HashMap<String, String>();
      forMypage.put("email", email);
      forMypage.put("pageNo", pageNo);
      
      PagingToppingListVO ptList = myPageService.getListOfToppingPlaceByEmail(forMypage);
      
      return new ModelAndView("JsonView","tpList",ptList);
   }
   
   public ModelAndView getListOfToppingActivityByEmail(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      MemberVO user = (MemberVO) session.getAttribute("mvo");
      if(user == null) return new ModelAndView("redirect:main01.jsp");
      
      String pageNo = "1";
      if(request.getParameter("pageNo") != null)
         pageNo = request.getParameter("pageNo");
      String email = user.getEmail();
      if(request.getParameter("email") != null && request.getParameter("email") != "")
         email = request.getParameter("email");
      
      System.out.println("email :: "+email);
      
      HashMap<String,String> forMypage = new HashMap<String, String>();
      forMypage.put("email", email);
      forMypage.put("pageNo", pageNo);
      
      
      PagingToppingListVO ptList = myPageService.getListOfToppingActivityByEmail(forMypage);
      
      return new ModelAndView("JsonView","taList",ptList);
   }

   /* Message */
   public ModelAndView sendMessage(HttpServletRequest request, HttpServletResponse response, MessageVO messageVO) throws Exception{
      MemberVO sender = (MemberVO)request.getSession().getAttribute("mvo");

      if(sender == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");
      messageVO.setSenderEmail(sender);

      messageVO.setMessage(messageVO.getMessage().replaceAll("\n", "<br>"));
      messageVO.setMessage(messageVO.getMessage().replaceAll("\r", "<br>"));
      System.out.println("messageVO :: "+messageVO);

      myPageService.sendMessage(messageVO);

      return new ModelAndView("JsonView", "success", "메세지가 성공적으로 보내졌습니다.");
   }

   public ModelAndView deleteSendMessage(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) 
         return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");   
      int messageNo = Integer.parseInt(request.getParameter("messageNo"));
      System.out.println("messageNo :: "+messageNo);

      int returnVal = myPageService.deleteMessageFromSendTable(messageNo);
      String returnMsg = "삭제가 실패하였습니다.";
      if(returnVal == 1)
         returnMsg = "삭제되었습니다.";


      return new ModelAndView("JsonView","returnMsg",returnMsg);
   }
   public ModelAndView deleteReceiveMessage(HttpServletRequest request, HttpServletResponse response, MessageVO messageVO) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) 
         return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");   

      int messageNo = Integer.parseInt(request.getParameter("messageNo"));

      int returnVal = myPageService.deleteMessageFromReceiveTable(messageNo);

      String returnMsg = "삭제가 실패하였습니다.";
      if(returnVal == 1)
         returnMsg = "삭제되었습니다.";

      return new ModelAndView("JsonView","returnMsg",returnMsg);
   }

   public ModelAndView getMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");
      int pageNo = 1;
      if(request.getParameter("pageNo") != null)
         pageNo = Integer.parseInt(request.getParameter("pageNo"));
      forGetMessageListVO fgmlVO = new forGetMessageListVO(pageNo, memberVO.getEmail(), memberVO.getEmail());

      myPageService.getMessageList(fgmlVO);

      return new ModelAndView();
   }
   public ModelAndView getSendMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");
      int pageNo = 1;
      if(request.getParameter("pageNo") != null)
         pageNo = Integer.parseInt(request.getParameter("pageNo"));
      forGetMessageListVO fgmlVO = new forGetMessageListVO(pageNo, memberVO.getEmail(), memberVO.getEmail());


      SendMessageListVO sendMList = myPageService.getSendMessageList(fgmlVO);
      System.out.println("getSendMessageList.....On");
      return new ModelAndView("JsonView", "sendMList", sendMList);
   }

   public ModelAndView getReceiveMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");
      int pageNo = 1;
      if(request.getParameter("pageNo") != null)
         pageNo = Integer.parseInt(request.getParameter("pageNo"));
      forGetMessageListVO fgmlVO = new forGetMessageListVO(pageNo, memberVO.getEmail(), memberVO.getEmail());

      ReceiveMessageListVO receiveMList = myPageService.getReceiveMessageList(fgmlVO);
      System.out.println("getReceiveMessageList....On");
      return new ModelAndView("JsonView", "receiveMList", receiveMList);
   }
   public ModelAndView getSendMessageDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");

      if(request.getParameter("messageNo") == null) return new ModelAndView("JsonView","alert","해당 메세지는 존재하지 않는 메세지 입니다.");
      int messageNo = Integer.parseInt(request.getParameter("messageNo"));

      MessageVO messageVO = myPageService.getSendMessageDetail(messageNo);

      return new ModelAndView("JsonView","message",messageVO);
   }

   public ModelAndView getReceiveMessageDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");

      if(request.getParameter("messageNo") == null) return new ModelAndView("JsonView","alert","해당 메세지는 존재하지 않는 메세지 입니다.");
      int messageNo = Integer.parseInt(request.getParameter("messageNo"));


      MessageVO messageVO = myPageService.getReceiveMessageDetail(messageNo);

      return new ModelAndView("JsonView","message",messageVO);
   }

   /* AttendActivity */
   public ModelAndView getListOfAttendActivity(HttpServletRequest request, HttpServletResponse response) throws Exception{
      MemberVO memberVO = (MemberVO)request.getSession().getAttribute("mvo");
      if(memberVO == null) return new ModelAndView("index","alert","로그인을 하셔야 이용이 가능합니다.");
      String pageNo = "1";
      if(request.getParameter("pageNo") != null){
         pageNo = request.getParameter("pageNo");
      }
      String email = memberVO.getEmail();
      if(request.getParameter("email") != null && request.getParameter("email") != "")
         email = request.getParameter("email");
      System.out.println("email :: "+email+", "+request.getParameter("email"));
      HashMap<String, String> forAttendActivity = new HashMap<String, String>();
      forAttendActivity.put("email", email);
      forAttendActivity.put("pageNo", pageNo);
      ActivityListVO attendList = myPageService.getListOfAttendActivity(forAttendActivity);
      return new ModelAndView("JsonView", "attendList",attendList);
   }
   
   /* Q&A */
   public ModelAndView qnaMyList(HttpServletRequest request,
         HttpServletResponse response,HttpSession session) throws Exception{
      MemberVO mvo =(MemberVO)session.getAttribute("mvo");
      if(mvo==null){ 
         return new ModelAndView("redirect:/main01.jsp");
      }
      String pageNo;
      if(request.getParameter("pageNo") == null)
         pageNo = "1";
      else
         pageNo = request.getParameter("pageNo");

      PagingQnAVO pagingQnaVO = new PagingQnAVO(mvo.getEmail(), pageNo);

      QnAListVO qaListVO = myPageService.getListOfMyQnA(pagingQnaVO);

      return new ModelAndView("JsonView","list",qaListVO);
   }
   public ModelAndView deleteQnA(HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception{
      String qnaNo=request.getParameter("qnaNo");
      System.out.println("Delete qnaNo    :: " + qnaNo);
      myPageService.deleteQnA(Integer.parseInt(request.getParameter("qnaNo")));

      return new ModelAndView("JsonView");
   }
   
   /* 내가 쓴 글 */
   public ModelAndView MyActivityList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      MemberVO mvo =(MemberVO)session.getAttribute("mvo");
      if(mvo==null){ 
         return new ModelAndView("redirect:/main01.jsp");
      }
      String email = mvo.getEmail();
      String pageNo = request.getParameter("pageNo");
      if(pageNo == null){
         pageNo = "1";
      }
      if(request.getParameter("email") != null && request.getParameter("email") != ""){
    	  email = request.getParameter("email");
      }
      System.out.println("requestEmail :: "+request.getParameter("email"));
      HashMap<String, String> forMyActivity = new HashMap<String, String>();
      forMyActivity.put("email", email);
      forMyActivity.put("pageNo", pageNo);
      ActivityListVO list = myPageService.myActivityList(forMyActivity);
      System.out.println("MyActivityList.....On");
      return new ModelAndView("JsonView", "myActivityList",list);
   }
   public ModelAndView MyTipList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      MemberVO mvo =(MemberVO)session.getAttribute("mvo");
      if(mvo==null){ 
         return new ModelAndView("redirect:/main01.jsp");
      }
      String email = mvo.getEmail();
      String pageNo = request.getParameter("pageNo");
      if(pageNo == null){
         pageNo = "1";
      }
      if(request.getParameter("email") != null && request.getParameter("email") != "")
    	  email = request.getParameter("email");
      System.out.println(email);
      HashMap<String, String> forMyTip = new HashMap<String, String>();
      forMyTip.put("email", email);
      forMyTip.put("pageNo", pageNo);
      TipListVO list = myPageService.myTipList(forMyTip);
      System.out.println("MyTipList.....On");
      return new ModelAndView("JsonView", "myTipList",list);
   
   }
   public ModelAndView MyPostingList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      MemberVO mvo =(MemberVO)session.getAttribute("mvo");
      if(mvo==null){ 
         return new ModelAndView("redirect:/main01.jsp");
      }
      String email = mvo.getEmail();
      String pageNo = request.getParameter("pageNo");
      if(pageNo == null){
         pageNo = "1";
      }
      if(request.getParameter("email") != null && request.getParameter("email") != "")
    	  email = request.getParameter("email");
      HashMap<String, String> forMyPost = new HashMap<String, String>();
      forMyPost.put("email", email);
      forMyPost.put("pageNo", pageNo);
      FreeBoardListVO list = myPageService.myPostingList(forMyPost);
      System.out.println("MyPostingList.....On");
      return new ModelAndView("JsonView", "myPostList",list);
   }
}