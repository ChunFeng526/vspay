<?php
namespace Shop\Controller;
use Think\Controller;
class PublicController extends CommonController{
	
  function forgot()
	{
		if (IS_POST) {
			$json = array();

			$d = I('post.');
			$rand_num = rand(100000, 999999);

			$account['pwd'] = think_ucenter_encrypt($rand_num, C('PWD_KEY'));

			$r = M('member')->where(array('email' => $d['email']))->save($account);

			if ($r) {
				$user_info = M('member')->where(array('email' => $d['email']))->find();
				storage_user_action($user_info['member_id'], $user_info['uname'], C('FRONTEND_USER'), '使用邮件重置了密码');
				$email_content = '您好,您的密码已经重置成功<br />' .
					'您的账号是 ' . $user_info['uname'] . '<br />' .
					'邮箱是 ' . $user_info['email'] . '<br />' .
					'密码是 ' . $rand_num . '<br />' .
					'您可以使用账号或者邮箱来进行网站的登录<a href="' . C('SITE_URL') . '/login.html">点此进行登录</a>';

				//发送邮件
				think_send_mail($d['email'], $rand_num, '密码重置成功-' . C('SITE_NAME'), $email_content);

				$json['redirect'] = U('/login');
				$this->ajaxReturn($json);
				die;
			}
		}
		if (is_login()) {
			$this->redirect('/order');
		}
		$this->action = U('/forgot');
		$this->display();
	}


	/* 注册页面 */
	public function register()
	{

		if (IS_POST) {
			$this->uname = I('uname');
			$this->email = I('email');
			$this->pwd = I('pwd');
			$this->repwd = I('repwd');


			if (empty($_POST['uname'])) {
				echo "<script>alert('用户名不能为空！！');history.go(-1);</script>";
				exit;
				//$this->error_uname="用户名不能为空！！";				
				//$this->display();die();
			} elseif (M('Member')->getByUname(trim($_POST['uname']))) {
				$this->error_uname = "用户名已经存在！！";
				$this->display();
				die();
			} elseif (empty($_POST['pwd'])) {
				echo "<script>alert('密码不能为空！！');history.go(-1);</script>";
				exit;
				//$this->error_pwd="密码不能为空！！";
				//$this->display();die();
			} elseif (empty($_POST['repwd'])) {
				echo "<script>alert('确认密码不能为空！！');history.go(-1);</script>";
				exit;
				//$this->error_repwd="确认密码不能为空！！";
				//$this->display();die();
			} elseif ($_POST['pwd'] != $_POST['repwd']) {
				echo "<script>alert('两次密码输入不相等！！');history.go(-1);</script>";
				exit;
				//$this->error_repwd="两次密码输入不相等！！";
				//$this->display();die();
			}

			$data = array();

			$data['email'] = $_POST['email'];
			$data['uname'] = trim($_POST['uname']);
			$data['pwd'] = think_ucenter_encrypt($_POST['pwd'], C('PWD_KEY'));
			$data['status'] = 1;
			$data['daili'] = 0;
			$data['create_time'] = time();
			$data['last_login_ip'] = get_client_ip();

			$re = M('Member')->add($data);
			if ($re) {
				$auth = array(
					'uid' => $re,
					'username' => $data['uname'],
				);
				session('user_auth', $auth);
				session('user_auth_sign', data_auth_sign($auth));

				storage_user_action($re, $data['uname'], C('FRONTEND_USER'), '注册成为会员');
				/*
					$email_content='您好,感谢您注册成为'.C('SITE_NAME').'会员<br />'.
					'您的账号是 '.$data['uname'].'<br />'.
					'邮箱是 '.$data['email'].'<br />'.
					'密码是 '.$_POST['pwd'].'<br />'.
					'您可以使用账号或者邮箱来进行网站的登录<a href="'.C('SITE_URL').'/login.html">点此进行登录</a>';

					//发送邮件
					think_send_mail($data['email'],$data['uname'],C('SITE_NAME').'会员注册成功',$email_content);
					 */
				$this->redirect('/login');
			} else {
				$this->error = "注册失败";
				$this->display();
				die();
			}

		}
		/**/
		$this->title = '用户注册-';
		$this->meta_keywords = C('SITE_KEYWORDS');
		$this->meta_description = C('SITE_DESCRIPTION');

		$this->display();

	}

	/* 登录页面 */
	public function login()
	{
		if (IS_AJAX) {
			$code = I('verify');
			$verify = new \Think\Verify();

			if (!$verify->check($code)) {
				$res = array('status' => 3, 'info' => '验证码错误');
				$this->ajaxReturn($res);
			}
			/*商城还是游戏登录*/
			$user = M('member')->where(array('phone' => $_POST['phone']))->field('member_id,uname,phone,status,login_count,pwd')->find();
			//用户存在且可用
			if ($user && $user['status'] == 1) {
				//验证密码
				if (think_ucenter_encrypt($_POST['pwd'], C('PWD_KEY')) == $user['pwd']) {
					//数据库记录sessionid
					$auth = array(
						'uid' => $user['member_id'],
						'username' => $user['uname'],
						'phone' => $user['phone'],
						'status' => $user['status'],
						'login_count' => $user['login_count']
					);

					var_dump($auth);
					die;
					session('user_auth', $auth);
					session('in_time', time());
					session('user_auth_sign', data_auth_sign($auth));

					if ($user['address_id'] != 0) {
						session('shipping_address_id', $user['address_id']);
					}

					$data = array();
					$data['member_id'] = $user['member_id'];
					$data['session_id'] = session_id();
					$data['last_login_time'] = time();
					$data['login_count'] = array('exp', 'login_count+1');
					$data['last_login_ip'] = get_client_ip();
//					 $tip = new \Lib\Taobaoip();
//					 $ip_region = $tip->getLocation($data['last_login_ip']);
//					 $data['last_ip_region'] = $ip_region['region'] . '-' . $ip_region['city'];
					M('Member')->where(array('member_id' => $user['member_id']))->save($data);

					$fp = @fopen("test.txt", "a+");
					fwrite($fp, date("Y-m-d H:i:s") .'——'. $user['uname']   .'——'. $data['last_login_ip']. "登录了系统！\n");
					fclose($fp);

					if(session('website') != ''){
						$res = array('status' => 1, 'info' => '登录成功','website'=>session('website'));
					}else{
						$res = array('status' => 1, 'info' => '登录成功','website'=>"/shop/home/index");
					}
					$this->ajaxReturn($res);
				} else {
					$res = array('status' => 2, 'info' => '密码错误');
					$this->ajaxReturn($res);
				}
			} else {
				$res = array('status' => 2, 'info' => '用户不存在或被禁用');
				$this->ajaxReturn($res);
			}
		} else {
			$this->title = '用户登录';
			$this->meta_keywords = C('SITE_KEYWORDS');
			$this->meta_description = C('SITE_DESCRIPTION');

			if (is_login()) {
				$this->redirect('shop/home/index');
			} else {
				$this->redirect('shop/home/index');
			}
		}
	}

	//找回密码
	function password()
	{
		if ($_POST) {
			$data = I();
			$phone = $_COOKIE['ck_mm_phone'];
			$yzm = $_COOKIE['ck_mm_yzm'];
			//判断
			if (empty($data['phone'])) {
				$data = array('status' => 0, 'info' => '请填写手机号');
				$this->ajaxReturn($data);

//				msg("请填写手机号", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if (empty($data['yzm'])) {
				$data = array('status' => 0, 'info' => '请填写验证码');
				$this->ajaxReturn($data);
//				msg("请填写验证码", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if (empty($data['pass'])) {
				$data = array('status' => 0, 'info' => '请填写新密码');
				$this->ajaxReturn($data);
//				msg("请填写新密码", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if (empty($data['passtwo'])) {
				$data = array('status' => 0, 'info' => '请填写确认密码');
				$this->ajaxReturn($data);
//				msg("请填写确认密码", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if ($data['pass'] != $data['passtwo']) {
				$data = array('status' => 0, 'info' => '两次密码不相同');
				$this->ajaxReturn($data);
//				msg("两次密码不相同", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if ($phone != $data['phone']) {
				$data = array('status' => 0, 'info' => '手机号不正确');
				$this->ajaxReturn($data);
//				msg("手机号不正确", '0', 'lxkf.png', U('Pay/chongzhi'));
			}
			if ($yzm != $data['yzm']) {
				$data = array('status' => 0, 'info' => '验证码不正确');
				$this->ajaxReturn($data);
//				msg("验证码不正确", '0', 'lxkf.png', U('Pay/chongzhi'));
			}


			//修改密码
			$save['pwd'] = think_ucenter_encrypt($data['pass'], C('PWD_KEY'));

			M('member')->where(array('phone' => $phone))->save($save);

			$data = array('status' => 1, 'info' => '修改成功');
			$this->ajaxReturn($data);
		}
		$this->display();
	}

	//发送验证码
	function fayzm()
	{
		$gjdx_id = 'I3445713';
		$gjdx_mi = 'CihAvwHycD4683';
		$phone = I('mobile');//手机号码
		$thisptype = I('thisptype');//区号
		if (empty($phone)) {
			msg("请填写手机号", '0', 'lxkf.png', U('Pay/chongzhi'));
		}
		$issend = session('set_time');
		$oldtimes = $issend + 60;
		$nowstime = time();

		if ($oldtimes <= $nowstime) {
			$yzm = rand(1000, 9999);
			//生成验证码
			$mobile = $phone;
			$code = $yzm;
			$sms = new \Lib\ChuanglanSMS($gjdx_id, $gjdx_mi);
			// 发送手机号（国家区号+手机号码）
			$result = $sms->sendInternational("{$thisptype}{$mobile}", "【聚点商城】您的手机验证码 {$code}");
			cookie('mm_phone', $phone, 360);  //设置cookie
			cookie('mm_yzm', $yzm, 360);  //设置cookie
			session('set_time', time(), 60);
			$result = json_decode($result, true);
			msg('已发送', '1', '');
		} else {
			msg('发送过于频繁', '1', '');

		}
	}


	function hhh()
	{
		//生成验证码
		$mobile = '15555556735';
		$code = '1234';
		//发送短信
		$sms = new \Lib\Alisms();
		//测试模式
		$status = $sms->send_verify($mobile, $code);
		if (!$status) {
			echo $sms->error;
		}
	}


	//验证码
	public
	function verify()
	{
		ob_clean();
		$config = array(
			'codeSet' => '0123456789',
			'fontSize' => 30,    // 验证码字体大小
			'length' => 4,     // 验证码位数
			'fontttf' => '5.ttf',
			'useCurve' => false,
			'bg' => array(229, 237, 240),
		);
		$Verify = new \Think\Verify($config);
	    $Verify->entry();

	}
}
?>