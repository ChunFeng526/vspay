<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="./Public/sadmin/css/style.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="./Public/sadmin/js/jquery.min.js"></script>
<script src="./Public/sadmin/js/verificationNumbers.js" tppabs="./Public/sadmin/js/verificationNumbers.js"></script>
<script src="./Public/sadmin/js/Particleground.js" tppabs="./Public/sadmin/js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  
});
</script>
</head>
<body>
<form action="<?php echo U('login');?>" method="post" class="login-form">
<dl class="admin_login">
 <dt>
  <strong>后台登录</strong>
  <em></em>
 </dt>
 <div class="check-tips" style="text-align:center;color:#fff;"></div>
 <dd class="user_icon">
  <input type="text" name="username" placeholder="账号" class="login_txtbx"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" name="password" placeholder="密码" class="login_txtbx"/>
 </dd>

 <dd>
  <input type="submit" value="立即登陆" class="submit_btn"/>
 </dd>
 <dd>
 
 </dd>
</dl>
</form>
<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
<script type="text/javascript">
    	
    	//表单提交


    	$("form").submit(function(){
    		var self = $(this);
    		$.post(self.attr("action"), self.serialize(), success, "json");
    		return false;

    		function success(data){
    			if(data.status){
    				window.location.href = data.url;
    			} else {
    				self.find(".check-tips").text(data.info);
    				
    			}
    		}
    	});

	
    </script>
</body>
</html>