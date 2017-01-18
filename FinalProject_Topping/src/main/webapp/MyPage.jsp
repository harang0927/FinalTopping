<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="./js/jquery.form.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
/* 	.test{
		border-bottom: 2px solid #02bace;
		color:#02bace;
	} */
	
</style>
<script type="text/javascript">
$(function() {
	if ('${sessionScope.mvo.email eq null}' == 'true') {
		alert('로그인 해주세요!');
		window.close();
		window.opener.location.href = "main01.jsp";
	}
	var email = "";
	if('${param.email ne null or param.email ne ""}'){
		email = '${param.email}';
		$.ajax({
			type:"POST",
			url:"member.do",
			data:"command=getUserInfoByEmail&email="+email,
			
			success:function(data){
				var vo = data.userInfo;
				console.log("email:"+vo.email);
				console.log("nickname:"+vo.nickName);
				if(vo.imgUrl != null && vo.imgUrl != "")
					$('#userImage1').attr('src','./images/UserImages/'+vo.imgUrl);
				else
					$('#userImage1').attr('src','./images/NoUserImage.jpg');
				$('#username').text(vo.nickName+"("+vo.email+")");
				console.log(vo.nickName+"("+vo.email+")");
			}
		});
	}
	if ('${sessionScope.mvo.imgUrl eq "" or sessionScope.mvo.imgUrl eq null}') {
		$('#userImage').attr('src', './images/NoUserImage.jpg');
	}
	$("#tabs").tabs({
		active : 4
	});
	$('#myBoardBox').tabs({
		active : 0
	});
	/* Follow */
	var followData = "command=getFollowList";
	if(email != "" && email != null)
		followData += "&email="+email;
	$.ajax({
		type : "post",
		url : "mypage.do",
		data : followData,

		success : function(data) {
			$('#followCount>a').html(data.fList.followCount);
			$('#followerCount>a').html(data.fList.followerCount);
			var fList = data.fList.followList;
			var followList = "";
			for (var i = 0; i < fList.length; i++) {
				var imgUrl = fList[i].followUser.imgUrl;
				if (imgUrl == null)
					imgUrl = "./images/noImage.jpg";
				followList += "<img src='./images/UserImages/"+imgUrl+"'width='50' height='50'>";
				followList += fList[i].followUser.nickName;
				followList += "(" + fList[i].followUser.email + ")";
				followList += "<br><br>";
			}
			$('#followModal').html(followList);
			var followerList = "";
			var ferList = data.fList.followerList;
			for (var i = 0; i < ferList.length; i++) {
				var imgUrl = ferList[i].followerUser.imgUrl;
				if (imgUrl == null)
					imgUrl = "./images/noImage.jpg";
				followerList += "<img src='./images/UserImages/"+imgUrl+"'width='50' height='50'>";
				followerList += ferList[i].followerUser.nickName;
				followerList += "(" + ferList[i].followerUser.email
						+ ")";
				followerList += "<br><br>";
			}//for
			$('#followerModal').html(followerList);
		}//success
	});//ajax
	$.ajax({
		type:"POST",
		url:"mypage.do",
		data:"command=checkFollow&email=${param.email}",
		
		success:function(data){
			if(data.flag == true)
			$('#followBtn').attr('src','./images/unFollowBtn.jpg');
		}
	});
	$('#followBtn').click(function(){
		$.ajax({
			type:"POST",
			url:"mypage.do",
			data:"command=changeFollow&email=${param.email}",
			
			success:function(data){
				if(data.result.indexOf("UnFollow") > -1){
					alert(data.result)
					$('#followBtn').attr('src','./images/followBtn.jpg');
				}else{
					alert(data.result)
					$('#followBtn').attr('src','./images/unFollowBtn.jpg');
				}
				
				$.ajax({
					type : "post",
					url : "mypage.do",
					data : followData,

					success : function(data) {
						$('#followCount>a').html(data.fList.followCount);
						$('#followerCount>a').html(data.fList.followerCount);
						var fList = data.fList.followList;
						var followList = "";
						for (var i = 0; i < fList.length; i++) {
							var imgUrl = fList[i].followUser.imgUrl;
							if (imgUrl == null)
								imgUrl = "./images/noImage.jpg";
							followList += "<img src='"+imgUrl+"'width='50' height='50'>";
							followList += fList[i].followUser.nickName;
							followList += "(" + fList[i].followUser.email + ")";
							followList += "<br>";
						}
						$('#followModal').html(followList);
						var followerList = "";
						var ferList = data.fList.followerList;
						for (var i = 0; i < ferList.length; i++) {
							var imgUrl = ferList[i].followerUser.imgUrl;
							if (imgUrl == null)
								imgUrl = "./images/noImage.jpg";
							followerList += "<img src='"+imgUrl+"'width='50' height='50'>";
							followerList += ferList[i].followerUser.nickName;
							followerList += "(" + ferList[i].followerUser.email
									+ ")";
							followerList += "<br>";
						}//for
						$('#followerModal').html(followerList);
					}//success
				});//ajax
			}			
		});
	});

		/* 참여한 액티비티 목록 */
		$('#attendActivityBox').click(function(event, pageNo) {
			$('#tabs-1').show();
			var aa_data = "command=getListOfAttendActivity";
			if (pageNo != null)
				aa_data += "&pageNo=" + pageNo;
			if(email != null && email != "")
				aa_data += "&email="+email;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : aa_data,

				success : function(data) {
					var list = data.attendList.list;
					var pagingBean = data.attendList.pagingBean;
					var printList = "";

					for (var i = 0; i < list.length; i++) {
						printList += "<tr>";
						printList += "<td>"
								+ list[i].activityNo
								+ "</td>";
						printList += "<td><a id='showDetailOfActivity' data-target='' value='"+list[i].activityNo+"'>";
						printList += list[i].activityTitle
								+ "</a></td>";
						printList += "<td>"
								+ list[i].nowAttendance
								+ "</td>";
						printList += "<td>"
								+ list[i].maxAttendance
								+ "</td>";
						if (list[i].startDate != null)
							printList += "<td>"
								+ list[i].startDate
								+ "</td>";
						if (list[i].endDate != null)
							printList += "<td>"
								+ list[i].endDate
								+ "</td>";
						printList += "</tr>";
					}
					var paging = "";
					if (pagingBean.previousPageGroup) {
						paging += "<a id='attendpagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#QnaDiv'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
					}
					for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
						if (pagingBean.nowPage != i) {
							paging += "<a id='attendpagingNo' value='"+i+"' href='#QnaDiv'>"
								+ i + "</a>";
						} else
							paging += i;
						paging += "&nbsp;&nbsp;";
					}
					if (pagingBean.nextPageGroup) {
						paging += "<a id='attendpagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#QnaDiv'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
					}
					
					$('#attendActivity tbody').html(printList);
					$('#attendActivityPaging').html(paging);
				}
			});
		})
		$(document).on('click','#showDetailOfActivity',function(){
			window.open('activity.do?command=showActivityByNo&activityNo='+$(this).attr('value'));
		});
		$(document).on('click','#attendpagingNo',function(){
			$('#attendActivityBox').trigger('click',[$(this).attr('value')]);
		});
						
		/* Topping 목록 */
		$('#tabs-2').tabs();
		$('#toppingBox').click(function() {
			$('#taTab').trigger('click');
		});
		$('#taTab').click(function(event, pageNo) {
			var ta_data = "command=getListOfToppingActivityByEmail";
			if (pageNo != null)
				ta_data += "&pageNo=" + pageNo;
			if(email != null && email != "")
				ta_data += "&email="+email;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : ta_data,

				success : function(data) {
					var list = data.taList.toppingList;
					var pagingBean = data.taList.pagingBean;
					var printList = "";

					for (var i = 0; i < list.length; i++) {
						var vo = list[i].activityBoardVO;
						printList += "<tr style='text-align:center'>";
						printList += "<td>" + vo.activityNo + "</td>";
						printList += "<td style='text-align:left'><a id='showDetailOfActivity' value='"+vo.activityNo+"'>";
						printList += vo.activityTitle
							+ "</a></td>";
						printList += "<td>"+ vo.nowAttendance+ "</td>";
						printList += "<td>"+ vo.maxAttendance+ "</td>";
					if (vo.startDate != null)
						printList += "<td>"+ vo.startDate+ "</td>";
					if (vo.endDate != null)
						printList += "<td>"+ vo.endDate+ "</td>";
					//printList += "<td>"+"<button id='checkListUp' value='"+list[i].toppingListNo+"'>"+"List Up!"+"</button>";
					printList += "</tr>";
					}
					var paging = "";
					if (pagingBean.previousPageGroup) {
						paging += "<a id='tapagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#QnaDiv'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
					}
					for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
						if (pagingBean.nowPage != i)
							paging += "<a id='tapagingNo' value='"+i+"' href='#QnaDiv'>"+ i + "</a>";
						else
							paging += i;
						paging += "&nbsp;&nbsp;";
					}
					if (pagingBean.nextPageGroup) {
						paging += "<a id='tapagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#QnaDiv'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
					}
					$('#toppingActivityList tbody').html(printList);
					$('#toppingActivityListPaging').html(paging);
				}
			});
		});
		$(document).on("click", "#tapagingNo", function() {
			$("#taTab").trigger('click', [ $(this).attr('value') ]);
		});
		$('#tpTab').click(function(event, pageNo) {
			var tp_data = "command=getListOfToppingPlaceByEmail";
			if (pageNo != null)
				tp_data += "&pageNo=" + pageNo;
			if(email != null && email != "")
				tp_data += "&email="+email;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : tp_data,

				success : function(data) {
					var list = data.tpList.toppingList;
					var pagingBean = data.tpList.pagingBean;
					var printList = "";

					for (var i = 0; i < list.length; i++) {
						var vo = list[i].placeVO;
						printList += "<tr>";
						printList += "<td><a id='showDetailOfPlace' href='#' value='"+vo.placeId+"'>";
						printList += vo.placeName+ "</a></td>";
						printList += "<td>"
							+ vo.placeDistrict
							+ "</td>";
							if(vo.placeImgUrl == null)
								printList += "<td><img src='./images/noimage_default.jpg' width='150px'></td>";
							else
								printList += "<td><img src='"+vo.placeImgUrl+"' width='150px'></td>";
							//printList += "<td>"+"<button id='checkListUp' value='"+list[i].toppingListNo+"'>"+"List Up!"+"</button>";
							printList += "</tr>";
							}
					var paging = "";
					if (pagingBean.previousPageGroup) {
						paging += "<a id='tppagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#toppingPlaceList'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
					}
					for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
						if (pagingBean.nowPage != i) {
							paging += "<a id='tppagingNo' value='"+i+"' href='#toppingPlaceList'>"+ i + "</a>";
						} else
							paging += i;
						paging += "&nbsp;&nbsp;";
					}
					if (pagingBean.nextPageGroup) {
						paging += "<a id='tppagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#toppingPlaceList'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
					}
					$('#toppingPlaceList tbody').html(printList);
					$('#toppingPlaceListPaging').html(paging);
				}
			});
		});
		$(document).on('click', "#tppagingNo", function() {
			$('#tpTab').trigger('click', [ $(this).attr('value') ]);
		});

		/* 이미지 변경하기 */
		$('#uploadImage').change(function() {
			if ($(this).val() != '') {
				if (!confirm("Do you want to change the image?")) {
					return false;
				}
				$('#uploadFrm').submit();
				alert("The image will change after a while.");
			}
		});

		$('#uploadFrm').ajaxForm({
			dataType : 'text',
			beforeSerialize : function() {
				// form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.            
			},
			beforeSubmit : function() {
				//action에 걸어주었던 링크로 가기전에 실행 ex)로딩중 표시를 넣을수도 있다.
			},

			success : function(data) {
				var obj = JSON.parse(data);
				$('#userImage1').attr('src', obj.imgUrl);
				$('#userImage2').attr('src', obj.imgUrl);
			}//success
		});//ajaxForm

		/* 회원정보 수정 */
		$('#uploadInfo').ajaxForm({
			dataType : 'text',
			beforeSerialize : function() {
				// form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.            
			},
			beforeSubmit : function() {
				//action에 걸어주었던 링크로 가기전에 실행 ex)로딩중 표시를 넣을수도 있다.
			},

			success : function(data) {
				alert("새로고침 하시면 변경 된 정보가 적용됩니다.")
			}//success
		});

		/* 메세지 */
		$("#messageListDiv").tabs({
			active : 1,
			collapsible : true
		});//message.tabs

		$('#messageBox').click(function() {
			$('#sendMessageL').trigger("click");
		});

		$('#sendMessageL').click(function(event, pageNo) {
			$('#sendMessageList').show();
			var p_data = "command=getSendMessageList";
			if (pageNo != null)
				p_data += "&pageNo=" + pageNo;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : p_data,

				success : function(data) {
					var list = data.sendMList.sendMessageList;
					var pagingBean = data.sendMList.pagingBean;
					var printList = "";
					for (var i = 0; i < list.length; i++) {
						printList += "<tr>";
						printList += "<td>"+ list[i].receiverEmail.nickName+ "</td>";
						printList += "<td style='overflow:hidden;text-align:left'><a id='showContent' class='sender' href='#' data-toggle='modal' data-target='#messageContent' value='"+list[i].messageNo+"'>"
							+ list[i].title
							+ "</td>";
						printList += "<td>"+ list[i].writeDate+ "</td>";
						printList += "</tr>";
					}
					var paging = "";
					if (pagingBean.previousPageGroup) {
						paging += "<a id='sendpagingNo' value="+pagingBean.startPageOfPageGroup-1+" href='#sendMessageList'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
					}
					for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
						if (pagingBean.nowPage != i) {
							paging += "<a id='sendpagingNo' value="+i+" href='#sendMessageList'>"+ i + "</a>";
						} else {
							paging += i;
						}
						paging += "&nbsp;&nbsp;";
					}
					if (pagingBean.nextPageGroup) {
						paging += "<a id='sendpagingNo' value="+pagingBean.endPageOfPageGroup+1+" href='#sendMessageList'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
					}
					$('#sendMessageList').html(
						"<table width='100%' cellpadding='2' align='center' style='table-layout:fixed;'>"
						+ "<tr style='border-bottom:1px solid #cccccc;border-top:1px solid #cccccc;'>"
						+ "<th width='20%' style='text-align:center;color:#008080;'>Receiver</th>"
						+ "<th width='60%' style='text-align:center;color:#008080;'>Title</th>"
						+ "<th width='20%' style='text-align:center;color:#008080;'>Date</th>"
						+ "</tr>"
						+ printList
						+ "</table><br><br>"
						+ paging);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
					+ "\n" + "message:"
					+ request.responseText
					+ "\n" + "error:" + error);
				}
			});//ajax
		});//senderMessageList.Click
		$(document).on("click", "#sendpagingNo", function() {
			$('#sendMessageL').trigger('click', [ $(this).attr('value') ]);
		});//sendpagingNo.click

		$('#receiveMessageL').click(function(event, pageNo) {
			$('#receiveMessageList').show();
			var p_data = "command=getReceiveMessageList";
			if (pageNo != null)
				p_data += "&pageNo=" + pageNo;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : p_data,

				success : function(data) {
					var list = data.receiveMList.receiveMessageList;
					var pagingBean = data.receiveMList.pagingBean;
					var printList = "";
					
					for (var i = 0; i < list.length; i++) {
						printList += "<tr>";
						printList += "<td>"
							+ list[i].senderEmail.nickName
							+ "</td>";
						printList += "<td style='overflow:hidden;text-align:left'><a id='showContent' class='receiver' href='#' data-toggle='modal' data-target='#messageContent' value='"+list[i].messageNo+"'>"
							+ list[i].title
							+ "</td>";

						printList += "<td>"
							+ list[i].writeDate
							+ "</td>";
						printList += "</tr>";
					}
					var paging = "";
					if (pagingBean.previousPageGroup) {
						paging += "<a id='receivepagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#receiveMessageList'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
					}
					for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
						if (pagingBean.nowPage != i) {
							paging += "<a id='receivepagingNo' value='"+i+"' href='#receiveMessageList'>"
								+ i + "</a>";
						} else
							paging += i;
						paging += "&nbsp;&nbsp;";
					}
					if (pagingBean.nextPageGroup) {
						paging += "<a id='receivepagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#receiveMessageList'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
					}
					$('#receiveMessageList').html(
						"<table width='100%' cellpadding='2' align='center' style='table-layout:fixed;'>"
						+ "<tr style='border-bottom:1px solid #cccccc;border-top:1px solid #cccccc;'>"
						+ "<th width='20%' style='text-align:center;color:#008080;'>Sender</th>"
						+ "<th width='60%' style='text-align:center;color:#008080;'>Title</th>"
						+ "<th width='20%' style='text-align:center;color:#008080;'>Date</th>"
						+ "</tr>"
						+ printList
						+ "</table><br><br>"
						+ paging);
				},
				error : function(request, status, error) {
					alert("code:" + request.status
						+ "\n" + "message:"
						+ request.responseText
						+ "\n" + "error:" + error);
				}
			});//ajax
		});//receiveMessageList.Click
		$(document).on("click", "#receivepagingNo", function() {
			$('#receiveMessageL').trigger('click', [ $(this).attr('value') ]);
		});//receivepagingNo.click

		$(document).on("click","#showContent",function() {
			var c_data = "command=";
			if ($(this).attr('class') == 'sender') {
				c_data += "getSendMessageDetail";
				$('#Bystander').val("send");
				$('#replyMessage').hide();
			} else if ($(this).attr('class') == 'receiver') {
				c_data += "getReceiveMessageDetail";
				$('#Bystander').val("receive");
				$('#replyMessage').show();
			} else {
				return;
			}
			c_data += "&messageNo=" + $(this).attr('value');
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : c_data,
				
				success : function(data) {
					var message = data.message;
					$('#msgNo').text(message.messageNo);
					$('#msgSender').text(message.senderEmail.nickName);
					$('#msgSender').attr('value',message.senderEmail.nickName);
					$('#msgReceiver').text(message.receiverEmail.nickName);
					$('#msgTitle').text(message.title);
					$('#msgDate').text(message.writeDate);
					$('#msgContent').html(message.message);
				}
			});//ajax
		});//click
		$('#deleteMessage').click(function() {
			var d_date = "command=";
			if ($('#Bystander').val() == 'send')
				d_date += "deleteSendMessage";
			if ($('#Bystander').val() == 'receive')
				d_date += "deleteReceiveMessage";
			d_date += "&messageNo=" + $('#msgNo').text();
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : d_date,

				success : function(data) {
					alert(data.returnMsg);
					$('#messageContent .close').click();
					if ($('#Bystander').val() == 'send')
						$('#sendMessageL').trigger('click');
					if ($('#Bystander').val() == 'receive')
						$('#receiveMessageL').trigger('click');
				}
			});//ajax
		});//deleteMessage.Click
		var messageIdCheckFlag = false;
		$('#receiver')
				.keyup(
						function() {
							$
									.ajax({
										type : "POST",
										url : "member.do",
										data : "command=emailCheck&email="
												+ $('#receiver').val(),

										success : function(data) {
											if (data.flag) {
												$('#checkFlag')
														.html(
																"<font color='#6BACF2'>The user exists.</font>");
												messageIdCheckFlag = 'true';
											} else {
												$('#checkFlag')
														.html(
																"<font color='red'>This user does not exist.</font>");
												messageIdCheckFlag = 'false';
											}
											$('#checkFlag').attr('value',
													data.flag);
										}//success
									});//ajax
						});//receiver.keyUp(IDCheck)

		$('#sendMessageForm').ajaxForm({

			dataType : 'text',
			beforeSerialize : function() {
				// form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.            
			},
			beforeSubmit : function() {
				if (messageIdCheckFlag != 'true') {
					alert("받을 여행자의 Email을 확인해 주세요...");
					return false;
				}
				//action에 걸어주었던 링크로 가기전에 실행 ex)로딩중 표시를 넣을수도 있다.
			},

			success : function(data) {
				$('#sendingMessage .close').click();
				$('#sendMessageL').trigger("click");
				$('#sendMessageForm .insert').val('');
			}//success
		});//ajaxForm

		$('#replyMessage').click(function() {
			$('#receiver').val($('#msgSender').text());
			$('#messageContent .close').click();
		});

		/* QnA */
		$('#qnaBox')
				.click(
						function(event, pageNo) {
							$('#tabs-5').show();
							$
									.ajax({
										type : "POST",
										url : "mypage.do",
										data : "command=qnaMyList",

										success : function(data) {
											var list = data.list.list;
											var pagingBean = data.list.pagingBean;
											var printList = "";

											for (var i = 0; i < list.length; i++) {
												printList += "<tr>";
												printList += "<td style='text-align:center'>"
														+ list[i].questionNo
														+ "</td>";
												printList += "<td><a id='showQnA' class='qna' href='#' data-toggle='modal' data-target='#QnAContent' value='"+list[i].qnaNo+"'>";
												if (list[i].admin != null
														&& list[i].admin != "")
													printList += "[Answer] ";
												printList += list[i].title
														+ "</a></td>";
												printList += "<td style='text-align:center'>"
														+ list[i].writeDate
														+ "</td>";
												printList += "</tr>";
											}
											var paging = "";
											if (pagingBean.previousPageGroup) {
												paging += "<a id='qnapagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#QnaDiv'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
											}
											for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
												if (pagingBean.nowPage != i) {
													paging += "<a id='qnapagingNo' value='"+i+"' href='#QnaDiv'>"
															+ i + "</a>";
												} else
													paging += i;
												paging += "&nbsp;&nbsp;";
											}
											if (pagingBean.nextPageGroup) {
												paging += "<a id='qnapagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#QnaDiv'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
											}
											$('#QnADiv tbody').html(
													"<table border='1' width='100%' cellpadding='2' align='center'>"
															+ printList);
											$('#qnaPaging').html(paging);
										},
										error : function() {

										}
									});
						})
		$(document).on("click", "#qnapagingNo", function() {
			$('#qnaBox').trigger("click", [ $(this).attr('value') ])
		});
		$(document)
				.on(
						"click",
						"#showQnA",
						function() {
							$
									.ajax({
										type : "POST",
										url : "qna.do",
										/* data : "command=showQnA&qnaNo="+ $(this).attr('value'), */
										data : "command=showMyQnA&qnaNo="+ $(this).attr('value'),

										success : function(data) {
											var vo = data.qnavo;
											$('#qnaNo').text(vo.questionNo);
											$('#qnaTitle').text(vo.title);
											$('#qnaWriter').text(
													vo.memberVO.email);
											if (vo.admin != null
													&& vo.admin != "") {
												$('#qnaWriter').text(vo.admin);

												var btn = "<button id='deleteQna' value='"+vo.questionNo+"'>";
												btn += "Delete";
												btn += "</button>"
												$('#qnaBtnDiv').html(btn);
											}
											$('#qnaWrite_Date').text(
													vo.writeDate);
											$('#qnaContentView').text(
													vo.content);
										}
									});
						});
		$(document).on("click", "#deleteQna", function() {
			if (confirm("해당 질문글을 삭제하면 답변글까지 모두 삭제됩니다... 삭제 하시겠습니까?")) {
				$.ajax({
					type : "POST",
					url : "mypage.do",
					data : "command=deleteQnA&qnaNo=" + $(this).val(),

					success : function(data) {
						alert("삭제 되었습니다.");
						$('#QnAContent .close').click();
						$('#qnaBox').trigger("click");
					}
				});
			}
		});
		/* 내가 쓴 글 */
		$('#myBoard').click(function() {
			$('#getMyActivityList').trigger("click");
		});
		$('#getMyActivityList').click(function(event, pageNo) {
			var command = "command=MyActivityList";
			if (pageNo != null)
				command += "&pageNo=" + pageNo;
			if(email != null && email != '')
				command += "&email="+email;
			$.ajax({
				type : "POST",
				url : "mypage.do",
										data : command,

										success : function(data) {
											var list = data.myActivityList.list;
											var pagingBean = data.myActivityList.pagingBean;
											var printList = "";

											for (var i = 0; i < list.length; i++) {
												printList += "<tr>";
												printList += "<td style='width:40%;text-align:left'><a id='showDetailOfActivity' value='"+list[i].activityNo+"'>"
														+ list[i].activityTitle
														+ "</a></td>";
												printList += "<td style='text-align:center'>";
												printList += list[i].nowAttendance
														+ " / "
														+ list[i].maxAttendance
														+ "</td>";
												printList += "<td style='text-align:center'>"
														+ list[i].startDate
														+ "</td>";
												printList += "<td style='text-align:center'>"
														+ list[i].endDate
														+ "</td>";
												printList += "</tr>";
											}
											var paging = "";
											if (pagingBean.previousPageGroup) {
												paging += "<a id='myactpagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#ActivityOfMine'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
											}
											for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
												if (pagingBean.nowPage != i) {
													paging += "<a id='myactpagingNo' value='"+i+"' href='#QnaDiv'>"
															+ i + "</a>";
												} else
													paging += i;
												paging += "&nbsp;&nbsp;";
											}
											if (pagingBean.nextPageGroup) {
												paging += "<a id='myactpagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#ActivityOfMine'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
											}
											$('#ActivityOfMine tbody').html(
													printList);
											$('#activityPaging').html(paging);
										},
										error : function() {

										}
									});
						});
		$(document).on("click", "#myactpagingNo", function() {
			$('#getMyActivityList').trigger('click', [ $(this).attr('value') ])
		});
		$('#getMyTipList')
				.click(
						function(event, pageNo) {
							var command = "command=MyTipList";
							if (pageNo != null)
								command += "&pageNo=" + pageNo;
							if(email != null && email != '')
								command += "&email="+email;
							$
									.ajax({
										type : "POST",
										url : "mypage.do",
										data : command,

										success : function(data) {
											var list = data.myTipList.tipList;
											var pagingBean = data.myTipList.pagingBean;
											var printList = "";

											for (var i = 0; i < list.length; i++) {
												printList += "<tr>";
												printList += "<td style='width:15%;text-align:center;'>"
														+ list[i].tipNo
														+ "</td>";
												printList += "<td style='text-align:left;'><a id='showTipByNo' value='"+list[i].tipNo+"'>";
												printList += list[i].title
														+ "</a></td>";
												printList += "<td style='text-align:center;'>"
														+ list[i].writeDate
														+ "</td>";
												printList += "<td style='text-align:center;'>"
														+ list[i].clipCount
														+ "</td>";
												printList += "</tr>";
											}
											var paging = "";
											if (pagingBean.previousPageGroup) {
												paging += "<a id='mytippagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#TipOfMine'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
											}
											for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
												if (pagingBean.nowPage != i) {
													paging += "<a id='mytippagingNo' value='"+i+"' href='#TipOfMine'>"
															+ i + "</a>";
												} else
													paging += i;
												paging += "&nbsp;&nbsp;";
											}
											if (pagingBean.nextPageGroup) {
												paging += "<a id='mytippagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#TipOfMine'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
											}
											$('#TipOfMine tbody').html(
													printList);
											$('#tipPaging').html(paging);
										},
										error : function() {

										}
									});
						});
		$(document).on('click','#showTipByNo',function(){
			window.open('tip.do?command=showTipByNo&tipNo='+$(this).attr('value'));
		});
		$(document).on("click", "#mytippagingNo", function() {
			$('#getMyTipList').trigger('click', [ $(this).attr('value') ])
		});
		$('#getMyPostList').click(function(event, pageNo) {
			var command = "command=MyPostingList";
			if (pageNo != null)
				command += "&pageNo=" + pageNo;
			if(email != null && email != '')
				command += "&email="+email;
			$.ajax({
				type : "POST",
				url : "mypage.do",
				data : command,
				
				success : function(data) {
					var list = data.myPostList.list;
					var pagingBean = data.myPostList.pagingBean;
					var printList = "";
					
					for (var i = 0; i < list.length; i++) {
						printList += "<tr style='text-align:center'>";
						printList += "<td style='width:15%'>"
							+ list[i].postingNo
							+ "</td>";
							printList += "<td style='text-align:left'><a id='showPositngOnFreeBoard'  value='"+list[i].postingNo+"'>";
							printList += list[i].postingTitle
												+ "</a></td>";
										printList += "<td style='text-align:center'>"
												+ list[i].writeDate
												+ "</td>";
										printList += "<td style='text-align:center'>"
												+ list[i].hits
												+ "</td>";
										printList += "</tr>";
									}
									var paging = "";
									if (pagingBean.previousPageGroup) {
										paging += "<a id='mypostpagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#FreeBoardOfMine'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
									}
									for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
										if (pagingBean.nowPage != i) {
											paging += "<a id='mypostpagingNo' value='"+i+"' href='#FreeBoardOfMine'>"
													+ i + "</a>";
										} else
											paging += i;
										paging += "&nbsp;&nbsp;";
									}
									if (pagingBean.nextPageGroup) {
										paging += "<a id='mypostpagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#FreeBoardOfMine'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
									}
									$('#FreeBoardOfMine tbody').html(
											printList);
									$('#postPaging').html(paging);
								},
								error : function() {

								}
							});
						});
		$(document).on('click', '#showPositngOnFreeBoard', function(){
			window.open('freeboard.do?command=showPositngOnFreeBoard&postingNo='+$(this).attr('value'));
		});
		$(document).on("click", "#mypostpagingNo", function() {
			$('#getMyPostList').trigger('click', [ $(this).attr('value') ])
		});
		
		/* Clip */
	      $('#clipBox').click(function(event, pageNo){
	         var command = "command=myClipList";
	         if (pageNo != null)
	            command += "&pageNo=" + pageNo;
	         if(email != null && email != "")
	            command += "&email="+email;
	         $.ajax({
	            type : "POST",
	            url : "tip.do",
	            data : command,

	            success : function(data) {
	               var list = data.myClipList.clipList;

	               var pagingBean = data.myClipList.pagingBean;
	               var printList = "";

	               for (var i = 0; i < list.length; i++) {
	                  var mvo = list[i].memberVO;
	                  var tvo = list[i].tipBoardVO;
	                  printList += "<tr>";
	                  printList += "<td style='width:15%'>"
	                        + tvo.tipNo
	                        + "</td>";
	                  printList += "<td>"+tvo.type+"</td>";
	                  printList += "<td style='text-align:left'><a id='showTipByNo' value='"+list[i].tipBoardVO.tipNo+"'>";
	                  printList += tvo.title
	                        + "</a></td>";
	                  printList += "<td>"
	                        + tvo.writeDate
	                        + "</td>";
	                  printList += "</tr>";
	               }
	               var paging = "";
	               if (pagingBean.previousPageGroup) {
	                  paging += "<a id='mypostpagingNo' value='"+pagingBean.startPageOfPageGroup-1+"' href='#FreeBoardOfMine'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
	               }
	               for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
	                  if (pagingBean.nowPage != i) {
	                     paging += "<a id='mypostpagingNo' value='"+i+"' href='#FreeBoardOfMine'>"
	                           + i + "</a>";
	                  } else
	                     paging += i;
	                  paging += "&nbsp;&nbsp;";
	               }
	               if (pagingBean.nextPageGroup) {
	                  paging += "<a id='mypostpagingNo' value='"+pagingBean.endPageOfPageGroup+1+"' href='#FreeBoardOfMine'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
	               }
	               $('#clipListBox tbody').html(
	                     printList);
	               $('#clipPaging').html(paging);
	            },
	            error : function() {

	            }
	         });
	      });
	});//function
	
	
	
	/* ===위로가기화살표=== */

	$(document).ready(function() {
		$("#page-top").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		});
	});

	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#page-top').fadeIn();
			} else {
				$('#page-top').fadeOut();
			}
		});

	});
	/* ===//위로가기화살표=== */
</script>
<style type="text/css">
th, td {
	padding: 10px;
	padding-top: 3px;
	padding-bottom: 3px;
}

/* ===위로가기화살표=== */
#page-top {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
	cursor: pointer;
}

#page-top a {
	text-decoration: none;
}
/* ===//위로가기화살표=== */

/* ===회원정보수정===*/
#uploadInfoBtn:hover {
	background-color: #ffffff !important;
	border: 1px solid #cccccc !important;
	color: #02bdd5 !important;
}
/*===============*/
/*====메세지===*/
#messageListDiv button {
	background-color: #ffffff;
	border: 1px solid #5F9EA0;
	border-radius: 4px;
	color: #5F9EA0;
}

#messageListDiv button:hover {
	background-color: #e5e5e5;
	border: 1px solid #5F9EA0;
	border-radius: 4px;
	color: #5F9EA0;
}

.color01 {
	color: #008080;
	font-weight: bold;
}

#replyMessage, #deleteMessage, #sendMessageForm button {
	background-color: #5F9EA0;
	border: 1px solid #5F9EA0;
	border-radius: 4px;
	color: #ffffff;
}

#replyMessage:hover, #deleteMessage:hover, #sendMessageForm button:hover
	{
	background-color: #f5f5f5;
	border: 1px solid #5F9EA0;
	border-radius: 4px;
	color: #5F9EA0;
}

#sendMessageForm input[type=text] {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #008080;
	background-color: #f5f5f5;
}

/*======//메세지=======*/
/*===QnA===*/
.color02{
	color:#FF6347;
}

#deleteQna{
	background-color: #FF6347;
	border: 1px solid #FF6347;
	border-radius: 4px;
	color: #ffffff;
}

#deleteQna:hover{
	background-color: #f5f5f5;
	border: 1px solid #FF6347;
	border-radius: 4px;
	color: #FF6347;
}

/*===//QnA===*/

/*=== 내가쓴글 ===*/
#ActivityOfMine tbody {
	/* background-color: #f5f6f8; */
	
}

#ActivityOfMine tbody tr, #TipOfMine tbody tr, #FreeBoardOfMine tbody tr,
#attendActivity tbody tr, #toppingActivityList tbody tr, #toppingPlaceList tbody tr,
#clipListBox tbody tr{
	border-bottom: 1px solid #eeeeee;
	cursor: pointer;
	font-size: 12px;
	height: 30px;
}

#ActivityOfMine tbody tr:hover, #TipOfMine tbody tr:hover, #FreeBoardOfMine tbody tr:hover,
#attendActivity tbody tr:hover, #toppingActivityList tbody tr:hover, #toppingPlaceList tbody tr:hover,
#clipListBox tbody tr:hover{
	background-color: #fbfbfb;
}

.myBoardBoxTable {
	width: 100%;
	margin-top: 20px;
	padding: 10px;
}

.myBoardBoxTableTr {
	background-color: #eeeeee;
	height: 30px;
	border-top: 1px solid #9a9a9a;
	margin-bottom: 15px;
}

.myBoardBoxTableTr th {
	text-align: center;
	font-size: 12px;
}

#activityPaging, #tipPaging, #postPaging, #attendActivityPaging, 
#toppingActivityListPaging, #toppingPlaceListPaging, #clipPaging{
	width: 100%;
	text-align: center;
	margin-top: 15px;
	font-size: 12px;
}

A:hover {
	text-decoration: none
}

A {
	text-decoration: none;
}

A:visited {
	color: ffffff
}
/*=== //내가쓴글 ===*/




/* 탭스타일 추가.. */
.nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
        .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
.tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
.tab-pane { padding: 15px 0; }
.tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }





</style>
</head>
<body>

<!-- 위로가기화살표 -->
<div id="page-top">
	<span><img src="./images/top_1.png"></span>
</div>
<!-- //위로가기화살표 -->
	<div align="center">
		<c:choose>
		<c:when test="${sessionScope.mvo.imgUrl ne null and sessionScope.mvo.imgUrl ne ''}">
		<img id="userImage1" alt="" src="./images/UserImages/${sessionScope.mvo.imgUrl }" width="250em" height="250em" style="margin-top:50px; border-radius: 50%;">
		</c:when>
		<c:otherwise>
		<img id="userImage1" alt="" src="./images/NoUserImage.jpg" width="250em" height="250em" style="margin-top:50px; border-radius: 50%;">
		</c:otherwise>
		</c:choose>
		<br>
		<br> <label id="username" style="color:#02bdd5;font-size: 1.2em">${sessionScope.mvo.nickName }(${sessionScope.mvo.email})</label><br>
		
		
		
	 <!-- 내정보 or 이미 친추되어 있을 경우 팔로우신청버튼을 보이지않게 갈것이다. -->
		<c:choose>
			<c:when test="${sessionScope.mvo.email eq param.email}">
				 <!-- 버튼이 보이지 않는경우... -->
			</c:when>
			<c:otherwise>
				<div style="width: 130px; height: 29px;">
					<img id="followBtn" src="./images/followBtn.jpg" style="cursor: pointer;">
				</div>
			</c:otherwise>
		</c:choose>	

		<table style="text-align: center; margin-bottom: 20px;">
			<thead>
				<tr>
					<th>Follow</th>
					<th>Follower</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="followCount"><a href="#" data-toggle="modal"
						data-target="#followModalDiv"></a></td>
					<td id="followerCount"><a href="#" data-toggle="modal"
						data-target="#followerModalDiv"></a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="followModalDiv" class="modal fade" style="text-align: center;">
		<div class="modal-dialog modal-sm modal-keyboard">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Follow List</h4>
				</div>
				<div id="followModal" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="followerModalDiv" class="modal fade"
		style="text-align: center;">
		<div class="modal-dialog modal-sm modal-keyboard">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Follower List</h4>
				</div>
				<div id="followerModal" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div id="tabs">
		<ul style="background: white; border-color:white;">
			<li id="t-1" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">
				<a id="attendActivityBox" href="#tabs-1" style="color:#9a9a9a;">Activity</a></li>
			<li id="t-2" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">
				<a id="toppingBox" href="#tabs-2" style="color:#9a9a9a;">Topping</a></li>
			<li id="t-3" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">
				<a id="clipBox" href="#tabs-7" style="color:#9a9a9a;">Clip</a></li>
				<c:if test="${sessionScope.mvo.email eq param.email}">
			<li id="t-4" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">
				<a id="messageBox" href="#tabs-3" style="color:#9a9a9a;">Message</a></li>
			<li id="t-5" style="background-color: #414141; border-color:white; border-right: 1px solid #dddddd;">
				<a id="profilBox" href="#tabs-4" style="color:#ffffff;">Profile</a></li>
			<li id="t-6" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">
				<a id="qnaBox" href="#tabs-5" style="color:#9a9a9a;">QnA</a></li>
				</c:if>
			<li id="t-7" style="background-color: white; border-color: white; border-right: 1px solid #dddddd;">	
				<a id="myBoard" href="#tabs-6" style="color:#9a9a9a;">My writings</a></li>
		</ul>
		
		<script type="text/javascript">
			$('#t-1').click(function(){
				$(this).css('background-color', '#414141');
				$('#attendActivityBox').css('color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				//$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');
				
			});
			$('#t-2').click(function(){
				$(this).css('background-color', '#414141');
				$('#toppingBox').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				//$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');

			});
			$('#t-3').click(function(){
				$(this).css('background-color', '#414141');
				$('#clipBox').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				//$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');

			});
			$('#t-4').click(function(){
				$(this).css('background-color', '#414141');
				$('#messageBox').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				//$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');

			});
			$('#t-5').click(function(){
				$(this).css('background-color', '#414141');
				$('#profilBox').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				//$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');

			});
			$('#t-6').click(function(){
				$(this).css('background-color', '#414141');
				$('#qnaBox').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-7').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				//$('#qnaBox').css('color', '#9a9a9a');
				$('#myBoard').css('color', '#9a9a9a');

			});
			$('#t-7').click(function(){
				$(this).css('background-color', '#414141');
				$('#myBoard').css('color', '#ffffff');
				$('#t-1').css('background-color', '#ffffff');
				$('#t-2').css('background-color', '#ffffff');
				$('#t-3').css('background-color', '#ffffff');
				$('#t-4').css('background-color', '#ffffff');
				$('#t-5').css('background-color', '#ffffff');
				$('#t-6').css('background-color', '#ffffff');
				
				$('#attendActivityBox').css('color', '#9a9a9a');
				$('#toppingBox').css('color', '#9a9a9a');
				$('#clipBox').css('color', '#9a9a9a');
				$('#messageBox').css('color', '#9a9a9a');
				$('#profilBox').css('color', '#9a9a9a');
				$('#qnaBox').css('color', '#9a9a9a');
				//$('#myBoard').css('color', '#9a9a9a');

			});
		</script>
		
		
		<div id="tabs-1">
			<div id="attendActivity">
				<table style="width: 100%" class="myBoardBoxTable">
					<thead>
						<tr class="myBoardBoxTableTr">
							<th style="width: 10%">No</th>
							<th style="width: 40%;">Title</th>
							<th style="width: auto;">Now</th>
							<th style="width: auto;">Max</th>
							<th style="width: 15%;">StartDate</th>
							<th style="width: 15%;">EndDate</th>
						</tr>
					</thead>
					<tbody style="text-align: left;">

					</tbody>
				</table>
			</div>
			<div id="attendActivityPaging" style="text-align: center"></div>
		</div>
		<div id="tabs-2" style="background-color: white; margin-top: 15px;">
		
		
			<!-- <ul>
				<li><a id="taTab" href="#toppingActivityList">Activity</a></li>
				<li><a id="tpTab" href="#toppingPlaceList">Destination</a></li>
			</ul> -->
			
			

			<ul style="background: white; border-color:white;">
				<li style="background: white; border-color:white;"><a id="taTab" href="#toppingActivityList"><img id="t1" src="./images/activityBtn_on.jpg" onclick="pic(1)"></a></li>
				<li style="background: white; border-color:white;"><a id="tpTab" href="#toppingPlaceList"><img id="t2" src="./images/destinationBtn_off.jpg" onclick="pic(2)"></a></li>
			</ul>
			
			<!-- 소분류 클릭시 이미지 바뀜 -->
			<script>
			function pic(n){
			 if(n==1){
				 document.getElementById("t1").src="./images/activityBtn_on.jpg";
			     document.getElementById("t2").src="./images/destinationBtn_off.jpg";
			 }
			 else if(n==2){
				 document.getElementById("t2").src="./images/destinationBtn_on.jpg";
				 document.getElementById("t1").src="./images/activityBtn_off.jpg";
			 }
			}
			</script>
			
			<div id="toppingActivityList">
				<table style="width: 100%" class="myBoardBoxTable">
					<thead>
						<tr class="myBoardBoxTableTr">
							<th style="width: 10%">No</th>
							<th style="width: 40%;">Title</th>
							<th style="width: auto;">Now</th>
							<th style="width: auto;">Max</th>
							<th style="width: 15%;">StartDate</th>
							<th style="width: 15%;">EndDate</th>
						</tr>
					</thead>
					<tbody style="text-align: left;">

					</tbody>
				</table>
				<div id="toppingActivityListPaging" style="text-align: center"></div>
			</div>

			<div id="toppingPlaceList">
				<table style="width: 100%" class="myBoardBoxTable">
					<thead>
						<tr class="myBoardBoxTableTr">
							<th>PlaceName</th>
							<th>PlaceAddress</th>
							<th>Image</th>
						</tr>
					</thead>
					<tbody style="text-align: left;">

					</tbody>
				</table>
				<div id="toppingPlaceListPaging" style="text-align: center"></div>
			</div>

		</div>
				<c:if test="${sessionScope.mvo.email eq param.email}">
		<div id="tabs-3">
			<div id="messageListDiv">
				<ul style="background: white; border-color:white;">
					<li style="background: white; border-color:white;"><a id="sendMessageL" href="#sendMessageList"><img id="m1" src="./images/sendmessageBtn_on.jpg" onclick="mes(1)"></a></li>
					<li style="background: white; border-color:white;"><a id="receiveMessageL" href="#receiveMessageList"><img id="m2" src="./images/inboxBtn_off.jpg" onclick="mes(2)"></a></li>
				</ul>
				
				<!-- 소분류 클릭시 이미지 바뀜 -->
				<script>
				function mes(n){
				 if(n==1){
					 document.getElementById("m1").src="./images/sendmessageBtn_on.jpg";
				     document.getElementById("m2").src="./images/inboxBtn_off.jpg";
				 }
				 else if(n==2){
					 document.getElementById("m2").src="./images/inboxBtn_on.jpg";
					 document.getElementById("m1").src="./images/sendmessageBtn_off.jpg";
				 }
				}
				</script>
				
				
				
				<div align="right">
					<button data-toggle="modal" data-target="#sendingMessage"
						style="margin-right: 20px; margin-top: 20px;">Send Message</button>
				</div>
				<div id="sendMessageList" style="text-align: center;"></div>
				<div id="receiveMessageList" style="text-align: center;"></div>
			</div>
		</div>
		<div id="tabs-4">
			<table align="center">
				<tr>
					<td align="center">
						<form id="uploadFrm" action="mypage.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="command" value="uploadUserImage">
							<c:choose>
		<c:when test="${sessionScope.mvo.imgUrl ne null and sessionScope.mvo.imgUrl ne ''}">
		<img id="userImage2" alt="" src="./images/UserImages/${sessionScope.mvo.imgUrl }" width="250em" height="250em" style="margin-top:50px; border-radius: 50%;">
		</c:when>
		<c:otherwise>
		<img id="userImage2" alt="" src="./images/NoUserImage.jpg" width="250em" height="250em" style="margin-top:50px; border-radius: 50%;">
		</c:otherwise>
		</c:choose>
							<br></a> <br>
							<input type="file" id="uploadImage" name="uploadImage"><br>
						</form>
					</td>
					
					<td>
						<form id="uploadInfo" action="mypage.do" method="post">
							<input type="hidden" name="command" value="updateUserInfo"><br>
							<span class="glyphicon glyphicon-envelope"></span>
							Email :: <input type="text" id="email" name="email"
								value="${sessionScope.mvo.email}" readonly="readonly" style="border:none"><br><br>
							<span class="glyphicon glyphicon-user"></span>
							NickName :: <input type="text" id="nickName"
								name="nickName" value="${sessionScope.mvo.nickName}" 
								style="border-top: none;border-left: none;border-right: none;border-bottom: 1px solid #cccccc;width:70%"><br><br>
							<span class="glyphicon glyphicon-home"></span>
							Address :: <input type="text" id="address"
								name="address" value="${sessionScope.mvo.address}"
								style="border-top: none;border-left: none;border-right: none;border-bottom: 1px solid #cccccc;width:74%"><br><br>
							<span class="glyphicon glyphicon-comment"></span>
							Introduce :: <br>
							<textarea rows="12" cols="50" name="selfIntroduce"
								id="selfIntroduce" style="resize:none;padding:0 5px;">${sessionScope.mvo.selfIntroduce}</textarea>
							<br><br>
							<div style="text-align: center;">
								<button id="uploadInfoBtn"  type="submit" style="background-color:#333333;border:1px solid #333333;color:#ffffff;padding:3px 5px;border-radius:4px;">Modify</button>
							</div>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div id="tabs-5">
			<div id="QnADiv" style="text-align: center;">
				<table style="width: 100%; text-align: left;">
					<thead style="text-align: center;">
					<br>
						<tr style="color:#FF6347;border-top:1px solid #cccccc;border-bottom: 1px solid #cccccc;">
							<th width="20%" style="text-align: center;">QnA No</th>
							<th width="50%" style="text-align: center;">Title</th>
							<th width="30%" style="text-align: center;">Date</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div id="qnaPaging" style="width: 100%; text-align: center;"></div>
			</div>
		</div>
				</c:if>
		<div id="tabs-6">
			<div id="myBoardBox">
				<ul style="background: white; border-color:white;">
					<li style="background: white; border-color:white;">
						<a id="getMyActivityList" href="#ActivityOfMine">
							<img id="mm1" src="./images/activityBtn_on.jpg" onclick="myp(1)">
						</a>
					</li>
					<li style="background: white; border-color:white;">
						<a id="getMyTipList" href="#TipOfMine">
							<img id="mm2" src="./images/tipBtn_off.jpg" onclick="myp(2)">
						</a>
					</li>
					<li style="background: white; border-color:white;">
						<a id="getMyPostList" href="#FreeBoardOfMine">
							<img id="mm3" src="./images/freeboardBtn_off.jpg" onclick="myp(3)">
						</a>
					</li>
				</ul>
				
				<!-- 소분류 클릭시 이미지 바뀜 -->
				<script>
				function myp(n){
					 if(n==1){
						 document.getElementById("mm1").src="./images/activityBtn_on.jpg";
					     document.getElementById("mm2").src="./images/tipBtn_off.jpg";
					     document.getElementById("mm3").src="./images/freeboardBtn_off.jpg";
					 }
					 else if(n==2){
						 document.getElementById("mm1").src="./images/activityBtn_off.jpg";
					     document.getElementById("mm2").src="./images/tipBtn_on.jpg";
					     document.getElementById("mm3").src="./images/freeboardBtn_off.jpg";
					 }else if(n==3){
						 document.getElementById("mm1").src="./images/activityBtn_off.jpg";
					     document.getElementById("mm2").src="./images/tipBtn_off.jpg";
					     document.getElementById("mm3").src="./images/freeboardBtn_on.jpg";
					 }
					}
				</script>
				
				<div id="ActivityOfMine">
					<table class="myBoardBoxTable" style="">
						<thead style="">
							<tr class="myBoardBoxTableTr" style="">
								<th style="witdh: 50%;">Title</th>
								<th style="width: 20%;">Now / Max</th>
								<th style="witdh: 15%;">Start Date</th>
								<th style="witdh: 15%;">Due Date</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<div id="activityPaging" style=""></div>
				</div>
				<div id="TipOfMine" class="myBoardBoxTable">
					<table style="width: 100%;">
						<thead>
							<tr class="myBoardBoxTableTr">
								<th style="witdh: 15%">No</th>
								<th style="width: 50%">Title</th>
								<th style="witdh: 20%">WriteDate</th>
								<th style="witdh: 15%">ClipCount</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<div id="tipPaging" style="width: 100%; text-align: center;"></div>
				</div>
				<div id="FreeBoardOfMine" class="myBoardBoxTable">
					<table style="width: 100%; border: 1px; border-color: black;">
						<thead>
							<tr class="myBoardBoxTableTr">
								<th style="witdh: 15%">No</th>
								<th style="width: 50%">Title</th>
								<th style="witdh: 20%">WriteDate</th>
								<th style="witdh: 15%">Hits</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<div id="postPaging" style="width: 100%; text-align: center;"></div>
				</div>
			</div>
		</div>
		<div id="tabs-7">
			<div id="clipListBox" style="width:100%;" align="center">
				<table style="width: 100%; text-align:center;" class="myBoardBoxTable">
					<thead>
						<tr class="myBoardBoxTableTr">
							<th width="15%">ClipNo</th><th width="15%">Type</th><th width="40%">Title</th><th width="20%">Write date</th><th width="10%"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div id="clipPaging"></div>
		</div>
	</div>
</body>






<!-- Modal -->
<div id="messageContent" class="modal fade" style="text-align: center;">
	<div class="modal-dialog modal-lg modal-keyboard">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" aria-hidden="true">×</button>
				<h3 class="smaller lighter blue no-margin modal-title">Message</h3>
			</div>
			<div class="modal-footer">
				<div class="container" style="width: 100%">
					<div class="row" style="width: 100%">
						<div class="col-md-12 col-lg-12 col-sm-12" style="width: 100%">
							<div class="login-box well" style="width: 100%">
								<input type="hidden" id="Bystander">
								<table style="table-layout:fixed;width:100%;">
									<tr>
										<td style="width: 45%; text-align: left;"><span class="color01">Message No</span>&nbsp;&nbsp;<label
											id="msgNo" style="font-weight: normal;"></label>
										</td>
										<td style="text-align: left; width: 55%"><span class="color01">Send Date</span>&nbsp;&nbsp;<label
											id="msgDate" style="font-weight: normal;"></label>
										</td>
									</tr>
									<tr>
										<td style="text-align: left;"><span class="color01">From</span>&nbsp;&nbsp;<label
											id="msgSender" style="font-weight: normal;"></label>
										</td>
										<td style="text-align: left;"><span class="color01">To</span>&nbsp;&nbsp;<label
											id="msgReceiver" style="font-weight: normal;"></label>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: left;word-wrap:break-word;"><span class="color01">Subject</span>
											&nbsp;&nbsp;<label id="msgTitle" style="font-weight: normal;"></label>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: left;word-wrap:break-word;border-top:1px solid #dddddd;">
											<label id="msgContent" style="font-weight: normal;"></label>
										</td>
									</tr>
								</table>
								<button data-toggle="modal" data-target="#sendingMessage"
									id="replyMessage">Reply</button>
								<button id="deleteMessage">Delete</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 메시지 전송하기 창 -->
<div id="sendingMessage" class="modal fade" style="text-align: center;">
	<div class="modal-dialog modal-lg modal-keyboard">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" aria-hidden="true">×</button>
				<h3 class="smaller lighter blue no-margin modal-title">Message</h3>
			</div>
			<div class="modal-footer">
				<div class="container" style="width: 100%">
					<div class="row" style="width: 100%">
						<div class="col-md-12 col-lg-12 col-sm-12" style="width: 100%">
							<div class="login-box well" style="width: 100%">
								<form id="sendMessageForm" action="mypage.do" method="post">
									<input type="hidden" name="command" value="sendMessage">
									<table style="width: 100%">
										<tr>
											<td style="text-align: left; width: 15%;color:#008080;font-weight:bold;">To</td>
											<td align="left"><input type="text" class="insert"
												id="receiver" name="receiverEmail.email" required="required"
												width="55%"><label class="insert" id="checkFlag"></label></td>
										</tr>
										<tr>
											<td style="text-align: left; width: 15%;color:#008080;font-weight:bold;">Subject</td>
											<td align="left"><input type="text" class="insert"
												name="title" required="required" style="width:85%"></td>
										</tr>
										<tr>
											<td style="text-align: left;" colspan="2"><br>
												<textarea class="insert" rows="10" required="required"
													name="message" style="width: 100%;resize:none;border-radius:4px;border:1px solid #008080"></textarea>
											</td>
										</tr>
									</table>
									<button id="sendingMessage">Send Message</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- QnA상세보기 창 -->
<div id="QnAContent" class="modal fade" style="text-align: center;">
	<div class="modal-dialog modal-lg modal-keyboard">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" aria-hidden="true">×</button>
				<h3 class="smaller lighter blue no-margin modal-title">QnA Detailed View</h3>
			</div>
			<div class="modal-footer">
				<div class="container" style="width: 100%">
					<div class="row" style="width: 100%">
						<div class="col-md-12 col-lg-12 col-sm-12" style="width: 100%">
							<div class="login-box well" style="width: 100%">
								<table style="width: 100%; text-align: left;">
									<tr>
										<td><span class="color02" style="font-weight: bold;">QnA No</span>&nbsp;&nbsp;<label id="qnaNo" style="font-weight: normal;"></label>
										</td>
										<td><span class="color02" style="font-weight: bold;">Date</span>&nbsp;&nbsp;<label id="qnaWrite_Date" style="font-weight: normal;"></label>
										</td>
									</tr>
									<tr>
										<td colspan="2"><span class="color02" style="font-weight: bold;">Writer</span>&nbsp;&nbsp;<label id="qnaWriter" style="font-weight: normal;"></label>
										</td>
									</tr>
									<tr>
										<td colspan="2"><span class="color02" style="font-weight: bold;">Title</span>&nbsp;&nbsp;<label id="qnaTitle" style="font-weight: normal;"></label>
									</tr>
									<tr>
										<td colspan="2" id="qnaContentView" style="text-align: left; border-top:1px solid #dddddd;" >
										</td>
									</tr>
								</table>
								<div style="text-align: right;" id="qnaBtnDiv"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</html>