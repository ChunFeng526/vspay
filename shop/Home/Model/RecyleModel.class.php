<?php
namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class RecyleModel extends ModelModel
{
    

    
   /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        // self::EXISTS_VALIDATE 或者0 存在字段就验证（默认）
        // self::MUST_VALIDATE 或者1 必须验证
        // self::VALUE_VALIDATE或者2 值不为空的时候验证
        array('pay_num', 'require', '矿石数不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('pay_num', '/^[1-9]\d*$/', '矿石数只能为整数', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('pay_way', 'require', '请选择回收方式', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('pay_no', 'require', '账号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('pay_name', 'require', '收款人不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
       
    );

     /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('uid', 'get_userid', self::MODEL_INSERT, 'function'),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('status', '0', self::MODEL_INSERT),
        array('account', 'getAccount', self::MODEL_INSERT,'callback'),
        array('Year', "getYear", self::MODEL_INSERT,'callback'),
        array('Week', "getWeek", self::MODEL_INSERT,'callback'),
    );

    /**
     * [getAccount 获取用户头像]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function getAccount($value){
    	$userid=get_userid();
    	$where['userid']=$userid;
    	return D('User')->where($where)->getField('account');
    }

    protected function getYear(){
    	return date('Y');
    }

    protected function getWeek(){
    	return date('W');
    }

}
