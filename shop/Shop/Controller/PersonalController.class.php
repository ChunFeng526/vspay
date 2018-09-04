<?php

namespace Shop\Controller;

use Think\Controller;

class PersonalController extends Controller
{
	//用户登录
	public function login()
	{

		$this->display();
	}

	//推广激活
	public function reg()
	{
		$this->display();

	}

	public function Regs()
	{
		$config = S('DB_CONFIG_DATA');
		if (!$config) {
			$config = api('Config/lists');
			S('DB_CONFIG_DATA', $config);
		}

		C($config); //添加配置

		$username = I('username');
		$mobile = trim(I('mobile'));
		$password = trim(I('password'));
		$conpassword = trim(I('conpassword'));
		$fidmobile = trim(I('fidmobile'));
		$email = trim(I('email'));
		$is_supply = trim(I('is_supply'));
		$supply_name = trim(I('supply_name'));
		$prov = trim(I('province'));
		$city = trim(I('city'));




		$uid = session('user_auth.uid');

		if (empty($username)) {
			$mes = array('status' => '2', 'info' => '姓名不能为空');
			$this->ajaxReturn($mes);
		}

		if (empty($mobile)) {
			$mes = array('status' => '2', 'info' => '手机号码不能为空');
			$this->ajaxReturn($mes);
		}

		$mobile_ser = M('member')->where(array('phone' => $mobile))->find();
		if (!empty($mobile_ser)) {
			$mes = array('status' => '2', 'info' => '手机号码已存在');
			$this->ajaxReturn($mes);
		}

		if ($password != $conpassword) {
			$mes = array('status' => '2', 'info' => '两次密码输入不同');
			$this->ajaxReturn($mes);
		}

		if (checkLength($password, 6, 20) == false) {
			$mes = array('status' => '2', 'info' => '密码6~20个字符不能为特殊符号');
			$this->ajaxReturn($mes);
		}


		if($is_supply==1){
			if(strlen($supply_name)>3&&strlen($supply_name)>12){
				$mes = array('status' => '2', 'info' => '店铺名称长度3~12个字符');
				$this->ajaxReturn($mes);
			}
		}

		/*推荐人id*/
		$fid = M('member')->where(array('phone'=>$fidmobile))->getField('member_id');
		if($fid){
			$userinfo = M('member')->where(array('member_id' => $fid))->Field('path_id,lenth_layer')->find();
			$dataaa['lenth_layer'] = $userinfo['lenth_layer'] + 1;

			$add['fid'] = $fid;
		}else{
			$dataaa['path_id'] = 0;
			$dataaa['lenth_layer'] = 0;

			$add['fid'] = 0;
		}

		//增加好友
		$add['uname'] = $username;
		$add['phone'] = $mobile;
		$add['email'] = $email;
		$add['pwd'] = think_ucenter_encrypt($password, C('PWD_KEY'));
		$add['prov'] = $prov;
		$add['city'] = $city;
		$add['touxiang'] = "/Public/pc/images/default.png";
		$add['twopass'] = 'MDAwMDAwMDAwMH+getyzm32s';
		$add['status'] = 1;
		$add['create_time'] = time();
		$data['last_login_ip'] = get_client_ip();

		if($is_supply==1){
			$add['is_dailishang']=1;
			$add['dailishang_name']=$supply_name;
		}

		$u = M('member')->add($add);

		$dataaa['path_id'] = $userinfo['path_id'] . $u . ',';


		$res_dosave = M('member')->where(array('member_id' => $u))->save($dataaa);
		if ($res_dosave) {
			$money['chicken_jifen'] = 0;
			$money['fish_jifen'] = 0;
			$money['farm_jifen'] = 0;
			$money['farmlink_jifen'] = 0;
			$money['renqicount'] = 1;
			$money['member_id'] = $u;
			M('member_jifens')->add($money);
			$mes = array('status' => '1', 'info' => '注册成功');
			$this->ajaxReturn($mes);
		} else {
			$mes = array('status' => '2', 'info' => '注册失败');
			$this->ajaxReturn($mes);
		}
	}
}

?>