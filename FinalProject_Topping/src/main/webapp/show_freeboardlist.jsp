<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

<!-- show_freeboardlist css -->
<link rel="stylesheet" href="css/show_freeboardlist.css">
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

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ajax tabs -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {

		var header = "";
		$('#ex_select')
				.change(
						function(event, pageNo) {
							//alert($(this).val());
							if ($(this).val() == "ShowAll") {
								var af_data = "command=getFreeBoardListAjax";
								if (pageNo != null)
									af_data += "&pageNo=" + pageNo;
								$
										.ajax({
											type : "post",
											url : "freeboard.do",
											data : af_data,
											success : function(data) {
												//alert(data.flvo.list.length); 
												var list = data.flvo.list;
												var str = "";

												$('#showlist').children()
														.remove();
												$('#free-paging').children()
														.remove();
												for (var i = 0; i < list.length; i++) {
													//alert(posting.postingNo);
													str += "<tr>";
													str += "<td>"
															+ list[i].postingNo
															+ "</td>";
													str += "<td>["
															+ list[i].postingHeader
															+ "]</td>";
													str += "<td style='text-align:left'><a id='titleClick' value='" + list[i].postingNo+ "'>"
															+ list[i].postingTitle
															+ "</a></td>";
													str += "<td>"
															+ list[i].memberVO.nickName
															+ "</td>";
													str += "<td>"
															+ list[i].writeDate
															+ "</td>";
													str += "<td>"
															+ list[i].hits
															+ "</td>";
													str += "</tr>";
												}

												var pagingBean = data.flvo.pagingBean;
												var paging = "";

												//페이징...
												if (pagingBean.previousPageGroup) {
													paging += "<a id='freeboardNo' href='#' value='"
															+ (pagingBean.startPageOfPageGroup - 1)
															+ "'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
												}
												for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
													if (pagingBean.nowPage != i) {
														paging += "<a id='freeboardNo' href='#' value='"+i+"'>"
																+ i + "</a>";
													} else {
														paging += i;
													}
													paging += "&nbsp;&nbsp;";
												}
												if (pagingBean.nextPageGroup) {
													paging += "<a id='freeboardNo' href='#' value='"
															+ (pagingBean.endPageOfPageGroup + 1)
															+ "'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
												}

												$('#showlist').append(str);
												$('#free-paging').html(paging);

											}, // callback
											error : function() {
												alert("응답 시간이 지연되어서 ...Error..");
											},
											timeout : 1000
										// 1초 동안 서버로부터 응답이 없으면 에러 발생
										}); //ajax
							} // if

							if ($(this).val() == "Request Guide"
									|| $(this).val() == "Posting") {
								var cf_data = "command=listbyPostingHeader";
								if (pageNo != null)
									cf_data += "&pageNo=" + pageNo;
								cf_data += "&postingHeader=" + $(this).val();
								$
										.ajax({
											type : "post",
											url : "freeboard.do",
											/* data : "postingHeader="+ $(this).val(), */
											data : cf_data,
											success : function(data) {
												//alert(data.flvo.list.length);
												var list = data.flvo.list;
												var str = "";

												/* $('#showlist').children().remove(); */
												/* $('#free-paging').children().remove(); */
												for (var i = 0; i < list.length; i++) {
													//alert(posting.postingNo);
													str += "<tr>";
													str += "<td>"
															+ list[i].postingNo
															+ "</td>";
													str += "<td>["
															+ list[i].postingHeader
															+ "]</td>";
													str += "<td style='text-align:left'><a id='titleClick' value='"+list[i].postingNo+"'>"
															+ list[i].postingTitle
															+ "</a></td>";
													str += "<td>"
															+ list[i].memberVO.nickName
															+ "</td>";
													str += "<td>"
															+ list[i].writeDate
															+ "</td>";
													str += "<td>"
															+ list[i].hits
															+ "</td>";
													str += "</tr>";
												}

												var pagingBean = data.flvo.pagingBean;
												var paging = "";

												//페이징...
												if (pagingBean.previousPageGroup) {
													paging += "<a id='freeboardNo' href='#' value='"
															+ (pagingBean.startPageOfPageGroup - 1)
															+ "'><img src='${initParam.root }/img/left_arrow_btn.gif'></a>&nbsp;&nbsp;";
												}
												for (var i = pagingBean.startPageOfPageGroup; i <= pagingBean.endPageOfPageGroup; i++) {
													if (pagingBean.nowPage != i) {
														paging += "<a id='freeboardNo' style='cursor:pointer;' value='"+i+"'>"
																+ i + "</a>";
													} else {
														paging += i;
													}
													paging += "&nbsp;&nbsp;";
												}
												if (pagingBean.nextPageGroup) {
													paging += "<a id='freeboardNo' style='cursor:pointer;' value='"
															+ (pagingBean.endPageOfPageGroup + 1)
															+ "'><img src='${initParam.root }/img/right_arrow_btn.gif'></a>";
												}

												$('#showlist').html(str);
												$('#free-paging').html(paging);
											}, // callback
											error : function() {
												alert("응답 시간이 지연되어서 ...Error..");
											},
											timeout : 1000
										// 1초 동안 서버로부터 응답이 없으면 에러 발생
										}); //ajax
							}
						}); // change

		$(document)
				.on(
						'click',
						'#titleClick',
						function() {
							location.href = 'freeboard.do?command=showPositngOnFreeBoard&&postingNo='
									+ $(this).attr('value');
						});
		//click

		$(document).on('click', '#freeboardNo', function() {
			$('#ex_select').trigger('change', [ $(this).attr('value') ]);
		});//click

	}); // fnt
</script>
</head>
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
	<!--
        ==================================================
        Notice Board Table
        ================================================== -->
	<!--main content start-->
	<div class="col-md-12">
		<section class="col-md-1"></section>
		<section id="main-content" class="col-md-10">

			<div id="how-tabs">
				<ul>
					<li><a href="tip.do?command=getTipBoardList&&page=1"
						class="check02">TipBoard</a></li>
					<li><a href="freeboard.do?command=getFreeBoardList&&page=1"
						class="check01"><span
							class="glyphicon glyphicon-option-vertical"
							style="color: #02bdd5"></span>FreeBoard</a></li>
				</ul>
			</div>

			<!-- notice.jsp 내용들 -->
			<div id="freeboard">
				<section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb"
								style="background-color: #333; color: #fff;">
								<li><span class="glyphicon glyphicon-home"
									style="color: #ffffff;"></span>&nbsp;Home</li>
								<li>Community</li>
								<li>TipBoard</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->


					<!-- 테이블-->
					<div class="row">
						<div class="col-md-12">
							<section class="panel">

								<!-- selectbox -->
								<div id="selectbox">
									<form name="frm" id="frm">
										<label for="ex_select"></label> <select name="postingHeader"
											id="ex_select">
											<option selected="selected">TYPE</option>
											<option value="ShowAll" id="showAll">All</option>
											<option value="Request Guide" id="requestGuide">Request
												Guide</option>
											<option value="Posting" id="posting">Posting</option>
										</select>
									</form>
								</div>
								<!-- //selectbox -->

								<table class="table table-hover free-table">
									<thead>
										<tr>
											<th width="10%">No</th>
											<th width="15%">Type</th>
											<th width="40%">Title</th>
											<th width="15%">Writer</th>
											<th width="15%">Date</th>
											<th width="5%">Hits</th>
										</tr>
									</thead>
									<tbody id="showlist">
										<c:forEach var="flvo" items="${requestScope.flvo.list}">
											<tr>
												<td>${flvo.postingNo}</td>
												<td>[${flvo.postingHeader}]</td>
												<td class="free-title"><a
													href="freeboard.do?command=showPositngOnFreeBoard&&postingNo=${flvo.postingNo}">${flvo.postingTitle}</a></td>
												<td>${flvo.memberVO.nickName}</td>
												<td>${flvo.writeDate}</td>
												<td>${flvo.hits}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<!-- 글쓰기&페이징 -->
								<div id="free-footer">
									<div id="free-paging" class="col-md-8">
										<!-- 페이징 처리 -->
										<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.
										  이미지 링크는 현 페이지 그룹 시작페이지 번호 -1 =>
							  			 이전 페이지 그룹의 마지막 페이지 번호로 한다.  --%>
										<c:if test="${requestScope.flvo.pagingBean.previousPageGroup}">
											<a
												href="freeboard.do?command=getFreeBoardList&pageNo=
											${requestScope.flvo.pagingBean.startPageOfPageGroup-1}">이전페이지</a>
										</c:if>

										<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의
										   시작페이지~~마지막페이지까지 화면에 보여준다. 
										   이 때 현재 페이지를 제외한 나머지 페이지는 링크를 걸어
										   해당 페이지에 대한 게시물 리스트 조회가 가능하도록 한다. --%>
										<c:forEach var="i"
											begin="${requestScope.flvo.pagingBean.startPageOfPageGroup}"
											end="${requestScope.flvo.pagingBean.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${requestScope.flvo.pagingBean.nowPage!=i}">
													<a href="freeboard.do?command=getFreeBoardList&pageNo=${i}">${i}</a>
												</c:when>
												<c:otherwise>
											${i}
										</c:otherwise>
											</c:choose>
										</c:forEach>

										<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다.
											이미지 링크는 현재 페이지 그룹의 마지막 번호 + 1 => 
											다음 그룹의 시작 페이지로 링크한다. 
											right_arrow_btn.gif
									 --%>
										<c:if test="${requestScope.flvo.pagingBean.nextPageGroup}">
											<a
												href="freeboard.do?command=getFreeBoardList&pageNo=
												${requestScope.flvo.pagingBean.endPageOfPageGroup+1}">
												다음페이지 </a>
										</c:if>
									</div>

									<div id="free-writeBtn" class="col-md-4">
										<c:if test="${sessionScope.mvo!=null}">
											<a href="posting.jsp">Write</a>
										</c:if>
									</div>
								</div>
								<!-- //글쓰기&페이징 -->
							</section>
						</div>
					</div>
					<!-- //테이블-->
				</section>
			</div>
			<!-- //notice.jsp 내용들 -->
		</section>
		<section class="col-md-1"></section>
	</div>


	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>