<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>Show Free Board</title>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- Twitter Bootstrs CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Ionicons Fonts Css -->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Hero area slider css-->
<link rel="stylesheet" href="css/slider.css">
<!-- owl craousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<!-- Template Javascript Files
        ================================================== -->
<!-- modernizr js -->
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<!-- jquery -->
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- owl carouserl js -->
<script src="js/owl.carousel.min.js"></script>
<!-- bootstrap js -->

<script src="js/bootstrap.min.js"></script>
<!-- wow js -->
<script src="js/wow.min.js"></script>
<!-- slider js -->
<script src="js/slider.js"></script>
<script src="js/jquery.fancybox.js"></script>
<!-- template main js -->
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<script src="js/bootstrap-select.min.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#showfree{
	margin-top:120px;
}
#showfree-table{
	table-layout: fixed;
}

#freeshowBtn{
	/* margin-right: 15px; */
	padding: 5px 10px;
	text-align: center;
}

#freeshowBtn a{
	margin-right: 15px;
	padding: 5px 10px;
	background-color: #333;
	color : #f5f5f5;
	border-radius : 4px;
	border: 1px solid #333;
}
#freeshowBtn a:hover{
	background-color: #f5f5f5;
	color : #23527c;
	border: 1px solid #23527c;
	cursor: pointer;
}
.check01{
	color:#02bdd5; 
}

input{
	height: 40px;
    padding: 6px 12px;
    font-size: 13px;
    line-height: 1.428571429;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
}
</style>
</head>
<script type="text/javascript">
	function deletePosting() {
		if(confirm("Are you sure you want to delete it?")){
			//확인을 선택하면 이곳에서 페이지를 이동
			location.href="freeboard.do?command=deletePostingFromFreeBoard&&postingNo=${fbvo.postingNo}";
		}
	}//
	
	function updatePosting() {
		if(confirm("Do you really want to modify it?")){
			//확인을 선택하면 이곳에서 페이지를 이동
			location.href="freeboard.do?command=updateView&&postingNo=${fbvo.postingNo}";
		}
	}

</script>
<script type="text/javascript">
//comment
$(document).on("click","#addComment",function(){
      console.log("clicked..");
    var content = $('#commentContent').val();
    console.log(content);
    $.ajax({
       type : "POST",
       url : "freeboard.do?command=addCommentToFreeBoard",
       data : "freeBoardVO.postingNo=${fbvo.postingNo}&&content="+ content,
       success : function(data) {
          var str = "";
           var cmtvo = data.cmtvo;
           console.log(cmtvo.content);
           console.log(cmtvo.commentNo);
           console.log("email:"+cmtvo.memberVO.email);
           console.log("session: ${sessionScope.mvo.email}");
           str+='<div id="comment'+cmtvo.commentNo+'"><div class="row" style="margin: 0; padding: 0">'+
           '<div class="col-md-1"></div><div class="col-md-1">'+
           '<div style="text-align: center;"><img src="./images/user_default.jpg" width="80%"></div>'+
           '<div style="text-align: center;">'+cmtvo.memberVO.email+'</div></div><div class="col-md-7">'+
           '<div id="textarea_insert'+cmtvo.commentNo+'" style="margin-bottom: 2px; text-align: left;"><div style="height: auto;"id="cmtcontent'+cmtvo.commentNo+'" class="form-control">'+cmtvo.content+'</div>'+
           '</div></div>';
           if("${sessionScope.mvo.email}"==cmtvo.memberVO.email) {
              console.log("같음!!");
              str+='<div class="col-md-3"><div id="commentButtons"><input type="button" name="delete_'+cmtvo.commentNo+'"id="deleteTipComment" value="Delete" style="display:inline; margin-right:4px;">'+
               '<input id="commentNo" type="hidden" value="'+cmtvo.commentNo+'">'+
               '<input type="button" name="update_'+cmtvo.commentNo+'" id="updateComment" value="Modify" style="display:inline">'+
               '</div></div></div>';
           }
           str+='</div>';
          
           $('#commentContent').val('');
           
           if("${sessionScope.mvo.email}"==cmtvo.memberVO.email) {
              console.log("같음!!");
           }
        $('#addCommentHere').prepend(str);     
       } //success
    }); // ajax
 }); // on
 
 
 $(document).on("click",'#deleteTipComment',function() {
    var sel = $(this).attr('name');
    var split = sel.split('_');
    var commentNo= split[1];
    
    $.ajax({
       type : "POST",
       url : "freeboard.do?command=deleteFreeBoardComment",                     
       data : "commentNo=" + commentNo,
       success : function(data) {
          $('#comment'+commentNo).remove();
          console.log("successs");
       } // success
    }); //ajax
    
 }); //on 
 
 
 $(document).on("click",'#updateComment', function() {
    var sel = $(this).attr('name');
    var split = sel.split('_');
    var commentNo= split[1];
    
    var value = $('#cmtcontent'+commentNo).text();
    console.log(value);
    
    var textarea="<textarea id='updatecmt"+commentNo+"' class='form-control' rows='2'>"+
        value+"</textarea>";
        $('#textarea_insert'+commentNo).after(textarea); // 수정 폼
        
    $('#cmtcontent'+commentNo).hide(); // div 숨기기
     var updatebtn = "<input id='finupdate' name='finupdate_"+commentNo+"'type='button' value='Success' style='display:inline'>";
     
     $('input[name="update_'+commentNo+'"]').after(updatebtn); // 수정완료버튼
    $('input[name="update_'+commentNo+'"]').hide();
 
 }); // on
 
$(document).on("click",'#finupdate', function(){
      var sel = $(this).attr('name');
    var split = sel.split('_');
    var commentNo= split[1];
    console.log('finished..' + commentNo);
    
    var content = $('#updatecmt'+commentNo).val();
    console.log("content.." + content);
    
    $.ajax({
       type : "POST",
       url : "freeboard.do?command=updateFreeBoardComment",
       data : "commentNo="+ commentNo+"&&content="+content,
       success : function(data) {
          $('#updatecmt'+commentNo).remove(); // textarea 제거
          
           $('#cmtcontent'+commentNo).html(content); // div 보이기
          $('#cmtcontent'+commentNo).show();
         
          $('input[name="finupdate_'+commentNo+'"]').hide();
          $('input[name="update_'+commentNo+'"]').show(); // 수정버튼 보이기
       }
    }); // ajax
  }); // on
</script>
<body>
	<!--
        ==================================================
        Header Section Start
        ================================================== -->
	<!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<%@include file="header_before_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="header_after_login.jsp"%>
		</c:otherwise>
	</c:choose>
	<!--================글쓰기폼====================-->
	<div class="col-sm-12">
			<section class="col-sm-2"></section>
			<section class="col-sm-8" id="showfree">
			<h3><span class="glyphicon glyphicon-option-vertical check01"></span>Free Board</h3>
				<table id="showfree-table" class="table">
					<tr>
						<th width="20%">No<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${fbvo.postingNo}</th>
						<th width="80%" colspan="2">Title<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>[${fbvo.postingHeader}]&nbsp;${fbvo.postingTitle}</th>
					</tr>
					<tr>
						<th width="20%">Writer<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span><a onclick="window.open('MyPage.jsp?email=${fbvo.memberVO.email}','MyPage', 'width=760, height=620, menubar=no, location=no, status=no, fullscreen=no, toolbar=no, top=0')" target="_blank" style="cursor: pointer;">${fbvo.memberVO.nickName}</a></th>
						<th width="50%">Date<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${fbvo.writeDate}</th>
						<th width="30%">Hits<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${fbvo.hits}</th>
					</tr>
		 			<tr>
						<td colspan="3">
							<textarea rows="15" style="resize:none;width:100%;border:none;">${fbvo.content}</textarea>
						</td>
					</tr>
					<tr>
						<td valign="middle" colspan="3">
							<%-- <div id="freeshowBtn">
							<a href="freeboard.do?command=getFreeBoardList">List</a> 
							<c:if test="${sessionScope.mvo.email==fbvo.memberVO.email}">
								<a onclick="updatePosting()">Modify</a>
								<a onclick="deletePosting()">Delete</a>
							</c:if>
							</div> --%>
						</td>
					</tr>
				</table>
				
				 <!-- 코멘트 전체 -->
         <div id="commentTotal">
            <!-- 댓글부분 시작-->
            <div class="row">
               <div class="col-md-12">
                  <h4>Comment</h4>
               </div>
            </div>
            <hr>
            <div  id="addCommentHere">
            <c:if test="${fbvo.commentVO!=null }">
               <c:forEach var="fbvo" items="${fbvo.commentVO }">
                  <div id="comment${fbvo.commentNo }">
                     <div class="row" style="margin: 0; padding: 0">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                           <div style="text-align: center;">
                              <img src="./images/user_default.jpg" width="80%">
                           </div>
                           <div style="text-align: center;">${fbvo.memberVO.email }</div>
                        </div>
                        <div class="col-md-7">
                           <div id="textarea_insert${fbvo.commentNo }" style="margin-bottom: 2px; text-align: left;">
                          
                              <div style="height: auto;" id="cmtcontent${fbvo.commentNo }" class="form-control" >${fbvo	.content }</div>
                           </div>
                        </div>
                        <div class="col-md-3">
                           <div id="commentButton" style="display: inline;">
                              <c:if test="${sessionScope.mvo.email==fbvo.memberVO.email }">
                                 <input type="button" name="delete_${fbvo.commentNo }"
                                    id="deleteTipComment" value="Delete" style="display: inline">                      
                                 <input type="button"  name="update_${fbvo.commentNo }"
                                    id="updateComment" value="Modify" style="display: inline">
                                 <input id="commentNo" type="hidden" value="${fbvo.commentNo }">
                                
                              </c:if>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </c:forEach>
            </c:if>
    		</div>
         </div>
      </div>
      <p>

         <!-- 댓글 입력 부분 시작-->
      <form name="commentForm">

         <div class="row" style="width: 70%; margin: 0 auto;" align="center">
            <div class="col-md-1"></div>
            <div class="col-md-10" style="width: 85%; margin-top: 30px;">
               <textarea class="form-control" id="commentContent" name="content"
                  rows="3" placeholder="Write Comment" style="text-align: left; resize:none"></textarea>
               <button id="addComment" type="button"
                  class="btn btn-default btn-md"
                  style="width: 100%; height: 40px; border-radius: 0px; background-color: #02bace; color: #ffffff">Reply</button>
            </div>
            <div class="col-md-1"></div>
         </div>
      </form>
      <!-- 댓글입력부분 끝 -->
      <div class="row" style="margin: 0 auto; margin-top: 30px;">
      	<div class="col-md-12">
		      <div id="freeshowBtn" style="float: none">
				<a href="freeboard.do?command=getFreeBoardList">List</a> 
				<c:if test="${sessionScope.mvo.email==fbvo.memberVO.email}">
					<a onclick="updatePosting()">Modify</a>
					<a onclick="deletePosting()">Delete</a>
				</c:if>
			  </div>
		  </div>
      </div>
      <!-- 코멘트 전체 끝 -->
			</section>
			<section class="col-sm-2"></section>

	<!--================//글쓰기폼====================-->

	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>






























