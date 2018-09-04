<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 排单码
 * 
 */
class BuyNumController extends AdminController
{


    /**
     * 用户列表
     * 
     */
    public function index()
    {

        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['manage_name|username|account'] = array(
                $condition,
                $condition,
                $condition,
                '_multi' => true,
            );
        }
        
        $map['type']='buy_num';
        #++++转账明细++++++
        $adminzgz=M('fruit_in');
         //分页
        $p=getpage($adminzgz,$map,10);
        $page=$p->show();  

        $data_list     = $adminzgz
            ->where($map)
            ->order('id desc')
            ->select();

        #+++++平台总数据+++++
        $total=$adminzgz->where(array('type'=>'buy_num'))->sum('num');
        // #+++++平台总数据+++++
        
        $this->assign('total',$total);   
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    /**
     * 新增用户
     * 
     */
    public function add()
    {
        if (IS_POST) {
              
           $account=I('post.account');
           $num=I('post.num');
           if(empty($account)){
                $this->error('用户账号不能为空');
           }
           if(empty($num)){
                $this->error('数量不能为空');
           }
           if(!preg_match('/^[1-9]\d*$/',$num)){
               $this->error('请输入整数');
           }


           $dbst=M('store');
           $dbazg=M('fruit_in'); // 播发给用户记录表
           $u_info=D('User')->where(array('account'=>$account))->field('account,username,userid')->find();
           if(empty($u_info)){
                 $this->error('账号错误或用户不存在');
           }

           #查询平台总充值了多少水果
           $admin_kucun=M('admin_kucun');//平台仓库表
           $kucun_info=$admin_kucun->order('id')->find();
           $less_num=$kucun_info['less_num'];
           $kucun_id=$kucun_info['id'];
           if ($less_num < $num) {
                $this->error('库存不足'); 
           }

           $uid=$u_info['userid'];

           $dbst->startTrans();
           $up=$dbst->where(array('uid'=>$uid))->setInc('cangku_num',$num);
            //减少系统总库存
            if(!$up){
               $dbst->rollback();
               $this->error('转入失败'); 
            }

            $kucun_res=$admin_kucun->where(array('id'=>$kucun_id))->setDec('less_num',$num);
            if(!$kucun_res){
               $dbst->rollback();
               $this->error('转入失败'); 
            }
           
          
          
           //把数据记录到金猫崽流水明细
             $m_info=session('user_auth');
             $manage_id=$m_info['uid'];
             $data['manage_id']=$manage_id;//管理者ID
             $data['manage_name']=$m_info['username'];
             $data['uid']=$uid; //用户ID
             $data['num']=$num; //转账数量
             $data['create_time']=time();
             $data['ip']=get_client_ip();
             $data['type']='buy_num';
             $data['content']=I('content');
             $data['username']=$u_info['username'];
             $data['account']=$u_info['account'];
             $res=$dbazg->data($data)->add();


            #++添加果子明细+S++
            $trading['trading_type']=1;
            $trading['num']=$num;
            $trading['to_id']=0;
            $trading['uid']=$uid;
            $trading['trading_name']='平台转入';
            $trading['content']=I('content');
            add_trading($trading);
            #++添加果子明细+E++  
           
            if ($res){
              $dbst->commit();
              $this->success('操作成功');
            } 
            else{
              $dbst->rollback();
              $this->error('操作失败');
            }
            
        } else {
                $this->display();
        }
    }

   
}
