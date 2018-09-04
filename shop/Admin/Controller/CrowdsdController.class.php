<?php
namespace Admin\Controller;

use Think\Page;
use Admin\Model\CrowdsdModel;
use Admin\Model\UserModel;
/**
 * 用户控制器
 * 
 */
class CrowdsdController extends AdminController
{


    /**
     * 众筹列表
     * 
     */
     public function index()
    {


         // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','userid','string');
        $status     = I('status');
        if($keyword){
            
            $map['uid'] = $keyword;
        }
        

         //按日期搜索
        $date=date_query('create_time');
        if($date){
            $where=$date;
            if(isset($map))
                $map=array_merge($map,$where);
            else
                $map=$where;
        }
      
        if($level!=''){
            $map['a.level']=$level;
        }

        // 获取所有用户
        $crowd  = new CrowdsdModel();
       $crowdsd=$crowd->select();
    //   var_dump($crowdsd);die;
        if(!isset($map)){
            $map=true;
        }
        // var_dump($map);


        //分页
       
        $p=getpage($crowd,$map,15);
        $page=$p->show();  

        $data_list     = $crowd->where($map)->order('id desc')->select();
        // echo $crowd->getlastsql();
        // var_dump($data_list);die;
        foreach($data_list as $v){
         
            $v['create_time']=date('Y-m-d H:i:s',$v['create_time']);
            $v['username']=M('user')->where("userid={$v['uid']}")->getField('username');
            
            $data_lists[]=$v;
        }
    
         //取管理员会员列表的权限   
        $uids= is_login();    
        $hylbs="1,2,3,4,5"; 
        $auth_id    = M('admin')->where(array('id'=>$uids))->getField('auth_id');   
        if($auth_id<>1){
        $auth_id    = M('admin')->where(array('id'=>$uids))->getField('auth_id');
        $hylbs    = M('group')->where(array('auth_id'=>$auth_id))->getField('hylb');

        }

        $hylb=explode(",",$hylbs);
        $this->assign('hylb',$hylb);
        $this->assign('list',$data_lists);
        $this->assign('table_data_page',$page);
        $this->display();
    }


    
}
