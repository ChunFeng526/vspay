<?php
namespace Home\Controller;
use Think\Controller;
class GrowthController extends CommonController {


     //===========采蜜记录===============
    public function StealDeatail(){
        if(!IS_AJAX){
            return false;
        }
        $userid=session('userid');
        $m=M('steal_detail');
        $where['uid']=$userid;

        $p = I('p','0','intval');
        $page=$p*10;
        $arr=$m->field("num s_num,username uname,type_name,FROM_UNIXTIME(create_time,'%Y-%m-%d %H:%i') as tt ")->where($where)->order('id desc')->limit(
            $page,10)->select();
       if(empty($arr)){
               $arr=null; 
        }
        $this->ajaxReturn($arr);
    }

//    转入
    public function Intro(){
        $time = time();
        $userid = session('userid');
		$u_ID = $userid;
		$drpath = './Uploads/Rcode';
		$imgma = 'codes' . $userid . '.png';
		$urel = '/Uploads/Rcode/' . $imgma;
		if (!file_exists($drpath . '/' . $imgma)) {
            sp_dir_create($drpath);
            vendor("phpqrcode.phpqrcode");
            $phpqrcode = new \QRcode();
            $hurl = "http://{$_SERVER['HTTP_HOST']}" . U('Index/Changeout/sid/' . $u_ID);
           // $hurl = "http://www.huiyunx.com" . U('Index/Changeout/sid/' . $u_ID);
            $size = "7";
            //$size = "10.10";
            $errorLevel = "L";
            $phpqrcode->png($hurl, $drpath . '/' . $imgma, $errorLevel, $size);
        }
		$this->urel = $urel;
        $this->display();
    }
    public function test(){
        //获取要下载的文件名
        $filename = $_GET['filename'];
        //设置头信息
        ob_end_clean();
//        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
//        header('Content-Description: File Transfer');
//        header('Content-Type: application/octet-stream');

//        header('Content-Disposition:attachment;filename=' . basename($filename));
//        header('Content-Length:' . filesize($filename));

        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Length: ' . filesize($filename));
        header('Content-Disposition: attachment; filename=' . basename($filename));

        //读取文件并写入到输出缓冲
        readfile($filename);
        echo "<script>alert('下载成功')</script>";
    }

//    public function test(){
//        $filename = $_GET['filename'];
//        $url = 'http://www.huiyunx.com/Uploads/Rcode/codes6000197.png';
//        downloadImage($url);
//    }

    //转入明细
    public function Introrecords(){
        $uid = session('userid');
        $where['get_id'] = $uid;
        $where['get_type'] = 0;
        $Chan_info = M('tranmoney')->where($where)->order('id desc')->select();
        $this->assign('Chan_info',$Chan_info);
        $this->assign('uid',$uid);
        $this->display();
    }


    //取消订单
 public function quxiao_order(){

    $id = (int)I('id','intval',0);
    $uid = session('userid');
    $mydeal = M('trans')->where(array("id"=>$id,"payin_id|payout_id"=>$uid,"pay_state"=>array("lt",2)))->find();

     if(!$mydeal)ajaxReturn('订单不存在~',0);

    $type=$mydeal["trans_type"];
    M('trans_quxiao')->add($mydeal);//把记录复制到另一个表


    if($type==0){//卖出单，自己是购买方，只清空payin_id和改变pay_state为0

            $payout['payin_id'] =0;
            $payout['pay_state'] =0;
            $res1 = M('trans')->where(array('id'=>$id))->save($payout); 


    }elseif($type==1){//为购买单，删除订单

        $res1 = M('trans')->delete($id); 


    }

        if($res1){       
        ajaxReturn('取消成功',1);
        }else{
        ajaxReturn('操作失败',1);
        }
}


    //买入
    public function Purchase(){

         $uid = session('userid');
        $cid = trim(I('cid'));
        if(empty($cid)){
            $mapcas['user_id&is_default'] =array($uid,1,'_multi'=>true);
            $carinfo = M('ubanks')->where($mapcas)->count(1);
            if($carinfo < 1){
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }else{
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid,'is_default'=>1))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }
        }else{
            $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.id'=>$cid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
        }

        //生成买入订单
        if(IS_AJAX){
            $pwd = trim(I('pwd'));
            $sellnums = trim(I('sellnums'));//出售数量
            $cardid = trim(I('cardid'));//银行卡id
            $messge = trim(I('messge'));//留言
            $sellAll = array(500,1000,3000,5000,10000,30000);
            if (!in_array($sellnums, $sellAll)) {
                ajaxReturn('您选择买入的金额不正确',0);
            }
//            //自己是否有足够余额
//            $is_enough = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
//            if($sellnums > $is_enough){
//                ajaxReturn('您当前账户暂无这么多余额~',0);
//            }
            //验证银行卡是否是自己
            $id_Uid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
            if($id_Uid != $uid){
                ajaxReturn('对不起,该张银行卡不是您的哦~',0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //生成订单
            $data['pay_no'] = build_order_no();
            $data['payin_id'] = $uid;
            $data['out_card'] = $cardid;
            $data['pay_nums'] = $sellnums;
            $data['trade_notes'] = $messge;
            $data['pay_time'] = time();
            $data['trans_type'] = 1;
            $res_Add = M('trans')->add($data);
            //给自己减少这么多余额
            if($res_Add){
//                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$sellnums);
                ajaxReturn('买入订单创建成功',1);
            }
        }
        $this->assign('morecars',$morecars);
        $this->display();

    }

    //添加银行卡
    public function test1(){
        $sellnums = array(500,1000,3000,5000,10000,30000);
        $sellnums = 5000;//出售数量
        $sellAll = array(500,1000,3000,'5000',10000,30000);
        if (!in_array(500, $sellAll)) {
            echo "Got Irix";
        }
    }
    /**
     *
     */
    public function Addbank(){
        $bakinfo = M('bank_name')->order('q_id asc')->select();
        $this->assign('bakinfo',$bakinfo);
        if(IS_AJAX){
            $uid = session('userid');
            $crkxm = I('crkxm');
            $khy = I('khy');
            $yhk = I('yhk');
            $khzy = I('khzy');

            if(empty($crkxm)){
                ajaxReturn('请输入真实姓名',0);
            }
            if(empty($khy)){
               ajaxReturn('请选择开户行',0);
            }
            if(empty($yhk)){
                ajaxReturn('请输入银行卡号',0);
            }
            if(empty($khzy)){
                ajaxReturn('请输入开户支行',0);
            }

            $data['hold_name'] = $crkxm;
            $data['card_id'] = $khy;
            $data['card_number'] = $yhk;
            $data['open_card'] = $khzy;
            $data['add_time'] = time();
            $data['user_id'] = $uid;

            $res_addcard = M('ubanks')->add($data);
            if($res_addcard){
                //设置用户银行卡姓名
                $bank_uname = M('user')->where(array('userid'=>$uid))->getField('bank_uname');
                if(empty($bank_uname)){
                    M('user')->where(array('userid'=>$uid))->setField('bank_uname',$crkxm);
                }
                    ajaxReturn('银行卡添加成功',1,'/Growth/Purchase');
            }
        }
        $this->display();
    }
    //订单中心
    public function Nofinsh(){
        $state = trim(I('state'));
        $uid = session('userid');
        $traInfo = M('trans');
        if($state > 0){
            $where['pay_state'] =  array('between','1,2');
        }else{
            $where['pay_state'] = 0;
        }
        $where['payin_id'] = $uid;

        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        $banks = M('ubanks');
        foreach($orders as $k =>$v){
            if($v['payin_id'] != ''){
                //银行卡号.开户支行.开户银行
                $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
                $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
                $orders[$k]['cardnum'] = $bankinfos['card_number'];
                $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
                $orders[$k]['openrds'] = $bankinfos['open_card'];
                $orders[$k]['uname'] = $uinfomsg['username'];
                $orders[$k]['umobile'] = $uinfomsg['mobile'];

            }
        }
        $this->assign('state',$state);
        $this->assign('orders',$orders);
        $this->assign('page',$page);
        $this->display();
    }
    //确认打款
    public function Conpay(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payin_id'] = $uid;
        $where['pay_state'] = 1;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
            $orders[$k]['cardnum'] = $bankinfos['card_number'];
            $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
            $orders[$k]['openrds'] = $bankinfos['open_card'];
            $orders[$k]['uname'] = $uinfomsg['username'];
            $orders[$k]['umobile'] = $uinfomsg['mobile'];
        }
        if(IS_AJAX){
            $uid = session('userid');
            $picname = $_FILES['uploadfile']['name'];
            $picsize = $_FILES['uploadfile']['size'];
            $trid = trim(I('trid'));

            if($trid <= 0){
                ajaxReturn('提交失败,请重新提交',0);
            }
            if ($picname != "") {
                if ($picsize > 2014000) { //限制上传大小
                    ajaxReturn('图片大小不能超过2M',0);
                }
                $type = strstr($picname, '.'); //限制上传格式
                if ($type != ".gif" && $type != ".jpg" && $type != ".png"  && $type != ".jpeg") {
                    ajaxReturn('图片格式不对',0);
                }
                $rand = rand(100, 999);
                $pics = uniqid() . $type; //命名图片名称
                //上传路径
                $pic_path = "./Uploads/Payvos/". $pics;
                move_uploaded_file($_FILES['uploadfile']['tmp_name'], $pic_path);
            }
            $size = round($picsize/1024,2); //转换成kb
            $pic_path = trim($pic_path,'.');
            if($size){
                $res = M('trans')->where(array('id'=>$trid))->setField(array('trans_img'=>$pic_path,'pay_state'=>2));
                if($res){
                    ajaxReturn('打款提交成功',1,'/Growth/Conpay');
                }else{
                    ajaxReturn('打款提交失败',0);
                }
            }
        }
        $this->assign('page',$page);
        $this->assign('orders',$orders);
        $this->display();
    }

    public function Paidimg(){
        $id = I('id');
        $imginfo = M('trans')->where(array('id'=>$id))->getField('trans_img');
        $this->assign('imginfo',$imginfo);

        $this->display();
    }

    //已完成订单
    public function Dofinsh(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payin_id'] = $uid;
        $where['pay_state'] = 3;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
            $orders[$k]['cardnum'] = $bankinfos['card_number'];
            $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
            $orders[$k]['openrds'] = $bankinfos['open_card'];
            $orders[$k]['uname'] = $uinfomsg['username'];
            $orders[$k]['umobile'] = $uinfomsg['mobile'];
        }
        $this->assign('page',$page);
        $this->assign('orders',$orders);
        $this->display();
    }

    //买入记录
    public function Buyrecords(){
        $traInfo = M('trans');
        $uid = session('userid');
        $where['payin_id'] = $uid;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k =>$v){
            $Chan_info[$k]['username'] = M('user')->where(array('userid'=>$v['payout_id']))->getField('username');
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d',$v['pay_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s',$v['pay_time']);
        }
        if(IS_AJAX){
            if(count($Chan_info) >= 1) {
                ajaxReturn($Chan_info,1);
            }else{
                ajaxReturn('暂无记录',0);
            }
        }
        $this->assign('page',$page);
        $this->assign('Chan_info',$Chan_info);
        $this->assign('uid',$uid);
        $this->display();
    }


//卖入中心
    public function Buycenter(){
        if(IS_AJAX){
            $pricenum = I('mvalue');
            if($pricenum == ''){
                ajaxReturn('请选择正确的订单价格',0);
            }
            $order_info = M('trans as tr')->join('LEFT JOIN  ysk_user as us on tr.payout_id = us.userid')->where(array('tr.pay_state'=>0,'tr.trans_type'=>0,'tr.pay_nums'=>$pricenum))->order('id desc')->select();

            foreach($order_info as $k => $v){
                $order_info[$k]['cardinfo'] = M('bank_name')->where(array('q_id'=>$v['card_id']))->getfield('banq_genre');
                $order_info[$k]['spay'] = $v['pay_nums'] * 0.85;
            }
            if(count($order_info) <= 0){
                ajaxReturn('没找到相关记录',0);
            }else{
                ajaxReturn($order_info,1);
            }
        }
        $this->display();
    }

    public function Dopurs(){
        if(IS_AJAX){
            $uid = session('userid');
            $trid = I('trid',1,'intval');
            $pwd = trim(I('pwd'));
            $sellnums = M('trans')->where(array('id'=>$trid))->field('pay_nums,payout_id,pay_state')->find();

            $sellAll = array(500,1000,3000,5000,10000,30000);
            if (!in_array($sellnums['pay_nums'], $sellAll)) {
                ajaxReturn('您选择购买的金额不正确',0);
            }
            if($sellnums['payout_id'] == $uid){
                ajaxReturn('您不能买入自己上架的哦~',0);
            }
            if($sellnums['pay_state'] != 0){
                ajaxReturn('该订单存在异常,暂时无法购买哦~',0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //记录买入会员
            $res_Buy = M('trans')->where(array('id'=>$trid))->setField(array('payin_id'=>$uid,'pay_state'=>1));
            if($res_Buy){

                ajaxReturn('买入成功',1);
            }
        }
        $this->display();
    }
    //银行卡信息
    public function Cardinfos(){
        $uid = session('userid');
        $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid))->order('u.id desc')->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre,banks.banq_img')->select();
        if(IS_AJAX){
            $cardid = I('bangid');
            //是否是自己绑定的银行卡
            $isuid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
            if($isuid != $uid){
                ajaxReturn('该张银行卡暂不属于您~',0);
            }
            $res = M('ubanks')->where(array('id'=>$cardid))->delete();
            if($res){
                ajaxReturn('该银行卡删除成功',1,'/User/Personal');
            }
        }
        $this->assign('morecars',$morecars);
        $this->display();
    }
}