<?php

namespace SAdmin\Controller;
use SAdmin\Model\MemberModel;
//微信支付
use Common\Libs\Weixin_tx\ComPay;//红包与企业支付
use \Common\Libs\Weixin_tx\WechatAuth;//JSSDK 需要用到accessToken
use \Common\Libs\Weixin_tx\JSSDK;//JSSDK
class TixianController extends CommonController
{

	protected function _initialize()
	{
		$config =   S('DB_CONFIG_DATA');
		C($config);
		//基础配置(必须)
		define('APPID',C('tx_wxappid'));
		define('MCHID', C('tx_wxmchid'));
		define('KEY', C('tx_wxappkey'));
		define('APPSECRET',  C('tx_wxappsecret'));

		parent::_initialize();
		$this->breadcrumb1 = '提现管理';
		$this->breadcrumb2 = '提现订单';
	}

	//农场提现
	function tixian()
	{
		$status = I('status');
		$id = I('id');
		$mobile = I('mobile');
		if(!empty($mobile)){
			$id = M('member')->where(array('mobile'=>$mobile))->getField('id');
		}
		$this->breadcrumb1 = '提现管理';
		$this->breadcrumb2 = '提现订单';
		$nctx['tixian_type'] = 0;
		if(!empty($status)){
			$nctx['state'] = $status;
		}
		if(!empty($id)){
			$nctx['member_id'] = $id;
		}
		$member = M("tixian");
		$count = $member->where($nctx)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count, 25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $member->where($nctx)->order('time desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$m = M('member')->where(array('member_id' => $v['member_id']))->find();
			$list[$k]['uname'] = $m['uname'];
		}
		/*区分公排还是果园*/
		$tixiantype = 2;
		$this->assign('list', $list);// 赋值数据集
		$this->assign('page', $show);// 赋值分页输出
		$this->assign('status', $status);
		$this->assign('id', $id);
		$this->assign('mobile', $mobile);
		$this->display(); // 输出模板
	}

	/*提现订单处理*/
	public function OKti(){
		$id = I('id');
		$type = I('type');
		$tixianmsg = M('tixian')->where(array('id'=>$id))->find();
		$txtype = $tixianmsg['zhifu_type'];

		if($txtype == 1){
			$jifen_types = 'yongjin';
		}
		if($txtype == 2){
			$jifen_types = 'daili_yongjin';
		}
		if($txtype == 3){
			$jifen_types = 'farmlink_jifen';
		}
		if($txtype == 4){
			$jifen_types = 'chicken_jifen';
		}
		if($txtype == 5){
			$jifen_types = 'yu_ku';
		}
		if($txtype == 6){
			$jifen_types = 'farm_jifen';
		}


		if($type == 1){
			$res = M('tixian') -> where(array('id'=>$id))->setField('state',2);
			/*加上消费积分*/
			M('member_jifens')->where(array('member_id'=>$tixianmsg['member_id']))->setInc('xiaofei_jifen',$tixianmsg['give_xiaofei']);
		}else{
			$res = M('tixian') -> where(array('id'=>$id))->setField('state',3);
			M('member_jifens')->where(array('member_id'=>$tixianmsg['member_id']))->setInc($jifen_types,$tixianmsg['zong_rmb']);
		}
		if($res){
			S('DB_CONFIG_DATA',null);
			$this->success('保存成功！');
		}
	}

	public function Transfers()
	{
		$nzbill = M('jiaoyiorder');
		$this->breadcrumb1 = '提现管理';
		$this->breadcrumb2 = '转账订单';
		$mobile = I('mobile');
		if($mobile != ''){
			$getid = M('member')->where(array('phone'=>$mobile))->getField('member_id');
			$search1['jy_fromuid'] = $getid;
			$search1['jy_touid'] = $getid;
			$search1['_logic'] = 'or';

			$search['_complex'] = $search1;
			$search['jy_type'] = array('elt','4');
		}

		$status = I('status');
		if($status != ''){
			if($status != 5){
				$search['all_state'] = $status;
			}else{
				$search['jy_status'] = $status;
			}
		}
		$jy_type = I('sptype');
		if($jy_type != ''){
			$search['jy_type'] = $jy_type;
		}else{
			$search['jy_type'] = array('elt','4');
		}


		$star = I('star');
		$endt = I('endt');

		$startime = strtotime($star);
		$endtime = strtotime($endt);

		if($startime != '' || $endtime !=''){
			$search['date_added'] =  array('between',array($startime,$endtime));
		}


		$count = $nzbill->where($search)->count();
		$Page  = new \Think\Page($count,20);
		$show  = $Page->show();
		$list = $nzbill->where($search)->order('jy_id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$earns = 0;
		foreach ($list as $v){
			if($v['jy_mun'] >0 ){
				if($v['all_state']==2){
					$earmoneys = $v['jy_mun'];
					$earns +=$earmoneys;
				}
			}
		}

		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('star',$star);
		$this->assign('endt',$endt);
		$this->assign('status',$status);
		$this->assign('jy_type',$jy_type);
		$this->assign('earns',$earns);
		$this->display();
	}

	public function deltrans(){
		$id = I('id');
		$type = I('type');
		if($type == ''){
			$res = M('jiaoyiorder') -> where(array('jy_id'=>$id))->delete();
			if($res){
				S('DB_CONFIG_DATA',null);
				$this->success('删除成功！');
			}
		}
		$jy_msg = M('jiaoyiorder') -> where(array('jy_id'=>$id))->find();
		$zztype = $jy_msg['jy_type'];//转账积分种类
		/*转账类型*/
		if ($zztype == 1) {//鸡场
			$str = "chicken_jifen";
		} else if ($zztype == 2) {//鱼场
			$str = "fish_jifen";
		} else if ($zztype == 3) {//果园
			$str = "farm_jifen";
		} else {
			$str = "farmlink_jifen";
		}


		if($type == 1){
			$allnums = $jy_msg['jy_mun'] + $jy_msg['yj_jiangjin'];//买家可得总量
			/*给买家加钱*/
			M('member_jifens')->where(array('member_id'=>$jy_msg['jy_touid']))->setInc($str,$allnums);
			/*订单已完成*/
			$res = M('jiaoyiorder') -> where(array('jy_id'=>$id))->setField(array('jy_status'=>3,'all_state'=>2));
			if($res){
				S('DB_CONFIG_DATA',null);
				$this->success('通过成功！');
			}
		}

		if($type == 2){
			$allnums = $jy_msg['jy_mun'] + $jy_msg['jy_fee'];//卖家总归还数量
			/*给卖家加钱*/
			M('member_jifens')->where(array('member_id'=>$jy_msg['jy_fromuid']))->setInc($str,$allnums);
			/*订单已取消*/
			$res = M('jiaoyiorder') -> where(array('jy_id'=>$id))->setField(array('jy_status'=>2,'all_state'=>0));
			if($res){
				S('DB_CONFIG_DATA',null);
				$this->success('拒绝成功！');
			}
		}
	}

	public function show_order()
	{

		$this->crumbs = '订单详情';

		$model = new OrderModel();

		$this->data = $model->order_info(I('id'));

		$id = I('id');
		$order_data = M("order_data"); // 实例化order_data对象
		// 查找status值为1name值为think的用户数据
		$odata = $order_data->where("oid='$id'")->select();
		foreach ($odata as $v => $k) {
			$od[$v]['text'] = think_ucenter_decrypt($odata[$v]['text'], C('KM_KEY'));
		}

		$this->assign("odata", $od);
		$this->display('show');
	}



	//--------------------------旧系统版块
	/*公排提现*/
	function dogpwiths()
	{
		$this->breadcrumb1 = '财务';
		$this->breadcrumb2 = '工排提现';
		$nctx['tixian_type'] = 1;
		$member = M("tixian");
		$count = $member->where($nctx)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count, 25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $member->where($nctx)->order('time desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$m = M('member')->where(array('member_id' => $v['member_id']))->find();
			$list[$k]['uname'] = $m['uname'];
		}
		/*区分公排还是果园*/
		$tixiantype = 1;
		$this->assign('list', $list);// 赋值数据集
		$this->assign('page', $show);// 赋值分页输出
		$this->assign();
		$this->display('tixian'); // 输出模板
	}



	//支付宝打款提现处理
	private function alipay($id)
	{

		Vendor('Alipay.AlipayFundTransToaccountTransferRequest', '', '.class.php');
		Vendor('Alipay.AopClient', '', '.class.php');
		$aop = new \AopClient();
		$aop->appId = C('appid');
		$aop->rsaPrivateKey = C('PrivateKey');//私钥
		$aop->alipayrsaPublicKey = C('PublicKey');//公钥
		$aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
		$aop->apiVersion = '1.0';
		$aop->signType = 'RSA';
		$aop->postCharset = 'utf-8';
		$aop->format = 'json';
		$request = new \AlipayFundTransToaccountTransferRequest ();


		//查询订单详情
		$dd = M('tixian')->where(array('order' => $id))->find();

		if ($dd['state'] == 1) {
			exit('已经结算');
		}

		$zfb = $dd['pay'];//支付宝
		$amount = $dd['tx_rmb'];//金额

		$request->setBizContent("{" .
			"\"out_biz_no\":\"{$id}\"," .
			"\"payee_type\":\"ALIPAY_LOGONID\"," .
			"\"payer_show_name\":\"利民荣邦提现\"," .
			"\"payee_account\":\"{$zfb}\"," .
			"\"amount\":\"{$amount}\"," .
			"\"remark\":\"提现\"" .
			"}");
		$result = $aop->execute($request);


		$hao = $this->object2array($result);
		$good = $this->object2array($hao['alipay_fund_trans_toaccount_transfer_response']);

		if ($good['code'] == 10000) {
			//改变提现状态
			//$a = M('tixian')->where(array('id' => $id))->save(array('state' => 1));

		} else {
			return $good;
			//print_r($good);
		}

	}

	//微信打款
	private function wx_tx($id){
		$dd = M('tixian')->where(array('order'=>$id))->find();
	 	if($dd['state']==1){
			exit('已付款');
		}
		//print_r($dd);exit;
		$data = $this->ComPay($dd['pay'],$dd['tx_rmb']);
		//返回错误
		if($data){
			return $data;
		}


	}

	//微信企业付款
	private function ComPay($openid,$value){
		$rb = new ComPay();
		$fee = $value*100;
		$body = '企业支付';
		$rb->setOpenid($openid);
		$rb->setAmount($fee);
		$rb->setMchid(MCHID);
		$rb->setApiKey(KEY);
		$rb->setMchAppid(APPID);
		$rb->setDesc($body);
		$res =  $rb->ComPay();
		//print_r($rb->error());
		if(empty($res)){
			return $rb->error();
		}
		//$res ? $this->success('发送成功') : $this->error($rb->error());
		//die();

	}







	function object2array($object)
	{
		if (is_object($object)) {
			foreach ($object as $key => $value) {
				$array[$key] = $value;
			}
		} else {
			$array = $object;
		}
		return $array;
	}


	//获取上级 - 感恩提现奖
	public function getx($uid, $rmb)
	{
		$userinfo = M('member');
		$pid = $userinfo->where(array('id' => $uid))->getField('path_id');
		/*拆出来path路径*/
		$pid = rtrim($pid, ',');
		$prev_path = explode(',', $pid);
		rsort($prev_path);
		unset($prev_path[0]);
		unset($prev_path[count($prev_path)]);
		$nums = count($prev_path);
		if ($nums >= 9) {
			for ($nums; $nums > 9; $nums--) {
				unset($prev_path[$nums]);
			}
		}
		/*九级分销*/
		foreach ($prev_path as $k => $v) {
			switch ($k) {
				case 1:
					$snum = C('x_one');
					break;
				case 2:
					$snum = C('x_two');
					break;
				case 3:
					$snum = C('x_three');
					break;
				case 4:
					$snum = C('x_four');
					break;
				case 5:
					$snum = C('x_five');
					break;
				case 6:
					$snum = C('x_six');
					break;
				case 7:
					$snum = C('x_seven');
					break;
				case 8:
					$snum = C('x_eight');
					break;
				case 9:
					$snum = C('x_nine');
					break;
			}
			/*找到他们的直推人数*/
			$directnums = $userinfo->where(array('pid' => $v))->count(1);
			$levelsetings = M('level_nc')->order('id asc')->select();
			foreach ($levelsetings as $layers) {
				if ($directnums >= $layers['direct_nums']) {
					$cantake_layer = $layers['can_takes'];
				}
			}


			/*上级是否参与购买*/
			$previspw = $userinfo->where(array('id' => $v))->getField('lv');
			$info = array('userid' => $v, 'money' => $rmb * $snum, 'dj' => $k, 'ta_uid' => $uid, 'type' => 3);
			if($cantake_layer >= $k) {
				if ($previspw > 0) {
					get_money($info);
				}
			}
		}

	}


	//获取上级 - 关爱奖
	public function san($uid, $money)
	{


		$arra = array(C('g_one'), C('g_two'), C('g_three'));


		//一代好友
		$one = M('member')->where(array('pid' => $uid))->Field('id')->select();

		//二代好友
		foreach ($one as $k => $v) {
			$two = M('member')->where(array('pid' => $v['id']))->Field('id')->select();
		}

		//三代好友
		foreach ($two as $k => $v) {
			$three = M('member')->where(array('pid' => $v['id']))->Field('id')->select();
		}
		//$one 找到一级   $two 找到二级  $three 找到三级
		//数组转字符串  付给一个数组
		foreach ($one as $k => $v) {
			$new_one[] = $v['id'];

		}
		foreach ($two as $k => $v) {
			$new_two[] = $v['id'];

		}
		foreach ($three as $k => $v) {
			$new_three[] = $v['id'];

		}
		if (!empty($one)) {
			$retueninfo[] = implode(',', $new_one);

		}
		if (!empty($two)) {
			$retueninfo[] = implode(',', $new_two);

		}
		if (!empty($three)) {
			$retueninfo[] = implode(',', $new_three);

		}
		$stock = M('stock');
		foreach ($retueninfo as $k => $v) {
			$newmoney = $arra[$k] * $money;
			$munoo = explode(',', $v);
			$mun = count($munoo);
			$geimoney = $newmoney / $mun;
			$stock->where(array('uid' => array('in', $v)))->SetInc('acer', $geimoney);
			foreach ($munoo as $kk => $kkk) {
				//添加到数据库日志
				$add['me_uid'] = $kkk;
				$add['ta_uid'] = $uid;
				$add['add_time'] = time();
				$add['dj'] = $k + 1;
				$add['rmb'] = $geimoney;
				$add['type'] = 4;
				M('fenrun')->add($add);
			}
		}


	}

	/*工排区提现*/
	private function gptixian($tx)
	{
		$usetable = M('member');
		$jifen = $tx['zong_rmb'] - $tx['tx_rmb'];
		$jf_add = $usetable->where(array('id' => $tx['member_id']))->setInc('member_jifen', $jifen);
		M('tixian')->where(array('id' => $tx['id']))->setField('state', 1);
	}
}

?>