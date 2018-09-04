<?php
namespace Admin\Controller;
use Think\Controller;
class SellNumController extends AdminController {
      #会员列表
    public function index(){

          $keywork=I('keyword');
          if($keywork){
            $where['username|mobile']=array('like','%'.$keywork.'%');
          }
          $state=I('state');
          if($state!=''){
            $where['state']=$state;
          }
          $table=M('sellnum');
          $p = getpage($table, $where, 10);
          $pageshow   = $p->show();
          $userArr=$table->where($where)
                           ->order('id desc')
                           ->select();

          $this->assign(array(
              'list'=>$userArr,
              'table_data_page'=>$pageshow,
          ));
         $this->display();
      }

       public function setState(){

          $state=I('state');
          $id=I('id',0,'intval');
          $table=M('sellnum');
          $where['id']=$id;
          $info=$table->where($where)->field('state,num,uid')->find();
          $old_state=$info['state'];
          if($old_state!=0){
            $this->error('不可操作');
          }
          $res=$table->where($where)->setField('state',$state);
          if($res)
          {
            //退回果子
            if($state==2){
               if(!M('store')->where(array("uid"=>$info['uid']))->setInc('cangku_num',$info['num'])){
                  $this->error('操作失败');
                }
            }

            $this->success('操作成功');

          }else{
            $this->error('操作失败');
          }
       }

       public function delete(){
         $id=I('id',0,'intval');
         if($id){
            M('sellnum')->delete($id);
            $this->success('操作成功');
         }
       }


}

