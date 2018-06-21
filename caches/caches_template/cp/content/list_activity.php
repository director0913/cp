<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<link type="text/css" rel="stylesheet" href="<?php echo CSS_PATH;?>mycss.css"/>
<div class="wrap-bg">
    <div class="wrapper">
          <div class="activities">
                <h1 class="activetitle"><img width="315px" height="40px" src="<?php if($catid=='28') { ?><?php echo IMG_PATH;?>/wanfa.png<?php } else { ?><?php echo IMG_PATH;?>/activity-tit.png<?php } ?>"></h1>
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=6251d0cf864be1493e3cc76d1c9e4e23&action=lists&catid=%24catid&order=listorder+ASC&moreinfo=1\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$data = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder ASC','moreinfo'=>'1','limit'=>'20',));}?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                        <div class="active-listbox ">
                         <dl class="active-pic">
                            <dt>
                            <img src="<?php echo $val['thumb'];?>" width="640" height="121">
                            </dt>
                            <dd>
                                <h1><?php echo $val['title'];?></h1>
                                <ul>
                                    <li>活动对象：<?php echo $val['description'];?></li>
                                    <li>活动内容：<?php echo $val['info'];?></li>
                                </ul>
                            </dd>
                         </dl>
                         <div class="active-word">
                            <p><?php echo $val['content'];?></p>
                         </div>
                    </div>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
          </div>
    </div>
</div>
                            
<?php include template("content","footer"); ?>
