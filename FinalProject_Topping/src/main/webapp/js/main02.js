$(function(){
        $(window).scroll(function() {
            if ($(this).scrollTop() > 450) {
                $('#page-top').fadeIn();
            } else {
                $('#page-top').fadeOut();
            }
        });
        
});