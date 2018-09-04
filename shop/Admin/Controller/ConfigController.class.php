<?php
// +----------------------------------------------------------------------
// | 零云 [ 简单 高效 卓越 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Think\Page;

/**
 * 系统配置控制器
 * 
 */
class ConfigController extends AdminController
{


    public function msgs()
	{	
		if(IS_POST){
			
			$content=I('MSG');
			$account=I('MSG_account');
			$password=I('MSG_password');
			$re1=M('config','nc')->where(array('name'=>'MSG_password'))->setField('value',$password);
			$re2=M('config','nc')->where(array('name'=>'MSG_account'))->setField('value',$account);
			$re3=M('config','nc')->where(array('name'=>'MSG'))->setField('value',$content);
			
				return $this->success('修改成功', U('Config/msgs'));
			
			
		}
		$this->breadcrumb2 = '短信设置';
	
		$content=M('config','nc')->where(array('name'=>'MSG'))->getField('value');
   	 	$account=M('config','nc')->where(array('name'=>'MSG_account'))->getField('value');
		$password=M('config','nc')->where(array('name'=>'MSG_password'))->getField('value');
		$this->assign('account', $account);
		$this->assign('password', $password);
		$this->assign('content', $content);
		$this->display();
	}



    /**
     * 获取某个分组的配置参数
     */
    public function group($group = 4)
    {
        //根据分组获取配置
        $map['group']  = array('eq', $group);
        $field         = 'name,value,tip,type';
        $data_list     = D('Config')->lists($map,$field);
        $display=array(1=>'base',2=>'system',3=>'siteclose',4=>'fee',5=>'price',6=>'zhongchou');
        $this->assign('info',$data_list)->display($display[$group]);
    }

 public function group1($group = 4)
    {
        //根据分组获取配置
     $config_object = D('Config');
     $growem=$config_object->where("name='growem'")->getField('value');
      

        $data_list=array();

        for($i=1;$i<=5;$i++){
           $data_list[]= D('coindets')->where("cid=".$i)->order('coin_addtime desc')->find();

        }

        $this->assign('info',$data_list)->assign('growem',$growem)->display("price");
    }



    public function group2($group = 1)
    {
        //根据分组获取配置
        
      
        $jifen= D('config')->where("name='jifen'")->getField("value");
        $regjifen= D('config')->where("name='regjifen'")->getField("value");
          $jifens= D('config')->where("name='jifens'")->getField("value");
        $rens= D('config')->where("name='rens'")->getField("value");

        $this->assign('jifen',$jifen)->assign('regjifen',$regjifen)->assign('jifens',$jifens)->assign('rens',$rens)->display("base");
    }




//众筹设置
    public function group3()
    {
        //根据分组获取配置
    $time_n=time();
    $open_time=date("Y-m-d");

    $is_has=M('crowds')->where("open_time<=".$time_n." and status<>2")->order("create_time desc")->find();

    if($is_has){
      $jindu=$is_has['jindu'];
      $open_time=date("Y-m-d",$is_has['open_time']);
      $num=(int)$is_has['num'];
      $id=(int)$is_has['id'];
    }
         

        $this->assign('open_time',$open_time)->assign('is_has',$is_has)->assign('jindu',$jindu)->assign('id',$id)->assign('num',$num)->display("zhongchou");
    }


//奖励设置
    public function group4()
    {
     
        $map['group']  = array('eq', 4);
        $field         = 'name,value,tip,type';
        $data_list     = D('Config')->lists($map,$field);
        $this->assign('info',$data_list);


        $map1['group']  = array('eq', 7);
        $data_list1     = D('Config')->lists($map1,$field);
        $this->assign('manage',$data_list1);

        $map2['group']  = array('eq', 9);
        $data_list2     = D('Config')->lists($map2,$field);
        $this->assign('qukuai',$data_list2);

        $map3['group']  = array('eq', 10);
        $data_list3     = D('Config')->lists($map3,$field);
        $this->assign('vip',$data_list3);
        $map4['group']  = array('eq', 6);
        $data_list4     = D('Config')->lists($map4,$field);
        $this->assign('fenx',$data_list4);        


        $map5['group']  = array('eq', 8);
        $data_list5     = D('Config')->lists($map5,$field);
        $this->assign('zhuand',$data_list5); 
 
        $this->display("fee");


    }




/**
     * 管理奖保存配置
     * 
     */

 public function manage_Save()
    {
        $config=I('post.');
        if ($config && is_array($config)) {
            $config_object = D('Config');
            for($i=1;$i<=3;$i++) {
                $map = array('name' => "guanli".$i);
                // 如果值是数组则转换成字符串，适用于复选框等类型

                $config_object->where($map)->setField('value',$config["managej_".($i-1)]);
                $config_object->where($map)->setField('tip',$config["manage_".($i-1)]);
            }
        }

        $this->success('保存成功！');
    }




/**
     * 区块奖保存配置
     * 
     */

 public function qukuai_Save()
    {
        $config=I('post.');
        if ($config && is_array($config)) {
            $config_object = D('Config');
            for($i=1;$i<=5;$i++) {
                $map = array('name' => "qukuai".$i);
                // 如果值是数组则转换成字符串，适用于复选框等类型

                $config_object->where($map)->setField('value',$config["qukuaij_".($i-1)]);
                $config_object->where($map)->setField('tip',$config["qukuai_".($i-1)]);
            }
        }

        $this->success('保存成功！');
    }



/**
     * 区块奖保存配置
     * 
     */

 public function vip_Save()
    {
        $config=I('post.');
        if ($config && is_array($config)) {
            $config_object = D('Config');
            for($i=1;$i<=2;$i++) {
                $map = array('name' => "vip".$i);
                // 如果值是数组则转换成字符串，适用于复选框等类型

                $config_object->where($map)->setField('value',$config["vipj_".($i-1)]);
                $config_object->where($map)->setField('tip',$config["vip_".($i-1)]);
            }
        }

        $this->success('保存成功！');
    }


    /**
     * 区块奖保存配置
     * 
     */

 public function fenx_Save()
    {
        $config=I('post.');
        if ($config && is_array($config)) {
            $config_object = D('Config');
            for($i=1;$i<=4;$i++) {
                $map = array('name' => "zhitui".$i);
                // 如果值是数组则转换成字符串，适用于复选框等类型
                $config_object->where($map)->setField('value',$config["fenxj_".($i-1)]);
                $config_object->where($map)->setField('tip',$config["fenx_".($i-1)]);


                $map1 = array('name' => "zhuand".$i);
                $config_object->where($map1)->setField('value',$config["zhuandj_".($i-1)]);
                $config_object->where($map1)->setField('tip',$config["fenx_".($i-1)]);
            }
        }

        $this->success('保存成功！');
    }


    /**
     * 批量保存配置
     * 
     */
    public function groupSave()
    {
        $config=I('post.');
        unset($config['file']);
        if ($config && is_array($config)) {
            $config_object = D('Config');
            foreach ($config as $name => $value) {
                $map = array('name' => $name);
                // 如果值是数组则转换成字符串，适用于复选框等类型
                if (is_array($value)) {
                    $value = implode(',', $value);
                }

                $config_object->where($map)->setField('value',$value);
            }
        }

        $this->success('保存成功！');
    }



   /**
     * 保存实时价格
     * 
     */
    public function groupSave1()
    {
        $config=I('post.');
     
     $config_object = D('Config');
     $growem=$config["growem"];
     $config_object->where("name='growem'")->setField('value',$growem);

     $arr=array(1=>"Vpay",2=>"比特币",3=>"莱特币",4=>"以太坊",5=>"狗狗币");
      

                $timen=time();
                for($i=1;$i<=5;$i++){
                $coinone['cid'] = $i;
                $coinone['coin_price'] =$config["s".$i];

                $coinone['coin_name'] =$arr[$i];

              //  dump($arr[$i]);
                $coinone['max'] =$config["g".$i];
                $coinone['min'] =$config["d".$i];
                $coinone['coin_addtime'] = $timen;
                M('coindets')->add($coinone);
                }


        $this->success('保存成功！');
    }


 /**
     * 基本设置
     * 
     */
    public function groupSave2()
    {
        $jifen=I('post.jifen');
        $regjifen=I('post.regjifen');
     
   D('Config')->where("name='jifen'")->setField('value',$jifen);
    D('Config')->where("name='regjifen'")->setField('value',$regjifen);


        $this->success('保存成功！');
    }



 /**
     * 基本设置
     * 
     */
    public function tuijian()
    {
        $jifens=I('post.jifens');
        $rens=I('post.rens');
     
   D('Config')->where("name='jifens'")->setField('value',$jifens);
    D('Config')->where("name='rens'")->setField('value',$rens);


        $this->success('保存成功！');
    }



/**
     * 发布众筹
     * 
     */
    public function groupSave3()
    {

        $num=I('post.num', 'intval', 0);
        $dprice=(float)I('post.dprice');
        $date=I('post.open_time');
        $jindu=I('post.jindu', 'intval', 0);
        $open_time=strtotime($date);


          //把其它众筹项目状态改为2，表示已完成
          M('crowds')->where("status<>2")->save(array("status"=>2));

          $datas["num"]=$num;
          $datas["dprice"]=$dprice;
          $datas["open_time"]=$open_time;
          $datas["create_time"]=time();
          $datas["status"]=0;
          $datas["jindu"]=$jindu;
          M('crowds')->add($datas);  

        $this->success('发布成功！');
    }



/**
     * 修改众筹
     * 
     */
    public function groupSave4()
    {

        $id=I('post.tid', 'intval', 0);
        $jindu=(float)I('post.jindu'); 
 
          $datas["jindu"]=$jindu;
          M('crowds')->where("id=".$id)->save($datas);  


        $this->success('修改成功！');
    }




    public function BaseSave(){

      $ids=I('post.ids');
      $limit_num=I('post.limit_num');
      $test=M('limit');
      foreach ($ids as $k => $v) {
        $where['id']=$v;
        $data['limit_num']=$limit_num[$k];
        $test->where($where)->save($data);
      }
      $this->success('保存成功！');
      
   }


    public function sitecloseSave()
    {
        $config=I('post.');
        $key=(array_keys($config));
        
        if ($config && is_array($config)) {
            $map['name']=$key[0];
            $config_object = D('Config');
            $data['value']=$config[$key[0]];
            $data['tip']=$config['tip'];

            $config_object->where($map)->save($data);
        }

        $this->success('保存成功！');
    }

    public function turntable(){
        $info=M('turntable_lv')->order('id')->find();
        $this->assign('info',$info);
        $this->display();
    }

    //保存转盘数据
    public function savezhuanpan(){
        $data = I('post.');
        $info=M('turntable_lv')->where('id=1')->save($data);
        $this->success('保存成功！');
    }

    public function tool(){
        $info=M('tool')->order('id')->select();
        $this->assign('info',$info);
        $this->display();
    }

    //保存转盘数据
    public function savetool(){
        $ids = I('post.id');
        $nums = I('post.num');
        $tool=M('tool');
        foreach ($ids as $k => $val) {
            $tool->where(array('id'=>$val))->save(array('t_num'=>$nums[$k]));
        }
        $this->success('保存成功！');
    }
}
