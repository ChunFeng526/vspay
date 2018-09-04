<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>用户注册</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/login.css">
<script type="text/javascript" src="/Public/home/common/js/jquery-1.9.1.min.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js" ></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/js/home_index.js"></script>
</head>
<style>
    body{background:  url(/Public/home/wap/images/222.jpg) no-repeat;background-size: 100% 100%;height: 100%}
   /*.yanzhm a{color: #f00}*/
</style>
<body>

<div class="register-container">
    <h1 style="color: #c29900;">用户注册</h1>
    
    
    
    <form name="AddUser" action="<?php echo U('Login/register');?>" id="registerForm" method="get">
        <div>
            <input type="text" name="username" class="username" placeholder="昵称" autocomplete="off"/>
        </div>
        <div>
            <input type="number" name="mobile" class="phone_number" placeholder="输入手机号码" autocomplete="off" id="number"/>
        </div>
        <div class="yanzhm">
            <input type="number" id="code" name="code" class="code" placeholder="验证码" oncontextmenu="return false" onpaste="return false" />
            <a href="javascript:void(0)" id="mycode">获取验证码</a>
        </div>
        <div>
            <input type="password" name="login_pwd" class="password" placeholder="输入登录密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" name="relogin_pwd" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>

        <input type="text" name="pid" placeholder="推荐人手机号码" value="<?php echo ($mobile); ?>">

        <div>
            <input type="password" name="safety_pwd" class="safety_pwd" placeholder="交易密码" oncontextmenu="return false" onpaste="return false" />
        </div>

        <div  class="inde-reg">
         <button id="submit"  type="button" onclick="adduser()">注 册</button>
        </div>
    </form>
<!--    <a href="<?php echo U('Login/Appload');?>" class="inde-reg ">
        <button type="button" class="register-tis">APP下载</button>
    </a> -->

  <!--   <a href="https://w-5.net/7Wr0L" class="inde-reg ">
        <button type="button" class="register-tis">APP下载</button>
    </a> -->

    <a href="<?php echo U('Login/login');?>" class="inde-reg">
        <button type="button" class="register-tis" style="background: none;border:none;color: #f00;">已经有账号？</button>
    </a>
  <div class="pad10" style="    height: 12vmin;"></div>
</div>
</body>

<!--表单验证-->
    <script src="/Public/home/wap/js/jquery.validate.min.js?var1.14.0"></script>
   <script type="text/javascript" src="/Public/home/common/js/sendmessage.js"></script>
</html>

<script type="text/javascript">
    $('#mycode').click(function(){
        var mobile=$("input[name='mobile']").val();
        if(mobile=='' || mobile==null){
            layer.msg('请输入手机号码');
        }
        $.post("<?php echo U('Login/sendCode');?>",{'mobile':mobile},function(data){
            if(data.status==1){
                layer.msg(data.message);
                RemainTime();
            }else{
                layer.msg(data.message);
            }
        });
    });

    var intime="<?php echo (session('set_time')); ?>";
    var timenow ="<?php echo time(); ?>";

    var bet=(parseInt(intime)+60)-parseInt(timenow);
    $(document).ready(function(){
        if(bet>0){
            RemainTime();
        }
    });
    var iTime = 59;
    var Account;
    if(bet>0){
        iTime=bet;
    }
    function RemainTime(){
        var iSecond,sSecond="",sTime="";
        if (iTime >= 0){
            iSecond = parseInt(iTime%60);
            iMinute = parseInt(iTime/60)
            if (iSecond >= 0){
                if(iMinute>0){
                    sSecond = iMinute + "分" + iSecond + "秒";
                }else{
                    sSecond = iSecond + "秒";
                }
            }
            sTime=sSecond;
            if(iTime==0){
                clearTimeout(Account);
                sTime='获取验证码';
                iTime = 59;
            }else{
                Account = setTimeout("RemainTime()",1000);
                iTime=iTime-1;
            }
        }else{
            sTime='没有倒计时';
        }
        $('#mycode').html(sTime);
    }
</script>