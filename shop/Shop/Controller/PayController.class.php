<?php

namespace Shop\Controller;

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

	public function ttyy()
	{
		echo '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>';
		echo '<script>alert("商城暂未开放"); window.history.back(-1); </script>';
	}

	public function index()
	{
		$all_oid = I("oid");
		$fromtype = I('formtype');
	//$all_money=explode('|', $all_oid);
	//$all_money_a=implode(',', $all_money);
  // $oid=trim($all_money_a,',');
/*echo $oid;die;*/
		$uid = session('userid');
		if (!$uid) error_alert("请登录后进行操作");
		if (!$all_oid) error_alert("缺少订单参数");
		$order_db = M("order");
		if ($fromtype == 99) {
			//购物车订单过来的
			$orderinfo = $order_db->where(array("order_id" => $all_oid))->select();
			if ($orderinfo['order_relation']) {
				$relations = ltrim(rtrim($orderinfo['order_relation'], "|"), "|");
				$orderids = explode("|", $relations);
				$order = $order_db->where(array("order_id" => array('in', $orderids)))->select();
			} else {
				$order = $orderinfo;
			}
		} else {
			//个人订单过来的
			$order = $order_db->where(array("order_id" => $all_oid))->select();
		}
		foreach ($order as $k => $v) {
			 //订单验证
			if ($v['status'] != 0) error_alert("该订单不是待支付状态，无法进行支付。");
		}
		
		//该订单是否有打款图
		//查询农联金额
		$farmlink_jifen = M("store")->where(array("uid" => $uid))->getField("cangku_num");
		$this->assign("farmlink_jifen", $farmlink_jifen);
		$this->assign("order", $order);
		$this->display();
	}

	public function pays()
	{
		$type = trim(I("type"));
		$oid = trim(I("oid"));
		$uid = session('userid');
		!$uid && error_alert("请登录后进行操作");
		$oid || error_alert("缺少订单参数");
		//订单验证
		header('Content-Type:text/html; charset=utf-8');
		$order = M("order")->where(array("order_id" => $oid, "uid" => $uid, "status" => 0))->find();
		if (!$order) {
			error_alert("该订单不存在或已支付");
		}
		if (!empty($order['order_proof'])) {
			error_alert("该订单已支付");
		}
		//查询是否是关联订单
		if ($order['order_relation']) {
			$relations = ltrim(rtrim($order['order_relation'], "|"), "|");
			$orderids = explode("|", $relations);
			$orderList = M('order')->where(array('order_id' => array("in", $orderids)))->select();
			$pay_money = M('order')->where(array('order_id' => array("in", $orderids)))->sum("buy_price");
		} else {
			$orderList = M('order')->where(array('order_id' => $oid))->select();
			$pay_money = M('order')->where(array('order_id' => $oid))->sum("buy_price");
		}
		if ($type == 1) {
			$payField = "shop_vpay";
		} else if ($type == 2) {
			$payField = "shop_weixin";
		} else if ($type == 3) {
			$payField = "shop_zhifubao";
		} else if ($type == 4) {
			$payField = "shop_zhifubao";
		} else {
			$payField = "shop_vpay";
		}
		$neednums = M('store')->where(array('uid' => $uid))->getField('cangku_num');
		if ($neednums < $pay_money) {
			error_alert('您的Vpay余额不足');
		} else {
		    //减少余额
            M('store')->startTrans();
			$res_dec = M('store')->where(array('uid' => $uid))->setDec('cangku_num', $pay_money);
			//查询当前积分
            $jifen = M('store')->where(array('uid' => $uid))->getField('fengmi_num');
			//增加金额80%的积分
            $yin_jifen = $pay_money * 0.8;
            $res_inc =  M('store')->where(array('uid'=>$uid))->setInc('fengmi_num',$yin_jifen);
            //  写入记录
            $traInfo = M('tranmoney');
            $data['pay_id'] = $uid;
            $data['get_nums'] = $yin_jifen;
            $data['get_time'] = time();
            $data['get_type'] = 24;
            $data['now_nums'] = $jifen;
            $data['now_nums_get'] = $jifen + $yin_jifen;
            $data['is_release'] = 1;
            $traInfo->add($data);
			// foreach ($orderList as $key => $value) {
			// 	if ($value['shangjia'] > 0) {
			// 		// M('store')->where(array('uid' => $value['shangjia']))->setInc('cangku_num', $value['buy_price']);
			// 	}
			// }
			if ($res_dec && $res_inc) {
			    M('order')->commit();
				M('order')->where(array('order_id' => $oid))->setField('status', 1);
				success_alert('支付成功', '/shop/home/index');
			}
		}
	}

	public function proofpay()
	{
		$oid = trim(I("orid"));
		$uid = session('userid');
		if (!$uid) error_alert("请登录后进行操作");
		if (!$oid) error_alert("缺少订单参数");
		//订单验证
		$order = M("order")->where(array("order_id" => $oid, "uid" => $uid, "status" => 0))->find();
		if (!$order) error_alert("该订单不存在或已支付");
		//该订单是否有打款图
		if (!empty($order['order_proof'])) {
			error_alert("该订单已支付");
		}
		$imginfo = $_FILES;
		$img = moreimg_uploads();
		if ($img['status'] == '0') {
			error_alert($img['res']);
		}
		$i = 0;
		foreach ($imginfo as $kname => $v) {
			if (!empty($v['name'])) {
				$data[$kname] = $img['res'][$i];
				$i++;
			}
		}
		$isAllOK = false;
		//查询是否是关联订单
		if ($order['order_relation']) {
			$relations = ltrim(rtrim($order['order_relation'], "|"), "|");
			$orderids = explode("|", $relations);
			foreach ($orderids as $key => $value) {
				$proof_key = "order_proof_" . $value;
				if ($data[$proof_key]) {
					M('order')->where(array('order_id' => $value))->setField("order_proof", $data[$proof_key]);
					$isAllOK = true;
				} else {
					$isAllOK = false;
					break;
				}
			}
		} else {
			$proof_key = "order_proof_" . $oid;
			if ($data[$proof_key]) {
				M('order')->where(array('order_id' => $oid))->setField("order_proof", $data[$proof_key]);
				$isAllOK = true;
			} else {
				$isAllOK = false;
			}
		}
		if ($isAllOK == true) {
			success_alert("提交成功", U('Member/mine'));
		} else {
			if ($orderids) {
				M('order')->where(array('order_id' => array("in", $orderids)))->setField("order_proof", "");
			} else {
				M('order')->where(array('order_id' => $oid))->setField("order_proof", "");
			}
			error_alert("提交失败");
		}
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
		$uid = session('userid');
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
	public function apily()
	{
		header("Content-type: text/html; charset=utf-8");
		require_once './alipay/wappay/service/AlipayTradeService.php';
		require_once './alipay/wappay/buildermodel/AlipayTradeWapPayContentBuilder.php';
		require './alipay/config.php';
		$uid = session('userid');
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
	protected function jfpay($order_no, $pay_type, $jifentypes)
	{
		$uid = session('userid');
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
	protected function wxpay()
	{
		//参数效验
		$oid = I("oid");
		$uid = session('userid');
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
	public function notify()
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
		$alipaySevice = new \AlipayTradeService($config);
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
			$orderinfo = M('order')->where(array('order_no' => $out_trade_no))->find();
			$this->updateOrderStatus($out_trade_no, $orderinfo['pay_type'], $orderinfo['buy_price'], $trade_no, $orderinfo['sanji_money']);
			echo "success";        //请不要修改或删除
		} else {
			//验证失败
			echo "fail";    //请不要修改或删除
		}
	}
	public function test()
	{
		$order_no = 'M2017110412003761759';
		$pay_type = 3;
		$pay_money = 1;
		$pay_type = 1;
		$sanji_money = 20;
		$this->updateOrderStatus($order_no, $pay_type, $pay_money, null, $sanji_money);
	}
	protected function updateOrderStatus($order_no, $pay_type, $pay_money, $trade_no, $sanji_money)
	{
		$order = M("order")->where(array("order_no" => $order_no))->find();
		if ($order['status'] != 0) {
			return;
		}
		//如果是一元夺宝订单减少开奖数量
		if ($order['is_duobao'] == 2) {
			$goodinfo = M('order_detail')->where(array('order_id' => $order['order_id']))->field('com_id,com_num')->find();
			$kaijiangnums = M('product_detail')->where(array('id' => $goodinfo['com_id']))->getField('kaijiang_nums');
			if ($kaijiangnums - $goodinfo['com_num'] > 0) {
				M('product_detail')->where(array('id' => $goodinfo['com_id']))->setDec('kaijiang_nums', $goodinfo['com_num']);
			}
			//开奖
			if ($kaijiangnums - $goodinfo['com_num'] > 0) {
				M('product_detail')->where(array('id' => $goodinfo['com_id']))->setDec('kaijiang_nums', $goodinfo['com_id']);
			}
			if ($kaijiangnums - $goodinfo['com_num'] > 0) {
				$sql = "SELECT sum(com_num)as total,uid  FROM `nc_order_detail` where com_id = " . $goodinfo['com_id'] . " and uid != ''  GROUP BY uid ORDER BY total desc limit 5";
				$ret = M('order_detail')->query($sql);
				$seluid = array_rand($ret, 1);
				$seluid = $ret[$seluid]['uid'];
				M('product_detail')->where(array('id' => $goodinfo['com_id']))->setField('seluid', $seluid);//商品详情表
				M('order')->where(array("order_no" => $order_no))->setField('seluid', $seluid);//商品详情表
			}
		}
		M("order")->where(array("order_no" => $order_no))->setField("status", 1);
		M("order")->where(array("order_no" => $order_no))->setField("pay_type", $pay_type);
		M("order")->where(array("order_no" => $order_no))->setField("pay_money", $pay_money);
		M("order")->where(array("order_no" => $order_no))->setField("trade_no", 1);
		M("order")->where(array("order_no" => $order_no))->setField("pay_time", time());
		$this->userAward($order['uid'], $pay_money);
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
	/**
	 * 用户奖金
	 * @param  [type] $uid   得到该奖金的用户ID
	 * @param  [type] $money 计算奖金的金额
	 * @return [type]        [description]
	 */
	protected function userAward($uid, $money)
	{
		//该用户是什么级别
		$member_tb = M("member");
		$member = $member_tb->where(array("member_id" => $uid))->field("member_id,fid,prov,city")->find();
		$smember = $member_tb->where(array("member_id" => $member['fid']))->field("member_id,is_dailishang,is_manager")->find();
		if ($smember) {
			$fid = $smember['member_id'];
			//推广员
			//推广员:0.5%的推广金 代理商:1%推广金 两者可兼得
			//市级代理
			//市级代理:享受该市所产生全部营业额 0.5%的代理服务费
			//大区负责人:享受其所推荐所有城市通过平台营业额 0.5%的管理服务费。
			//大区管理服务费:(100 万+150 万+50 万)*0.5%=15000 元 北京市代理服务费:100 万*0.5%=5000 元
			//商户推广金:15 万*1%=1500 元
			//消费推广金:10 万 0.5%=500 元 综合收入=大区管理服务费+北京市代理服务费+商户推广金+消费 推广金=15000+5000+1500+500=22000 元
			//推广金
			$tg_money = $money * 5 / 1000;
			$member_tb->where(array("member_id" => $fid))->setInc("tg_money", $tg_money);
			//上级用户是否是商家
			if ($smember['is_dailishang'] == 2) {
				//代理商
				$stg_money = $money * 1 / 100;
				$member_tb->where(array("member_id" => $fid))->setInc("tg_money", $stg_money);
				//当前用户订单城市是否属于该代理商代理的城市
				$user_prov = $member['prov'];
				$user_city = $member['city'];
				$s_user_prov = $smember['prov'];
				$s_user_city = $smember['city'];
				if ($user_prov == $s_user_prov && $user_city == $s_user_city) {
					$sj_money = $money * 5 / 1000;
					$member_tb->where(array("member_id" => $fid))->setInc("dl_money", $sj_money);
				}
			}
			if ($smember['is_dailishang'] == 1) {//大区负责人
				$user_prov = $member['prov'];
				$user_city = $member['city'];
				//查询上级代理城市列表
				$dailishang_list = $member_tb->where(array("fid" => $fid, "is_dailishang" => 2))->field("member_id,city,prov")->select();
				foreach ($dailishang_list as $key => $value) {
					if ($user_prov == $value['prov'] && $user_city == $value['city']) {
						$gl_money = $money * 5 / 1000;
						$member_tb->where(array("member_id" => $fid))->setInc("gl_money", $gl_money);
					}
				}
			}
		}
	}
}
