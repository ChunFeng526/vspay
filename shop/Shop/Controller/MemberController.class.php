<?php



namespace Shop\Controller;



use Think\Controller;



class MemberController extends CommonController

{

	//所有订单

	public function allorder()

	{

		$uid = session('userid');



		$s = I("s");

		$findwhere['uid'] = $uid;

		$findwhere['is_show'] = 1;

		if ($s >= 0 && $s < 4 ) {

			$findwhere['status'] = $s;

		}

		
		$orderList = M("order")->where($findwhere)->order('order_id desc')->select();

		





		foreach ($orderList as $key => $order) {

			$deid = $order["order_id"];

			$orderList[$key]["detail"] = M("order_detail")->where(array("order_id" => $deid))->select();

		}
		
		$this->assign("s", $s);

		$this->assign("orderList", $orderList);

		$this->display();

	}



	public function collection()

	{

		$uid = session('user_auth.uid');

		if (!$uid) $this->error("请登录后进行操作。", "/");

		$collectList = M("collect")->where(array('uid' => $uid))->select();

		foreach ($collectList as $key => $value) {

			$collectList[$key]["name"] = M("product_detail")->where(array("id" => $value['proid']))->getField("name");

			$collectList[$key]["price"] = M("product_detail")->where(array("id" => $value['proid']))->getField("price");

			$collectList[$key]["pic"] = M("product_detail")->where(array("id" => $value['proid']))->getField("pic");

		}





		$this->assign("collectList", $collectList);

		$this->display("Dianpu/shangjia");

	}



	public function myAward(){

		$uid = session('user_auth.uid');

		$store = M("user")->where(array("member_id"=>$uid))->field("dl_money,tg_money,gl_money")->find();





		$this->assign("store",$store);

		$this->display();

	}





	public function collectionbj()

	{

		$this->display();

	}



	public function fruit()

	{

		$uid = session('user_auth.uid');

		if (!$uid) $this->error("请登录后进行操作");



		$userList = $this->getThreeUser($uid);

		//查询上级用户信息

		$fid = M("user")->where(array("member_id" => $uid))->getField("fid");

		$upUser = M("user")->where(array("member_id" => $fid))->field("member_id,uname,avatar")->find();

		$oneList = $userList[0];

		$twoList = $userList[1];

		$threeList = $userList[2];



		$levelidList = array_merge($oneList, $twoList, $threeList);

		array_push($levelidList, $fid);

		$fourList = array();

		//查找当前用户的好友

		$friendList = M("friend")->where(array("u_id" => $uid))->select();



		foreach ($friendList as $key => $value) {

			if (!in_array($value['f_id'], $levelidList)) {

				array_push($fourList, $value['f_id']);

			}

		}





		$list = array();

		$list[0][0] = $upUser;

		foreach ($oneList as $key => $value) {

			$list[1][$key] = M("user")->where(array("member_id" => $value))->field("member_id,uname,avatar")->find();

		}





		foreach ($twoList as $key => $value) {

			$list[2][$key] = M("user")->where(array("member_id" => $value))->field("member_id,uname,avatar")->find();

		}



		foreach ($threeList as $key => $value) {

			$list[3][$key] = M("user")->where(array("member_id" => $value))->field("member_id,uname,avatar")->find();

		}



		foreach ($fourList as $key => $value) {

			$list[4][$key] = M("user")->where(array("member_id" => $value))->field("member_id,uname,avatar")->find();

		}





		$this->assign("fruitList", $list);

		$this->display();

	}



	public function mine()

	{

		$uid = session('userid');

		//查询收藏数量

		$scCount = M("collect")->where(array("uid" => $uid))->count();

		$member = M("verify_list")->where(array("uid" => $uid))->find();

		/*账户积分*/



		

		$uinfo = M('user')->where(array('userid' => $uid))->find();



		$memberjifens = M('store')->where(array('uid' => $uid,'type'=>2))->find();

		$this->assign('uinfo', $uinfo);

		$this->assign("scCount", $scCount);

		$this->assign("member", $member);

		$this->assign("memberjifens", $memberjifens);



		$this->display();

	}



	public function stics()

	{

		$orderid = I('order_id');

		$orderinfo = M('order')->where(array('order_id'=>$orderid))->select();

		$this->assign('detls',$orderinfo);

		$this->display();

	}



	//商品评价

	public function Docontent(){

		$content = I('content');

		$id = I('id');

		if($content != ''){

			$res = M('product_detail')->where(array('id'=>$id))->setField('producs_pingjia',$content);

			if($res){

				$mes = array('status'=>1,'info'=>'评价成功');

				$this->ajaxReturn($mes);

			}else{

				$mes = array('status'=>2,'info'=>'评价失败');

				$this->ajaxReturn($mes);

			}

		}

	}



	public function address()

	{

		$type = I('type');

		$this->assign('type', $type);

		$this->display();

	}



	/*添加收货地址*/

	public function Addaddress()

	{

        $uid = session('userid');

		$uanme = I('uname');

		$province = I('province');

		$phone = I('phone');

		$city = I('city');

		$district = I('district');

		$address = I('detailadd');

		$detailadd = I('detailadd');

		$ismoren = I('ismoren');

		$address_id = I('address_id');



		if ($uanme == '') {

			$mes = array('status' => 2, 'info' => '请填写用户名');

			$this->ajaxReturn($mes);

		}

		if ($province == '--请选择省份--') {

			$mes = array('status' => 2, 'info' => '请选择省份');

			$this->ajaxReturn($mes);

		}

		if ($city == '') {

			$mes = array('status' => 2, 'info' => '请选择市辖区');

			$this->ajaxReturn($mes);

		}

		if ($district == '市辖区' || $district == '') {

			$mes = array('status' => 2, 'info' => '请选择市辖区');

			$this->ajaxReturn($mes);

		}

		if ($address == '') {

			$mes = array('status' => 2, 'info' => '请选择具体位置');

			$this->ajaxReturn($mes);

		}

		if ($ismoren == 1 && $address_id == '') {

			$Info = '新增默认地址成功';

			$data['zt_'] = $ismoren;

			$addid = M('address')->where(array('member_id' => $uid, 'zt_' => 1))->getField('address_id');

			M('address')->where(array('address_id' => $addid))->setField('zt_', 0);

		}

		if ($ismoren == 1 && $address_id != '') {

			$Info = '修改默认地址成功';

			$data['zt_'] = $ismoren;

			$addid = M('address')->where(array('member_id' => $uid, 'zt_' => 1))->getField('address_id');

			M('address')->where(array('address_id' => $addid))->setField('zt_', 0);

		}

		if ($ismoren == 0 && $address_id != '') {

			$Info = '修改地址成功';

			$data['zt_'] = $ismoren;

			$addid = M('address')->where(array('member_id' => $uid, 'zt_' => 0))->getField('address_id');

			M('address')->where(array('address_id' => $addid))->setField('zt_', 0);

		}





		$data['member_id'] = $uid;

		$data['name'] = $uanme;

		$data['telephone'] = $phone;

		$data['province_id'] = $province;

		$data['city_id'] = $city;

		$data['country_id'] = $district;

		$data['address'] = $address;

		if ($address_id == '') {

			$res = M('address')->add($data);

		} else {

			$res = M('address')->where(array('address_id' => $address_id))->save($data);

		}



		if ($res) {

			$mes = array('status' => 1, 'info' => $Info, 'webhref' => 'member/addresslist');

			$this->ajaxReturn($mes);

		} else {



			$mes = array('status' => 2, 'info' => '新增收货地址失败');

			$this->ajaxReturn($mes);

		}



	}



	//删除收货地址

	public function deleadd()

	{

		$id = I('id');

		$res = M('address')->where(array('address_id' => $id))->delete();

		if ($res) {

			$this->redirect('member/addresslist');

		}

	}



	public function addresslist()

	{

		$uid = session('userid');

		$addtype = I('type');

		if (!$uid) $this->error("请登录后进行操作。", "/");

		$addressList = M("address")->where(array("member_id" => $uid))->select();

		$this->assign("addressList", $addressList);

		$this->assign("addtype", $addtype);

		$this->display();

	}



	/*个人资料*/

	public function personal()

	{

		$uid = session('user_auth.uid');

		$minemsg = M('member')->where(array('member_id' => $uid))->find();

		$this->assign('minemsg', $minemsg);

		$this->display();

	}



	public function Savepersonal()

	{

		$uid = session('user_auth.uid');

		$data['uname'] = I('uname');

		$data['api_pay'] = I('zfb');

		$data['bankname'] = I('bankname');

		$data['banknumber'] = I('banknumber');

		$res = M('member')->where(array('member_id' => $uid))->save($data);

		if ($res) {

			$mes = array('status' => 1, 'info' => '个人信息修改成功');

			$this->ajaxReturn($mes);

		} else {

			$mes = array('status' => 2, 'info' => '个人信息修改失败');

			$this->ajaxReturn($mes);

		}

	}



	/*修改聚点收款码*/

	public function savecollection()

	{

		$uid = session('user_auth.uid');

		$res = img_uploading();

		$photo = $res['res'];

		$users = M('member');

		if ($res['stats'] == 'error') {

			$errorcontent = $res['error'];

			echo "<meta charset=\"utf-8\"/> <script>alert(" . $errorcontent . ")</script>";

			echo '<script>javascript:history.back(-1);</script>';

			return;

		} else {

			$users->where('member_id=' . $uid)->setField('judian_pic', $photo);

			echo '<script>javascript:history.go(-1);location.reload()</script>';

			return;

		}

	}



	/*修改收货地址*/

	public function Dditadd()

	{

		$id = I('id');

		$info = M('address')->where(array('address_id' => $id))->find();

		$this->assign('info', $info);

		$this->display('address');

	}



	//获取当前用户的三级用户有哪些

	protected function getThreeUser($userid)

	{

		$oneUserList = array();

		$twoUserList = array();

		$threeUserList = array();



		//查出该用户的上级

		$oneList = M("user")->where(array("fid" => $userid))->field("member_id")->select();//该用户的一级ID列表

		foreach ($oneList as $key => $one) {

			$oneid = $one['member_id']; //一级用户ID

			array_push($oneUserList, $oneid);

			$twoList = M("user")->where(array("fid" => $oneid))->field("member_id")->select();

			foreach ($twoList as $kk => $two) {

				$twoid = $two['member_id']; //二级用户ID

				array_push($twoUserList, $twoid);

				$threeList = M("user")->where(array("fid" => $twoid))->field("member_id")->select();

				foreach ($threeList as $k => $three) {

					$threeid = $three['member_id'];    //三级用户ID

					array_push($threeUserList, $threeid);

				}



			}



		}

		$list[0] = $oneUserList;

		$list[1] = $twoUserList;

		$list[2] = $threeUserList;





		return $list;

	}





	//推广激活

	public function reg()

	{

		$uid = I("id");

		//查询是否有该用户

		$member = M("user")->where(array("member_id" => $uid))->find();

		if (!$member) $this->error("注册地址有误。");



		$this->assign("tjid", $member['member_id']);

		$this->assign("tjph", $member['phone']);

		$this->display();



	}





	public function reg_action()

	{

		$username = I('username');

		$mobile = trim(I('mobile'));

		$password = trim(I('password'));

		$conpassword = trim(I('conpassword'));



		if (!$username) {

			$this->error('姓名不能为空');

		}



		if (!$mobile) {

			$this->error('手机号码不能为空');

		}



		$mobile_ser = M('member')->where(array('phone' => $mobile))->find();

		if ($mobile_ser) {

			$this->error('手机号码已存在');

		}



		if ($password != $conpassword) {

			$this->error('两次密码输入不同');

		}



		if (checkLength($password, 6, 20) == false) {

			$this->error('密码6~20个字符不能为特殊符号');

		}





		//增加好友

		$add['uname'] = $username;

		$add['phone'] = $mobile;

		$add['fid'] = $uid;

		$add['email'] = $email;

		$add['pwd'] = think_ucenter_encrypt($password, C('PWD_KEY'));

		$add['twopass'] = 'MDAwMDAwMDAwMH+getyzm32s';

		$add['status'] = 1;

		$data['create_time'] = time();

		$data['last_login_ip'] = get_client_ip();

		$u = M('member')->add($add);

		/*加风车*/

		// $this->fengchecount($u);

		//    /*加人气值*/

		//    $this->renqicount($u);

		//    /*加管家*/

		// $this->Expert($u);

		/*判断用户等级-直推人数和团队人数-*/

		//    $this->Calmgrade();





		$userinfo = M('member')->where(array('member_id' => $uid))->Field('path_id,lenth_layer')->find();

		$dataaa['path_id'] = $userinfo['path_id'] . $u . ',';

		$dataaa['lenth_layer'] = $userinfo['lenth_layer'] + 1;



		$res_dosave = M('member')->where(array('member_id' => $u))->save($dataaa);

		if ($res_dosave) {

			$money['chicken_jifen'] = 0;

			$money['fish_jifen'] = 0;

			$money['farm_jifen'] = 0;

			$money['farmlink_jifen'] = 0;

			$money['renqicount'] = 1;

			$money['member_id'] = $u;

			M('member_jifens')->add($money);

			$mes = array('status' => '1', 'info' => '添加好友成功');

			$this->ajaxReturn($mes);

		} else {

			$mes = array('status' => '1', 'info' => '添加好友失败');

			$this->ajaxReturn($mes);

		}



	}



	public function Tixian()

	{

		$uid = session('user_auth.uid');

		$jifeninfo = M('member_jifens')->where(array('member_id' => $uid))->find();

		$this->assign('jifeninfo', $jifeninfo);

		$this->display();

	}



	/*个人提现记录*/

	public function Tixiandecors()

	{

		$uid = session('user_auth.uid');

		$nctx['member_id'] = $uid;

		$member = M("tixian");

		$count = $member->where($nctx)->count();// 查询满足要求的总记录数

		$Page = new \Think\Page($count, 2);// 实例化分页类 传入总记录数和每页显示的记录数(25)

		$show = $Page->webshow();// 分页显示输出

		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性

		$list = $member->where($nctx)->order('time desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();



		foreach ($list as $k => $v) {

			$m = M('member')->where(array('member_id' => $v['member_id']))->find();

			$list[$k]['uname'] = $m['uname'];

		}



		$this->assign('list', $list);// 赋值数据集

		$this->assign('page', $show);// 赋值分页输出

		$this->assign();

		$this->display(); // 输出模板

	}



	/*取消提现*/

	public function canceltx()

	{

		$uid = session('user_auth.uid');

		$id = I('id');

		$type = I('type');

		$tixianmsg = M('tixian')->where(array('id' => $id, 'member_id' => $uid))->find();

		if ($tixianmsg != '') {

			$txtype = $tixianmsg['zhifu_type'];

			if ($txtype == 1) {

				$jifen_types = 'yongjin';

			}

			if ($txtype == 2) {

				$jifen_types = 'daili_yongjin';

			}

			if ($txtype == 3) {

				$jifen_types = 'farmlink_jifen';

			}

			if ($txtype == 4) {

				$jifen_types = 'chicken_jifen';

			}

			if ($txtype == 5) {

				$jifen_types = 'yu_ku';

			}

			if ($txtype == 6) {

				$jifen_types = 'farm_jifen';

			}



			$tixstatus = M('tixian')->where(array('id' => $id, 'member_id' => $uid))->getField('state');

			if($tixstatus == 1){

				$res_doadd = M('member_jifens')->where(array('member_id' => $uid))->setInc($jifen_types, $tixianmsg['zong_rmb']);

				$res = M('tixian')->where(array('id' => $id))->setField('state', 4);

				if ($res) {

					$mes = array('status'=>1,'info'=>'撤销提现成功');

					$this->ajaxReturn($mes);

				}

			}else{

				$mes = array('status'=>2,'info'=>'撤销提现失败');

				$this->ajaxReturn($mes);

			}

		}else{

			$mes = array('status'=>2,'info'=>'撤销提现失败');

			$this->ajaxReturn($mes);

		}

	}





	/*提现详情页*/

	public function Dotixian()

	{

		$uid = session('user_auth.uid');

		$type = I('type');

		if ($type == 1) {

			$jifentype = 'yongjin';

		}

		if ($type == 2) {

			$jifentype = 'daili_yongjin';

		}

		if ($type == 3) {

			$jifentype = 'farmlink_jifen';

		}

		if ($type == 4) {

			$jifentype = 'chicken_jifen';

		}

		if ($type == 5) {

			$jifentype = 'yu_ku';

		}

		if ($type == 6) {

			$jifentype = 'farm_jifen';

		}



		$configs = $this->Withdrawconfigs();

		$jifen_nums = M('member_jifens')->where(array('member_id' => $uid))->getField($jifentype);

		$this->assign('jifen_nums', $jifen_nums);

		$this->assign('type', $type);

		$this->assign('configs', $configs);

		$this->display();

	}



	/*执行提现操作*/

	public function Withdraw()

	{

		$uid = session('user_auth.uid');

		$txtype = I('txtype');

		$txnums = I('txnums');

		$txmode = I('txmode');



		$withconfigs = $this->Withdrawconfigs();//提现配置





		/*个人信息*/

		$umsg = M('member')->where(array('member_id' => $uid))->field('wx_name,api_pay,banknumber,judian_pic')->find();

		if ($txmode == 1) {

			if ($umsg['wx_name'] == '') {

				$mes = array('status' => 2, 'info' => '提现失败,请在个人中心绑定微信账号');

				$this->ajaxReturn($mes);

			}

		}

		if ($txmode == 2) {

			if ($umsg['api_pay'] == '') {

				$mes = array('status' => 2, 'info' => '提现失败,请在个人中心绑定支付宝账号');

				$this->ajaxReturn($mes);

			}

		}

		if ($txmode == 3) {

			if ($umsg['banknumber'] == '') {

				$mes = array('status' => 2, 'info' => '提现失败,请在个人中心绑定银行卡信息');

				$this->ajaxReturn($mes);

			}

		}



		if ($txmode == 4) {

			if ($umsg['judian_pic'] == '') {

				$mes = array('status' => 2, 'info' => '提现失败,请在个人中心绑定聚点收款二维码信息');

				$this->ajaxReturn($mes);

			}

		}



		/*我的积分*/

		if ($txtype == 1) {

			$jifen_types = 'yongjin';

		}

		if ($txtype == 2) {

			$jifen_types = 'daili_yongjin';

		}

		if ($txtype == 3) {

			$jifen_types = 'farmlink_jifen';

		}

		if ($txtype == 4) {

			$jifen_types = 'chicken_jifen';



			$jifen_xiaofei = $txnums * $withconfigs['ji_tixian_xiaofe'] + 0; //消费积分

			$jifen_shouxu = $txnums * $withconfigs['ji_tixian_shouxu'] + 0; //提现手续费

			$Surplus = $txnums - $jifen_xiaofei - $jifen_shouxu;

		}

		if ($txtype == 5) {

			$jifen_types = 'yu_ku';



			$jifen_xiaofei = $txnums * $withconfigs['yu_tixian_xiaofe'] + 0; //消费积分

			$jifen_shouxu = $txnums * $withconfigs['yu_tixian_shouxu'] + 0; //提现手续费

			$Surplus = $txnums - $jifen_xiaofei - $jifen_shouxu;

		}

		if ($txtype == 6) {

			$jifen_types = 'farm_jifen';



			$jifen_xiaofei = $txnums * $withconfigs['guo_tixian_xiaofe'] + 0; //消费积分

			$jifen_shouxu = $txnums * $withconfigs['guo_tixian_shouxu'] + 0; //提现手续费

			$Surplus = $txnums - $jifen_xiaofei - $jifen_shouxu;

		}



		$mine_jiefn = M('member_jifens')->where(array('member_id' => $uid))->getField($jifen_types);

		if ($txnums <= 0) {

			$mes = array('status' => 2, 'info' => '提现失败,请输入正确数量');

			$this->ajaxReturn($mes);

		}



		if ($mine_jiefn < $txnums) {

			$mes = array('status' => 2, 'info' => '提现失败,您暂未拥有这么多积分');

			$this->ajaxReturn($mes);

		}



		if ($txnums < $withconfigs['tixian_start']) {

			$mes = array('status' => 2, 'info' => '提现失败,最低起提积分是' . $withconfigs['tixian_start'] . '');

			$this->ajaxReturn($mes);

		}



		if ($txnums % $withconfigs['tixian_beishu'] != 0) {

			$mes = array('status' => 2, 'info' => '提现失败,您只能提现' . $withconfigs['tixian_beishu'] . '的倍数');

			$this->ajaxReturn($mes);

		}



		if ($txtype <= 3) {

			$jifen_xiaofei = $txnums * $withconfigs['tixian_xiaofei_yj'] + 0; //消费积分

			$jifen_shouxu = $txnums * $withconfigs['tixian_shouxu_yj'] + 0; //提现手续费

			$Surplus = $txnums - $jifen_xiaofei - $jifen_shouxu;

		}



		$yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');

		$orderSn = $yCode[intval(date('Y')) - 2011] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));

		$data['order'] = $orderSn;

		$data['member_id'] = $uid;

		$data['zong_rmb'] = $txnums;

		$data['pay_type'] = $txmode;

		$data['zhifu_type'] = $txtype;

		$data['time'] = date('Y-m-d H:i:s');

		$data['give_xiaofei'] = $jifen_xiaofei;//拆分出来的消费积分

		$data['tx_rmb'] = $Surplus;//实际可到账金额

		$res_withdraw = M('tixian')->add($data);

		if ($res_withdraw) {

			M('member_jifens')->where(array('member_id' => $uid))->setDec($jifen_types, $txnums);

			$mes = array('status' => 1, 'info' => '提现成功,请等待后台审核');

			$this->ajaxReturn($mes);

		} else {

			$mes = array('status' => 2, 'info' => '提现失败');

			$this->ajaxReturn($mes);

		}

	}



	private function Withdrawconfigs()

	{

		/*提现配置*/

		$configs = M('childcoop_configs')->where(array('id' => 1))->find();

		if ($configs != '') {

			return $configs;

		}

	}



	public function moneydets()

	{

		$uid = session('user_auth.uid');

		$nctx['get_id'] = $uid;

		$member = M("fenxiaojiang");

		$count = $member->where($nctx)->count(1);// 查询满足要求的总记录数

		$Page = new \Think\Page($count, 30);// 实例化分页类 传入总记录数和每页显示的记录数(25)

		$show = $Page->show();// 分页显示输出

		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性

		$list = $member->where($nctx)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();



		$this->assign('list', $list);// 赋值数据集

		$this->assign('page', $show);// 赋值分页输出

		$this->display();

	}



	public function test()

	{

		$order_no = "M2017102015244414185";

		$ordfers = $this->asd($order_no);

	}



	public function asd($order_no)

	{

		$order = M("order")->where(array("order_no" => $order_no))->find();

		M("order")->where(array("order_no" => $order_no))->setField("status", 1);





		$uid = $order['uid'];//该订单用户ID

		M("user")->where(array("member_id" => $uid))->setInc('buy_moneys', $order['buy_price']);



		$member = M("user")->where(array("member_id" => $uid))->find();

		/*改变用户等级*/

		$member_grade = M('childcoop_configs')->where(array('id' => 1))->field('senior_member,higst_member')->find();

		if ($member['buy_moneys'] >= $member_grade['senior_member'] && $member['buy_moneys'] < $member_grade['senior_member']) {

			M("user")->where(array("member_id" => $uid))->setField('houtaijibie', 2);

		}

		if ($member['buy_moneys'] >= $member_grade['higst_member']) {

			M("user")->where(array("member_id" => $uid))->setField('houtaijibie', 3);

		}



		if ($member) {

			$one = M("user")->where(array("member_id" => $member['fid']))->field("member_id,fid,houtaijibie")->find();

			if ($one) {

				$two = M("user")->where(array("member_id" => $one['fid']))->field("member_id,fid,houtaijibie")->find();

				if ($two) {

					$three = M("user")->where(array("member_id" => $two['fid']))->field("member_id,fid,houtaijibie")->find();

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

		if ($twosanji_type == 2) {

			$bili_det = M('sanjitwo')->where(array('id' => 1))->find();

		}

		if ($threesanji_type == 3) {

			$bili_det = M('sanjithree')->where(array('id' => 1))->find();

		}



		$list[0] = $oneid;

		$list[1] = $twoid;

		$list[2] = $threeid;



		/*级别不同采用的三级分销不同*/

		$pay_money = 288;

		$get_money = 0;



		foreach ($list as $key => $value) {

			if ($key == 0) $get_money = $pay_money * $bili_det['first'] * 100 / 100;

			if ($key == 1) $get_money = $pay_money * $bili_det['second'] * 100 / 100;

			if ($key == 2) $get_money = $pay_money * $bili_det['third'] * 100 / 100;



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



	//确认收货

	public function Confirmad()

	{

		$orderid = I('orderid');

		$orders = M('order');

		$res_change = $orders->where(array('order_id' => $orderid))->setField('status', 3);

		if ($res_change) {
			$datas=$orders->where(array('order_id' => $orderid))->find();
			$uid=$datas['order_sellerid'];
			$money=$datas['buy_price'];
			$res=M('store')->where(array('uid'=>$uid))->setInc('cangku_num',$money);
			if($res){
				$mes = array('status' => 1, 'info' => '确认收货成功');
			}else{
				$orders->where(array('order_id' => $orderid))->setField('status', 2);
				$mes = array('status' => 2, 'info' => '确认收货失败');
			}
			

			$this->ajaxReturn($mes);

		} else {

			$mes = array('status' => 2, 'info' => '确认收货失败');

			$this->ajaxReturn($mes);

		}

	}



	//退出登录

	public function loginout()

	{

		session_unset();

		session_destroy();

		$this->redirect('Home/login/login');

	}



	//商家订单

	public function Mineorders(){

		$uid = user_login();

		$orderDetail = M("order_detail");

		$orderList = M("order")->where(array("order_sellerid"=>$uid))->select();

		foreach ($orderList as $key => $value) {

			$orderList[$key]["detail"] = $orderDetail->where(array("order_id"=>$value['order_id']))->select();

		}



		// $orderList = array_merge($orderList,$orderList,$orderList);



		$this->assign('orderList',$orderList);

		$this->display();

	}





	public function havemoney(){

		$id = trim(I('id'));

		$uid = session('user_auth.uid');

		//该订单是否为该商家的

		$orderInfo = M("order")->where(array("order_id"=>$id,"order_sellerid"=>$uid))->find();

		if(empty($orderInfo)){

			$mes = array('status'=>0,'info'=>'该订单不存在');

			$this->ajaxReturn($mes);

		}



		$isPay = M("order")->where(array("order_id"=>$id,"order_sellerid"=>$uid))->setField("status",1);

		if($isPay){

			$mes = array('status'=>1,'info'=>'确认成功');

			$this->ajaxReturn($mes);

		}else{

			$mes = array('status'=>0,'info'=>'确认失败');

			$this->ajaxReturn($mes);

		}



	}





	//商家发货

	public function deliver(){

		$id = I('id');
        $uid = user_login();
		$express_order = I('express_order');
		$express_name = I('express_name');

		if($express_order == ''){

			$mes = array('status'=>2,'info'=>'请输入快递单号');

			$this->ajaxReturn($mes);

		}



		if($express_name == ''){

			$mes = array('status'=>2,'info'=>'请输入快递公司名称');

			$this->ajaxReturn($mes);

		}



		$res = M('order')->where(array('order_id'=>$id,"order_sellerid"=>$uid))->find();
		if(empty($res)){
			$mes = array('status'=>2,'info'=>'订单不存在');
			$this->ajaxReturn($mes);
		}

		if($res['status'] != 1){

			$mes = array('status'=>2,'info'=>'该订单不是可发货状态');

			$this->ajaxReturn($mes);

		}

		if($res){

			$res_deliver = M('order')->where(array('order_id'=>$id))->setfield(array('kd_name'=>$express_name,'kd_no'=>$express_order,'status'=>2));

			if($res_deliver){

				$mes = array('status'=>1,'info'=>'发货成功');

				$this->ajaxReturn($mes);

			}else{

				$mes = array('status'=>2,'info'=>'发货失败');

				$this->ajaxReturn($mes);

			}

		}

	}







	//认证中心

	public function verify(){



		if(IS_POST){

			$realname = trim(I("realname"));

			$idcard = trim(I("idcard"));

			$phone = trim(I("phone"));

			$type = intval(trim(I("type")));

			$userid = user_login();

	/*		var_dump($userid);die;*/

			if(empty($realname)||!isset($realname)){

				error_alert('姓名不能为空');

			}



			if(empty($idcard)||!isset($idcard)){

				error_alert('身份证不能为空');

			}



			if(empty($phone)||!isset($phone)){

				error_alert('手机号不能为空');

			}



			if(empty($type)||!isset($type)){

				error_alert('请选择认证类型');

			}



			//用户信息

			$userInfo = M("user")->where(array("userid"=>$userid))->find();



			$data = array();

			if($type==2){

				if($userInfo['is_e_verify']!=0){

					error_alert('您已经完成企业认证');

				}



				$imginfo = $_FILES;

				// p($imginfo);exit;

				$img = moreimg_uploads();

				if($img['status'] == '0'){

					error_alert($img['res']);

				}



				$i=0;

				foreach ($imginfo as $kname =>$v){

					if(!empty($v['name'])){

						$data[$kname] = $img['res'][$i];

						$i++;

					}

				}



                if(empty($data['app_idcard_hands']) || empty($data['app_blicense'])){

					error_alert('请上传有关证件');

				}





			}else if($type==1){



				if($userInfo['is_p_verify']!=0){

					error_alert('您已经完成个人认证');

				}

				$imginfo = $_FILES;

				// p($imginfo);exit;

				$img = moreimg_uploads();

				if($img['status'] == '0'){

					error_alert($img['res']);

				}



				$i=0;

				foreach ($imginfo as $kname =>$v){

					if(!empty($v['name'])){

						$data[$kname] = $img['res'][$i];

						$i++;

					}

				}





                if(empty($data['app_idcard_front']) || empty($data['app_idcard_back'])){

					error_alert('请上传有关证件');

				}





			}else{

				error_alert('认证类型不正确');

			}





			$verifyCount = M("verify_list")->where(array("uid"=>$userid,"status"=>0,"type"=>$type))->count();

			if($verifyCount>0){

				error_alert('您已提交过认证申请');

			}







			$dede['uid'] = $userid;

			$dede['account'] =$userInfo['mobile'];

			$dede['username'] =$userInfo['username'];

			$dede['type'] = $type;

			$dede['realname'] =$realname;

			$dede['idcard'] =$idcard;

			$dede['phone'] = $phone;

			$dede['up_idcard'] =$data['app_idcard_front'];

	        $dede['down_idcard'] =$data['app_idcard_back'];

			$dede['hand_idcard'] =$data['app_idcard_hands'];

			$dede['licence'] =$data['app_blicense'];

			$dede['status'] =0;

			$dede['time'] =time();

			$dede['datestr'] =date("Ymd");



	



            









			$isAdd = M("verify_list")->add($dede);



			if($isAdd){

				success_alert('提交申请成功，等待后台审核。');



			}else{

				error_alert('提交申请失败');

			}





		}







		$this->display();

	}



	public function level(){

		$uid = session('userid');

		$userInfo = M("user")->where(array("member_id"=>$uid))->find();





		$this->assign("userInfo",$userInfo);

		$this->display();

	}





	public function level_up(){

		$uid = session('user_auth.uid');

		$level = trim(I("level"));



		$imginfo = $_FILES;

		$img = moreimg_uploads();

		if($img['status'] == '0'){

			error_alert($img['res']);

		}



		$i=0;

		foreach ($imginfo as $kname =>$v){

			if(!empty($v['name'])){

				$data[$kname] = $img['res'][$i];

				$i++;

			}

		}



		if(empty($level)||!isset($level)){

			error_alert("参数错误");

		}



		if(empty($data['proof'])||!isset($data['proof'])){

			error_alert("付款凭证不为空");

		}



		if($level==1){



		}else if($level==2){



		}else if($level==3){



		}else{

			error_alert("非法请求");

		}



		//是否为当前等级

		$userInfo = M("user")->where(array("member_id"=>$uid))->find();

		if($userInfo['member_grade']==$level){

			error_alert("您已经是该等级了,无需申请。");

		}





		$count  = M("level_list")->where(array("uid"=>$uid,"status"=>0))->count();

		if($count>0){

			error_alert("您当前已经提交过申请了");

		}



		$level_data = array();

		$level_data['uid'] = $uid;

		$level_data['level'] = $level;

		$level_data['proof'] = $data['proof'];

		$level_data['money'] = $level==1?99:($level==2?1999:6000);

		$level_data['status'] = 0;

		$level_data['time'] = time();

		$level_data['datestr'] = date("Ymd");

		$isAdd = M("level_list")->add($level_data);

		if($isAdd){

			success_alert("提交成功,等待系统审核。",U('Member/level'));

		}else{

			error_alert("提交失败。");

		}





	}









}



