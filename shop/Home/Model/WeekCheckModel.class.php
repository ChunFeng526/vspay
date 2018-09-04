<?php
namespace Home\Model;
use Common\Model\ModelModel;

class WeekCheckModel extends ModelModel
{

    public function __construct(){
        $this->week=M('week');
        $this->config=D('Config');
        $this->user=D('User');
        $this->store=D('Store');
    }

    /**
     * 计算每周收益
     */
    public function WeekCome($userid){
       
        // $userid=user_login();//用户ID
        //判断本周是否已执行
        $week_where['uid']=$userid;
        $week_where['Year']=date('Y');
        $week_where['Week']=date('W');
        $count=$this->week->where($week_where)->count();
        if($count>0){
            return ;
        }

        $nzusfarm=M('nzusfarm');
        $where['uid']=$userid;
        $where['status']=1;
        $farm=$nzusfarm->where($where)->field('farm_type,sum(seeds) as seeds')->group('farm_type')->order('farm_type')->select();

        $lv=$this->CarFee($userid);//三种车的拆分概率
        $total=0;
        foreach ($farm as $k => $val) {
            $u_vl=$lv[$val['farm_type']];
            $num=$val['seeds']*$u_vl;
            $total+=$num;
        }
        if($total==0){
            return ;
        }

         //=======判断用户注册日期,如果注册没到7天，按注册时长计算===S===
        $week=SearchDate();
        $reg_date=$this->user->where(array('userid'=>$userid))->getField('reg_date');
        $reg_date=date('Y-m-d',$reg_date);

        $week_start=$week['week_start']+86400; //周二注册算六天，周一注册算七天
        $week_end=$week['week_end'];
        $time=date('Y-m-d',$week_end);
        //计算量日期差
        $be_day=$this->diffBetweenTwoDays($reg_date,$time);
        $be_day=intval($be_day);
        if($be_day<7){
            $total=$total/7*$be_day;
        }
        //=======判断用户注册日期,如果注册没到7天，按注册时长计算===E===


        $store=$this->store;
        $res=$store->IncNum($total,array('uid'=>$userid));
        $huafei_total=$store->IncHuaFei($total,array('uid'=>$userid));
        if($res===false){
            return false;
        }

        //添加生生在记录
        $this->GrowthDetail($userid,$total,$huafei_total);

        //从好友采矿拆分
        $this->FriendsCome($userid);

        //添加本周标记，表示已拆分
        $this->WeekMark($userid);
        echo "string";
    }

   

    //求两个日期之间相差的天数
    private function diffBetweenTwoDays($day1,$day2)
    {
      $sec1=strtotime($day1);
      $sec2=strtotime($day2);
      if($sec1 < $sec2){
        $tmp=$sec2;
        $sec2=$sec1;
        $sec1=$tmp;
      }

       $day=($sec1-$sec2)/86400;
       return intval($day);
    }



    private function WeekMark($userid){
        $week=$this->week;
        $data['uid']=$userid;
        $count=$week->where($data)->count();
        //添加数据
        $data['Year']=date('Y');
        $data['Week']=date('W');
        $data['create_time']=time();
        if($count>0){
            $week->save($data);
        }else{
            $week->add($data);
        }
    }

    private function GrowthDetail($userid,$num,$huafei_total){
        $data['uid']=$userid;
        $data['num']=$num;
        $data['creat_time']=time();
        $data['total']=$huafei_total;
        $data['Year']=date('Y');
        $data['Week']=date('W');
        $res=M('growth')->add($data);
        return $res;
    }

    //获取三种车的拆分概率
    private function CarFee($userid){
        $config=$this->config;
        //直推拆分
        $level=$this->user->where(array('userid'=>$userid))->getField('level');
        $recommend_lv=0;
        if($level>0){
            $name=array(1=>'LEVEL1',2=>'LEVEL2',3=>'LEVEL3',4=>'LEVEL4');
            $recommend_lv=$config->getValue($name[$level]);
            $recommend_lv=$recommend_lv/100;
        }

        $data=$config->getCarFee();//三种车的拆分概率
        //签到拆分
        $sign_lv=$this->FullWeek($userid);

        foreach ($data as $k => $v) {
            $lv[$k+1]=$v/100+$sign_lv+$recommend_lv;
        }

        return $lv;
    }


    #++++++玩家每周连续登陆操作采矿动作，本周的拆分率+0.5%作为奖励+++++S+++#
    private function FullWeek($userid){
        $where['uid']=$userid;
        //获取上周记录
        $week=SearchDate();
        $where['_string']="create_time BETWEEN ".$week['week_start']." AND ".$week['week_end'];
        $sign_count=M('sign')->where($where)->count(1);//每周签到次数
        $lv=0;
        if($sign_count==7){
            $lv=0.5/100;
        }
        return $lv;
    }

    //从好友采矿拆分
    private function FriendsCome($userid){
        $caimi_week=M('caimi_week');
        $where['uid']=$userid;
        //获取上周记录
        $week=SearchDate();
        $where['_string']="create_time BETWEEN ".$week['week_start']." AND ".$week['week_end'];
        $info=$caimi_week->field('id,fid,f_level,count(1) as caimi_count')->where($where)->group('fid')->order('f_level')->select();

        if(empty($info)){
            return ;
        }
        //取一级二级拆分概率
        $one_lv=$this->config->getValue('FRIENDS_ONE');
        $two_lv=$this->config->getValue('FRIENDS_TWO');
        $total=0;
        $growth=M('growth');
        $swhere['Year']=date('Y');
        $swhere['Week']=date('W');
        foreach ($info as $k => $val) {
            $f_level=$val['f_level'];
            $fid=$val['fid'];
            $count=$val['caimi_count'];//共签到几天
            $f_level==0 ? $lv=$one_lv : $lv=$two_lv;
            //获取好友本周收益,收益是同一周计算，直接去当前周
            $swhere['uid']=$fid;
            $num=$growth->where($swhere)->getField('num');
            if($num>0){
                $lv_num=$lv/100*$num;
                $lv_num=$lv_num/7*$count;
                $total+=$lv_num; 
            }
            $caimi_week->delete($val['id']);
        }

        $this->store->IncNum($total,array('uid'=>$userid));
        $this->store->where(array('uid'=>$userid))->setInc('fengmi_num',$total);
        //添加自己的采蜜收益
        $swhere['uid']=$userid;
        $growth->where($swhere)->setField('caimi_num',$total);
        $growth->where($swhere)->setInc('total',$total);
    }
    
}
