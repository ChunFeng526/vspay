<?php
namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class TraingFreeModel extends ModelModel
{
    

   protected $tableName = 'trading_free'; 
   /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('num', 'require', '出售数量不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
        array('num', '/^[1-9]\d*$/', '出售数量只能为整数', self::MUST_VALIDATE, 'regex', self::MODEL_INSERT),
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
    );

    /**
     * [getAccount 获取用户头像]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function getAccount(){
    	$userid=get_userid();
    	$where['userid']=$userid;
    	return D('User')->where($where)->getField('account');
    }

    protected function getUsername(){
        $userid=get_userid();
        $where['userid']=$userid;
        return D('User')->where($where)->getField('username');
    }

     //验证交易密码
    public function checkpwd($value){
        return  D("User")->check_pwd_two($value);
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
                $this->error="修改成功";
                return $id;
            }else{
                $this->error="修改失败";
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




    public function setFreeUser(){
        $id=I('post.id',0,'intval');
        $id=safe_replace($id);
        if(!isset($id) || empty($id)){
            $this->error="参数错误";
            return false;
        }
        $userid=session('userid');
        $where['id']=$id;
        $where['status']=0;
        $where['buy_id']=0;
        $data['status']=1;
        $data['buy_id']=$userid;
        $data['buy_username']=$this->getUsername();
        $data['buy_account']=$this->getAccount();
        $res=$this->where($where)->save($data);
        if($res){
            $this->error="操作成功";
            return true;
        }else{
            $this->error="操作失败";
            return false;
        }
    }

}
