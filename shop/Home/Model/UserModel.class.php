<?php

namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class UserModel extends ModelModel
{
	protected $tableName = 'user';
	/**
	 * 自动验证规则
	 *
	 */
	protected $_validate = array(
		// self::EXISTS_VALIDATE 或者0 存在字段就验证（默认）
		// self::MUST_VALIDATE 或者1 必须验证
		// self::VALUE_VALIDATE或者2 值不为空的时候验证

		//我的交易密码
		// array('mypwdtwo', 'require', '‘我的交易密码’不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_INSERT),
		// array('mypwdtwo', 'check_pwd_two', '‘我的交易密码’错误', self::EXISTS_VALIDATE, 'callback', self::MODEL_INSERT),

		//激活码
		// array('activatecode', 'require', '激活码不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_INSERT),

		//推荐人
//		array('pid', 'require', '推荐人手机不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
//		array('pid', '/^1[3456798]\d{9}$/', '推荐人手机错误', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('pid', 'check_parent', '推荐人手机错误或不存在', self::MUST_VALIDATE, 'callback', self::MODEL_INSERT),

		//验证手机号码
		array('mobile', 'require', '手机号码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('mobile', '/^1[3456798]\d{9}$/', '手机号码格式不正确', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('mobile', '', '手机号码已存在', self::MUST_VALIDATE, 'unique', self::MODEL_INSERT),
		//验证用户名
		// array('account', '', '该账号已被使用', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
		// array('account', '/^[A-Za-z0-9]+$/', '用户名只可含有数字、字母、下划线且不以下划线开头结尾，不以数字开头！', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
		array('username', 'require', '姓名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('username', '2,8', '姓名长度为2-8个字', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),


		//验证登录密码
		array('login_pwd', 'require', '登录密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('relogin_pwd', 'require', '确认登录密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		array('login_pwd', '6,20', '登录密码长度为6-20位', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),
		array('relogin_pwd', 'login_pwd', '两次输入登录密码不一致', self::MUST_VALIDATE, 'confirm', self::MODEL_INSERT),

		//验证交易密码
		array('safety_pwd', 'require', '交易密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
//		array('resafety_pwd', 'require', '确认交易密码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
//		array('safety_pwd', '6,20', '交易密码长度为6-20位', self::MUST_VALIDATE, 'length', self::MODEL_INSERT),
//		array('resafety_pwd', 'safety_pwd', '两次输入交易密码不一致', self::MUST_VALIDATE, 'confirm', self::MODEL_INSERT),

		// array('email', 'require', '邮箱不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
		// array('email', '/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/', '邮箱格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_INSERT),
		// array('email', '', '该邮箱已被使用', self::MUST_VALIDATE, 'unique', self::MODEL_INSERT),

	);

	/**
	 * 自动完成规则
	 *
	 */
	protected $_auto = array(
		array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function'),
		array('pid', 'check_parent', self::MODEL_BOTH, 'callback'),
		array('reg_date', 'time', self::MODEL_INSERT, 'function'),
		array('status', '1', self::MODEL_INSERT),
		array('activate', '1', self::MODEL_INSERT),
	);


	/**
	 *
	 */
	protected function check_parent($value)
	{
	    $where['userid|mobile'] = $value;
		$pid = $this->where($where)->getField('userid');
		if ($pid > 0)
			return $pid;
		else
			return false;
	}

	/**
	 * [getdeep 层级]
	 * @return [type] [description]
	 */
	protected function getdeep()
	{
		$userid = $this->user_login();
		$where['userid'] = $userid;
		$deep = $this->where($where)->getField('deep');
		return $deep + 1;
	}

	/**
	 * [getpath 路径]
	 * @return [type] [description]
	 */
	protected function getpath()
	{
		$userid = $this->user_login();
		$where['userid'] = $userid;
		$path = $this->where($where)->getField('path');
		if (empty($path))
			$path = '-' . $userid . '-';
		else
			$path .= $userid . '-';
		return $path;
	}


    /**
     * 用户登录
     *
     */
    public function Quicklogin($account)
    {
        //去除前后空格
        $account = trim($account);
        if (!isset($account) || empty($account)) {
            $this->error = '账号不能为空';
            return false;
        }


        //匹配登录方式
        // if (preg_match("/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/", $account)) {
        //     $map['email'] = array('eq', $account); // 邮箱登陆
        // if (preg_match("/^1\d{10}$/", $account)) {
        $map['mobile|account|userid'] = array('eq', $account); // 手机号登陆
        // } else {
        //     $map['account'] = array('eq', $account); // 用户名登陆
        // }
        $user_info = $this->where($map)->find(); //查找用户
        if ($user_info['status'] <= 0) {
            $this->error = '您的账号已锁定，请联系管理员!';
            return false;
        } else{
            $session_id = session_id();
            $this->where($map)->setField('session_id', $session_id);
            return $user_info;
        }
        return false;
    }


	/**
	 * 用户登录
	 *
	 */
	public function login($account, $password, $map = null)
	{
		//去除前后空格
		$account = trim($account);
		if (!isset($account) || empty($account)) {
			$this->error = '账号不能为空';
			return false;
		}
		if (!isset($password) || empty($password)) {
			$this->error = '密码不能为空';
			return false;
		}

		//匹配登录方式
		// if (preg_match("/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/", $account)) {
		//     $map['email'] = array('eq', $account); // 邮箱登陆
		// if (preg_match("/^1\d{10}$/", $account)) {
		$map['mobile|account|userid'] = array('eq', $account); // 手机号登陆
		// } else {
		//     $map['account'] = array('eq', $account); // 用户名登陆
		// }
		$user_info = $this->where($map)->find(); //查找用户
		if (!$user_info) {
			$this->error = '账号或密码错误!';
			return false;
		} elseif ($user_info['status'] <= 0) {
			$this->error = '您的账号已锁定，请联系管理员!';
			return false;
		} else {
		

			if ($this->pwdMd5($password, $user_info['login_salt']) !== $user_info['login_pwd']) {
				$this->error = '账号或密码错误！';
				return false;
			} else {
				$session_id = session_id();
				$this->where($map)->setField('session_id', $session_id);
				return $user_info;
			}
		}
		return false;
	}

    /**
     * 用户交易
     *
     */
    public function Trans($account, $password, $map = null)
    {
        $map['mobile|account'] = array('eq', $account); // 手机号登陆
        $user_info = $this->where($map)->find(); //查找用户
        if (!$user_info) {
            ajaxReturn('您输入的账号有误',0);
        } elseif ($user_info['status'] <= 0) {
            ajaxReturn('您的账号已锁定',0);
        } else {
            $ispwd = $this->pwdMd5($password, $user_info['safety_salt']);
            if ($ispwd == $user_info['safety_pwd']) {
            }else{
                ajaxReturn('交易密码错误',0);
            }
        }
        return false;
    }


    public function Savepwd($account, $password,$type)
    {
        $map['mobile|account'] = array('eq', $account); // 手机号登陆
        $user_info = $this->where($map)->find(); //查找用户

        if (!$user_info) {
            ajaxReturn('您输入的账号有误',0);
        } elseif ($user_info['status'] <= 0) {
            ajaxReturn('您的账号已锁定',0);
        } else {
            if($type == 1){
                $ispwd = $this->pwdMd5($password, $user_info['login_salt']);
                if ($ispwd == $user_info['login_pwd']) {
                }else{
                    ajaxReturn('登录密码错误',0);
                }
            }else{
                $ispwd = $this->pwdMd5($password, $user_info['safety_salt']);
                if ($ispwd == $user_info['safety_pwd']) {
                }else{
                    ajaxReturn('交易密码错误',0);
                }
            }
        }
    }

	/**
	 * [pwdMd5 用户密码加密]
	 *
	 */
	public function pwdMd5($value, $salt)
	{
		$user_pwd = md5(md5($value) . $salt);
		return $user_pwd;
	}

	//验证交易密码是否正确
	public function check_pwd_two($value)
	{
		$where['userid'] = session('userid');
		$u_info = $this->where($where)->field('safety_pwd,safety_salt')->find();
		$salt = $u_info['safety_salt'];
		$pwd = $u_info['safety_pwd'];
		if ($pwd == $this->pwdMd5($value, $salt)) {
			return true;
		} else {
			return false;
		}
	}

	//验证登录密码是否正确
	public function check_pwd_one($value)
	{
		$where['userid'] = session('userid');
		$u_info = $this->where($where)->field('login_pwd,login_salt')->find();
		$salt = $u_info['login_salt'];
		$pwd = $u_info['login_pwd'];
		if ($pwd == $this->pwdMd5($value, $salt)) {
			return true;
		} else {
			return false;
		}
	}


	/**
	 * 设置登录状态
	 *
	 */
	public function auto_login($user)
	{
		// 记录登录SESSION和COOKIES
		$auth = array(
			'userid' => $user['userid'],
			'account' => $user['account'],
			'mobile' => $user['mobile'],
			'username' => $user['username'],
		);
		session('userid', $user['userid'], 43200);

		session('user_login', $auth, 43200);
		session('user_login_sign', $this->data_auth_sign($auth), 43200);
		return $this->user_login();
	}

	/**
	 * 数据签名认证
	 * @param  array $data 被认证的数据
	 * @return string       签名
	 *
	 */
	public function data_auth_sign($data)
	{
		// 数据类型检测
		if (!is_array($data)) {
			$data = (array)$data;
		}
		ksort($data); //排序
		$code = http_build_query($data); // url编码并生成query字符串
		$sign = sha1($code); // 生成签名
		return $sign;
	}

	/**
	 * 检测用户是否登录
	 * @return integer 0-未登录，大于0-当前登录用户ID
	 *
	 */
	public function user_login()
	{
		$user = session('user_login');
		if (empty($user)) {
			return 0;
		} else {
			if (session('user_login_sign') == $this->data_auth_sign($user)) {
				return $user['userid'];
			} else {
				return 0;
			}
		}
	}


	public function UserField($field)
	{
		$userid = session('userid');
		$where['userid'] = $userid;
		return $this->where($where)->getField($field);
	}


	/**
	 * [UserInfo 获取用户信息]
	 * @param [type] $where [description]
	 * @param [type] $field [description]
	 */
	public function UserInfo($where = null, $field)
	{
		if (empty($where))
			$where['userid'] = $this->user_login();
		$info = $this->where($where)->field($field)->find();

		$pid = $info['pid'];
		if (!$field && $pid > 0) {
			//读取父级信息
			$p_info = $this->where('userid = ' . $pid)->field('account as p_account,username as p_username,mobile as p_mobile')->find();
			if ($p_info)
				$info = array_merge($info, $p_info);
		}

		return $info;
	}


	protected function is_password($value)
	{
		$len = strlen($value);
		if ($len < 6 || $len > 20) {
			$this->error = '密码长度为6-20位';
			return false;
		}
		// $meth='/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/';
		// if(!preg_match($match,$value)){
		//     $this->error='密码至少由数字、字符组成';
		//     return false;
		// }
		return true;
	}

	public function CangkuNum($field)
	{
		$userid = $this->user_login();
		$where['uid'] = $userid;
		return D('store')->field($field)->where($where)->find();
	}

	/**
	 * [ChildrenNum 直推人数]
	 */
	public function ChildrenNum()
	{
		$where['pid'] = $this->user_login();
		return $this->where($where)->count(1);
	}


	protected function getUserTool($userid)
	{
		$where['uid'] = $userid;
		$info = M('user_level')->where($where)->find();
		return $info;
	}


}
