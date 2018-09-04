<?php

namespace Shop\Controller;

use Think\Controller;

class PayController extends CommonController
{

	protected function _initialize()
	{
		$config = S('DB_CONFIG_DATA');
		C($config);
		//基础配置(必须)
		define('APPID', C('wxappid'));
		define('MCHID', C('wxmchid'));
		define('KEY', C('wxappkey'));
		define('APPSECRET', C('wxappsecret'));
		//证书配置
		//默认为Application/Common/Common/Libs/Weixin/cert文件夹下
		//其他位置需要设置证书物理路径
		// define('SSLCERT_PATH', '');
		// define('SSLKEY_PATH',  '' );

		//加载
		vendor('WxPay.JsApiPay');
		import('Vendor.WxPay.JsApiPay');

		vendor('Alipay.CoreFunction');
		vendor('Alipay.Md5Function');
		vendor('Alipay.Notify');
		vendor('Alipay.Submit');

	}

	//建林阿里pay
	public function alipay()
	{

		$alipay_config = C("alipay");        //读取配置文件

		$order_no = I("order_no");

		//取订单


		//商户订单号，商户网站订单系统中唯一订单号，必填
		$out_trade_no = "131646164164641414";

		//订单名称，必填
		$subject = "聚宝" . $out_trade_no;

		//付款金额，必填
		$total_fee = "0.01";
		// $total_fee = 0.01;
		if ($total_fee < 0.01) {
			echo "<script>alert('该订单金额有误，无法进行支付。');</script>";
			echo "<script language=JavaScript>history.go(-1);location.reload();</script>";
			die;
		}

		//商品描述，可空
		$body = "聚宝描述";
		// $body="abavv";


		/************************************************************/

		//构造要请求的参数数组，无需改动
		$parameter = array(
			"service" => $alipay_config['service'],
			"partner" => $alipay_config['partner'],
			"seller_id" => $alipay_config['seller_id'],
			"payment_type" => $alipay_config['payment_type'],
			"notify_url" => $alipay_config['notify_url'],
			"return_url" => $alipay_config['return_url'],

			"anti_phishing_key" => $alipay_config['anti_phishing_key'],
			"exter_invoke_ip" => $alipay_config['exter_invoke_ip'],
			"out_trade_no" => $out_trade_no,
			"subject" => $subject,
			"total_fee" => $total_fee,
			"body" => $body,
			"_input_charset" => trim(strtolower($alipay_config['input_charset']))
			//其他业务参数根据在线开发文档，添加参数.文档地址:https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.kiX33I&treeId=62&articleId=103740&docType=1
			//如"参数名"=>"参数值"

		);

		//建立请求
		$alipaySubmit = new \Vendor\Alipay\AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter, "get", "确认");
		echo $html_text;
	}


	public function alipay_notify_url()
	{
		$alipay_config = C("alipay");
		//计算得出通知验证结果
		$alipayNotify = new \Vendor\Alipay\AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
		logResult("||notify result:" . $verify_result);
		if ($verify_result) {//验证成功
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

			//获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表

			//商户订单号

			$out_trade_no = $_POST['out_trade_no'];

			//支付宝交易号

			$trade_no = $_POST['trade_no'];

			//交易状态
			$trade_status = $_POST['trade_status'];


			if ($_POST['trade_status'] == 'TRADE_FINISHED') {
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
				//如果有做过处理，不执行商户的业务程序

				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知

				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			} else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
				//如果有做过处理，不执行商户的业务程序

				//注意：
				//付款完成后，支付宝系统发送该交易状态通知

				//调试用，写文本函数记录程序运行情况是否正常
				//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
			}
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			$updateArr['pay_time'] = time();
			$updateArr['trade_no'] = $trade_no;
			$updateArr['order_status'] = 1;
			$isUpdate = M("order")->where("order_no='" . $out_trade_no . "'")->save($updateArr);
			echo "success";    //请不要修改或删除
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		} else {
			//验证失败
			echo "fail";
			//调试用，写文本函数记录程序运行情况是否正常
			//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
		}
	}


	public function alipay_return_url()
	{

		$alipay_config = C("alipay");

		//计算得出通知验证结果
		$alipayNotify = new \Vendor\Alipay\AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		logResult("||return result:" . $verify_result);

		$out_trade_no = $_GET["out_trade_no"];
		$trade_no = $_GET['trade_no'];
		$trade_status = $_GET['trade_status'];
		$where['order_no'] = $out_trade_no;
		$where['trade_no'] = $trade_no;

		if ($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
			sleep(5);
			$order = M("order")->where($where)->find();
			if ($order) {
				$this->success("订单支付成功，进入订单中心。", "/Order/center");
			} else {
				$this->success("订单支付中，进入订单中心。", "/Order/center");
			}

		} else {

			$this->success("订单支付失败。", "/");
		}

		// if($verify_result) {//验证成功
		// 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 	//请在这里加上商户的业务逻辑程序代码

		// 	//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		//     //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

		// 	//商户订单号

		// 	$out_trade_no = $_GET['out_trade_no'];

		// 	//支付宝交易号

		// 	$trade_no = $_GET['trade_no'];

		// 	//交易状态
		// 	$trade_status = $_GET['trade_status'];


		//     if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {

		// 		//判断该笔订单是否在商户网站中已经做过处理
		// 			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
		// 			//如果有做过处理，不执行商户的业务程序
		// 		$updateArr['pay_time'] = time();
		// 		$updateArr['trade_no'] = $trade_no;
		// 		$updateArr['order_status'] = 1;
		// 		$isUpdate = M("order")->where("order_no='".$out_trade_no."'")->save($updateArr);

		// 		var_dump($isUpdate);die(mysql_error());
		//     }
		//     else {
		//       echo "trade_status=".$_GET['trade_status'];
		//     }


		// 	//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

		// 	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// }
		// else {
		//     //验证失败
		//     //如要调试，请看alipay_notify.php页面的verifyReturn函数
		//     echo "失败";

		// }

	}


	public function index()
	{
		$oid = I("oid");
		$uid = session('user_auth.uid');
		if (!$uid) $this->error("请登录后进行操作");
		if (!$oid) $this->error("缺少订单参数");

		//订单验证
		$order = M("order")->where(array("order_id" => $oid, "uid" => $uid))->find();
		if ($order['status'] != 0) $this->error("该订单不是待支付状态，无法进行支付。");

		//查询农联金额
		$farmlink_jifen = M("member_jifens")->where(array("member_id" => $uid))->getField("farmlink_jifen");
		$xiaofei_jifen = M("member_jifens")->where(array("member_id" => $uid))->getField("xiaofei_jifen");
		$this->assign("xiaofei_jifen", $xiaofei_jifen);
		$this->assign("farmlink_jifen", $farmlink_jifen);
		$this->assign("order", $order);

		$this->display();
	}


	public function pay()
	{
		$order_no = I("ono");
		$pay_type = I("ptype");

		/*积分类型*/
		$jifentypes = I('jifentypes');

		if ($jifentypes < 1 || $jifentypes > 3) {
			$data['status'] = "0";
			$data['info'] = "请选择正确的积分赠送类型";
			echo json_encode($data);
			die;
		}
		$uid = session('user_auth.uid');
		/*二级密码*/
		$pwd = I("pwd");
		$data = array();
		if (!$uid) {
			$data['status'] = "0";
			$data['info'] = "请登录后进行操作";
			echo json_encode($data);
			die;
		}


		if (!$pay_type) {
			$data['status'] = "0";
			$data['info'] = "请选择支付类型";
			echo json_encode($data);
			die;
		}

		if (!$order_no) {
			$data['status'] = "0";
			$data['info'] = "该订单不存在";
			echo json_encode($data);
			die;
		}

		//订单验证
		$order = M("order")->where(array("order_no" => $order_no, "uid" => $uid))->find();
		if (!$order) {
			$data['status'] = "0";
			$data['info'] = "您好像没有该订单哦";
			echo json_encode($data);
			die;
		}

		if ($order['status'] != 0) {
			$data['status'] = "0";
			$data['info'] = "该订单不是待支付状态，无法进行支付。";
			echo json_encode($data);
			die;
		}

		/*接受二级密码*/
		$twopad = think_ucenter_encrypt($pwd, C('PWD_KEY'));
		//验证二级密码
		$usertwopwd = M('member')->where(array('member_id' => $uid))->getField('twopass');
		if ($usertwopwd != $twopad) {
			$data['status'] = "0";
			$data['info'] = "二级密码不相同";
			echo json_encode($data);
			die;
		}
		if ($pay_type == 1) {//微信

		} else if ($pay_type == 2) {//支付宝
			$mes = array('status' => 1, 'info' => $pay_type);
			$this->ajaxReturn($mes);
		} else if ($pay_type == 3) {//积分
			$data = $this->jfpay($order['order_no'], $pay_type, $jifentypes);
			echo json_encode($data);
			die;
		} else if ($pay_type == 4) {
			$data = $this->jfpay($order['order_no'], $pay_type, $jifentypes);
			echo json_encode($data);
			die;
		}
	}

	public function test()
	{
		$order_no = '201710271452';
		$order_name = '聚宝优品';
		$order_price = 0.01;
		$this->apily($order_no, $order_name, $order_price);
	}

	public function apily()
	{
		header("Content-type: text/html; charset=utf-8");
		require_once './alipay/wappay/service/AlipayTradeService.php';
		require_once './alipay/wappay/buildermodel/AlipayTradeWapPayContentBuilder.php';
		require './alipay/config.php';
		$uid = session('user_auth.uid');
		$order_no = I('order_no');
		if (!empty($order_no) && trim($order_no) != "") {
			//商户订单号，商户网站订单系统中唯一订单号，必填
			$out_trade_no = $order_no;
			$order = M("order")->where(array("order_no" => $order_no, "uid" => $uid))->find();
			//订单名称，必填
			$subject = '聚宝优品';

			//付款金额，必填
			$total_amount = $order['buy_price'];

			//商品描述，可空
//			$body = $_POST['WIDbody'];

			//超时时间
			$timeout_express = "1m";

			$payRequestBuilder = new \AlipayTradeWapPayContentBuilder();
			$payRequestBuilder->setBody($body);
			$payRequestBuilder->setSubject($subject);
			$payRequestBuilder->setOutTradeNo($out_trade_no);
			$payRequestBuilder->setTotalAmount($total_amount);
			$payRequestBuilder->setTimeExpress($timeout_express);

			$payResponse = new \AlipayTradeService($config);
			$result = $payResponse->wapPay($payRequestBuilder, $config['return_url'], $config['notify_url']);

			return;
		}
	}


	protected
	function jfpay($order_no, $pay_type, $jifentypes)
	{
		$uid = session('user_auth.uid');
		$order = M("order")->where(array("order_no" => $order_no, "uid" => $uid))->find();
		//查询农联金额
		$farmlink_jifen = M("member_jifens")->where(array("member_id" => $uid))->getField("farmlink_jifen");

		//积分
		$xiaofei_jifen = M("member_jifens")->where(array("member_id" => $uid))->getField("xiaofei_jifen");

		//查询该订单需要消耗多少积分
		$order_xf_jifen = M("order")->where(array("order_no" => $order_no))->getField("xiaofei_jifen");

		$peisong = date('YmdHis') . rand(10000000, 99999999);
		//订单金额
		$pay_money = $order['buy_price'];
		if ($pay_type == 4) {//两种都使用
			$all_jifen = $farmlink_jifen + $xiaofei_jifen;
			if ($all_jifen < $order_xf_jifen) {
				$data['status'] = "0";
				$data['info'] = "积分不足，无法支付。";
				return $data;
			}
			//如果积分够就扣积分 不足差多少农联来补
			if ($xiaofei_jifen >= $order_xf_jifen) {
				M("member_jifens")->where(array("member_id" => $uid))->setDec("xiaofei_jifen", $order_xf_jifen);
				M("order")->where(array("order_no" => $order_no, "uid" => $uid))->setField("status", 1);
				$data['status'] = "1";
				$data['info'] = "支付成功";
				$this->updateOrderStatus($order_no, $pay_type, $order_xf_jifen, $peisong, $order['sanji_money']);

				return $data;
			} else {//差多少用农联来补充
				$cha_money = $pay_money - $xiaofei_jifen;
				M("member_jifens")->where(array("member_id" => $uid))->setDec("xiaofei_jifen", $xiaofei_jifen);
				M("member_jifens")->where(array("member_id" => $uid))->setDec("farmlink_jifen", $cha_money);
				//运单编号
				$this->updateOrderStatus($order_no, $pay_type, ($xiaofei_jifen + $cha_money), $peisong, $order['sanji_money']);
				$data['status'] = "1";
				$data['info'] = "支付成功";
				return $data;
			}
		}

		if ($pay_type == 3) {//只使用农联积分
			if ($farmlink_jifen < $pay_money) {
				$data['status'] = "0";
				$data['info'] = "农联积分不足，无法支付。";
				return $data;
			}
			//根据积分类型给用户加上对应赠送积分
			if ($jifentypes == 1) {
				$jifenani = 'chicken_jifen';
				$jifennums = $order['jifen_ji'];
			}
			if ($jifentypes == 2) {
				$jifenani = 'farm_jifen';
				$jifennums = $order['jifen_guoyuan'];
			}
			if ($jifentypes == 3) {
				$jifenani = 'fish_jifen';
				$jifennums = $order['jifen_yu'];
			}
			M("member_jifens")->where(array("member_id" => $uid))->setDec("farmlink_jifen", $pay_money);
			M("member_jifens")->where(array("member_id" => $uid))->setInc($jifenani, $jifennums);
			M("order")->where(array("order_no" => $order_no, "uid" => $uid))->setField("status", 1);
			$data['status'] = "1";
			$data['info'] = "支付成功";
			$this->updateOrderStatus($order_no, $pay_type, $order_xf_jifen, $peisong, $order['sanji_money']);

			return $data;
		}
	}

	protected
	function wxpay()
	{
		//参数效验
		$oid = I("oid");
		$uid = session('user_auth.uid');

		//获取订单信息


		//读取配置
		$wxConfig = C("wx");


		//①、获取用户openid
		$tools = new \JsApiPay();
		$openId = $tools->GetOpenid();

		//②、统一下单
		$input = new WxPayUnifiedOrder();
		$input->SetBody("test");
		$input->SetAttach("test");
		$input->SetOut_trade_no($wxConfig["MCHID"] . date("YmdHis") . rand(100, 999));
		$input->SetTotal_fee("1");
		$input->SetTime_start(date("YmdHis"));
		$input->SetTime_expire(date("YmdHis", time() + 600));
		$input->SetGoods_tag("test");
		$input->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
		$input->SetTrade_type("JSAPI");
		$input->SetOpenid($openId);
		$order = WxPayApi::unifiedOrder($input);
		$jsApiParameters = $tools->GetJsApiParameters($order);
		$this->jsApiParameters = $jsApiParameters;
		$this->display();

	}

	//回调
	public
	function notify()
	{
		//这里没有去做回调的判断，可以参考手机做一个判断。
		$xmlObj = simplexml_load_string($GLOBALS['HTTP_RAW_POST_DATA']); //解析回调数据
		$appid = $xmlObj->appid;//微信appid
		$mch_id = $xmlObj->mch_id;  //商户号
		$nonce_str = $xmlObj->nonce_str;//随机字符串
		$sign = $xmlObj->sign;//签名
		$result_code = $xmlObj->result_code;//业务结果
		$openid = $xmlObj->openid;//用户标识
		$is_subscribe = $xmlObj->is_subscribe;//是否关注公众帐号
		$trace_type = $xmlObj->trade_type;//交易类型，JSAPI,NATIVE,APP
		$bank_type = $xmlObj->bank_type;//付款银行，银行类型采用字符串类型的银行标识。
		$total_fee = $xmlObj->total_fee;//订单总金额，单位为分
		$fee_type = $xmlObj->fee_type;//货币类型，符合ISO4217的标准三位字母代码，默认为人民币：CNY。
		$transaction_id = $xmlObj->transaction_id;//微信支付订单号
		$out_trade_no = $xmlObj->out_trade_no;//商户订单号
		$attach = $xmlObj->attach;//商家数据包，原样返回
		$time_end = $xmlObj->time_end;//支付完成时间
		$cash_fee = $xmlObj->cash_fee;
		$return_code = $xmlObj->return_code;
		//下面开始你可以把回调的数据存入数据库，或者和你的支付前生成的订单进行对应了。
		//需要记住一点，就是最后在输出一个success.要不然微信会一直发送回调包的，只有需出了succcess微信才确认已接收到信息不会再发包.
	}

	public function payreturn()
	{
				/* *
		 * 功能：支付宝服务器异步通知页面
		 * 版本：2.0
		 * 修改日期：2016-11-01
		 * 说明：
		 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。

		 *************************页面功能说明*************************
		 * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
		 * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
		 * 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
		 */
		require './alipay/config.php';
		require_once './alipay/wappay/service/AlipayTradeService.php';

		$arr = $_POST;
		$alipaySevice = new AlipayTradeService($config);
		$alipaySevice->writeLog(var_export($_POST, true));
		$result = $alipaySevice->check($arr);

		/* 实际验证过程建议商户添加以下校验。
		1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if ($result) {//验证成功
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代

			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

			//获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表

			//商户订单号
			$out_trade_no = $_POST['out_trade_no'];

			//支付宝交易号

			$trade_no = $_POST['trade_no'];

			//交易状态
			$trade_status = $_POST['trade_status'];


			if ($_POST['trade_status'] == 'TRADE_FINISHED') {

				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//请务必判断请求时的total_amount与通知时获取的total_fee为一致的
				//如果有做过处理，不执行商户的业务程序

				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			} else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//请务必判断请求时的total_amount与通知时获取的total_fee为一致的
				//如果有做过处理，不执行商户的业务程序
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
			}
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			$orderinfo = M('order')->where(array('order_no'=>$out_trade_no))->find();
			$this->updateOrderStatus($out_trade_no,$orderinfo['pay_type'],$orderinfo['buy_price'],$trade_no,$orderinfo['sanji_money']);
			echo "success";        //请不要修改或删除

		} else {
			//验证失败
			echo "fail";    //请不要修改或删除
		}
	}


	protected
	function updateOrderStatus($order_no, $pay_type, $pay_money, $trade_no, $sanji_money)
	{
		$order = M("order")->where(array("order_no" => $order_no))->find();
		M("order")->where(array("order_no" => $order_no))->setField("status", 1);
		M("order")->where(array("order_no" => $order_no))->setField("pay_type", $pay_type);
		M("order")->where(array("order_no" => $order_no))->setField("pay_money", $pay_money);
		M("order")->where(array("order_no" => $order_no))->setField("trade_no", $trade_no);
		M("order")->where(array("order_no" => $order_no))->setField("pay_time", time());


		$uid = $order['uid'];//该订单用户ID
		M("member")->where(array("member_id" => $uid))->setInc('buy_moneys', $order['buy_price']);

		$member = M("member")->where(array("member_id" => $uid))->find();
		/*改变用户等级*/
		$member_grade = M('childcoop_configs')->where(array('id' => 1))->field('senior_member,higst_member')->find();
		if ($member['buy_moneys'] >= $member_grade['senior_member'] && $member['buy_moneys'] < $member_grade['senior_member']) {
			M("member")->where(array("member_id" => $uid))->setField('houtaijibie', 2);
		}

		if ($member['buy_moneys'] >= $member_grade['higst_member']) {
			M("member")->where(array("member_id" => $uid))->setField('houtaijibie', 3);
		}

		if ($member) {
			$one = M("member")->where(array("member_id" => $member['fid']))->field("member_id,fid,houtaijibie")->find();
			if ($one) {
				$two = M("member")->where(array("member_id" => $one['fid']))->field("member_id,fid,houtaijibie")->find();
				if ($two) {
					$three = M("member")->where(array("member_id" => $two['fid']))->field("member_id,fid,houtaijibie")->find();
				}
			}
		}

		$oneid = $one['member_id'];
		$twoid = $two['member_id'];
		$threeid = $three['member_id'];
		/*后台设置所选取三级分销表*/
		$onesanji_type = $one['houtaijibie'];
		$twosanji_type = $two['houtaijibie'];
		$threesanji_type = $three['houtaijibie'];


		if ($onesanji_type == 1) {
			$bili_det = M('sanjione')->where(array('id' => 1))->find();
		}
		if ($onesanji_type == 2) {
			$bili_det = M('sanjitwo')->where(array('id' => 1))->find();
		}
		if ($onesanji_type == 3) {
			$bili_det = M('sanjithree')->where(array('id' => 1))->find();
		}

		$list[0] = $oneid;
		$list[1] = $twoid;
		$list[2] = $threeid;

		/*级别不同采用的三级分销不同*/

		$get_money = 0;
		foreach ($list as $key => $value) {
			if ($key == 0) $get_money = $sanji_money * $bili_det['first'] * 100 / 100;
			if ($key == 1) $get_money = $sanji_money * $bili_det['second'] * 100 / 100;
			if ($key == 2) $get_money = $sanji_money * $bili_det['third'] * 100 / 100;

			M('member_jifens')->where(array('member_id' => $value))->setInc('yongjin', $get_money);
			$data["buy_id"] = $uid;
			$data["get_id"] = $value;
			$data["goods_id"] = $order['order_id'];
			$data["buy_time"] = time();
			$data["buy_grade"] = $key + 1;
			$data["money_type"] = 1;
			$data["money_nums"] = $get_money;
			M("fenxiaojiang")->add($data);
		}
		return 1;
	}

}