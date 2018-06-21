define(["jquery"], function($) {
    return function() {
        //全屏高度，防止内容过短的时��，下面出现白边
        $(function() {
            var winH = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.scrollHeight;
            $("body>div.wrap-bg").css("minHeight", (winH - $("body>#header_plus").height() - $("body>.jc-footer").height()) + "px");
        });
        var $lotterysList=$("#lotterysList");
        if($lotterysList.is(":hidden")){
            $("#lotterys").hover(function(){
                $lotterysList.show();
            },function(){
                $lotterysList.hide();
            });
        }
        //menu菜单�?
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
        $(function() {
            try {
                //下面�? 加入收藏
                $("#shoucang").on('click', function() {
                    AddFavorite(location.herf, '彩票');

                    function AddFavorite(sURL, sTitle) {
                        try {
                            window.external.addFavorite(sURL, sTitle);
                        } catch (e) {
                            try {
                                window.sidebar.addPanel(sTitle, sURL, "");
                            } catch (e) {
                                alert("请使用Ctrl+D进行添加");
                            }
                        }
                    }
                });
            } catch (e) { console.log(e); }
        });

        var _home_menu = {
            _msgTip: function () {
                $.ajax({
                    type: 'POST',
                    url: 'common/getUnreadMsgCount',
                    data: '',
                    dataType: 'json',
                    timeout: '30000',
                    success: function(results) {
                        if(results.status == "200" && results.data > 0) {
                            $('#un_read_msg_count').text('('+results.data+')');
                            $('#un_read_msg_count').show();

                            if($('#is_index_page') != null && $('#is_index_page').length > 0) {
                                var audio='<audio id="audio1" style="display:none;" controls="controls" autoplay="autoplay" loop="loop" height="0" width="0"><source src="assets/new_msg.mp3" type="audio/mp3" /></audio>';
                                $("body").append(audio);
                                setTimeout(function(){
                                    $("#audio1").remove();
                                }, 2700);
                            }
                        }
                    }
                });
            },

            /*
             棢�查是否登�?
             未登�? 则隐藏用于余额，显示登录输入框��登录，反之�?
             已登录需要显�? 余额和用户名
             * */
            checkLogin: function(type) {
                $.ajax({
                    'url':'common/checkLogin', //棢�查是否登录链�?
                    'dataType': 'json',
                    'type': 'post',
                    'data': {'type':type},
                    'success': function(results) {
                        var data = results.data;
                        if(results.status=="200"){
                            if (data.loginId != '' && data.loginId != undefined && data.loginId != null) { //已登�?
                                $("#header_user").show();
                                $("#header_user_login").hide();
                                $("#header_user [name=\"user_name\"]").html(data.loginId);
                                $("#balance").html(data.balance ? ("�?" + data.balance) : "�?0");
                                _user_.isLogin = true;
                                _user_.userName = data.loginId;
                                $('#header_money_refresh').click(function() {
                                    _user_.refreshMoney1("#balance");
                                });
                                $("#play_free,#agent_reg_url").hide();
                                $("#spread_url_1").show();
                            } else {
                                var parentSelector = "#header_user_login"; //父级dom的��择�?
                                $("#header_user").hide();
                                if ($("#_form_login").length > 0) {
                                    $(parentSelector).hide();
                                } else {
                                    $(parentSelector).show();
                                }

                                function doLogin() {
                                    var username_login = $.trim($(parentSelector + " [name=\"username\"]").val());
                                    var passwd_login = $.trim($(parentSelector + " [name=\"passwd\"]").val());
                                    var authnum_login = $.trim($(parentSelector + " [name=\"authnum\"]").val());
                                    if (username_login == '') {
                                        _alert('用户名不能为�?!');
                                        return false;
                                    }
                                    if (passwd_login == '') {
                                        _alert('密码不能为空!');
                                        return false;
                                    }
                                    if (authnum_login == '') {
                                        _alert('验证码不能为�?!');
                                        return false;
                                    }
                                    if (!/^[0-9a-zA-Z]{4}$/.test(authnum_login)) {
                                        _alert('请输�?4位验证码!');
                                        return false;
                                    }
                                    var param = {
                                        userName: username_login,
                                        password: passwd_login,
                                        verifyCode: ""
                                    };
                                    param.verifyCode = authnum_login;
                                    $.ajax({
                                        url: "common/login/submit", //登录
                                        type: 'post',
                                        data: param,
                                        beforeSend: function() {
                                            $(parentSelector + " [name=\"login\"]").attr("disabled", true);
                                        },
                                        complete: function() {
                                            $(parentSelector + " [name=\"login\"]").attr("disabled", false);
                                        },
                                        'timeout': _user_.ajax_timeout,
                                        dataType: 'JSON',
                                        success: function(results) {
                                            if (results.status == "200") {
                                                //登陆成功
                                                __location('index');
                                                //下面是刷新用户名和余�?
                                                _home_menu.checkLogin(0);
                                            } else {
                                                var parentSelector = "#header_user_login"; //父级dom的��择�?
                                                //登陆错误
                                                _alert(results.description);
                                                if (results.status == "101") //验证码错�?
                                                {
                                                    //$(parentSelector + " [name=\"login_img\"]").click();
                                                    //$(parentSelector + " [name=\"authnum\"]").val("");
                                                    $(parentSelector + " .top-login-bg2").css("display", "block");
                                                } else {
                                                    $(parentSelector + " [name=\"authnum\"]").css("display", "none");
                                                }
                                            }
                                        },
                                        error: function(XMLHttpRequest, status) {
                                            if (status == 'timeout') {
                                                _alert('系统繁忙,请重新操�?!');
                                            }
                                        }
                                    });
                                }
                                $(parentSelector + " [name=\"login\"]").click(doLogin);
                                $(parentSelector + " [name=\"login_img\"]," + parentSelector + " [name=\"btn_refresh\"]," + parentSelector + " [name=\"div_top_click\"]").click(function newVerify() {
                                    $("img[name=\"login_img\"]").attr('src', 'common/public/verifycode/' + Math.random());
                                    $(parentSelector + " [name=\"authnum\"]").val('').trigger("focus");
                                    $(parentSelector + " [name=\"div_top_click\"]").hide();
                                });
                                // $(parentSelector+" [name=\"div_top_click\"]").trigger("click");//点击 按钮[请点击输入验证码]丢�次，帮助用户点击丢��?
                                $(parentSelector + " [name=\"authnum\"]").bind("focus", function() {
                                    if ($(this).val() == "") {
                                        (function newVerify() { //验证码链�?
                                            //$("img[name=\"login_img\"]").attr('src', 'common/public/verifycode/' + Math.random());
                                            //$(parentSelector + " [name=\"div_top_click\"]").hide();
                                        })();
                                    }
                                    try {
                                        if (event.preventDefault) { event.preventDefault(); } else { event.returnValue = false; } } catch (e) {}
                                });
                                $("#play_free").show();
                                $(parentSelector).get(0).onkeydown = function(event) {
                                    var e = event || window.event || arguments.callee.caller.arguments[0];
                                    if (e.keyCode == 9) { // Tab �?
                                        try {
                                            if (e.preventDefault) { e.preventDefault(); } else { e.returnValue = false; } } catch (e) {}
                                    }
                                    if (e && (e.keyCode == 13 || e.keyCode == 9)) { // enter �?
                                        if ($.trim($(parentSelector + " [name=\"passwd\"]").val()) == '') {
                                            $(parentSelector + " [name=\"passwd\"]").focus();
                                            return;
                                        }
                                        if ($.trim($(parentSelector + " [name=\"username\"]").val()) == '') {
                                            $(parentSelector + " [name=\"username\"]").focus();
                                            return;
                                        }
                                        if ($.trim($(parentSelector + " [name=\"authnum\"]").val()) == '') {
                                            $(parentSelector + " [name=\"div_top_click\"]").click();
                                            return;
                                        }
                                        if (!/^[0-9]{4}$/.test($.trim($(parentSelector + " [name=\"authnum\"]").val()))) {
                                            return;
                                        }
                                        doLogin(); //不要刪我的代�?
                                    }
                                };
                                _bug_placeholder("#header_user_login"); //解决 placeholder 兼容性问�?
                            }
                        }
                    }
                });
            }
        };
        //下面是解�? placeholder 兼容性问题：
        function _bug_placeholder(parent_selector_str) {
            try {
                var selector_str = parent_selector_str + " input[placeholder]";
                if (!$(selector_str) && $(selector_str).length == 0) {
                    return;
                }
                if (!('placeholder' in document.createElement('input'))) {
                    $(selector_str).each(function() {
                        var that = $(this),
                            text = that.attr('placeholder');
                        var isFlag = false;
                        if (that.attr("name") == "passwd" || that.attr("name") == "passward" || that.attr("name") == "pwd" || that.attr("type") == "password") {
                            isFlag = true;
                        } else {
                            isFlag = false;
                        }
                        if (that.val() === "") {
                            that.val(text).addClass('_bug_placeholder');
                            if (isFlag) {
                                that.removeAttr("type");
                            }
                        }
                        that.bind("focus", function() {
                            if ($(this).val() === text) {
                                $(this).val("").removeClass('_bug_placeholder');
                                if (isFlag) {
                                    that.attr("type", "password");
                                }
                            }
                        }).bind("blur", function() {
                            if ($(this).val() === "") {
                                $(this).val(text).addClass('_bug_placeholder');
                                if (isFlag) {
                                    that.removeAttr("type");
                                }
                            } else if (isFlag) {
                                that.attr("type", "password");
                            }
                        });
                    });
                }
            } catch (e) {
                console.log(e);
            }
        }
        _home_menu.checkLogin(0);//棢�查是否登录函�?
        _home_menu._msgTip();

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
        $("#_rightAD").find(".top1_btn").on("click", function(e) {
            window.open($(this).attr('href'));
        });
        $("#_rightAD").find(".top2_btn").on("click", function(e) {
            if($(this).attr('href') != '1') {
                window.open($(this).attr('href'));
            }
        });
    };
});
