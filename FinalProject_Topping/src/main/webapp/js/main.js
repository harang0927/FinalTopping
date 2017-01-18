(function($){
    $.fn.scrollingTo = function( opts ) {
        var defaults = {
            animationTime : 1000,
            easing : '',
            callbackBeforeTransition : function(){},
            callbackAfterTransition : function(){}
        };

        var config = $.extend( {}, defaults, opts );

        $(this).click(function(e){
            var eventVal = e;
            e.preventDefault();

            var $section = $(document).find( $(this).data('section') );
            if ( $section.length < 1 ) {
                return false;
            };

            if ( $('html, body').is(':animated') ) {
                $('html, body').stop( true, true );
            };

            var scrollPos = $section.offset().top;

            if ( $(window).scrollTop() == scrollPos ) {
                return false;
            };

            config.callbackBeforeTransition(eventVal, $section);

            $('html, body').animate({
                'scrollTop' : (scrollPos+'px' )
            }, config.animationTime, config.easing, function(){
                config.callbackAfterTransition(eventVal, $section);
            });
        });
    };
}(jQuery));



jQuery(document).ready(function(){
	"use strict";
	new WOW().init();

/*
(function(){
 jQuery('.smooth-scroll').scrollingTo();
}());
*/
});




$(document).ready(function(){




    $(window).scroll(function () {
        if ($(window).scrollTop() > 50) {
            $(".navbar-brand a").css("color","#fff");
            $("#top-bar").removeClass("animated-header");
        } else {
            $(".navbar-brand a").css("color","inherit");
            $("#top-bar").addClass("animated-header");
        }
    });
/*
    $("#clients-logo").owlCarousel({
 
        itemsCustom : false,
        pagination : false,
        items : 5,
        autoplay: true,

    })
*/
});



// fancybox
$(".fancybox").fancybox({
    padding: 0,

    openEffect : 'elastic',
    openSpeed  : 450,

    closeEffect : 'elastic',
    closeSpeed  : 350,

    closeClick : true,
    helpers : {
        title : { 
            type: 'inside' 
        },
        overlay : {
            css : {
                'background' : 'rgba(0,0,0,0.8)'
            }
        }
    }
});

/*login*/
$(document).ready(function(){
	$("#hidden-login").hide();
	$("#loginViewBtn").click(function(){
		$(".main-intro-text").slideUp('slow');
		$("#hero-area-blank").slideUp('slow');
		$("#hidden-signin").hide();
		$("#hidden-login").fadeIn('slow');
	});
});

/*signin*/
$(document).ready(function(){
	$("#hidden-signin").hide();
	$("#signinViewBtn").click(function(){
		$(".main-intro-text").slideUp('slow');
		$("#hero-area-blank").slideUp('slow');
		$("#hidden-login").hide();
		$("#hidden-signin").fadeIn('slow');
	});
});

function checkReg() {
	var f = document.regForm;
	if(f.email.value==""){
		alert("이메일 입력하세여");
		return;
	}else if(f.password.value==""){
		alert("패스워드를 입력하세여");
		return;
	}else if(f.passwordconfirm.value==""){
		alert("패스워드 확인을 입력하세요");
		return;
	}if(f.nickName.value==""){
		alert("닉네임을 입력하세여");
		return;
	}else if(f.passQuestion.value==""){
		alert("질문을 입력하세요");
		return;
	}else if(f.passAnswer.value==""){
		alert("답을 입력하세요");
		return;
	}else if(f.gender.value==""){
		alert("성별을 입력하세요");
		return;
	}else if(f.emailFlag.value==""){
		alert("아이디중복확인을 하세요");
		return;
	}else if(f.nickFlag.value==""){
		alert("닉네임중복확인을 하세요");
		return;
	}
	
	var pv1 = f.password.value;
	var pv2 = f.passwordconfirm.value;
	
	if(pv1 != pv2){
		alert("패스워드가 같지 않습니다.")
		return;
	}
	
	f.submit();
}
function emailCheck() { 
	var cemail = document.regForm.email.value;
	if(cemail!=""){
		window.open("member.do?command=emailCheck&email="+cemail,"", "resizable=no,toolbar=no,width=200, height=200");
	}
}
function nickNameCheck() { 
	var cnick = document.regForm.nickName.value;
	if(cnick!=""){
		window.open("member.do?command=nickNameCheck&nickName="+cnick,"", "resizable=no,toolbar=no,width=200, height=200");
	}
} 

/* */
function logout() {
	var f=confirm("로그아웃 하시겠습니까?");
	if(f)
		location.href="member.do?command=logout";
}
function updateConfirm() {
	var f=confirm("회원정보를 수정페이지로 가시겠습니까?");
	if(f)
		location.href="member.do?command=updateMemberView&&email=${sessionScope.mvo.email}";
}
function deleteConfirm() {
	var f=confirm("정말 탈퇴하시겠습니까?");
	if(f)
		location.href="member.do?command=deleteMember&&email=${sessionScope.mvo.email}";
}

