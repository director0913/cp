$(function() {
        //轮播
        $("#slideBox").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, autoPage: true, titCell: ".hd ul" });
        jQuery(".picMarquee-top").slide({mainCell:".bd .tbody",autoPlay:true,effect:"topMarquee",vis:10,interTime:50,trigger:"click"});
       //二维码下载
        $('.down-apple').click(function() {
            $('#img-apple').show();
            $('#img-andoid').hide();
        });
        $('.down-andoid').click(function() {
            $('#img-apple').hide();
            $('#img-andoid').show();
        });
        //公告，指南
        $("#help-tab").find("li").on("mouseover", function(e) {
            e.preventDefault();
            $("#help-tab").find("li").removeClass('on');
            $(this).addClass('on');
            var index = $(this).index();
            $("#help-cnt").children('ul').hide();
            $("#help-cnt").children('ul').eq(index).show();
        });
        // 高频低频切换
        $(".notice-tab .tab-sel").mouseover(function(){
             var index=$(".notice-tab .tab-sel").index(this);
             $(this).addClass('on').siblings().removeClass('on');
             $('.draw-contents').eq(index).css('display','block').siblings('.draw-contents').css('display','none');    
        })
        // 彩票切换
        $(".quick-tab-list .tab-sel-open").mouseover(function(){
             var index=$(".quick-tab-list .tab-sel-open").index(this);
             $(this).addClass('on').siblings().removeClass('on');
             $('.qb-box').eq(index).css('display','block').siblings('.qb-box').css('display','none');    
        })
        // 手机切换
     $(".app_wap_menu .app_center div").click(function(){
            var index=$(".app_wap_menu .app_center div").index(this);
            $(".app_wap_menu .app_center div").removeClass('menu-on');
            $(this).addClass("menu-on");
            $('.app-ma').eq(index).css('display',"block").siblings('.app-ma').css('display',"none");      

    });
     // 活动
     $(".active-listbox ").each(function(){
            $(this).find("dt").click(function(){
               if ($(this).parents(".active-pic").siblings('.active-word').hasClass("on")) {
                     $(this).parents(".active-pic").siblings('.active-word').removeClass("on"); 
               }else{
                $(this).parents(".active-pic").siblings('.active-word').addClass("on");
                $(this).parents(".active-listbox").siblings('.active-listbox').find(".active-word").removeClass("on");
               }

            })
     });
    
})
        
