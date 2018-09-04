<?php
namespace Home\Controller;
use Think\Controller;
class WxPayController extends Controller
{
    //微信支付异步回调
    public function WxReturn()
    {
       $order_no=I('order_no');
       $order_no=safe_replace($order_no);
       if(empty($order_no)){
         return false;
       }
       $where['order_no']=$order_no;
       $where['order_status']=0;
       $order=M('order');
       $o_info=$order->where($where)->find();
       if(empty($o_info)){
         return false;
       }
       //修改订单状态
       $res=$order->where($where)->setField('order_status',1);
       if(!$res){
         return false;
       }

        //给用户增加道具
       $tool_id=$o_info['tool_id'];
       $uid=$o_info['uid'];

       //判断是否是树
       $order_type=$o_info['order_type'];
       if($order_type==1){

        $this->kaiken($tool_id,$uid);

       }else{
      
           //取道具表
           $tool=M('tool')->field('t_type,t_fieldname,t_value')->find($tool_id);
           if($tool['t_type']==2){
                $field=$tool['t_fieldname'];
                M('user_level')->where(array('uid'=>$uid))->setField($field,$tool['t_value']);
           }
           //一键采蜜、狗粮
           if($tool['t_type']==1){
                $time=time();
                $month=$o_info['tool_num'];

                //检查是否已购买过
                $table=M('user_tool_month');
                $mwhere['uid']=$uid;
                $count=$table->where($mwhere)->count(1);
                if($count==0){
                    $table->add(array('uid'=>$uid));
                }
                $field_arr=array(2=>'end_oneclick_time',1=>'end_dogfood_time');
                $old_time=$table->where($mwhere)->getField($field_arr[$tool_id]);
                if($old_time==0)
                   $old_time=time(); 
                
                $end_time=strtotime("+{$month} months", $old_time);//到期时间  
                $data[2]=array('oneclick'=>$tool_id,'buy_oneclick_time'=>$time,'end_oneclick_time'=>$end_time);
                $data[1]=array('dogfood'=>$tool_id,'buy_dogfood_time'=>$time,'end_dogfood_time'=>$end_time);

                $table->where($mwhere)->save($data[$tool_id]);
           }
        }
    }


    private function kaiken($id,$uid){

         if($id==8 || $id==36){
           $type=1;
         }elseif ($id==10) {
           $type=2;
         }elseif ($id==12) {
           $type=3;
         }else{
            return false;
         }

          //农田里最低的果子数  
          $config=D('config');
          $min_guozi=$config->where(array('id'=>$id))->getField('value');
          

          $db_store=M('Store');
          $userid=$uid;

          $des_num=$min_guozi;
          $is_land=no_land();
          if($is_land && $id!=36){
            $des_num=$des_num+30;
           
          }

          $db_farm=M('nzusfarm');
          $db_farm->startTrans();

          $where['uid']=$userid;
          $where['farm_type']=$type;
          $where['status']=0;
          $farm=$db_farm->where($where)->order('f_id asc')->field('id,f_id')->find();
          if(empty($farm)){
              return false;
          }



          $data['status']=1;
          $data['seeds']=$min_guozi;
          if($id==36){
            $data['farm_type']=4;
          }
          $res=$db_farm->where(array('id'=>$farm['id']))->save($data);//把树种到地里
          if($res===false){
            $db_farm->rollback();
            return false;
          }

          //去更新仓库表
          $s_data = array(
            'plant_num' => array('exp', '`plant_num`+'.$min_guozi),
          );

          $res=$db_store->where(array('uid'=>$userid))->save($s_data);
          if($res===false){
            $db_farm->rollback();
            return false;
          }

          //给上级奖励
          if($is_land && $id!=36){
            $pid=M('user')->where(array('userid'=>$userid))->getField('pid');
            if($pid>0){
              $db_store->where(array('uid'=>$pid))->setInc('cangku_num',20);
            }
          }

          // 添加开地记录
          $databz['uid']=$userid;
          $databz['farm_id']=$farm['f_id'];
          $databz['num']=$min_guozi;
          $databz['farm_type']=$type;
          $databz['sow_time']=time();
          $k_res=M('kaidi')->data($databz)->add();

          //添加种树数量
          M('user_level')->where(array("uid"=>$userid))->setInc('land_num',1);
          //给用户添加等级
          AddUserLevel($userid);

          if($res) {
             $db_farm->commit();
            
          }else{
             $db_farm->rollback();
            
          }

  }


}
