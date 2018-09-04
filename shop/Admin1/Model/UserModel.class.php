<?php
namespace Admin\Model;

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
        //验证用户名
        array('account', 'require', '账号不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('account', '6,32', '账号长度为1-32个字符', self::EXISTS_VALIDATE, 'length', self::MODEL_BOTH),
        array('account', '', '账号已被使用', self::EXISTS_VALIDATE, 'unique', self::MODEL_BOTH),
        // array('account', '/^(?!_)(?!\d)(?!.*?_$)[\w]+$/', '用户名只可含有数字、字母、下划线且不以下划线开头结尾，不以数字开头！', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('username', 'require', '姓名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
       

        //验证登录密码
        array('login_pwd', '6,20', '密码长度为6-20位', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
        // array('login_pwd', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
        array('relogin_pwd', 'login_pwd', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_BOTH),

        //验证交易密码
        array('safety_pwd', '6,20', '密码长度为6-20位', self::VALUE_VALIDATE, 'length', self::MODEL_BOTH),
        // array('safety_pwd', '/(?!^(\d+|[a-zA-Z]+|[~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+)$)^[\w~!@#$%^&*()_+{}:"<>?\-=[\];\',.\/]+$/', '密码至少由数字、字符、特殊字符三种中的两种组成', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
        array('resafety_pwd', 'safety_pwd', '两次输入的密码不一致', self::EXISTS_VALIDATE, 'confirm', self::MODEL_BOTH),

        //验证手机号码
        array('mobile', '/^\d+$/i', '手机号码格式不正确', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('mobile', '', '手机号被占用', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        
        // array('email', 'require', '邮箱不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        // array('email', '/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/', '邮箱格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        // array('email', '', '该邮箱已被使用', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),

    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
        array('pid', '0', self::MODEL_INSERT),
        array('reg_date', 'time', self::MODEL_INSERT, 'function'),
        array('deep', '1', self::MODEL_INSERT),
        array('path', '', self::MODEL_INSERT),
        array('status', '1', self::MODEL_INSERT),
        array('activate', '1', self::MODEL_INSERT),
    );

     /**
     * [pwdMd5 用户密码加密]
     * 
     */
    public function pwdMd5($value,$salt){
       $user_pwd=md5(md5($value).$salt);
       return  $user_pwd;
    }
    

}
