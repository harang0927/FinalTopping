<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <title>Tip Content</title>
        <style type="text/css">
			a:hover {text-decoration: none}
			a{text-decoration: none;}
			a:visited {color:ffffff}
			
			#lightbox .modal-content {
			    display: inline-block;
			    text-align: center;   
			}
			
			#lightbox .close {
			    opacity: 1;
			    color: rgb(255, 255, 255);
			    background-color: rgb(25, 25, 25);
			    padding: 5px 8px;
			    border-radius: 30px;
			    border: 2px solid rgb(255, 255, 255);
			    position: absolute;
			    top: -15px;
			    right: -55px;
			    
			    z-index:1032;
			}
			
			#reCommentView{display: none;}
			#reCommentEnter{display: none;}
			
			
		</style>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
       <!--  <link rel="stylesheet" href="css/ionicons.min.css"> -->
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="css/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <!-- <link rel="stylesheet" href="css/jquery.fancybox.css"> -->
        <!-- template main css file -->
        <link rel="stylesheet" href="css/main.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        
		<!-- login form css
         <link rel="stylesheet" href="css/loginform.css"> -->
        <!-- main02 css -->
        <link rel="stylesheet" href="css/main02.css">
        
        <!-- BootScript -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
        <!-- main02 js -->
        <script type="text/javascript" src="js/main02.js"></script>
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        
        <script type="text/javascript">
	        $(document).ready(function(){
	        	$("#page-top").click(function() {
	                $('html, body').animate({scrollTop : 0}, 'slow');
	            });
	        });  
	        
	        	
	        //modal부분 긁어온것.
	        $(document).ready(function() {
	            var $lightbox = $('#lightbox');
	            
	            $('[data-target="#lightbox"]').on('click', function(event) {
	                var $img = $(this).find('img'), 
	                    src = $img.attr('src'),
	                    alt = $img.attr('alt'),
	                    css = {
	                        'maxWidth': $(window).width() - 100,
	                        'maxHeight': $(window).height() - 100
	                    };
	            
	                $lightbox.find('img').attr('src', src);
	                $lightbox.find('img').attr('alt', alt);
	                $lightbox.find('img').css(css);
	            });
	            
	            $lightbox.on('shown.bs.modal', function (e) {
	                var $img = $lightbox.find('img');
	                    
	                $lightbox.find('.modal-dialog').css({'width': $img.width()});
	            });
	          
	    });
	        
	     // comment
	          $(document).on("click","#addComment",function(){
	                console.log("clicked..");
	              var content = $('#commentContent').val();
	              console.log(content);
	              $.ajax({
	                 type : "POST",
	                 url : "tip.do?command=addCommentToTip",
	                 data : "TipBoardVO.tipNo=${tbvo.tipNo}&&content="+ content,
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
	                        str+='<div class="col-md-3"><div id="commentButtons"><input type="button" name="delete_'+cmtvo.commentNo+'"id="deleteTipComment" value="Delete" style="display: inline; margin-right:3px;">'+
	                         '<input id="commentNo" type="hidden" value="'+cmtvo.commentNo+'">'+
	                         '<input type="button" name="update_'+cmtvo.commentNo+'" id="updateComment" value="Modify" style="display: inline">'+
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
	                 url : "tip.do?command=deleteTipComment",                     
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
	                 url : "tip.do?command=updateTipComment",
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
	        
	        
	        
	        
	        
	        $(function(){
			      /* 토핑 확인 */
				$.ajax({
					type:"POST",
					url:"tip.do",
					data:"command=clipWhetherCheck&tipNo=${tbvo.tipNo}",
			              
					success:function(data){
						var map = data.resMap;
						if(map.status == true){
							$('#clipImg').attr('src','./images/big_clip_1.png');
						}//if
					}//success
				});//ajax 
				
				$('#clipImg').click(function(){
					$.ajax({
						type:"POST",
						url:"tip.do",
						data:"command=changeTipStatus&tipNo=${tbvo.tipNo}",
			              
						success:function(data){
							if(data.map.status == 'false'){
								$('#clipImg').attr('src','./images/big_clip_1.png');
							}else{
			                    $('#clipImg').attr('src','./images/big_clip_2.png');
							}
							$('#clipCount').text(data.map.count);
						}//success
					});//ajax 
				});//toppingImg.Click
			});//function
			
			
			function deleteTip() {
				if(confirm("Are you sure you want to delete it?")){
				//확인을 선택하면 이곳에서 페이지를 이동
					location.href="tip.do?command=deleteTipByNo&&tipNo=${tbvo.tipNo}";
				}//if			
			}//deleteTip
			
			function updateTip() {
				if(confirm("Do you really want to modify it?")){
					//확인을 선택하면 이곳에서 페이지를 이동
					location.href="tip.do?command=updateTipView&&tipNo=${tbvo.tipNo}";
				}//if
			}//updateTip
	    	  
	    	  
	    	  
	    	 
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
				<%@include file="header_before_login.jsp" %> 
			</c:when>
			<c:otherwise>
				<%@include file="header_after_login.jsp" %> 
			</c:otherwise>
		</c:choose>	
        
        
        <!--===============================================-->
        <section id="contact-section">
            <div class="container" style="margin-top: 80px; width: 70%">
	            
	            <!-- 타이틀 & 하트부분 -->
	            <div class="row" style="width: 100%">
		            <div class="col-md-8" style="float: left">
		            	<div>
		            		<font style="font-size: 35px;"><span>${tbvo.title}</span></font>
		            	</div>
		            	<div>
		            		<span style="margin-right: 20px;"><font style="font-size:13px; color:#8b8b8b">Writer : <a onclick="window.open('MyPage.jsp?email=${tbvo.memberVO.email}','MyPage', 'width=760, height=620, menubar=no, location=no, status=no, fullscreen=no, toolbar=no, top=0')" target="_blank" style="cursor: pointer;">${tbvo.memberVO.nickName }</a></font></span>
		            		<span style="margin-right: 20px;"><font style="color: #d3d3d3">l</font></span>
		            		<span><font style="font-size:13px; color:#8b8b8b">Write Date : ${tbvo.writeDate }</font></span>
		            	</div>
		            </div>
		            <form name="clipCountForm">
		            <div class="col-md-4" style="float: right; text-align: right;">
		            	<div>
		            	<!-- 이미 토핑한 액티비티는 빨간 하트로 표시된다.! -->
		            		<img id="clipImg" src="./images/big_clip_2.png" style="text-align: center;">
		            		<!-- 이미 토핑한 하트는 회색으로 표시된다. -->
		            		<!-- <img src="./images/bigheart_icon2.png" style="text-align: center;"> -->
		            	</div>
		            	<div>
		            		<font id="clipCount" style="font-size: 20px; color: #02bace; text-align: center; margin-right: 3%;">${tbvo.clipCount}</font>
		            	</div>
		            </div>
		            </form>
		            
	         	</div>
	         	
	         	<!-- 타이틀 바 -->
	         	<div style="border-bottom: 1px solid #d3d3d3; margin-top: 10px; width: 100%"></div>
                
                <!-- 내용부분 -->
                <div class="row" style="margin-top: 10px;">
                <!-- 왼쪽:제목,내용등.. -->
                	<div class="col-md-7">
						<h4><img src="./images/type_icon.jpg" style="margin-right: 5px;"><font style="margin-right: 90px;">Type</font><font style="color:#707070">${tbvo.type}</font></h4>
						<p style="margin-top: 20px"></p>
						<h4><img src="./images/location_icon.png" style="margin-right: 5px;"><font style="margin-right: 60px;">Location</font><font id="placename" style="color:#707070"></font></h4>
						<p style="margin-top: 20px"></p>
						
						<textarea class="form-control" rows="14" style="text-align: left; resize:none;" readonly="readonly">${tbvo.content}</textarea>
					</div>
                <!-- 오른쪽:맵 -->
	                <div class="col-md-5">
	                	<div style="width: 100%; height: 43px; margin-top: 15px; margin-bottom:31px; border-radius:0px; "></div>
						<div class="map-area" style="width:100%; ">
		                        <div id="mapdiv" class="map" style="width:100%; background-color: 'red'; height: 294px;"></div>
	                    </div>
	                </div>

				<script> 
				function initMap() {
					var map = new google.maps.Map(document.getElementById('mapdiv'), {
						center : {
							lat : -33.866,
							lng : 151.196
						},
						zoom : 15
					});
	
					var infowindow = new google.maps.InfoWindow();
					var service = new google.maps.places.PlacesService(map);
					var bounds = new google.maps.LatLngBounds();
					service.getDetails({
						placeId : '${tbvo.placeVO.placeId }'
					}, function(place, status) {
						if (status === google.maps.places.PlacesServiceStatus.OK) {
							map.setCenter(place.geometry.location);
							map.setZoom(18);
							var marker = new google.maps.Marker({
								map : map,
								position : place.geometry.location
							});
							$('#placename').text(place.name);
							google.maps.event.addListener(marker, 'click', function() {
								var imgUrl = "<img src='" + place.photos[0].getUrl({
									'maxWidth' : 200,
									'maxHeight' : 200
								}) + "'>";
								var ratingHtml = '';
								if (place.rating) {
									var ratingHtml = '<br>Rating :: ';
									for (var i = 0; i < 5; i++) {
										if (place.rating < (i + 0.5)) {
											ratingHtml += '&#10025;';
										} else {
											ratingHtml += '&#10029;';
										}//if-else
									}//for
								}//if
								infowindow.setContent(imgUrl + "<br>name :: " + place.name
										+ "<br>Address :: " + place.formatted_address
										+ "<br>Phone :: "
										+ place.international_phone_number + ratingHtml);
								infowindow.open(map, this);
							});//marker.clickListener
						}//if
					});//getDetailts.Function
					map.fitBounds(bounds);
				}//initMap
		</script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA95vH6tAb6oakponeSDvfvCQjWActrb8s&libraries=places&callback=initMap"
			async defer>
		</script>
			</div>
	              
	              
				
				
				<!-- 이미지부분.. -->
	              <div class="row">
	              	<div class="col-xs-12">
	              	<!-- <p> -->
	              		<!-- 타이틀바 -->
	              		<div style="border-bottom: 2px solid #d3d3d3; margin-top: 50px; margin-bottom:30px; width: 100%"></div>
						<div><h4>Gallery</h4></div>
	              		<!-- 이미지 노출부분 -->
	              		<div class="row">
	              		
	              		<!-- 1 -->
	              		<!-- 사용자가 업로드한 이미지 foreach 할 부분:시작. -->
	              		<!-- 해당이미지를 클릭할 경우, 모달창으로 크게 띄운다. --> 
	              		<c:choose> 
	              		<c:when test="${fn:length(tbvo.img) > 0}">
	              		<c:forEach var="img" items="${tbvo.img }">
	              			<div class="col-sm-4 col-xs-12">
	                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
	                                <div class="img-wrapper"  data-toggle="modal" data-target="#lightbox">
	                                    <img src="./tip_upload/${img.newName}" class="img-responsive">
	                                    <div class="overlay" style="cursor: pointer;"></div>
	                                </div>
	                            </figure>
                        	</div>
	              		</c:forEach>
                        <!-- 사용자가 업로드한 이미지 foreach 할 부분:끝. -->
                        </c:when>
                        
                        <c:otherwise>
                        <!-- 3(이미지가 없을 경우 샘플..)-->
	              			<div class="col-sm-4 col-xs-12">
	                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
	                                <div class="img-wrapper">
	                                    <img src="images/noimage_default.jpg" class="img-responsive">
	                                </div>
	                            </figure>
                        	</div>
                        </c:otherwise>
                        </c:choose>
                    	</div>
                    	<!-- 이미지노출부분 끝. -->
                    	<div style="border-bottom: 3px solid #d3d3d3; margin-bottom:30px; width: 100%"></div>
	              	</div> 	
	              </div>
                  <!-- 이미지부분 끝. -->
				
				
				
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
            <c:if test="${tbvo.commentVO!=null }">
               <c:forEach var="tbvo" items="${tbvo.commentVO }">
                  <div id="comment${tbvo.commentNo }">
                     <div class="row" style="margin: 0; padding: 0">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                           <div style="text-align: center;">
                              <img src="./images/user_default.jpg" width="80%">
                           </div>
                           <div style="text-align: center;">${tbvo.memberVO.email }</div>
                        </div>
                        <div class="col-md-7">
                           <div id="textarea_insert${tbvo.commentNo }" style="margin-bottom: 2px; text-align: left;">
                          
                              <div style="height: auto;" id="cmtcontent${tbvo.commentNo }" class="form-control" >${tbvo.content }</div>
                           </div>
                        </div>
                        <div class="col-md-3">
                           <div id="commentButton" style="display: inline;">
                              <c:if test="${sessionScope.mvo.email==tbvo.memberVO.email }">
                                 <input type="button" name="delete_${tbvo.commentNo }"
                                    id="deleteTipComment" value="Delete" style="display: inline;">                      
                                 <input type="button"  name="update_${tbvo.commentNo }"
                                    id="updateComment" value="Modify" style="display: inline;">
                                 <input id="commentNo" type="hidden" value="${tbvo.commentNo }">
                                
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
            <div class="col-md-10" style="width: 85%;">
               <textarea class="form-control" id="commentContent" name="content"
                  rows="3" placeholder="Write Comment" style="text-align: left; resize:none;" required="required"></textarea>
               <button id="addComment" type="button"
                  class="btn btn-default btn-md"
                  style="width: 100%; height: 40px; border-radius: 0px; background-color: #02bace; color: #ffffff">Reply</button>
            </div>
            <div class="col-md-1"></div>
         </div>
      </form>
      <!-- 댓글입력부분 끝 -->
      
      <!-- 코멘트 전체 끝 -->
    
    
    <div class="row" style="width: 68%; margin: 0 auto; margin-top: 50px;" align="center">
					<div class="col-md-12" style="border-top: 3px solid #d3d3d3; margin-right: 0px;">
					<p>
						<p align="right" style="margin-right:150px; ">
		                	<a href="tip.do?command=getTipBoardList"><span style="margin-right: 20px;">Tip list</span></a>
		                	<c:if test="${sessionScope.mvo.email == tbvo.memberVO.email}">
		                		<span style="margin-right: 20px; color:#9a9a9a"></span>
		                		<span><button id="updateTip" class="btn btn-default btn-md" onclick="updateTip()">Tip Update</button></span>
		                		<span style="margin-right: 20px; color:#9a9a9a"></span>
		                		<span><button id="deleteTip" class="btn btn-default btn-md" onclick="deleteTip()">Tip Delete</button></span>
		                	</c:if>
		                	<!-- 자기가쓴글이 아니면 여기를 막아주세용.(끝) -->
	                	</p>
					</div>
				</div>
				
				<%-- <!-- 리스트가기/글수정하기 -->
				<div class="row" style="margin-bottom:10px; margin-top:50px; padding: 0;">
	                <div class="col-md-12">
	                	<div style="border-bottom: 3px solid #d3d3d3;  margin-bottom:30px; width: 100%"></div>
	                	<p align="right" style="margin-right:150px; ">
		                	<a href="tip.do?command=getTipBoardList"><span style="margin-right: 20px;">Tip list</span></a>
		                	<c:if test="${sessionScope.mvo.email == tbvo.memberVO.email}">
		                		<span style="margin-right: 20px; color:#9a9a9a"></span>
		                		<span><button id="updateTip" class="btn btn-default btn-md" onclick="updateTip()">Tip Update</button></span>
		                		<span style="margin-right: 20px; color:#9a9a9a"></span>
		                		<span><button id="deleteTip" class="btn btn-default btn-md" onclick="deleteTip()">Tip Delete</button></span>
		                	</c:if>
		                	<!-- 자기가쓴글이 아니면 여기를 막아주세용.(끝) -->
	                	</p>
	                </div>
	            </div> --%>

            <!-- 컨테이너부분 끝 -->
        </section>
        
       		<!-- modal부분 -->
            <div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <div class="modal-content">
			            <div class="modal-body">
			                <img src="" alt="" />
			            </div>
			        </div>
			    </div>
			</div>
            <!-- modal끝 -->
            
            
            
            <!-- ==================================================
            Scroll Top
            ================================================== -->
            <div id="page-top">
            	<span><img src="./images/top_1.png"></span>
            </div>
            
           <!-- ==================================================
            Footer Section Start
            ================================================== -->
            <%@include file="footer.jsp" %> 


</body>
</html>