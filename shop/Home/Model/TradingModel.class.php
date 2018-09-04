<?php
namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class TradingModel extends ModelModel
{
    

    
   /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('buy_account', 'require', '买家账号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('buy_username', 'require', '买家姓名不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('num', 'require', '出售数量不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('num', '/^[1-9]\d*$/', '出售数量只能为整数', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('num', 'checknum', '出售数量只能为整数', self::MUST_VALIDATE, 'callback', self::MODEL_INSERT),
        array('pwd', 'require', '二级不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('pwd', 'checkpwd', '交易密码错误', self::MUST_VALIDATE, 'callback', self::MODEL_INSERT),
        array('img', 'require', '收款二维码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        
    );

     /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('sell_id', 'get_userid', self::MODEL_INSERT, 'function'),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('status', '0', self::MODEL_INSERT),
        array('sell_account', 'getAccount', self::MODEL_INSERT,'callback'),
        array('sell_username', 'getUsername', self::MODEL_INSERT,'callback'),
        array('sell_mobile', 'getMobile', self::MODEL_INSERT,'callback'),
    );

    /**
     * [checknum 出售数量为10的陪数]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function checknum($value){
        $res=$value%10;
        if($res==0)
            return true;
        else
            return false;
    }

    //验证交易密码
    public function checkpwd($value){
        return  D("User")->check_pwd_two($value);
    }


    /**
     * [getAccount 获取出售者账号]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function getAccount(){
    	$u_info=session('user_login');
    	return $u_info['account'];
    }

    /**
     * [getUsername 获取出售者姓名]
     * @return [type] [description]
     */
   protected function getUsername(){
        $u_info=session('user_login');
        return $u_info['username'];
    }

    /**
     * [getUsername 获取出售者姓名]
     * @return [type] [description]
     */
   protected function getMobile(){
        $u_info=session('user_login');
        return $u_info['mobile'];
    }

    public function setStatus($old_status,$new_status,$where=null){

        $id=I('post.id',0,'intval');
        $id=safe_replace($id);
        if(!isset($id) || empty($id)){
            $this->error="参数错误";
            return false;
        }
        if($where==null)
            $where['sell_id']=get_userid();//购买者
        $where['id']=$id;
        $status=$this->where($where)->getField('status');
        if($status==$old_status){
            if($this->where($where)->setField('status',$new_status)){
                $this->error="操作成功";
                return $id;
            }else{
                $this->error="操作失败";
                return false;
            }
        }
    }


    public function cancelTrade($old_status,$new_status,$where=null){

        $id=I('post.id',0,'intval');
        $id=safe_replace($id);
        if(!isset($id) || empty($id)){
            $this->error="参数错误";
            return false;
        }
        if($where==null)
        $where['sell_id|buy_id']=get_userid();//购买者
        $where['id']=$id;
        $status=$this->where($where)->getField('status');
        if($status==$old_status||$status==1||$status==2){
            if($this->where($where)->setField('status',$new_status)){
                $this->error="操作成功";
                return $id;
            }else{
                $this->error="操作失败";
                return false;
            }
        }
    }

    


}
