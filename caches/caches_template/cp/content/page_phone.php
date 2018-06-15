<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<link type="text/css" rel="stylesheet" href="<?php echo CSS_PATH;?>mycss.css"/>
<!-- main -->
<div class="wap-app-ma">
            <div class="wap-bg">
            <img src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=7d6a831ed81819e60e9468cb36f36f85&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%276%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='6' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>" class="wap-bgpic">
                  <div class="app-ma" style="display: block;">
                      <div class="wap-wrapper">
                                                 <div class="app-right">
                              <!-- <div class="app-tit"> <img width="482" height="244" src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=7d6a831ed81819e60e9468cb36f36f85&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%276%27&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='6' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>"></div> -->
                       <!--        <div class="txt500"><?php echo $_SERVER['HTTP_HOST'];?></div>
                              <div class="app-two" style="margin-top: 30px">
                                  <div class="app-two-left">
                                      <div class="app-btn1">
                                          <a href="javascript:;"><img src="<?php echo IMG_PATH;?>ios_down.png"></a>
                                      </div>
                                      <div class="app-btn2">
                                          <a href="javascript:;"><img src="<?php echo IMG_PATH;?>android_down.png"></a>
                                      </div>
                                  </div>
                                  <div id="app-phone" class="wap-two-left">
                                      <div class="wap-two-bg"><img src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=f96ddd90db1c5053a18193d5feeba3c6&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%272%27&cache=3600&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$tag_cache_name = md5(implode('&',array('sql'=>'SELECT * FROM cp_picture WHERE id=\'2\'',)).'f96ddd90db1c5053a18193d5feeba3c6');if(!$data = tpl_cache($tag_cache_name,3600)){pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='2' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);if(!empty($data)){setcache($tag_cache_name, $data, 'tpl_data');}}?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>"></div>
                                      <p>扫一扫二维码下载Iphone版</p>
                                  </div>
                                  <div id="app-android" class="wap-two-right">
                                      <div class="wap-two-bg"><img src="<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=48ae6feae962bbb11e4b248e9ce092bf&sql=SELECT+%2A+FROM+cp_picture+WHERE+id%3D%271%27&cache=3600&return=data\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$tag_cache_name = md5(implode('&',array('sql'=>'SELECT * FROM cp_picture WHERE id=\'1\'',)).'48ae6feae962bbb11e4b248e9ce092bf');if(!$data = tpl_cache($tag_cache_name,3600)){pc_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT * FROM cp_picture WHERE id='1' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);if(!empty($data)){setcache($tag_cache_name, $data, 'tpl_data');}}?>
                                <?php $n=1;if(is_array($data)) foreach($data AS $val) { ?>
                                    <?php echo $val['img'];?>
                                <?php $n++;}unset($n); ?>
                            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>"></div>
                                      <p>扫一扫二维码下载Android版</p>
                                  </div>
                              </div> -->
                          </div>
                      </div>
                  </div>
               </div>
           </div>
<!-- footer -->
<?php include template("content","footer"); ?>