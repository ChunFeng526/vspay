<?php
namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class StoreModel extends ModelModel
{
    

    public function CangkuNum($where){
        if(empty($where)){
            $userid=get_userid();
            $where['uid']=$userid;
        }
        return $this->where($where)->getField('cangku_num');
    }

    //扣减仓库数量
    public function DesNum($num){
    	if(empty($num)){
            $this->error="参数错误";
    		return false;
        }
        $userid=session('userid');
        $where['uid']=$userid;
        $cangku_num=$this->where($where)->getField('cangku_num');
        if($cangku_num<$num){
            $this->error="仓库果子不足";
            return false;
        }
    	$res= $this->where($where)->setDec('cangku_num',$num);
    	if($res)
        {
            return true;
        }else{
            $this->error="操作失败";
            return false; 
        }
    }

    //增加仓库数量
    public function IncNum($num,$where=null){
        if(empty($num))
            return false;

       if($where==null){
            $userid=get_userid();
            $where['uid']=$userid;
        }
        $res= $this->where($where)->setInc('cangku_num',$num);
        return $res;
    }

    //增加拆分累计
    public function IncHuaFei($num,$where=null){
        if(empty($num))
            return false;

       if($where==null){
            $userid=get_userid();
            $where['uid']=$userid;
        }
        $res= $this->where($where)->setInc('huafei_num',$num);
        if($res)
            return $this->where($where)->getField('huafei_num'); 
        else
            return false;
    }

    //创建仓库
    public function CreateCangku($num,$uid){
    	if(empty($uid))
    		return false;
    	$data['cangku_num']=$num;
        $data['uid']=$uid;
    	$res=$this->add($data);
    	if($res===false)
    		return false;
    	//创建15块地
    	for ($i=1; $i <= 15; $i++) {
    		$seed=0;
    		$status=0;
            if ($i<=5) {
                $farm_type=1;  
            }else if(5<$i && $i<=10) {
                $farm_type=2;  
            }else{
                $farm_type=3;  
            }
            $datalist[]=array('uid'=>$uid,'f_id'=>$i,'farm_type'=>$farm_type,'status'=>$status,'seeds'=>$seed);
    	}
        D('nzusfarm')->addAll($datalist);

        //添加等级表
        M('user_level')->add(array('uid'=>$uid));

        //添加施肥表
        M('user_huafei')->add(array('uid'=>$uid));
        
    	return true;
    }


    //增加总矿石
    public function IncTotal($num){
        if(empty($num))
            return false;

        $userid=get_userid();
        $where['uid']=$userid;
        $res= $this->where($where)->setInc('total_num',$num);
        return $res;
    }



}
