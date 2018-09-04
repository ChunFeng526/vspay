<?php
namespace Home\ Controller;
use Think\Controller;
class TurntableController extends CommonController {
    /**
     * 直推奖励 
     */
//   public function test(){

    


//  $allid = M('deals')->Field("sell_id,id")->select();
// //dump($allid);die;
//   foreach ($allid as $k => $v) {


//         $uname = M('user')->where(array('userid'=>$v['sell_id']))->getField('username');       
//         $datapay["buy_uname"]=$uname;
//         $res_pay = M('deals')->where(array("id"=>$v['id']))->save($datapay);

       
//      }

//  }

    public function index(){

        $uid = session('userid');
        //查询当前币对应价格

         $coindets=array();
        for($i=1;$i<=5;$i++){
           $coindets[]= D('coindets')->where("cid=".$i)->order('coin_addtime desc')->find();

        }

    
        //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>array("neq",0)))->order('cid asc')->select();
        // var_dump($minecoins);
        //我的钱包地址 没有则自动生成
        $waadd = M('user')->where(array('userid'=>$uid))->getField('wallet_add');
        if(empty($waadd) || $waadd == ''){
            $waadd = build_wallet_add();

            M('user')->where(array('userid'=>$uid))->setField('wallet_add',$waadd);
        }
        $this->assign('coindets',$coindets);
        $this->assign('minecoins',$minecoins);
        $this->assign('waadd',$waadd);
        $this->assign('uid',$uid);

        $this->display();
    }

    // public function vip_grade(){
    //     $locknumd = M('store')->where(array('uid'=>$uid))->find();
    //     $locknum=$locknumd['plant_num']+$locknumd['huafei_total'];
    //     // $oldgrade = M('store')->where(array('uid'=>$uid))->getField('vip_grade');
    //     // $locknumz =$mwenums+$locknumd;//总资产低于相应币数就会降级
    //     // $locknum=$locknumz-$paynums;//当前总资产数
    //     $grade=0;
    //     if($locknum>=10000){
    //          $grade=3;
    //     }elseif($locknum>=5000){
    //          $grade=2;
    //     }elseif($locknum>=1000){
    //          $grade=1;
    //     }
    //     // $graden=$grade1>$grade?$grade:$grade1;//取最小的
    //     // if($oldgrade>$graden) $datapay['vip_grade'] = $graden;//只降级不升级

    //     // $datapay['plant_num'] = array('exp', 'plant_num - ' . $paynums);
    //     $res_pay = M('store')->where(array('uid'=>$uid))->save(array('vip_grade'=>$grade));//转出-NYT
    // }
    //转账的对象
    public function Checkuser(){
        $paynums = I('paynums','float',0);
        $getu = trim(I('moneyadd'));
        $uid = session('userid');
        $mwenums = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->getField('c_nums');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多Ypay币哦~',0);
        }

        $where['userid|mobile|wallet_add'] = $getu;
        $uinfo = M('user')->where($where)->Field('userid,username')->find();
        if($uinfo['userid'] == $uid){
            ajaxReturn('您不能给自己转账哦~',0);
        }

        if(empty($uinfo) || $uinfo == ''){
            ajaxReturn('您输入的转出地址有误哦~',0);
        }
        $getmsg = array('uname'=>$uinfo['username'],'getuid'=>$uinfo['userid']);
        ajaxReturn($getmsg,1);
    }



 //NYT
    public function Wbaobei(){
        $uid = session('userid');
        $step = I('step');
        if($step < 1){
            $step = 1;
        }


        $times=strtotime(date("Y-m-d"));
        $timee=$times+86400;

        $lastsy = M('wbao_detail')->where(array('uid'=>$uid,'type'=>array("in","3,4"),'create_time'=>array("between",$times.",".$timee)))->sum('num');
       

        if($step==1){
             $list=M('wbao_detail')->where("(type=3 or type=4) and uid=".$uid)->order("create_time desc")->select(); //转入记录

        }elseif($step==2){
             $list=M('wbao_detail')->where("type=1 and uid=".$uid)->order("create_time desc")->select(); //转入记录

        }elseif($step==3){
             $list=M('wbao_detail')->where("type=2 and uid=".$uid)->order("create_time desc")->select(); //转入记录

        }

        
        $wbd = M('store')->where(array('uid'=>$uid))->getField('huafei_total');
        $wbc = M('store')->where(array('uid'=>$uid))->getField('plant_num');
        $wbtotal=number_format($wbd+$wbc,4,".", "");
        $grade= M('store')->where(array('uid'=>$uid))->getField('vip_grade');

        $this->assign('step',$step);
        $this->assign('lastsy',$lastsy);
        $this->assign('wbc',$wbc);
        $this->assign('grade',$grade);
        $this->assign('wbtotal',$wbtotal);
        $this->assign('list',$list);
        $this->display();
    }



    //NYT转入页面
    public function WbaoIn(){

    $uid = session('userid');
    $mwenums = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->getField('c_nums');
    $this->assign('mwenums',$mwenums);
    $this->display();
    }



    //NYT冻结资产页面
    public function WBDongjie(){

    $uid = session('userid');
    $mwenums = M('store')->where(array('uid'=>$uid))->getField('plant_num');
    $this->assign('mwenums',$mwenums);
    $this->display();
    }





 //NYT转入核对
    public function WBCheckuser(){
        $paynums = I('paynums','float',0);
        $paynums = (float)$paynums;



        $uid = session('userid');
        $mwenums = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->getField('c_nums');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多Ypay币哦~',0);
        }

   
        $getmsg = array('uname'=>$uinfo['username'],'getuid'=>$uinfo['userid']);
        ajaxReturn($getmsg,1);
    }


//NYT转出核对
    public function WBCheckuser1(){
        $paynums = I('paynums','float',0);
        $paynums = (float)$paynums;

        $uid = session('userid');
        $mwenums = M('store')->where(array('uid'=>$uid))->getField('plant_num');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多NYT可用资产哦~',0);
        }

   
        $getmsg = array('uname'=>$uinfo['username'],'getuid'=>$uinfo['userid']);
        ajaxReturn($getmsg,1);
    }



    //NYT转出页面
    public function WbaoOut(){

    $uid = session('userid');
    $mwenums = M('store')->where(array('uid'=>$uid))->getField('plant_num');
    $this->assign('mwenums',$mwenums);
    $this->display();
    }


// NYT冻结资产
    public function WBDong(){
        $paynums = I('paynums','float',0);
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        $mwenums = M('store')->where(array('uid'=>$uid))->getField('plant_num');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多NYT可用资产哦~',0);
        }
        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //冻结减NYT可用资产 加锁定资产  

        $locknumy = M('store')->where(array('uid'=>$uid))->getField('huafei_total');
        $locknum=$locknumy+$paynums;
        $grade=0;
        if($locknum>=10000){
             $grade=3;
        }elseif($locknum>=5000){
             $grade=2;
        }elseif($locknum>=1000){
             $grade=1;
        }

        $datapay['vip_grade'] =$grade;
        $datapay['plant_num'] = array('exp', 'plant_num - ' . $paynums);
        $datapay['huafei_total'] = array('exp', 'huafei_total + ' . $paynums);
        $res_pay = M('store')->where(array('uid'=>$uid))->save($datapay);

        if($res_pay){

        //添加NYT交易记录
        $wbaoss["crowds_id"]=0;
        $wbaoss["create_time"]=time();
        $wbaoss["num"]=$paynums;
        $wbaoss["uid"]=$uid;
        $wbaoss["dprice"]=0;
        $wbaoss["tprice"]=0;
        $wbaoss["type"]=5;//锁定资产
        $wbao_ss = M('wbao_detail')->add($wbaoss);

            ajaxReturn('NYT可用资产锁定成功',1,"Wbaobei");
        }else{
            ajaxReturn('NYT可用资产锁定失败',0);
        }
    }



 // NYT转出
    public function WBgetout(){
        $paynums = I('paynums','float',0);
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        $mwenums = M('store')->where(array('uid'=>$uid))->getField('plant_num');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多NYT可用资产哦~',0);
        }
          if($paynums<=0){
            ajaxReturn('非法操作~',0);
        }

        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);


        //一旦用户转出小于某数量的币，则等级会降
        $grade1=3;
        if($paynums<1000){
             $grade1=0;
        }elseif($paynums<5000){
             $grade1=1;
        }elseif($paynums<10000){
             $grade1=2;
        }

        //转出减NYT可用资产 加Ypay币  

        $locknumd = M('store')->where(array('uid'=>$uid))->getField('huafei_total');
        $oldgrade = M('store')->where(array('uid'=>$uid))->getField('vip_grade');
        $locknumz =$mwenums+$locknumd;//总资产低于相应币数就会降级
        $locknum=$locknumz-$paynums;//当前总资产数
        $grade=0;
        if($locknum>=10000){
             $grade=3;
        }elseif($locknum>=5000){
             $grade=2;
        }elseif($locknum>=1000){
             $grade=1;
        }
        $graden=$grade1>$grade?$grade:$grade1;//取最小的
        if($oldgrade>$graden) $datapay['vip_grade'] = $graden;//只降级不升级

        $datapay['plant_num'] = array('exp', 'plant_num - ' . $paynums);
        $res_pay = M('store')->where(array('uid'=>$uid))->save($datapay);//转出-NYT
     
        $payout['c_nums'] = array('exp', 'c_nums + ' . $paynums);
        $res_pay = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->save($payout);//转出+Ypay




        if($res_pay){

        //添加NYT交易记录
        $wbaoss["crowds_id"]=0;
        $wbaoss["create_time"]=time();
        $wbaoss["num"]=$paynums;
        $wbaoss["uid"]=$uid;
        $wbaoss["dprice"]=0;
        $wbaoss["tprice"]=0;
        $wbaoss["type"]=1;//转出
        $wbao_ss = M('wbao_detail')->add($wbaoss);

            ajaxReturn('NYT可用资产转出成功',1,"Wbaobei");
        }else{
            ajaxReturn('NYT可用资产转出失败',0);
        }
    }


// NYT转入
    public function WBgetin(){
        $paynums = I('paynums','float',0);

        $pwd = trim(I('pwd'));
        $uid = session('userid');
        $mwenums = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->getField('c_nums');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多Ypay币哦~',0);
        }

         if($paynums<=0){
            ajaxReturn('非法操作~',0);
        }


        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //转入加NYT可用资产 减Ypay币  
        
        $datapay['plant_num'] = array('exp', 'plant_num + ' . $paynums);
        $res_pay = M('store')->where(array('uid'=>$uid))->save($datapay);//转出+Ypay
        //转出的扣钱
        $payout['c_nums'] = array('exp', 'c_nums - ' . $paynums);
        $res_pay = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->save($payout);//转出-Ypay

        if($res_pay){

        //添加NYT交易记录
        $wbaoss["crowds_id"]=0;
        $wbaoss["create_time"]=time();
        $wbaoss["num"]=$paynums;
        $wbaoss["uid"]=$uid;
        $wbaoss["dprice"]=0;
        $wbaoss["tprice"]=0;
        $wbaoss["type"]=2;//转入
        $wbao_ss = M('wbao_detail')->add($wbaoss);

            ajaxReturn('Ypay币转入成功',1,"Wbaobei");
        }else{
            ajaxReturn('Ypay币转入失败',0);
        }
    }




       


//    Ypay转入
    public function Wegetin(){
        $paynums = I('paynums','float',0);
        $getu = trim(I('moneyadd'));
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        $mwenums = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->getField('c_nums');
        if($paynums > $mwenums){
            ajaxReturn('您当前暂无这么多Ypay币哦~',0);
        }

        $where['userid|mobile|wallet_add'] = $getu;
        $uinfo = M('user')->where($where)->Field('userid,username')->find();
        if($uinfo['userid'] == $uid){
            ajaxReturn('您不能给自己转账哦~',0);
        }

        if(empty($uinfo) || $uinfo == ''){
            ajaxReturn('您输入的转出地址有误哦~',0);
        }

        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //转入的加钱
        $issetgetu = M('ucoins')->where(array('c_uid'=>$uinfo['userid'],'cid'=>1))->count(1);
        if($issetgetu <= 0){
            $coinone['cid'] = 1;
            $coinone['c_nums'] = 0.0000;
            $coinone['c_uid'] = $uinfo['userid'];
            M('ucoins')->add($coinone);
        }
        $datapay['c_nums'] = array('exp', 'c_nums + ' . $paynums);
        $res_pay = M('ucoins')->where(array('c_uid'=>$uinfo['userid'],'cid'=>1))->save($datapay);//转出+Ypay
        //转出的扣钱
        $payout['c_nums'] = array('exp', 'c_nums - ' . $paynums);
        $res_pay = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>1))->save($payout);//转出-Ypay

        //转入的人+20%积分记录EEE
        $jifen_dochange['pay_id'] = $uid;
        $jifen_dochange['get_id'] = $uinfo['userid'];
        $jifen_dochange['get_nums'] = $paynums;
        $jifen_dochange['get_time'] = time();
        $jifen_dochange['get_type'] = 1;
        $res_tran = M('wetrans')->add($jifen_dochange);
        if($res_tran){
            ajaxReturn('Ypay币转出成功',1,"index");
        }else{
            ajaxReturn('Ypay币转出失败',0);
        }
    }

    public function Trans(){
        $type = I('type','intval',0);
        $traInfo = M('wetrans');
        $uid = session('userid');
        if($type == 1){
            $where['pay_id'] = $uid;
        }else{
            $where['get_id'] = $uid;
        }

        $where['get_type'] = 1;
        //分页
        $p = getpage($traInfo, $where, 15);
        $page = $p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k => $v) {
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d', $v['get_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s', $v['get_time']);
            $Chan_info[$k]['outinfo'] = M('user')->where(array('userid'=>$v['get_id']))->getField('username');
            $Chan_info[$k]['ininfo'] = M('user')->where(array('userid'=>$v['pay_id']))->getField('username');

            //转入转出
            if ($type == 1) {
                $Chan_info[$k]['trtype'] = 1;
            } else {
                $Chan_info[$k]['trtype'] = 2;
            }
        }
        if (IS_AJAX) {
            if (count($Chan_info) >= 1) {
                ajaxReturn($Chan_info, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }
        $this->assign('page', $page);
        $this->assign('Chan_info', $Chan_info);
        $this->assign('type',$type);
        $this->display();
    }


    public function Turnout(){

        $this->display();
    }


    //金积分交易
    public function transaction(){

        $cid = (int)I('cid','intval',0);
       
       if($cid=='intval')$cid=1;
        $uid = session('userid');

        //查询当前币对应价格名称信息
        $coindets = M('coindets')->order('coin_addtime desc,cid asc')->where(array("cid"=>$cid))->find();
 
         //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->order('id asc')->find();
        $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');

         //交易列表

        $deals = M('deal a')->join('ysk_user b ON a.sell_id=b.userid')->field('b.username as u_name,a.id as d_id,b.account as u_account,b.img_head as u_img_head,a.num as d_num,a.dprice as d_dprice,a.id as d_id')->where(array("a.type"=>1,"a.status"=>0,"a.cid"=>$cid))->limit($page, 5000)->order('dprice asc')->select();
      
        $this->assign('coindets',$coindets);
        $this->assign('deals',$deals);
        $this->assign('minecoins',$minecoins);
        $this->assign('my_yue',$my_yue);
        $this->assign('cid',$cid);

        $this->display();

    }


//金积分购买
    public function yue_goumai(){

//防重复提交
    if(session("gou_last_time")){
                 if((int)time()-(int)session("gou_last_time") <10 ){           
                  ajaxReturn('对不起，10秒内不能频繁提交~',0);
                 }
    }

    
    $t = (int)time();
    session("gou_last_time", $t);
    

        $num = (float)I('num');
        $cid = (int)I('cid','intval',0);
        $dealid = I('dealid','intval',0);
        $dprice = trim(I('dprice'));
        $tprice = trim(I('tprice'));
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        

        $ss1 = M('deal')->where(array('id'=>$dealid,'type'=>1))->getField('num');
        $restn= $num-$ss1;

        if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
        if(!$num|!$tprice)ajaxReturn('交易币的数量不能为空~',0);
        if($restn>0)ajaxReturn('交易币的数量超过最大限制~',0);



        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //自己是否有足够金积分        
            $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if($tprice> $my_yue){
                ajaxReturn('您当前账户暂无这么多金积分~',0);
            }


        //挂卖单人的ID
        $sell_id = M('deal')->where(array('id'=>$dealid,'type'=>1))->getField('sell_id');

        if($uid==$sell_id){
                ajaxReturn('您不能和自己交易~',0);
            }
        //检查 store表和 coindets 表是否有记录

         $ishas_store_u = M('store')->where(array('uid'=>$uid))->count(1);
        if(!$ishas_store_u)M('store')->add(array('uid'=>$uid,'cangku_num'=>0.0000));   
        $ishas_store_s = M('store')->where(array('uid'=>$sell_id))->count(1);
        if(!$ishas_store_s)M('store')->add(array('uid'=>$sell_id,'cangku_num'=>0.0000));   


        $issetgetu = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->count(1);
        if($issetgetu <= 0){
            $coinone['cid'] = $cid;
            $coinone['c_nums'] = 0.0000;
            $coinone['c_uid'] = $uid;
            M('ucoins')->add($coinone);
        }


        $issetgets = M('ucoins')->where(array('c_uid'=>$sell_id,'cid'=>$cid))->count(1);
        if($issetgets <= 0){
            $coinone1['cid'] = $cid;
            $coinone1['c_nums'] = 0.0000;
            $coinone1['c_uid'] = $sell_id;
            M('ucoins')->add($coinone1);
        }

        //购买的加币的数量、减金积分    



        $datapay['c_nums'] = array('exp', 'c_nums + ' . $num);
        $res0 = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->save($datapay);

        $datapay1['cangku_num'] = array('exp', 'cangku_num - ' . $tprice);
        $res1 = M('store')->where(array('uid'=>$uid))->save($datapay1);

        //出售的扣币的数量、加金积分
        
        $payout['djie_nums'] = array('exp', 'djie_nums - ' . $num);
        $res2 = M('ucoins')->where(array('c_uid'=>$sell_id,'cid'=>$cid))->save($payout);

        $payout1['cangku_num'] = array('exp', 'cangku_num + ' . $tprice);
        $res3 = M('store')->where(array('uid'=>$sell_id))->save($payout1);


        $pay_n = M('store')->where(array('uid' => $uid))->getField('cangku_num');
        $get_n = M('store')->where(array('uid' => $sell_id))->getField('cangku_num');


        $changenums['now_nums'] = $pay_n;
        $changenums['now_nums_get'] = $get_n;
        $changenums['is_release'] = 1;                 
        $changenums['pay_id'] = $uid;
        $changenums['get_id'] = $sell_id;
        $changenums['get_nums'] = $tprice;
        $changenums['get_time'] = time();
        $changenums['get_type'] = 4;
        M('tranmoney')->add($changenums);


        //剩余数量，更新订单状态1，为匹配交易
        if($restn>=0)$deals["status"]=1;
        $deals["num"]=array('exp', 'num - ' . $num);
        $deal_s = M('deal')->where(array('id'=>$dealid,'type'=>1))->save($deals);

        //添加交易记录
        $buy_name = M('user')->where(array('userid'=>$uid))->getField('username');    

        $dealss["d_id"]=$dealid;
        $dealss["sell_id"]=$sell_id;
        $dealss["buy_id"]=$uid;
        $dealss["create_time"]=time();
        $dealss["buy_uname"]=$buy_name;
        $dealss["cid"]=$cid;
        $dealss["type"]=1;
        $dealss["num"]=$num;
        $dealss["dprice"]=$dprice;
        $dealss["tprice"]=$tprice;
        $deal_ss = M('deals')->add($dealss);

        if($res0&&$res3&&$deal_ss){
            ajaxReturn('购买成功',1,"/Turntable/Transaction");
        }else{
            ajaxReturn('购买失败',0);
        }

    }



//出售币
    public function yue_chushou(){

    if(session("chu_last_time")){
                 if((int)time()-(int)session("chu_last_time") <10 ){           
                  ajaxReturn('对不起，10秒内不能频繁提交~',0);
                 }
    }
    $t = (int)time();
    session("chu_last_time", $t);


        
        $num = (float)I('num');
        $cid = (int)I('cid','intval',0);
        $dealid = I('dealid','intval',0);
        $dprice = trim(I('dprice'));
        $tprice = trim(I('tprice'));
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        

         $ss1 = M('deal')->where(array('id'=>$dealid,'type'=>2))->getField('num');
         $restn= $num-$ss1;


        if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
        if(!$num|!$tprice)ajaxReturn('交易币的数量不能为空~',0);
        if($restn>0)ajaxReturn('交易币的数量超过最大限制~',0);
        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);



        //自己是否有足够币出售        
        $my_bi = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->getField('c_nums');            
            if($num> $my_bi){
                ajaxReturn('您当前账户暂无这么多币出售~',0);
            }


        //挂买单人的ID
        $sell_id = M('deal')->where(array('id'=>$dealid,'type'=>2))->getField('sell_id');
        if($uid==$sell_id){
                ajaxReturn('您不能和自己交易~',0);
            }


        //检查 store表和 coindets 表是否有记录

         $ishas_store_u = M('store')->where(array('uid'=>$uid))->count(1);
        if(!$ishas_store_u)M('store')->add(array('uid'=>$uid,'cangku_num'=>0.0000));   
        $ishas_store_s = M('store')->where(array('uid'=>$sell_id))->count(1);
        if(!$ishas_store_s)M('store')->add(array('uid'=>$sell_id,'cangku_num'=>0.0000));      



        $issetgetu = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->count(1);
        if($issetgetu <= 0){
            $coinone['cid'] = $cid;
            $coinone['c_nums'] = 0.0000;
            $coinone['c_uid'] = $uid;
            M('ucoins')->add($coinone);
        }


        $issetgets = M('ucoins')->where(array('c_uid'=>$sell_id,'cid'=>$cid))->count(1);
        if($issetgets <= 0){
            $coinone1['cid'] = $cid;
            $coinone1['c_nums'] = 0.0000;
            $coinone1['c_uid'] = $sell_id;
            M('ucoins')->add($coinone1);
        }

   
       

        //出售的减对应的币数、加对应的金积分
        $datapay['c_nums'] = array('exp', 'c_nums - ' . $num);
        $res_pay0 = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->save($datapay);

        $datapay1['cangku_num'] = array('exp', 'cangku_num + ' . $tprice);
        $res_pay1 = M('store')->where(array('uid'=>$uid))->save($datapay1);


        //购买的扣金积分、加币
         $payout['c_nums'] = array('exp', 'c_nums + ' . $num);
         $res_pay2 = M('ucoins')->where(array('c_uid'=>$sell_id,'cid'=>$cid))->save($payout);
         
         $payout1['cangku_num'] = array('exp', 'cangku_num - ' . $tprice);
         
         $res_pay3= M('store')->where(array('uid'=>$sell_id))->save($payout1);
        //  var_dump($res_pay3);
        // var_dump(M('store')->getLastSql());

        //更新订单状态1，为匹配交易
        if($restn>=0) $deals["status"]=1;
        $deals["num"]=array('exp', 'num - ' . $num);
        $deal_s = M('deal')->where(array('id'=>$dealid,'type'=>2))->save($deals);
//dump($res_pay3);die;

        //添加交易记录
        $buy_name = M('user')->where(array('userid'=>$sell_id))->getField('username');    

        $dealss["d_id"]=$dealid;
        $dealss["sell_id"]=$sell_id;
        $dealss["buy_id"]=$uid;
        $dealss["create_time"]=time();
        $dealss["buy_uname"]=$buy_name;
        $dealss["cid"]=$cid;
        $dealss["type"]=2;
        $dealss["num"]=$num;
        $dealss["dprice"]=$dprice;
        $dealss["tprice"]=$tprice;
        
        $deal_ss = M('deals')->add($dealss);



        $pay_n = M('store')->where(array('uid' => $sell_id))->getField('cangku_num');
        $get_n = M('store')->where(array('uid' => $uid))->getField('cangku_num');


        $changenums['now_nums'] = $pay_n;
        $changenums['now_nums_get'] = $get_n;
        $changenums['is_release'] = 1;  
        $changenums['pay_id'] = $sell_id;
        $changenums['get_id'] = $uid;
        $changenums['get_nums'] = $tprice;
        $changenums['get_time'] = time();
        $changenums['get_type'] = 5;
        M('tranmoney')->add($changenums);


        
        // var_dump($res_pay3);
       
        if($res_pay0&&$res_pay3&&$deal_ss){
            ajaxReturn('售出成功',1,"/Turntable/Transaction");

        }else{
            ajaxReturn('售出失败',0);
        }

    }



    //交易中心
    public function Transactionsell(){
        
       $cid = (int)I('cid','intval',0);
       if($cid=='intval')$cid=1;
        $uid = session('userid');

       //查询当前币对应价格名称信息
        $coindets = M('coindets')->order('coin_addtime desc,cid asc')->where(array("cid"=>$cid))->find();

         //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->order('id asc')->find();
        $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');

         //交易列表
              

        $deals = M('deal a')->join('ysk_user b ON a.sell_id=b.userid')->field('b.username as u_name,a.id as d_id,b.account as u_account,b.img_head as u_img_head,a.num as d_num,a.dprice as d_dprice,a.id as d_id')->where(array("a.type"=>2,"a.status"=>0,"a.cid"=>$cid))->limit($page, 5000)->order('d_dprice desc')->select();


      
        $this->assign('coindets',$coindets);
        $this->assign('cname',$cname);
        $this->assign('deals',$deals);
        $this->assign('minecoins',$minecoins);
        $this->assign('my_yue',$my_yue);
        $this->assign('cid',$cid);

        $this->display();


    }






//取消订单
 public function quxiao_order(){

$id = (int)I('id','intval',0);
$uid = session('userid');
$mydeal = M('deal')->where(array("id"=>$id,"sell_id"=>$uid))->find();

 if(!$mydeal)ajaxReturn('订单不存在~',0);

$type=$mydeal["type"];
$num=$mydeal["num"];
$cid=$mydeal["cid"];
$dprice=$mydeal["dprice"];
if($type==1){//为出售单，则返还剩余相应的币

        $payout['c_nums'] = array('exp', 'c_nums + ' . $num);
        $res1 = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->save($payout); 


}elseif($type==2){//为购买单，则返还剩余相应的金积分

         $tprice=$num*$dprice;
         $payout1['cangku_num'] = array('exp', 'cangku_num + ' . $tprice);
         $res2 = M('store')->where(array('uid'=>$uid))->save($payout1);


        //生成金积分记录
        $pay_n = M('store')->where(array('uid' => $uid))->getField('cangku_num');

        $changenums['now_nums'] = $pay_n;
        $changenums['now_nums_get'] = $pay_n;
        $changenums['is_release'] = 1;
        $changenums['pay_id'] = 0;
        $changenums['get_id'] = $uid;
        $changenums['get_nums'] = $tprice;
        $changenums['get_time'] = time();
        $changenums['get_type'] = 6;
        M('tranmoney')->add($changenums);


}
//把此订单状态设置为2，即为取消

 $payout2['status'] =2;
 $res3 =M('deal')->where(array("id"=>$id,"sell_id"=>$uid))->save($payout2);

    if($res3){       
    ajaxReturn('取消成功',0,"Orderinfos");
    }else{
    ajaxReturn('操作失败',0,"Orderinfos");
    }
}



    //提交发布出售订单
    public function T_Salesell(){

        $num = (float)I('num');
        $cid = (int)I('cid','intval',0);
        $dprice = trim(I('dprice'));
        $tprice = trim(I('tprice'));
        $pwd = trim(I('pwd'));
        $uid = session('userid');



        $nowprice=M('coindets')->where(array('cid'=>$cid))->order('coin_addtime desc')->getField('coin_price');

          if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
    
        if(!$num|!$tprice)ajaxReturn('交易币的数量不能为空~',0);
     

        if($dprice>1.1*$nowprice)ajaxReturn('交易币的单价不能高过当前价格10%~',0);

        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->order('id asc')->getField('c_nums');
      //  $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');   
 
        if($minecoins<$num){
             ajaxReturn('交易币的数量不足',0);
         }

        //冻结我的资产
        $payout['djie_nums'] = array('exp', 'djie_nums + ' . $num);
        $payout['c_nums'] = array('exp', 'c_nums - ' . $num);
        $res2 = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->save($payout);


        //生成交易记录
        $deal['sell_id'] = $uid;  //挂售出单人ID
        $deal['num'] = $num;
        $deal['ynum'] = $num;
        $deal['create_time'] = time();
        $deal['tprice'] = $tprice;       
        $deal['dprice'] = $dprice;
       
        $deal['cid'] = $cid;
        $deal['type'] = 1;//1为出售订单
        $res_tran = M('deal')->add($deal);
 
        ajaxReturn('发布成功',1,"/Turntable/Transaction/cid/".$cid);         
 

    }




    //发布出售订单的页面
    public function Salesell(){

        $uid = session('userid');
        $cid = (int)I('cid','intval',0);

        //查询当前币对应价格及名称
        $coindets = M('coindets')->order('coin_addtime desc,cid asc')->where(array("cid"=>$cid))->find();
    

        //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->order('id asc')->find();
         $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');


        $this->assign('minecoins',$minecoins);
        $this->assign('my_yue',$my_yue);
        $this->assign('coindets',$coindets);
        $this->assign('cid',$cid);

        $this->display();

    }
    //发布购买订单的页面
    public function Salebuys(){
        
        $uid = session('userid');
        $cid = (int)I('cid','intval',0);


       //查询当前币对应价格及名称
        $coindets = M('coindets')->order('coin_addtime desc,cid asc')->where(array("cid"=>$cid))->find();
    

        //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->order('id asc')->find();
        $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');


        $this->assign('minecoins',$minecoins);
        $this->assign('my_yue',$my_yue);
        $this->assign('coindets',$coindets);
        $this->assign('cid',$cid);

        $this->display();


    }


    //提交发布购买订单
    public function T_Salebuys(){

        $num = (float)I('num');
        $cid = (int)I('cid','intval',0);
        $dprice = trim(I('dprice'));
        $tprice = $num*$dprice;
        $pwd = trim(I('pwd'));
        $uid = session('userid');



        $nowprice=M('coindets')->where(array('cid'=>$cid))->order('coin_addtime desc')->getField('coin_price');
    
      if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
        if(!$num|!$tprice)ajaxReturn('交易币的数量不能为空~',0);

        if($dprice>1.1*$nowprice)ajaxReturn('交易币的单价不能高过当前价格10%~',0);

        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //自己是否有足够金积分        
            $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if($tprice> $my_yue){
                ajaxReturn('您当前账户暂无这么多金积分~',0);
            }

         //冻结我的金积分
         $payout1['djie_num'] = array('exp', 'djie_num + ' . $tprice);
         $payout1['cangku_num'] = array('exp', 'cangku_num - ' . $tprice);
         $res_pay3 = M('store')->where(array('uid'=>$uid))->save($payout1);


        //生成交易记录
        $deal['sell_id'] = $uid;  //挂售出单人ID
        $deal['num'] = $num;
        $deal['ynum'] = $num;
        $deal['create_time'] = time();
        $deal['tprice'] = $tprice;       
        $deal['dprice'] = $dprice;       
        $deal['cid'] = $cid;
        $deal['type'] = 2;//2为购买订单
        $res_tran = M('deal')->add($deal);

        $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');

        //生成金积分记录
        $changenums['pay_id'] = $uid;
        $changenums['get_id'] = 0;
        $changenums['now_nums'] = $pay_n;
        $changenums['now_nums_get'] = $pay_n;
        $changenums['is_release'] = 1;
        $changenums['get_nums'] = $tprice;
        $changenums['get_time'] = time();
        $changenums['get_type'] = 3;
        M('tranmoney')->add($changenums);

 
        ajaxReturn('发布成功',1,"/Turntable/Transactionsell/cid/".$cid);
         
 

    }


    //订单
    public function Orderinfos(){

  $cid = (int)I('cid','intval',0);
   
        $step =I('step');//
        if(!$step) $step =1;
        $uid = session('userid');
        $where["sell_id"]=$uid;
        $where["status"]=0;   
        $where["cid"]=$cid;            
        if($step ==2) $where["status"]=1;
        $list = M('deal')->order('id desc')->where($where)->limit(1000)->select();

        $this->assign('list',$list);        
        $this->assign('step',$step);
        $this->assign('cid',$cid);
        $this->display();
    }

    //交易记录
    public function Transreocrds(){
    
        $cid = (int)I('cid','intval',0);
        $uid = session('userid');
        $where["buy_id"]=$uid;
        $where["cid"]=$cid;
        $list = M('deals')->order('id desc')->where($where)->limit(1000)->select();
        $this->assign('list',$list);  
         $this->assign('cid',$cid);
           
        $this->display();


    }




    //众筹
    public function Crowds(){
        $step = I('step');
        $html = 'Crowds'.$step;
        $time_n=time();

        if($step >= 1){

            if($step==1){
             $list=M('crowds')->where("open_time<=".$time_n." and status<>2")->order("create_time desc")->find();
            }else{

               $list=M('crowds')->where("open_time<=".$time_n." and status=2")->order("create_time desc")->find(); 
            }
          
            $this->assign('list',$list);
            $this->display('Turntable/'.$html);
        }else{

            $list = M('crowds')->where("status=0 and open_time>".$time_n)->order('id desc')->find();
            $this->assign('list',$list);
            $this->display();
        }
    }



    //金积分购买
  public function Crowds_goumai(){

        //防重复提交
         if(session("gou_last_time1")){
                 if((int)time()-(int)session("gou_last_time1") <10 ){           
                  ajaxReturn('对不起，10秒内不能频繁提交~',0);
                 }
         }

    
        $t = (int)time();
        session("gou_last_time1", $t);
    

        $num = (float)I('num');
        $cid = (int)I('cid','intval',0);
        $dealid = I('dealid','intval',0);
        $dprice = trim(I('dprice'));
        $tprice = trim(I('tprice'));
        $pwd = trim(I('pwd'));
        $uid = session('userid');
        

        $ss1 = 1000;
        $restn= $num-$ss1;

        if($num<0||$tprice<0||$dprice<0)ajaxReturn('非法输入~',0);
        if(!$num|!$tprice)ajaxReturn('交易币的数量不能为空~',0);
        if($restn>0)ajaxReturn('交易币的数量超过最大限制~',0);



        //验证交易密码
        $minepwd = M('user')->where(array('userid' => $uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
        $user_object = D('Home/User');
        $user_info = $user_object->Trans($minepwd['account'], $pwd);

        //自己是否有足够金积分        
            $my_yue = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if($tprice> $my_yue){
                ajaxReturn('您当前账户暂无这么多金积分~',0);
            }


        //查询该会员本期已经买了多少Ypay
        $bnums=0;    
        $benqi = M('crowds_detail')->where(array('crowds_id'=>$dealid,'uid'=>$uid))->Field('sum(num) as nums')->find();
        if($benqi) $bnums=$benqi["nums"];

        if($bnums>=$ss1){
                ajaxReturn('本期众筹您已经购买了'.$ss1.'枚，无法继续购买~',0);
            }

        //检查 store表和 coindets 表是否有记录

         $ishas_store_u = M('store')->where(array('uid'=>$uid))->count(1);
        if(!$ishas_store_u)M('store')->add(array('uid'=>$uid,'cangku_num'=>0.0000));   
  

        $issetgetu = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->count(1);
        if($issetgetu <= 0){
            $coinone['cid'] = $cid;
            $coinone['c_nums'] =0.0000;
            $coinone['c_uid'] = $uid;
            M('ucoins')->add($coinone);
        }
        // else{
        //     M('ucoins')->where(array('c_uid'=>$uid,'cid'=>$cid))->setinc('c_nums',$num);
        // }


        //购买的在NYT的冻结字段里加币的数量、并减该会员金积分    huafei_total字段为冻结数

        $datapay['huafei_total'] = array('exp', 'huafei_total + ' . $num);
        $datapay['cangku_num'] = array('exp', 'cangku_num - ' . $tprice);
        $res1 = M('store')->where(array('uid'=>$uid))->save($datapay);

        //添加金积分记录


        $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
        $changenums['now_nums'] = $pay_n;
        $changenums['now_nums_get'] = $pay_n;
        $changenums['is_release'] = 1;
        $changenums['pay_id'] = $uid;
        $changenums['get_id'] = 0;
        $changenums['get_nums'] = $tprice;
        $changenums['get_time'] = time();
        $changenums['get_type'] = 7;
        M('tranmoney')->add($changenums);


        //添加众筹交易记录
        $dealss["crowds_id"]=$dealid;
        $dealss["uid"]=$uid;
        $dealss["create_time"]=time();
        $dealss["num"]=$num;
        $dealss["dprice"]=$dprice;
        $dealss["tprice"]=$tprice;
        $deal_ss = M('crowds_detail')->add($dealss);

        //添加NYT交易记录
        $wbaoss["crowds_id"]=$dealid;
        $wbaoss["create_time"]=time();
        $wbaoss["num"]=$num;
        $wbaoss["uid"]=$uid;
        $wbaoss["dprice"]=$dprice;
        $wbaoss["tprice"]=$tprice;
        $wbaoss["type"]=2;//转入
        $wbao_ss = M('wbao_detail')->add($wbaoss);


        if($res1&&$deal_ss&&$wbao_ss){
            ajaxReturn('购买成功',1,"/Turntable/Crowds/step/1");
        }else{
            ajaxReturn('购买失败',0);
        }

    }




    //众筹记录
    public function Crowdrecords(){

       $step = I('step');
       $uid = session('userid');
       if($step==1){
        $list=M('wbao_detail')->where("type=3 and uid=".$uid)->order("create_time desc")->select(); //释放记录
       }else{
   
        $list=M('crowds_detail')->where("uid=".$uid)->order("create_time desc")->select();
        }

        $this->assign('list',$list);
        $this->assign('step',$step);
        $this->display();
    }

   
}