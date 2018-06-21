<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<!--main-->
<style type="text/css">
   .news_first {
    float: left;
    margin: 20px 0px 0px 20px;
    width: 965px;
    margin-bottom: 20px;
}
 .newslist li a {width: 363px;font-size: 16px;color: #000000;float:left} 
 .newslist li a:hover{color: #ff0000;}
 .newslist li{ height: 32px;line-height: 32px;border-bottom: 1px dashed #dadada;font-size: 16px;}
 .newslist{ width:1000px;min-height: 300px   } 
 .newslist{margin-top: 15px;}
 .newslist .rt{float: right;}
 .text-c{text-align: center;margin: 15px 0;}
 .text-c a, .text-c span{font-size: 16px;margin:0 3px;}
 .text-c span{color: #ff0000;}
 .newsbox{width: 1000px;margin: 0 auto;}
</style>

<div class="newsbox">
    
        <div class="crumbs" style="margin-top: 15px;font-size: 16px;"><h3><a href="/">首页</a><span> > </span><?php echo catpos($catid);?> 列表</h3></div>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=34168fffdb2f6e976c165a110fc27ad0&action=lists&catid=%24catid&num=10&order=listorder+DESC&page=%24page\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 10;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'listorder DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>   
           <ul class="newslist">
            <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>         
                <li ><a href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a>
                    <span class="rt" ><?php echo date('Y-m-d',$r[inputtime]);?></span>
                </li>
             <?php $n++;}unset($n); ?>
            </ul>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
             <div id="pages" class="text-c"><?php echo $pages;?></div>
    
</div>
<?php include template("content","footer"); ?>