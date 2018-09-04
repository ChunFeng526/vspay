<?php
header("Content-type: text/html; charset=utf-8"); 
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);

require_once "../lib/WxPay.Api.php";
require_once "WxPay.NativePay.php";
require_once 'log.php';
// $weixin_money = $_GET['weixin_money'];
// $order_no = $_GET['order_no'];
// session_start();
// if ($_SESSION['toale_money']!=$weixin_money) {
// 	die("价格错误");
// }
//模式一
/**
 * 流程：
 * 1、组装包含支付信息的url，生成二维码
 * 2、用户扫描二维码，进行支付
 * 3、确定支付之后，微信服务器会回调预先配置的回调地址，在【微信开放平台-微信支付-支付配置】中进行配置
 * 4、在接到回调通知之后，用户进行统一下单支付，并返回支付信息以完成支付（见：native_notify.php）
 * 5、支付完成之后，微信服务器会通知支付成功
 * 6、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
 */
$notify = new NativePay();
$url1 = $notify->GetPrePayUrl("123456789");

//模式二
/**
 * 流程：
 * 1、调用统一下单，取得code_url，生成二维码
 * 2、用户扫描二维码，进行支付
 * 3、支付完成之后，微信服务器会通知支付成功
 * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
 */
$input = new WxPayUnifiedOrder();
$input->SetBody("test");
$input->SetAttach("test");
// $num=WxPayConfig::MCHID.date("YmdHis");
$num="KL45645578227554511";
$input->SetOut_trade_no($num);
$input->SetTotal_fee(1);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("test");
$input->SetNotify_url("http://heiweigou.com.cn/wxpay/example/aa_notify.php");
$input->SetTrade_type("NATIVE");
$input->SetProduct_id("123456789");
$result = $notify->GetPayUrl($input);
$url2 = $result["code_url"];
?>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <title>微信支付</title>
</head>
<body>

	<div style="text-align:center;margin:0 auto">
	<img alt="模式二扫码支付" src="qrcode.php?data=<?php echo urlencode($url2);?>" style="width:250px;height:250px;"/>
	 <div id="myDiv"></div>
	 <div style="display:block;">
	 <div id="timer">0</div>
	 <input type="text" id="dd" value="">
	 </div>
	</div>
	 
    <script>  
    //设置每隔1000毫秒执行一次load() 方法  
    var myIntval=setInterval(function(){load()},1000);  
    function load(){  
        document.getElementById("timer").innerHTML=parseInt(document.getElementById("timer").innerHTML)+1; 
        var xmlhttp;    
        if (window.XMLHttpRequest){    
            // code for IE7+, Firefox, Chrome, Opera, Safari    
            xmlhttp=new XMLHttpRequest();    
        }else{    
            // code for IE6, IE5    
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");    
        }
        xmlhttp.onreadystatechange=function(){    
            if (xmlhttp.readyState==4 && xmlhttp.status==200){    
                trade_state=xmlhttp.responseText;
                // 去空格
                trade_state=trade_state.replace(/(^\s*)|(\s*$)/g, "");

                if(trade_state=='SUCCESS'){ 
                	// 支付成功后页面跳转
                    clearInterval(myIntval);
                    document.getElementById("myDiv").innerHTML='支付成功'; 
                    alert('支付成功');
                }else if(trade_state=='REFUND'){  
                    document.getElementById("myDiv").innerHTML='转入退款'; 
                    clearInterval(myIntval); 
                }else if(trade_state=='NOTPAY'){  
                    document.getElementById("myDiv").innerHTML='请扫码支付';  
                      
                }else if(trade_state=='CLOSED'){  
                    document.getElementById("myDiv").innerHTML='已关闭';  
                    clearInterval(myIntval);
                }else if(trade_state=='REVOKED'){  
                    document.getElementById("myDiv").innerHTML='已撤销';  
                    clearInterval(myIntval);
                }else if(trade_state=='USERPAYING'){  
                    document.getElementById("myDiv").innerHTML='用户支付中';  
                }else if(trade_state=='PAYERROR'){  
                    document.getElementById("myDiv").innerHTML='支付失败'; 
                    clearInterval(myIntval); 
                }  
                 
            }    
        } 
        //orderquery.php 文件返回订单状态，通过订单状态确定支付状态  
        xmlhttp.open("POST","./orderquery.php",false);    
        //下面这句话必须有    
        //把标签/值对添加到要发送的头文件。    
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("out_trade_no=<?php echo $num;?>"); 

        }  
    </script>
</body>
</html>