<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<div class="wrap-bg" style="padding-bottom:20px;">
    <img width="1920" height="585" src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=9dc51ceeb87944f28ee7667f541c72bf&sql=SELECT+%2A+FROM+cp_picture+WHERE+catid%3D%2720%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE catid='20' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>" alt="背景图" class="wrap-bgpic">
    <div class="clearfix wrapper">
        <div class="slide">
            <div id="slideBox" class="slideBox">
                <div class="hd">
                    <ul>
                    </ul>
                </div>
                <div class="bd">
                    <ul>
                        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=16c12dbd777da3cf9a41f543c2d784d0&sql=SELECT+%2A+FROM+cp_round_data+WHERE+id%3D%271%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_round_data WHERE id='1' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                            <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                <?php $n=1;if(is_array(json_decode($val['images'],true))) foreach(json_decode($val['images'],true) AS $v) { ?>
                                <li><a href="javascript:;"><img width="743" height="285" src="<?php echo $v['url'];?>"></a></a></li>
                                <?php $n++;}unset($n); ?>  
                            <?php $n++;}unset($n); ?>
                        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper" style="margin-top:15px;">
        <div class="part-3-cont-right part-right picMarquee-top">
            <div class="ratetop">
                <div>
                    中奖排行榜
                </div>
            </div>
            <div class="tableCarousel bd" cellspacing="0" cellpad c-greyding="0" style="">
                <div class="thead" style="position:absolute;z-index:6;width:100%;">
                    <div>
                        用户名
                    </div>
                    <div>
                        奖金
                    </div>
                </div>
                <div class="picMarquee-top">
                    <div  class="bd">
                    <div id="prizeUser" class="tbody">
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=6167e18542ea1aac3864c8218897196f&action=lists&catid=25&order=listorder+ASC&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'25','order'=>'listorder ASC','moreinfo'=>'1','limit'=>'20',));}?>
                        <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                            <p><span><span><?php echo $n;?></span><?php echo $val['title'];?></span><span class="orange"><?php echo $val['price'];?>元</span></p>
                        <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    

                    </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="part-2-cont-right part-right">
            <div class="lottery-news-box">
                <div class="news-title clearfix">
                            <li style="margin-bottom: 5px;">
                               <a  href="javascript:;" id="newsTitle_1" style="display: inline-block;width: 395px;text-align: center;">新闻资讯</a>
                               <a  href="<?php echo $CATEGORYS['16']['url'];?>" id="" style="display: inline-block;float: right;font-size: 14px;">更多</a>
                            </li>
                           
                </div> 
                
                  
                
                <div class="news-bar">
                    <div class="news-bar-content" id="news-bar-content1">
                        <ul class="news-bar-list news-bar-left clearfix">
                            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=122f741450fb68397e3ffcf962c9e870&action=lists&catid=16&order=listorder+DESC&num=14\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'16','order'=>'listorder DESC','limit'=>'14',));}?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <li>
                                        <a href="javascript:;" class="c-grey">新闻</a><span class="pad c-grey">|</span>
                                        <a href="<?php echo $val['url'];?>"><?php echo str_cut($val['title'], 75);?></a>
                                    </li>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="submain">
            <div class="home-wrapper">
               <!--  <div class="quick-buy-box">
                    <div class="qb-box-list">
                        <div id="_index_countdownIssue">
                            <div class="quick-buy-box mt15">
                                <div class="quick-buy" style="margin-left: -15px;">
                                    <ul  class="quick-tab-list clearfix">
                                        <li class="tab-sel-open on" ><a>重庆时时彩</a></li>
                                        <li class="tab-sel-open"><a>福彩3D</a></li>
                                        <li class="tab-sel-open" ><a>PK拾</a></li>
                                        <li class="tab-sel-open"><a>排列三</a></li>
                                        <li class="tab-sel-open"><a>山东11选5</a></li>
                                    </ul>
                                    <div  class="qb qb-box-list">
                                        <div class="qb-box ">
                                            <ul class="qb-info clearfix">
                                                <li> 第<span>20180606070</span>期
                                                <span class="c-gray">截止：</span>
                                                <span class="sale_end_timer">
                                                <span>
                                                <span name="day" class="orange">0</span>天
                                                <span name="h" class="orange">0</span>小时
                                                <span name="m" class="orange">0</span>分
                                                <span name="s" class="orange">0</span>秒
                                                </span>
                                                </span>
                                                </li>
                                                <li class="bztz">
                                                <a href="javascript:;" name="btn_game_play">手动选号</a> |
                                                <a href="javascript:;" name="btn_trend">走势图</a>
                                                </li>
                                            </ul>
                                            <div class="qb-selectnumber">
                                                <i class="sprite sprite-sscd"></i>
                                                <ul name="num_list" class="qb-selectnum clearfix qb_dlt_select">
                                                    <li class="qb-red lot_sn_red"><input value="8" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="0" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="9" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="8" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="2" readonly=""></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="qb-box" style="display: none;">
                                            <ul class="qb-info clearfix">
                                                <li> 第<span>10000000</span>期
                                                <span class="c-gray">截止：</span>
                                                <span class="sale_end_timer">
                                                <span>
                                                <span name="day" class="orange">0</span>天
                                                <span name="h" class="orange">0</span>小时
                                                <span name="m" class="orange">0</span>分
                                                <span name="s" class="orange">0</span>秒
                                                </span>
                                                </span>
                                                </li>
                                                <li class="bztz">
                                                <a href="javascript:;" name="btn_game_play">手动选号</a> |
                                                <a href="javascript:;" name="btn_trend">走势图</a>
                                                </li>
                                            </ul>
                                            <div class="qb-selectnumber">
                                                <i class="sprite sprite-sscd"></i>
                                                <ul name="num_list" class="qb-selectnum clearfix qb_dlt_select">
                                                    <li class="qb-red lot_sn_red"><input value="9" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="0" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="9" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="8" readonly=""></li>
                                                    <li class="qb-red lot_sn_red"><input value="2" readonly=""></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="qb-tz-box clearfix">
                                            <span class="fl bei-box clearfix">
                                            <a href="javascript:;" class="tz_bei_sub" id="times_sub">−</a>
                                            <input name="times_nums" type="text" name="input" maxlength="3" id="times_nums" class="multiple" value="2">
                                            <a href="javascript:;" class="tz_bei_add" id="times_add">+</a>
                                            <span class="mr10">元</span><strong style="display:none;" name="bet_amount" id="bet_amount" class="money orange">2</strong>
                                            </span>
                                            <span class="dg-btn-box">
                                            <a name="change_gameNum" class="change-btn" id="change_random" onclick="setbetNum()">
                                            <i class="icon-refresh-icon"></i> 换一注
                                            </a>
                                            <a name="doBet" class="dg-tz-btn icon" href="<?php echo $CATEGORYS['8']['url'];?>" id="doBet_submit_index">立即投注</a>
                                            </span>
                                        </div>
                                        <input type="hidden" value="1" id="selected_open">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <div class="right-info">
                    <div class="app-down">
                        <div class="down-tit">
                            <i class="icon-iphone-icon"></i>彩票APP手机客户端下载
                        </div>
                        <div class="down-img" id="img-apple">
                            <img src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=9370f1e7f724dddc828852d8501c560b&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%272%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='2' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>"/>
                        </div>
                        <div class="down-img" id="img-andoid" style="display: none">
                            <img src="
                            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=ef0fbe56cb9e47e64403ddc74e9c34f0&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%271%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='1' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>"/>
                        </div>  
                        <div class="down-txt">
                            <a class="down-apple"><i class="icon-appleinc"></i>Iphone版</a>
                            <a class="down-andoid"><i class="icon-android"></i>Android版</a>
                            <a class="mobile-more" href="javascript:;">更多方式</a>
                        </div>
                    </div>
                    <div class="help-tab-box">
                        <div class="part-2-cont-left part-left">
                            <div id="draw_box" class="draw-notice">
                                <ul class="help-tab clearfix" id="help-tab">
                                    <li class="on"><a class="web-notice">网站公告</a></li>
                                </ul>
                                <div id="help-cnt" style="height:250px" >
                                    <ul class="user-help-box help-ul" >
                                        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0d60accd9798412423585361366e472c&action=lists&catid=22&num=10&order=listorder+DESC\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'22','order'=>'listorder DESC','limit'=>'10',));}?> 
                                       
                                            <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                                <li><a href="<?php echo $val['url'];?>"><?php echo $val['title'];?></a></li>
                                            <?php $n++;}unset($n); ?>
                                        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                                    </ul>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include template("content","footer"); ?>
<script type="text/javascript">
    $('#lotterys,#lotterysList').css('display','block')
</script>