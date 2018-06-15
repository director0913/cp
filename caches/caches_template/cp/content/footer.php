<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?>
<div class="jc-footer">
    <div class="footer-cn js-lazy">
        <div class="cnRight">
            <div class="cnTop">
                <div class="cn-list">
                    <i class="sprite" style="background:url(<?php echo IMG_PATH;?>pc-logo-bottom.png) no-repeat; width:169px; height:152px;"></i>
                </div>
                <div class="cn-list">
                    <h3><i class="sprite sprite-hzxg"></i>&nbsp;&nbsp;账户相关</h3>
                    <ul>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何注册账号</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">怎么找回登录密码</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何修改手机号码</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何修改真实姓名</a></li>
                    </ul>
                </div>
                <div class="cn-list">
                    <h3><i class="sprite sprite-czgc"></i>&nbsp;&nbsp;充值购彩</h3>
                    <ul>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何进行充值</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何购买彩票</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">如何查询购彩记录</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1" title="">充值没到账怎么办</a></li>
                    </ul>
                </div>
                <div class="cn-list">
                    <h3><i class="sprite sprite-djtk"></i>&nbsp;&nbsp;兑奖提款</h3>
                    <ul>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1">怎样进行兑奖</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1">如何进行提款</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1">提款是否收手续费</a></li>
                        <li><a href="index.php?m=content&c=index&a=show&catid=21&id=3#help-1">提款不成功怎么办</a></li>
                    </ul>
                </div>
                <div class="cn-list service" onclick="window.open('<?php echo $CATEGORYS['29']['url'];?>')">
                    <h3><i class="sprite sprite-zxkf"></i>在线客服</h3>
                    <ul>
                        <li><i class="sprite sprite-end_qqkf"></i>&nbsp;<a href="javascript:;" target="_blank">在线客服</a></li>
                        <li><i class="sprite sprite-end_qqkf"></i>&nbsp;<a href="javascript:;" target="_blank">在线客服</a></li>
                        <li><i class="sprite sprite-end_qqkf"></i>&nbsp;<a href="javascript:;">QQ客服</a></li>
                    </ul>
                    <p>
                        在线咨询时间：7*24小时
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="foot_box">
        <div class="about_box">
            <ul class="foot_info">
            	<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=7d7a190ee7171128fd9318dc9abf4a18&sql=SELECT+%2A+FROM+cp_round_data+WHERE+id%3D%272%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_round_data WHERE id='2' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                        <?php $n=1;if(is_array(json_decode($val['images'],true))) foreach(json_decode($val['images'],true) AS $v) { ?>
                        <li><a href="javascript:;"><img width="122" height="50" src="<?php echo $v['url'];?>"></a></a></li>
                        <?php $n++;}unset($n); ?>  
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
            <p>
               	<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=4f459851d59b17511cc61a68f63b444e&action=lists&catid=24&order=listorder+ASC&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>'24','order'=>'listorder ASC','moreinfo'=>'1','limit'=>'20',));}?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                        <?php echo $val['content'];?>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </p>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="clear nospace">
    </div>
</div>
<!-- 更新浏览器 -->
<div class="ie-alert-wrap" style="display: none;">
    <!--         <h1>是时候升级你的浏览器了</h1>
     -->
    <!--         <p>你正在使用 Internet Explorer 的早期版本（IE9以下版本 或使用该内核的浏览器）。这意味着在升级浏览器前，你将无法访问此网站。
</p>
 -->
<!--         <hr> -->
<!--         <h2>请注意：Windows XP 及 Internet Explorer 早期版本的支持已经结束</h2>
 -->
<!--         <p>自 2016 年 1 月 12 日起，Microsoft 不再为 IE 11 以下版本提供相应支持和更新。没有关键的浏览器安全更新，您的 PC 可能易受有害病毒、间谍软件和其他恶意软件的攻击，它们可以窃取或损害您的业务数据和信息。请参阅 <a href="javascript:;">微软对 Internet Explorer 早期版本的支持将于 2016 年 1 月 12 日结束的说明</a> 。
</p>
 -->
<!--         <hr> -->
<!--         <h2>更先进的浏览器</h2>
 -->
<!--         <p>推荐使用以下浏览器的最新版本。如果你的电脑已有以下浏览器的最新版本则直接使用该浏览器访问<b id="referrer"></b>即可。
</p>
 -->
<!--         <ul class="browser"> -->
<!--             <li class="browser-chrome"><a href="javascript:;" target="_blank"> 谷歌浏览器<span>Google Chrome</span></a></li>
 -->
<!--             <li class="browser-360"><a href="javascript:;" target="_blank"> 360安全浏览器 <span>360用户推荐</span></a></li>
 -->
<!--             2016-08-06 --><!--             <li class="browser-firefox"><a href="javascript:;" target="_blank"> 火狐浏览器<span>Mozilla Firefox</span></a></li>
 -->
<!--             <li class="browser-ie"><a href="javascript:;" target="_blank"> IE浏览器<span>Internet Explorer</span></a></li>
 -->
<!--             <li class="browser-qq"><a href="javascript:;" target="_blank"> QQ浏览器9 <span>全新升级版本</span></a></li>
 -->
<!--             9.4.8187.400 --><!--             <div class="clean">
</div>
 -->
<!--         </ul> -->
<!--         <hr> -->
<!--         <h2>为什么会出现这个页面？</h2>
 -->
<!--         <p>如果你不知道升级浏览器是什么意思，请请教一些熟练电脑操作的朋友。如果你使用的不是IE6/7/8/9/10，而是360浏览器、QQ浏览器、搜狗浏览器等，出现这个页面是因为你使用的不是该浏览器的最新版本，升级至最新即可。
</p>
 -->
<!--         <hr> -->
</div>
<div class="ie-alert-bg" style="display: none;">
</div>
<div id="_leftAD" class="_float_AD l_AD">
<img src="<?php echo IMG_PATH;?>online-left.png">
<div class="close_btn">
</div>
<a href="<?php echo $CATEGORYS['29']['url'];?>" ><div class="top1_btn" ></div></a>
<a href="<?php echo $CATEGORYS['26']['url'];?>" ><div class="top2_btn" ></div></a>
<div class="two_img">
<img width="100" height="100" src="
 <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=ef0fbe56cb9e47e64403ddc74e9c34f0&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%271%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='1' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>

                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>">
</div>
</div>
<div id="_rightAD" class="_float_AD r_AD">
<img src="<?php echo IMG_PATH;?>online-right.png">
<div class="close_btn">
</div>
<a href="<?php echo $CATEGORYS['29']['url'];?>" ><div class="top1_btn" ></div></a>
<a href="<?php echo $CATEGORYS['26']['url'];?>" ><div class="top2_btn" ></div></a>
<div class="two_img">
<img width="100" height="100" src=" <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=9370f1e7f724dddc828852d8501c560b&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%272%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='2' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>">
</div>
</div>
<input id="is_index_page" type="hidden" value="1">
<script src="js/require.js" data-main="assets/js/application/index"></script>
<script src="js/require.config.js"></script>
<div style="display: none;">
<script src="js/z_stat.js" language="JavaScript"></script>

</div>
</body>
</html>	