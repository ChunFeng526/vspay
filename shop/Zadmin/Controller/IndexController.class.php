<?php
/*
//产品展示在1525行
 */
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;
class IndexController extends CommonController{
	
    protected $model;
	public function _initialize()
	{
		parent::_initialize();
	}
	//基本配置
    public function index()
    {
    	$this->display();
    }
	 //会员列表
	public function member(){
       	  $username=I('username');
		  if(!empty($username)){//按会员名字搜索
				 $where['username'] = array('like',"%".$_GET['username']."%");
			}
		  if($_GET['islock']!=''){//按会员名字搜索
				$where['islock'] = $_GET['islock'];
		  }
		 $M=M('users');
		 $count = $M->where($where)->count('userid');// 查询满足要求的总记录数
		 $Page   = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		 $show   = $Page->show();// 分页显示输出
		 $with = $M->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
		 $this->assign('arrData_news',$with);// 赋值数据集
		 $this->assign('page',$show);// 赋值分页输出
		 $this->display();	
	}
	 //会员详情
	 public function ht_hyxq(){
		  $M=M('users');
          $this->users=$M->where('userid='.$_GET['userid'])->select();    
	      $this->display();	
	 }
	//会员删除
	 public function ht_hydelete($userid=null){
		$obj = M("users");
        $data = $obj->delete($userid);
        if($data){
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Index/member').'"</script>';
            return;
        }else{
            echo "<meta charset=\"utf-8\"/> <script>alert('删除失败')</script>";
            echo '<script>location.href="'.U('Index/member').'"</script>';
            return;
        }
	 } 
	 //订单管理
	public function ht_ddgl(){
		$order=M('order');
		$state=I('order_state');
		$order_no=I('order_no');
		$mobile=I('order_buy_mobile');
		if($state!='')
			$where['order_state']=$state;
		if(!empty($order_no))
			$where['order_no']=array('like','%'.$order_no.'%');
		if(!empty($mobile))
			$where['order_buy_mobile']=array('like','%'.$mobile.'%');
		$count = $order->where($where)->count('order_id');// 查询满足要求的总记录数
		$Page   = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show   = $Page->show();// 分页显示输出
		$with = $order->where($where)->order('order_id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('gmsp',$with);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display();
	}
	 //订单详情
	public function ht_ddxq(){
        $order=M('order');
        $commodity=M('commodity');
        $users=M('users');
        $order_id=I('order_id',0,'intval');
        $where['order_id']=$order_id;
        $info=$order->where($where)->find();
		/*
			取会员名称
		 */
		$u_where['userid']=$info['u_userid'];
		$username=$users->where($u_where)->getField('username');
		$info['username']=$username;
		
		$shopid=$info['order_shopid'];
		
		if($shopid==0){
			#++取订单明细++
			$info_detail=M('order_detail')->where('order_id ='.$order_id)->select();
		}else{
			#++添加单价++
			$com_xj=$commodity->where(array('com_id'=>$shopid))->getField('com_xj');
			$info['com_xj']=$com_xj;
		}
		$this->assign('info',$info);
		$this->assign('info_detail',$info_detail);
		$this->display();
	}
	 //=======数据库找不到  待修改=======
	//  //修改订单状态
	public function xxddzt(){
        $db_gmsp=M('order');
		$dada['order_state']= I("post.gms_zt");
		$dada['kd_no']= I("post.kd_no");
		$order_id=I('order_id');
		if($dada['order_state']!=0){
        	$boolData=$db_gmsp->where('order_id='.$order_id)->save($dada);
            if($boolData){
               	$this->success('修改成功',U('Index/ht_ddgl'));
                return;
            }else{
               	$this->error('修改失败');
                return;
            }
        }else{
        	$this->error('修改失败');
              return;
        }
	}
	 //订单删除
	public function ht_dddelete(){
          $db_gmsp=M('order');
          $db_odetail=M('order_detail');
		 //删除订单
		 $order_id=I('order_id',0,'intval');
		 $data =$db_gmsp->delete($order_id);
		 if($data){
		 	$where['order_id']=$order_id;
		 	$db_odetail->where($where)->delete();
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Index/ht_ddgl').'"</script>';
            return;
        }else{
			echo "<meta charset=\"utf-8\"/> <script>alert('删除失败!')</script>";
			echo '<script>javascript:history.back(-1);</script>';
			return;
        } 
		$this->display();
	}	
	//会员登录记录/搜索
	public function ht_hylb2(){
		
		if(!empty($_POST)){
		
		if(empty($_POST['vip'])&& $_POST['username'] !=='会员名称'){//按会员名字搜索
		
		     $M=M('users');
			 $arrData['username'] = array('like',"%".$_POST['username']."%");
             $this->arrData_news=$M->where($arrData)->select(); 
	        $this->display('Index/ht_hylb2');
		}
	 if(!empty($_POST['vip'])&& $_POST['username'] =='会员名称'){//按会员类型搜索
		     $M=M('users'); 
             $this->arrData_news=$M->where('vip='.$_POST['vip'])->select(); 
	        $this->display('Index/ht_hylb2');
	 }
	 if(!empty($_POST['vip'])&& $_POST['username'] !=='会员名称'){//按会员名字和类型搜索
		  $M=M('users'); 
		  $arrData['username'] = array('like',"%".$_POST['username']."%");
		  $arrData['vip']=$_POST['vip'];
		  $this->arrData_news=$M->where($arrData)->select(); 
		  $this->display('Index/ht_hylb2');
	 }
	}else{
	    $M=M('users');
	    $count = $M->count('userid');// 查询满足要求的总记录数
	    $Page   = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
	    $show   = $Page->show();// 分页显示输出
	    $with = $M->order('userid desc')->limit($Page->firstRow.','.$Page->listRows)->select();
	    $this->assign('arrData_news',$with);// 赋值数据集
	    $this->assign('page',$show);// 赋值分页输出
	  $this->display('Index/ht_hylb2');
	 
	 }
	 
	}	
	//后台管理员管理
	public function ht_glygl(){
	   $db_Zadmin=M('Zadmin');
	   $Zadmin=$db_Zadmin->order('id desc')->select();	   
	   $this->assign('Zadmin',$Zadmin);// 赋值数据集
	   $this->display();
	}
	     //后台管理员增加编辑管理
public function ht_Zadmin(){
	 $db_Zadmin=M('Zadmin');
	if(!empty($_POST)){
		if(!empty($_POST['zusername'])&& !empty($_POST['password'])){
			if(!empty($_POST['id'])){//有id为编辑管理员
                  $data1['zusername']=$_POST['zusername'];
                  $data1['password']=md5($_POST['password']);
                  $boolData_editor=$db_Zadmin->where('id='.$_POST['id'])->save($data1);
               if($boolData_editor){
                   echo "<meta charset=\"utf-8\"/> <script>alert('修改成功')</script>";
                   echo '<script>location.href="'.U('Index/ht_glygl').'"</script>';
                   return;
                }else{
                   echo "<meta charset=\"utf-8\"/> <script>alert('修改失败')</script>";
                  echo '<script>javascript:history.back(-1);</script>';
                 return;
            }
			}else{//否则无id为添加管理员
			$data['zusername']=$_POST['zusername'];
            $data['password']=md5($_POST['password']);
            $boolData=$db_Zadmin->data($data)->add();
            if($boolData){
                echo "<meta charset=\"utf-8\"/> <script>alert('添加成功')</script>";
                echo '<script>location.href="'.U('Index/ht_glygl').'"</script>';
                return;
            }else{
                echo "<meta charset=\"utf-8\"/> <script>alert('添加失败')</script>";
                echo '<script>javascript:history.back(-1);</script>';
                return;
            }
			}
		}else{
			    echo "<meta charset=\"utf-8\"/> <script>alert('管理员名字或密码不能为空！')</script>";
                echo '<script>javascript:history.back(-1);</script>';
                return;
		}
	}else{
		if(!empty($_GET['id'])){//编辑管理员
	        $Zadmin=$db_Zadmin->where('id='.$_GET['id'])->find();	
			$this->assign('Zadmin',$Zadmin);// 赋值数据集
			$this->display();
		}else{//直接调用模板
			$this->display();		
		}
	}
 }
	//管理员删除
	 public function Zadmin_delete($id=null){
		$obj= M("Zadmin");
		$count=$obj->count('id');//查出用户个数
		if($count !=='1'){
        $data = $obj->delete($id);
        if($data){
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Index/ht_glygl').'"</script>';
            return;
        }else{
            echo "<meta charset=\"utf-8\"/> <script>alert('删除失败')</script>";
            echo '<script>location.href="'.U('Index/ht_glygl').'"</script>';
            return;
        }
	 }else{
		        echo "<meta charset=\"utf-8\"/> <script>alert('管理员最少必须保留一个！')</script>";
                echo '<script>javascript:history.back(-1);</script>';
                return;
	 } 
	 }
 public function yuyueimg(){
	 	 $img=I('post.pic','','trim');
	 	 $com_id=I('post.com_id','','trim');
	 	 $com=M('yuyue');
	 	 if($_FILES['photo']['name'] && !empty($img)){

	 	 	$upload = new \Think\Upload();// 实例化上传类
			$upload->maxSize   =     3145728 ;// 设置附件上传大小
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
			$upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
			$upload->savePath  =     ''; // 设置附件上传（子）目录
	        // 上传文件
	        $info=  $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
                return;
            }
            foreach($info as $file){

                $data[$img] = $file['savepath'].$file['savename'];   
            }
	 	 }
	 	 if(!empty($data[$img])){
	 	 	$filedata=$com->where('yy_id='.$com_id)->find();
			@unlink('./Public/Uploads/'.$filedata[$img]);
	 	 	if($com->where("yy_id=".$com_id)->save($data)){
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传成功!');location.href='" . U('Index/ht_xxgladd',array('yy_id'=>$com_id)) . "';</script>";
	 	 	}
	 	 	else{
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传失败');</script>";
	 	 		echo "<script>javascript:history.back(-1);</script>";
	 	 	}
	 	 }
	 }

	 /*
		 上传图片
	  */
	 public function updateimg(){
	 	 $img=I('post.pic','','trim');
	 	 $com_id=I('post.com_id','','trim');
	 	 $com=M('commodity');
	 	 if($_FILES['photo']['name'] && !empty($img)){
	 	 	$upload = new \Think\Upload();// 实例化上传类
			$upload->maxSize   =     3145728 ;// 设置附件上传大小
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
			$upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
			$upload->savePath  =     ''; // 设置附件上传（子）目录
	        // 上传文件
	        $info=  $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
                return;
            }
            foreach($info as $file){

                $data[$img] = $file['savepath'].$file['savename'];   
            }
	 	 }
	 	 if(!empty($data[$img])){

	 	 	$filedata=$com->where('com_id='.$com_id)->find();
			@unlink('./Public/Uploads/'.$filedata[$img]);

	 	 	if($com->where("com_id=".$com_id)->save($data)){
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传成功!');location.href='" . U('Index/ht_spadd',array('com_id'=>$com_id)) . "';</script>";
	 	 	}
	 	 	else{
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传失败');</script>";
	 	 		echo "<script>javascript:history.back(-1);</script>";
	 	 	}
	 	 }
	 }
	 public function setShow(){
              if(IS_POST){
              	$id=I('id');
              	$dada1['com_type']=I('com_type');
              }
            $commodity=M('commodity');
       $boolData=$commodity->where('com_id='.$id)->save($dada1);//商品状态修改
          if($boolData){
          	$mes='修改成功';
          }else{
          	$mes='修改失败';
          }
           
	 	// $id=I('id');
	 	 $this->ajaxReturn($mes);
	 }

	public function deleteuser(){

		$id=I('get.userid',0,'intval');
		if($id && IS_GET){
			$res=M('users')->delete($id);
			if($res)
				$this->redirect('Index/member');
			else
			{
				echo "<meta charset=\"utf-8\"/><script>alert('删除失败');</script>";
	 	 		echo "<script>javascript:history.back(-1);</script>";
			}
		}
	}


	 //会员公告管理
	public function ht_hygg(){

		$M=M('news');
	    $count =$M->count(1);// 查询满足要求的总记录数
	    $Page   = new \Think\Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数(25)
	    $show   = $Page->show();// 分页显示输出
	  
	    $with =$M->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();

	    $this->assign('news',$with);// 赋值数据集
	    $this->assign('page',$show);// 赋值分页输出
		

		$this->display();
	}


	//会员公告、添加修改
	public function ht_tjwz(){
		
		if(!empty($_GET['id'])){
          $db_new=M("news");
		  $data=$db_new->order('id desc')->find($_GET['id']); 
		  $this->assign('data', $data);
		}
		$this->display();
	}
	
	
	//添加新闻公告
	public function news_add(){

		    $db_news=M('news');
            $data['title']=$_POST['title'];
			$data['from']=$_POST['from'];
            $data['content']=$_POST['content'];
            $data['id']=$_POST['id'];
            if(isset($data['id']) && !empty( $data['id'])){
            	$res=$db_news->save($data);
            }else{
            	$data['addtime']=time();
            	$res=$db_news->add($data);
            }
            if($res){
				echo "<meta charset=\"utf-8\"/> <script>alert('保存成功')</script>";
	            echo '<script>location.href="'.U('Index/ht_hygg').'"</script>';
	            return;
            }else{
                echo "<meta charset=\"utf-8\"/> <script>alert('保存失败')</script>";
           		echo '<script>javascript:history.back(-1);</script>';
            	return;
            }
	}
	
	
	
	//删除新闻
    public function new_delete($id=null){
		
        $obj = M("news");
        $data = $obj->delete($id);
        if($data){
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Index/ht_hygg').'"</script>';
            return;
        }else{
            echo "<meta charset=\"utf-8\"/> <script>alert('删除失败')</script>";
            echo '<script>location.href="'.U('Index/ht_hygg').'"</script>';
            return;
        }
    }



    //后台提现记录
	public function ht_txjl(){

		$t_status=I('get.t_status');
		if($t_status!='' && $t_status!=null){
			$where['t_status']=$t_status;
		}

		$m=M('cash');
		$count = $m->where($where)->count(1);// 查询满足要求的总记录数
	    $Page   = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
	    $show   = $Page->show();// 分页显示输出

		
	    $info=$m->where($where)->limit($Page->firstRow.','.$Page->listRows)->order('id desc')->select();
	    $this->info=$info;	 
		$this->show=$show;
		$this->display();
	}

		
   //后台提现记录修改状态
  public function ht_txjlxg(){
  		if(!IS_POST)
  			return false;

  		$status=I('post.status',0,'intval');
  		$id=I('post.id',0,'intval');
  		$message=I('post.message');
  		if(empty($id))
  			return false;
  		$m=M('cash');
  		$where['id']=$id;
  		$old_status=$m->where($where)->getField('t_status');
  		if($old_status==0){
  			$res=$m->where($where)->setField(array('t_status'=>$status,'t_message'=>$message));
  			if($res==false){
  				echo "<meta charset=\"utf-8\"/> <script>alert('操作失败')</script>";
           		echo '<script>javascript:history.back(-1);</script>';
            	return;
  			}
  			//驳回
  			if($status==2){
  				$info=$m->where($where)->field('t_uid,t_total')->find();
  				$total=$info['t_total'];
  				$uid=$info['t_uid'];
  				$u_where['userid']=$uid;
  				$res=M('users')->where($u_where)->setInc('money',$total);
  				// die(M('users')->getlastsql());
  				if($res)
  					$this->DesMoney($total,$uid);
  			}
  			if($res){
  				 echo "<meta charset=\"utf-8\"/> <script>alert('操作成功')</script>";
           		 echo '<script>location.href="'.U('Index/ht_txjl').'"</script>';
  			}else{
  				echo "<meta charset=\"utf-8\"/> <script>alert('操作失败')</script>";
           		echo '<script>javascript:history.back(-1);</script>';
  			}
  		}
  }

  private function DesMoney($money,$uid){
        $data['type']=1;
        $data['num']=$money;
        $data['uid']=$uid;
        $data['type_name']='审核不通';
        $data['content']='提现审核不通过,退回'.$money.'元';
        $data['add_time']=time();
        M('money_detail')->add($data);
        return true;
    }

 }
 ?>