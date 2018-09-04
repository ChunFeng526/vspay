<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * 
 */
class UserController extends AdminController
{


    /**
     * 用户列表
     * 
     */
     public function index()
    {


         // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','userid','string');
        $status     = I('status');
        if($keyword){
            $condition = $keyword ;
            $map[$querytype] = $condition;
        }
        

         //按日期搜索
        $date=date_query('reg_date');
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
        $user   = M('user a');
        if(!isset($map)){
            $map=true;
        }


        // //按日期搜索
        // $date=date_query('reg_date');
        // if($date){
        //     $where=$date;
        //     if($map)
        //         $map=array_merge($map,$where).' and sex==0';
        //     else
        //         $map=$where.' and sex==0';
        // }

        // if($status=='0' || $status=='1'){
        //      $map['a.status']=$status;
        // }
        //  //$map=$map.' sex=0';
        // // 获取所有用户
        // $user   = M('user a');

        //========排序=========
        $order_str='a.userid desc';
       
        //========排序=========

        //分页
        $table=$user->join('ysk_store b on a.userid=b.uid','left');
        $p=getpage($table,$map,15);
        $page=$p->show();  

        $data_list     = $table
            ->field('a.userid,a.username,a.email,a.yinbi,a.account,a.mobile,a.reg_date,a.status,a.pid,b.cangku_num,b.fengmi_num')
            ->where($map)
            ->order($order_str)
            ->select();
       
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

           $admin_kucun=M('admin_kucun');//平台仓库表
            #查询平台总充值了多少水果
           $kucun_info=$admin_kucun->order('id')->find();
           $less_num=$kucun_info['less_num'];
           $kucun_id=$kucun_info['id'];
           if ($less_num < 300) {
                $this->error('平台库存不足'); 
           }


            // 提交数据
            $user_object = D('User');

            $data        = $user_object->create();
            if(!$data){
                $this->error($user_object->getError());
            }
            $parent=I('post.paccount');
            if(empty($parent)){
                $this->error('上级不能为空');
            }
            $where['account']=$parent;
            $p_info=$user_object->where($where)->field('userid,pid,username,mobile')->find();
            if(empty($p_info)){
                $this->error('上级账号错误或不存在');
            }

            $pid=$p_info['userid']; //上级ID

            $data['pid']=$p_info['userid'];
            $gid=$p_info['pid'];//上上级ID
            if($gid){
                $data['gid']=$gid;
            }

            //登录密码加密
            $salt= substr(md5(time()),0,3);
            $data['login_pwd']=$user_object->pwdMd5($data['login_pwd'],$salt);
            $data['login_salt']=$salt;
            //交易密码加密
            $data['safety_pwd']=$user_object->pwdMd5($data['safety_pwd'],$salt);
            $data['safety_salt']=$salt;

            $user_object->startTrans();
            if ($data) {
                $result = $user_object->add($data);
                if ($result) {
                    $uid=$result;
                    //为新会员创建仓库和土地
                    if(!D('Home/Store')->CreateCangku(300,$result)){
                        $user_object->rollback();
                        $this->error('仓库创建失败');
                    }

                    //判断他直推的人是多少奖励稻草人
                    $count=$user_object->where(array('pid'=>$pid))->count(1); 
                    if($count>=10){

                        if($count>=10 && $count<20){
                          $ren=1;
                        }
                        if($count>=20 && $count<30){
                          $ren=2;
                        }
                        if($count>=30 && $count<40){
                          $ren=3;
                        }
                        if($count>=40){
                          $ren=4;
                        }
                        if($ren){
                          M('user_level')->where(array('uid'=>$pid))->setField('dcr_num',$ren);
                        }
                    }

                    //给推荐人奖励20个种子
                    $table=M('user_seed');
                    $seed_where['uid']=$pid;
                    $count=$table->where($seed_where)->count(1);
                    if($count==0){
                      $data['uid']=$pid;
                      $data['zhongzi_num']=20;
                      $table->where($seed_where)->add($data);
                    }else{
                      $table->where($where)->setInc('zhongzi_num',20);
                    }


                    
                    //添加种子明细
                    $zz['uid']=$pid;
                    $zz['recommond_id']=$uid;
                    $zz['recommond_account']=$data['account'];
                    $zz['recommond_name']=$data['username'].'(后台注册)';
                    $zz['seed_num']=20;
                    $zz['time']=time();
                    $hdzz=M('zhongzijiangli')->data($zz)->add();



                    //减少系统总库存
                    if(!$admin_kucun->where(array('id'=>$kucun_id))->setDec('less_num',300)){
                        $user_object->rollback();
                        $this->error('操作失败');
                    }

                    //把数据记录到流水明细
                     $m_info=session('user_auth');
                     $manage_id=$m_info['uid'];
                     $data['manage_id']=$manage_id;//管理者ID
                     $data['manage_name']=$m_info['username'];
                     $data['uid']=$result; //用户ID
                     $data['guozi_num']=300; //转账数量
                     $data['create_time']=time();
                     $data['before_cangku_num']=0; //转账前仓库数量
                     $data['after_cangku_num']=300; //转账后仓库数量
                     $data['ip']=get_client_ip();
                     $data['type']=1;
                     $data['content']='后台注册会员:'.$data['account'];
                     $data['username']=$data['username'];
                     $data['account']=$data['account'];
                     $jl=M('admin_zhuangz')->data($data)->add();



                    $user_object->commit();
                    $this->success('操作成功', U('index'));
                } else {
                    $user_object->rollback();
                    $this->error('操作失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
               
                $this->display();
        }
    }

    /**
     * 编辑用户
     * 
     */
    public function edit($id)
    {
        if (IS_POST) {
            if(empty($_POST['login_pwd'])){
                unset($_POST['relogin_pwd']);
            }
            if(empty($_POST['safety_pwd'])){
                unset($_POST['resafety_pwd']);
            }


            // 提交数据
            $user_object = D('User');
            $data        = $user_object->create();

            //如果没有密码，去掉密码字段
            if(empty($data['login_pwd']) || trim($data['login_pwd'])==''){
                unset($data['login_pwd']);
            }
            else{
              $salt= substr(md5(time()),0,3);
               $data['login_pwd']=$user_object->pwdMd5($data['login_pwd'],$salt);
               $data['login_salt']=$salt;
            }
            if(empty($data['safety_pwd']) || trim($data['safety_pwd'])==''){
                unset($data['safety_pwd']);
            }
            else{
              $salt= substr(md5(time()),0,3);
               $data['safety_pwd']=$user_object->pwdMd5($data['safety_pwd'],$salt);
               $data['safety_salt']=$salt;
            }

            if(empty($data['quanxian']) ){
                $data['quanxian'] = '';
            }
            else{

              $quanxian= join("-",$data['quanxian']);
               
               $data['quanxian']=$quanxian;
            }


            if ($data) {
             // var_dump($data);die;
                $result = $user_object
                    ->field('userid,account,quanxian,username,mobile,email,safety_pwd,safety_salt,login_pwd,login_salt,sex')
                    ->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {

            // 获取账号信息
            $info = D('User')->find($id);
            unset($info['password']);
            $parent=D('User')->where(array('userid'=>$info['pid']))->getField('account');
            $info['parent']=$parent ? $parent :'无';
            $quanxian=explode("-",$info['quanxian']);
            $this->assign('info',$info);
            $this->assign('quanxian',$quanxian);
            //var_dump($quanxian);die;
            $this->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        $ids = I('request.ids');
        if (is_array($ids)) {
            if (in_array('1', $ids)) {
                $this->error('超级管理员不允许操作');
            }
        } else {
            if ($ids === '1') {
                $this->error('超级管理员不允许操作');
            }
        }
        parent::setStatus($model);
    }


 /**
     * 设置会员隐蔽的状态
     * 
     */
    public function setStatus1($model = CONTROLLER_NAME)
    {
        $id =(int)I('request.id');    
        $userid =(int)I('request.userid');    
        
         $user_object = D('User');    
        $result=D('User')->where(array('userid'=>$userid))->setField('yinbi',$id);
        if ($result) {
                    $this->success('更新成功', U('index'));
         }else {
                    $this->error('更新失败', $user_object->getError());
                }
    }



     /**
     * 编辑用户
     * 
     */
    public function AddFruits($id)
    {
        if (IS_POST) {
              
           $dbst=M('store');
           $dbazg=M('admin_zhuangz'); // 播发给用户记录表
           $admin_kucun=M('admin_kucun');//平台仓库表
           $uid=I('post.userid',0,'intval');
           $cangku_num=I('post.cangku_num');
           if(empty($cangku_num)){
                $this->error('数量不能为空');
           }
           if(!preg_match('/^[1-9]\d*$/',$cangku_num)){
               $this->error('请输入整数');
           }
            $opetype=I('post.opetype');

            if($opetype < 1){
                $this->error('请选择操作类型');
            }
            if($opetype == 1){
                $sqlname='cangku_num';
            }else{
                $sqlname='fengmi_num';
            }
           $dbst->startTrans();

           //判断库存是否还大于0
           $add_cangku=I('post.add_cangku');
           $des_cangku=I('post.des_cangku');
           #++++添加+++++
           if(!empty($add_cangku) && empty($des_cangku)){
               $before_cangku_num=$dbst->where('uid='.$uid)->getField($sqlname);
               $up=$dbst->where('uid='.$uid)->setInc($sqlname,$cangku_num);

                //添加余额记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield($sqlname);
                $jifen_dochange['now_nums'] = $pay_n;
                $jifen_dochange['now_nums_get'] = $pay_n;
                $jifen_dochange['is_release'] = 1;
                $jifen_dochange['pay_id'] = 0;
                $jifen_dochange['get_id'] = $uid;
                $jifen_dochange['get_nums'] = $cangku_num;
                $jifen_dochange['get_time'] = time();
                if($sqlname=="cangku_num"){
                $jifen_dochange['get_type'] = 11; //余额
                }else{
                $jifen_dochange['get_type'] = 12; //积分
                }
  
                $res_addres = M('tranmoney')->add($jifen_dochange);
                 if ($up) {
                    $dbst->commit();
                    $this->success('修改成功');
                 }else{
                    $dbst->rollback();
                    $this->error('修改失败');
                 }

            }
            #++++减少+++++
            if(empty($add_cangku) && !empty($des_cangku))
            {
                 $up=$dbst->where('uid='.$uid)->setDec($sqlname,$cangku_num);

                //添加积分记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield($sqlname);
                $jifen_dochange['now_nums'] = $pay_n;
                $jifen_dochange['now_nums_get'] = $pay_n;
                $jifen_dochange['is_release'] = 1;
                $jifen_dochange['pay_id'] = 0;
                $jifen_dochange['get_id'] = $uid;
                $jifen_dochange['get_nums'] = -$cangku_num;
                $jifen_dochange['get_time'] = time();
                if($sqlname=="cangku_num"){
                $jifen_dochange['get_type'] = 11; //积分
                }else{
                $jifen_dochange['get_type'] = 12; //积分
                }
  
                $res_addres = M('tranmoney')->add($jifen_dochange);

                 if(!$up){
                    $dbst->rollback();
                 }
                if ($up) {
                    $dbst->commit();
                    $this->success('修改成功');

                }else{
                    $dbst->rollback();
                    $this->error('修改失败');
                } 
 
            }



          


        } else {

            // 获取账号信息
            $info = D('User')->field('userid,username,account')->find($id);
            $cangku_num=D('store')->where(array('uid'=>$info['userid']))->getField('cangku_num');
            $fengmi_num=D('store')->where(array('uid'=>$info['userid']))->getField('fengmi_num');
            $info['cangku_num']=$cangku_num;
            $info['fengmi_num']=$fengmi_num;

            $this->assign('info',$info);
            $this->display();
        }
    }

    //用户登录
    public function userlogin(){
        $userid=I('userid',0,'intval');
        $user=D('Home/User');
        $info=$user->find($userid);
        if(empty($info)){
            return false;
        }

        $login_id=$user->auto_login($info);
        if($login_id){
            session('in_time',time());
            session('login_from_admin','admin',10800);
            $this->redirect('Home/Index/index');
        }
    }
}
