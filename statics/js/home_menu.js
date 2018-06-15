//全屏高度，防止内容过短的时候，下面出现白边
        $(function() {
            var winH = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.scrollHeight;
            $("body>div.wrap-bg").css("minHeight", (winH - $("body>#header_plus").height() - $("body>.jc-footer").height()) + "px");
        
        var $lotterysList=$("#lotterysList");
        if($lotterysList.is(":hidden")){
            $("#lotterys").hover(function(){
                $lotterysList.show();
            },function(){
                $lotterysList.hide();
            });
        }
        //menu菜单栏
        $("#lottery-list-box").on('mouseover', '.allGames', function() {
            $('.allGames').mouseover(function(e) {
                var tag = $(this).data('type');
                $(this).addClass('allGames-on').siblings('li').removeClass('allGames-on').find('.moreGames').css({ 'display': 'none' });
                $('#moreGames_' + tag).css({ 'display': 'block' });
                $('#lotterysList').addClass('lotterys-list-hd-border1');
                $(this).children('.icon').hide();
                $(this).children('.line-fff').show();
            });
            $('.allGames').mouseout(function(e) {
                $(this).removeClass('allGames-on').find('.moreGames').css({ 'display': 'none' });
                $('#lotterysList').removeClass('lotterys-list-hd-border1');
                $(this).children('.icon').show();
                $(this).children('.line-fff').hide();
            });
        });
        
         //关闭左右悬浮
        $("#_leftAD").find(".close_btn").on("click", function(e) {
            e.preventDefault();
            $(this).parent().hide();
        });
        $("#_leftAD").find(".top1_btn").on("click", function(e) {
            location.href=$(this).attr('href');
        });
        $("#_leftAD").find(".top2_btn").on("click", function(e) {
            location.href=document.getElementById('base_path').href+$(this).attr('href');
        });
        $("#_rightAD").find(".close_btn").on("click", function(e) {
            e.preventDefault();
            $(this).parent().hide();
        });
        // $("#_rightAD").find(".top1_btn").on("click", function(e) {
        // 	window.open($(this).attr('href'));
        // });
        // $("#_rightAD").find(".top2_btn").on("click", function(e) {
        // 	if($(this).attr('href') != '1') {
        // 		window.open($(this).attr('href'));
        // 	}
        // });
  });