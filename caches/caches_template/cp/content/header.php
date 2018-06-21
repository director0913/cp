<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!DOCTYPE html>
<html>
<head>
<meta name="referrer" content="always">
<meta name="renderer" content="webkit">
<meta name="referrer" content="unsafe-url">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
<meta name="description" content="<?php echo $SEO['description'];?>">
<link href="<?php echo CSS_PATH;?>home.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.slide.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>index.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>user.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>home_menu.js"></script>
<script type="text/javascript">

    function btncheck() {
        location.href = "http://ag.tt17168.com:81/Member/Reg/Default.aspx";
    }
    function forgetPassword() {
        alert("请联系在线客服找回密码");
    }


    function btncheck() {
        location.href = "http://ag.tt17168.com:81/Member/Reg/Default.aspx";
    }
    function finalcheck() {
        if ($.trim($("#loginName").val()) == "") {
            alert('请填写“用戶名”！');
            return false;
        }
        if ($.trim($("#loginPwd").val()) == "") {
            alert('请填写“密码”！');
            return false;
        }
       
         
        var loginName = $("#loginName").val();
        var loginPwd = $("#loginPwd").val();
         
           
       /* $.post("http://ag.tt17168.com:81/Member/Login/Default.aspx", { loginName: loginName, loginPwd: loginPwd, verifycode: "1111" }, function (m) {
            if (m == "1" || m.length > 160) {
                location.href = "http://ag.tt17168.com:81/Member/LoginValidate.aspx";
            } else if (m == "0") {
                //需要修改密碼
            } else {
                alert(m);
            }
        });*/
        return true;
        return false;
    }
    $(function () {
        $("#form_login input").keydown(function (e) {
            var curKey = e.which;
            if (curKey == 13) {
                $("#Submit").click();
                return false;
            }
        });
    });

        function tryrun() {

            alert("游客盘口只供试玩，与正式盘口无关！");
            window.location.href="http://ag.tt17168.com:81/Default.aspx?user=userdl";
            // alert_href('游客盘口只供试玩，与正式盘口无关！', '/Default.aspx?user=userdl');
      
        }
  
</script>
<!--[if lte IE 8]>
<style>
.ie-alert-bg,.ie-alert-wrap { display:block!important;}
</style>
<![endif]-->
</head>
<body>
<div class="header-plus" id="header_plus">
    <div class="header-toptray-plus">
        <div class="quick-tpis">
            <i class="icon-acc"></i>
            <marquee id="sys_tip" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()">
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=59fae842297991a448a06f40d462c2fe&action=lists&catid=11&order=listorder+ASC&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'11','order'=>'listorder ASC','moreinfo'=>'1','limit'=>'20',));}?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                        <?php echo $val['content'];?>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </marquee>
            <!-- onclick="window.open('<?php echo $CATEGORYS['8']['url'];?>')" -->
            <div id="scroll" class="quick-list" style="width: 388px;" >
                <a id="news_url" href="<?php echo $CATEGORYS['29']['url'];?>" target="_blank">联系我们</a><span style="margin-left: 2px;"> | </span>
                <div id="spread_url_1" style="display: none;">
                    <a href="javascript:;">推荐好友获收益<img style="margin-left: 2px;margin-bottom: 10px;" src="picture/hot_new.gif"></a><span> | </span>
                </div>
                <a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1">帮助中心</a>
                <a id="agent_reg_url" href="<?php echo $CATEGORYS['27']['url'];?>" title="加入代理"><span> | </span>加入代理</a>
                <a id="play_free" href="<?php echo $CATEGORYS['26']['url'];?>"><span> | </span>免费试玩</a>
            </div>
        </div>
    </div>
</div>
<div class="liansai-wrap" id="liansai-wrap">
    <div class="liansai" id="liansai">
        <div class="wrapper clearfix relative">
            <h1 class="sprite sprite-logo">
            <a href="javascript:;"><img width="230" height="71" src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=ab30082acd794c1d4f78a8970ee3a92e&sql=SELECT+%2A+FROM+cp_picture+WHERE+catid%3D%2719%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE catid='19' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>" alt=""></a>
            </h1>
            <form name="form_login" method="post" action="http://ag.tt17168.com:81/Member/Login/Default.aspx" id="form_login">
                <div id="header_user_login" class="wrap-login">
                    <div class="logxinxi" id="logxinxi">
                        <div class="top_login">
                            <div style="float:right;">
                                <div class="top-login-bg">
                                    <i class="icon-6"></i>
                                    <input class="top_loginip" id="loginName" name="loginName" type="text" placeholder="请输入用户名">
                                </div>
                                <div class="top-login-bg">
                                    <i class="icon-lock-icon"></i>
                                    <input class="top_loginip" id="loginPwd" name="loginPwd" type="password" placeholder="请输入密码" style="width: 70px;">
                                    <input  type="hidden" id="verifycode" name="verifycode"  value="8888">
                                </div>
<!--                                 <div class="need_captcha">
                                    <div class="top_click" name="div_top_click">
                                        请输入验证码
                                    </div>
                                    <div class="yanzhengma">
                                        <div class="top-login-bg2">
                                            <input class="top_loginmm" id="authnum" name="authnum" maxlength="4" type="text" placeholder="验证码">
                                            <span class="register_captcha_span" style="margin:0; position: relative;">
                                            <img name="login_img" class="login_img">
                                            </span>
                                        </div>
                                    </div>
                                </div> -->
                                <input class="dr_anniu" type="button" name="login" onclick="if (finalcheck()==true) document.form_login.submit();" value="登录">
                                <input class="dr_anniu reg_anniu" type="button" value="注册" onclick="tiao()">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div id="header_user" class="logxinxi" style="display:none;">
                <div class="top_login">
                    <span>您好，<a href="javascript:;" class="play-jl" name="user_name"></a></span>
                    <span>可用余额：</span>
                    <span><a class="balance colorRed" id="a_show_money" rel="nofollow"><span id="balance" class="orange">￥</span></a>
                    </span>
                    <span><a id="header_money_refresh"><i class="icon-refresh-icon"></i></a></span>
                    <span>
                   &nbsp;|&nbsp;
                    <a href="javascript:;">用户中心</a>&nbsp;|&nbsp;
                    <a href="javascript:;">充值</a>&nbsp;|&nbsp;
                    <a href="javascript:;">提现</a>&nbsp;|&nbsp;
                    <a href="javascript:;">交易记录</a>&nbsp;|&nbsp;
                    <a href="javascript:;">个人消息<b id="un_read_msg_count" style="color:red;display:none;"></b></a>&nbsp;|&nbsp;  
                    <a href="javascript:;">退出</a>&nbsp;
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<ul>
<div class="header-navbar-plus" >
    <div class="wrapper clearfix" id="header_box">
        <div class="lottery-plus" id="lotterys">
            <h2 class="">选择彩种 </h2>
            <div class="lotterys-list-hd" id="lotterysList" style="display:none">
                <a href="lottery-list-box">
                <ul class="lottery-list-box" id="lottery-list-box" onclick="window.open('<?php echo $CATEGORYS['8']['url'];?>')">
                    <li class="mainGame">
                    <a href="javascript:;" class="mainA">
                    <i class="icon nav40-9"><img src="<?php echo IMG_PATH;?>53.png"></i>
                    <span class="color333">极速时时彩</span>
                    </a>
                    <a href="javascript:;" class="status-desc">1分半钟开奖</a>
                    </li>
                    
                    <li class="mainGame">
                    <a href="javascript:;" class="mainA">
                    <i class="icon nav40-9"><img src="<?php echo IMG_PATH;?>5.png"></i>
                    <span class="color333">重庆时时彩</span>
                    </a>
                    <a href="javascript:;" class="status-desc">最火爆的彩票</a>
                    </li>
                    <li class="mainGame">
                    <a href="javascript:;" class="mainA">
                    <i class="icon nav40-9"><img src="<?php echo IMG_PATH;?>8.png"></i>
                    <span class="color333">香港六合彩</span>
                    </a>
                    <a href="javascript:;" class="status-desc"></a>
                    </li>

                    <li class="mainGame">
                    <a href="javascript:;" class="mainA">
                    <i class="icon nav40-9"><img src="<?php echo IMG_PATH;?>9.png"></i>
                    <span class="color333">北京赛车(PK10)</span>
                    </a>
                    <a href="javascript:;" class="status-desc">5分钟开一期</a>
                    </li>


                    <li class="allGames clearfix" data-type="3">
                    <h3> <i class="icon nav40-9"><img src="<?php echo IMG_PATH;?>8.png"></i><span>全部</span></h3>
                    <ul class="clearfix game-list">
                        <li><a href="javascript:;">极速时时彩</a></li>
                        <li><a href="javascript:;">三分时时彩</a></li>
                        <li><a href="javascript:;">重庆时时彩</a></li>
                        <li><a href="javascript:;">极速PK10</a></li>
                        <li><a href="javascript:;">三分PK10</a></li>
                        <li><a href="javascript:;">北京赛车(PK10)</a></li>
                    </ul>
                    <i class="icon" id="open-btn-1" style="display: block;"></i>
                    <div class="line-fff" style="display: none;">
                    </div>
                    <div class="moreGames clearfix" style="display: none;" id="moreGames_3">
                        <div class="moreGames-box fl">
                            <div class="otherGames num-games">
                                <h3>全部</h3>
                                <ol>
                                    <li><a href="javascript:;">极速时时彩</a></li>
                                    <li><a href="javascript:;">三分时时彩</a></li>
                                    <li><a href="javascript:;">重庆时时彩</a></li>
                                    <li><a href="javascript:;">极速PK10</a></li>
                                    <li><a href="javascript:;">三分PK10</a></li>
                                    <li><a href="javascript:;">北京赛车(PK10)</a></li>
                                    <li><a href="javascript:;">极速⑥合彩</a></li>
                                    <li><a href="javascript:;">香港⑥合彩</a></li>
                                    <li><a href="javascript:;">幸运飞艇</a></li>
                                    <li><a href="javascript:;">PC蛋蛋(北京28)</a></li>
                                    <li><a href="javascript:;">广东快乐十分</a></li>
                                    <li><a href="javascript:;">重庆幸运农场</a></li>
                                    <li><a href="javascript:;">上海时时乐</a></li>
                                    <li><a href="javascript:;">天津时时彩</a></li>
                                    <li><a href="javascript:;">新疆时时彩</a></li>
                                    <li><a href="javascript:;">山东11选5</a></li>
                                    <li><a href="javascript:;">上海11选5</a></li>
                                    <li><a href="javascript:;">江西11选5</a></li>
                                    <li><a href="javascript:;">广东11选5</a></li>
                                    <li><a href="javascript:;">福彩3D</a></li>
                                    <li><a href="javascript:;">排列三</a></li>
                                    <li><a href="javascript:;">幸运快三</a></li>
                                    <li><a href="javascript:;">安徽快三</a></li>
                                    <li><a href="javascript:;">江苏快三</a></li>
                                    <li><a href="javascript:;">广西快三</a></li>
                                    <li><a href="javascript:;">江西快三</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    </li>
                </ul>
                </a>
            </div>
        </div>
        <ul class="nav-plus clearfix">
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=b43f1459ac702900c8d44c91a5e796dd&action=category&catid=0&num=25&siteid=%24siteid&order=listorder+ASC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$data = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'25',));}?>
                <li class="on"><a href="/">首页</a></li>
                <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?><!--  一级栏目循环开始  -->
                <li><a <?php if($r['catid'] == $catid || $CATEGORYS[$CAT[parentid]][catid]==$r['catid']) { ?>class="h-nav-current" <?php } ?> href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></li>
                <?php $n++;}unset($n); ?><!--  一级栏目循环结束-->
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
    </div>
</div>
<script type="text/javascript">
      var urlstr = location.href;
    var urlstatus=false;
    $(".nav-plus a").each(function () {
         if ((urlstr + '/').indexOf($(this).attr('href')) > -1&&$(this).attr('href')!='') {
         $(this).parent("li").addClass('on');
         urlstatus = true;
         $(this).parents().siblings().removeClass("on");
       } else {
         $(this).parent("li").removeClass('on');
       }
    })
    function finalcheck() {
        if ($.trim($("#loginName").val()) == "") {
            alert('请填写“用戶名”！');
            return false;
        }
        if ($.trim($("#loginPwd").val()) == "") {
            alert('请填写“密码”！');
            return false;
        }
       
         
        var loginName = $("#loginName").val();
        var loginPwd = $("#loginPwd").val();
         
           
        $.post("http://ag.tt17168.com:81/Default.aspx", { loginName: loginName, loginPwd: loginPwd, verifycode: "1111" }, function (m) {
            if (m == "1" || m.length > 160) {
                location.href = "http://ag.tt17168.com:81/Member/LoginValidate.aspx";
            } else if (m == "0") {
                //需要修改密碼
            } else {
                alert(m);
            }
        });
        return true;
        return false;
    }
    function tiao(){
        location.href = "<?php echo $CATEGORYS['8']['url'];?>";
    }

</script>
