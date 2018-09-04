<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);

require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Notify.php';
require_once 'log.php';

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);
		Log::DEBUG("query:" . json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		Log::DEBUG("call back:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}
		return true;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);

//============ 陶 Start=====================
// 微信支付回调处理
$xml = $GLOBALS['HTTP_RAW_POST_DATA'];//获取微信返回信息
/*
	返回信息如下：
	<xml><appid><![CDATA[wxedee7ab2f72b2dc8]]></appid>
	<attach><![CDATA[é»‘å–‚ç‹—]]></attach>
	<bank_type><![CDATA[CFT]]></bank_type>
	<cash_fee><![CDATA[1]]></cash_fee>
	<fee_type><![CDATA[CNY]]></fee_type>
	<is_subscribe><![CDATA[Y]]></is_subscribe>
	<mch_id><![CDATA[1260283201]]></mch_id>
	<nonce_str><![CDATA[ad7ben1n05y0afh6pvmqw3eni20juuy0]]></nonce_str>
	<openid><![CDATA[om43Gwd5rXOwj7aFHUemrgYViKRU]]></openid>
	<out_trade_no><![CDATA[KL456456456456]]></out_trade_no>
	<result_code><![CDATA[SUCCESS]]></result_code>
	<return_code><![CDATA[SUCCESS]]></return_code>
	<sign><![CDATA[678C9DF79D1E3DF6215CF2B13D273EAD]]></sign>
	<time_end><![CDATA[20161112233702]]></time_end>
	<total_fee>1</total_fee>
	<trade_type><![CDATA[JSAPI]]></trade_type>
	<transaction_id><![CDATA[4008612001201611129582834632]]></transaction_id>
	</xml>
 */
// 解析XML
$postObj = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);
$out_trade_no = $postObj->out_trade_no;  //获取订单号
//$total_price = $postObj->cash_fee;  //付款金额


// ============下面修改订单状态========
$sub=substr($out_trade_no,0,2);
if($sub=='Yx'){
	file_get_contents("http://yxgsgy.com/Weixin/Pay/setMoney/order_no/".$out_trade_no);
}else{
	file_get_contents("http://yxgsgy.com/WxPay/WxReturn/order_no/".$out_trade_no);
}
// ==========End===============
echo "success";