<?php 
ini_set('date.timezone','Asia/Shanghai');
require_once "../lib/WxPay.Api.php";
require_once "WxPay.JsApiPay.php";
require_once 'log.php';

$order_no =$_GET['order_no'];
if(!isset($order_no) || empty($order_no)){
	return false;
}
//连接数据库
$mysql_conf = array(
    'host'    => '127.0.0.1:3306', 
    'db'      => 'kaixin_db', 
    'db_user' => 'kaixinuser', 
    'db_pwd'  => '2Wl8M7xH7E8qZG1rV2G', 
    );

$mysql_conn = @mysql_connect($mysql_conf['host'], $mysql_conf['db_user'], $mysql_conf['db_pwd']);
if (!$mysql_conn) {
    die("error");//诊断连接错误
}
mysql_query("set names 'utf8'");//编码转化
$select_db = mysql_select_db($mysql_conf['db']);
if (!$select_db) {
    die("error");
}

$sub=substr($order_no,0,2);
if($sub=='Yx'){
	$sql = "select order_paymoney as total_price from sp_order where order_no='".$order_no."'";
}else{
	$sql = "select total_price from ysk_order where order_no='".$order_no."'";
}

$res = mysql_query($sql);
if (!$res) {
    die("订单不存在");
}

$row = mysql_fetch_assoc($res);
mysql_close($mysql_conn);


$total_price=$row['total_price']; 
$weixin_money =$total_price*100 ;

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

//打印输出数组信息
function printf_info($data)
{
    foreach($data as $key=>$value){
        echo "<font color='#00ff55;'>$key</font> : $value <br/>";
    }
}

//①、获取用户openid
$tools = new JsApiPay();
$openId = $tools->GetOpenid();

//②、统一下单
$input = new WxPayUnifiedOrder();
$input->SetBody("悠享生态园林");
$input->SetAttach("悠享生态园林");
$input->SetOut_trade_no($order_no);
$input->SetTotal_fee($weixin_money);
$input->SetTime_start(date("YmdHis"));
$input->SetTime_expire(date("YmdHis", time() + 600));
$input->SetGoods_tag("悠享生态园林");
$input->SetNotify_url("http://yxgsgy.com/wxPay/example/notify.php");
$input->SetTrade_type("JSAPI");
$input->SetOpenid($openId);
$order = WxPayApi::unifiedOrder($input);
 // echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';
 // printf_info($order);
$jsApiParameters = $tools->GetJsApiParameters($order);

//获取共享收货地址js函数参数
$editAddress = $tools->GetEditAddressParameters();

//③、在支持成功回调通知中处理成功之后的事宜，见 notify.php
/**
 * 注意：
 * 1、当你的回调地址不可访问的时候，回调通知会失败，可以通过查询订单来确认支付是否成功
 * 2、jsapi支付时需要填入用户openid，WxPay.JsApiPay.php中有获取openid流程 （文档可以参考微信公众平台“网页授权接口”，
 * 参考http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html）
 */
?>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 
    <title>微信支付</title>
    <script type="text/javascript">
	//调用微信JS api 支付
	function jsApiCall()
	{
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest',
			<?php echo $jsApiParameters; ?>,
			function(res){
				WeixinJSBridge.log(res.err_msg);
				 // alert(res.err_code+res.err_desc+res.err_msg);
				//========= 陶业务判断 S
				if(res.err_msg=='get_brand_wcpay_request:ok'){
					
					// 页面跳转
					<?php 
					if($sub=='Yx'){
		            	echo 'window.location="http://yxgsgy.com/Weixin/Pay/paysuccess/order_no/'.$order_no.'"';
		            }else{ 
		            	echo 'window.location="http://yxgsgy.com"';
		             } ?>
				}
				if(res.err_msg=='get_brand_wcpay_request:cancel'){
					alert('取消支付!');
				}

				//========= 陶务判断 E
			}
		);
	}

	function callpay()
	{
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
		        document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
		    }
		}else{
		    jsApiCall();
		}
	}
	</script>
	<script type="text/javascript">
	//获取共享地址
	function editAddress()
	{
		WeixinJSBridge.invoke(
			'editAddress',
			<?php echo $editAddress; ?>,
			function(res){
				var value1 = res.proviceFirstStageName;
				var value2 = res.addressCitySecondStageName;
				var value3 = res.addressCountiesThirdStageName;
				var value4 = res.addressDetailInfo;
				var tel = res.telNumber;
				
			}
		);
	}
	
	// window.onload = function(){
	// 	if (typeof WeixinJSBridge == "undefined"){
	// 	    if( document.addEventListener ){
	// 	        document.addEventListener('WeixinJSBridgeReady', editAddress, false);
	// 	    }else if (document.attachEvent){
	// 	        document.attachEvent('WeixinJSBridgeReady', editAddress); 
	// 	        document.attachEvent('onWeixinJSBridgeReady', editAddress);
	// 	    }
	// 	}else{
	// 		editAddress();
	// 	}
	// };
	
	//取消支付
	function quxiao(){
		 window.location="http://yxgsgy.com";
	}
	
	</script>
</head>

<style>
  *{
    padding: 0px;
    margin:0px;
    font-family: '微软雅黑';
    font-size:16px; 
  }
  body{
  	background-color: #EDEDED;
  }
</style>

<body>

   <div style="text-align:center;height:150px;width:100%;">
      <p style="height:50px" ></p>
      <p style="font-size:24px;line-height:50px;" >悠享生态园林</p>
      <p style="font-size:24px;line-height:50px;" >￥<?php 
    	echo $total_price; ?></p>
    </div>
	
	 <div style="border-top:1px solid #ccc;border-bottom:1px solid #ccc;background: white;line-height: 55px;" >
        <div style="width:50%;float:left;text-align:center"  >收款方</div>
        <div style="width:50%;float:left;text-align:center"  >悠享生态园林</div>
        <div style="clear:both;" ></div>
    </div>
    
    <div style="height:150px;" ></div>

	<div align="center">
		<button style="width:45%; height:50px; border-radius: 5px;background-color:#1AAC19; border:0px #1AAC19 solid; cursor: pointer;  color:white;  font-size:16px;" type="button" onclick="callpay()" >立即支付</button>
		<button style="width:45%; height:50px; border-radius: 5px;background-color:#FF5722; border:0px #FF5722 solid; cursor: pointer;  color:white;  font-size:16px;" type="button"  onclick="quxiao();" >取消支付</button>
	</div>
	<br />
	<br />
	<div style="text-align:center;">
		
	</div>
</body>
</html>