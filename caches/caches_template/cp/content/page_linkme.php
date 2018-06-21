<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<link type="text/css" rel="stylesheet" href="<?php echo CSS_PATH;?>mycss.css"/>
<!-- main -->
<div class="wrap-bg" style="min-height: 244px;">
				<div class="wrapper">
					<div class="main">
						<div>
							<div class="content_box">
						    	<div class="content_main clearfix">
						        <h1 class="title_top"><?php echo $title;?></h1>
						        <div class="top_links"> 
						        <?php if($description) { ?><?php echo $description;?><?php } ?>
				                </div>
						        
						        <div class="content">
						        <p ><?php echo $content;?></p>
								<p>
						        </p></div>
						      </div>
						    </div>
						</div>
						
				        <div class="clear"></div>
					</div>
                </div>
			</div>
<!-- footer -->
<?php include template("content","footer"); ?>