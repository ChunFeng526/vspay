<?php
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;
class GoodsController extends CommonController{

 //商品类型列表展示
	public function ht_spngl(){
        $shop=M("shoptype");
        $one=$shop->where(array('pathid'=>0))->order('id asc')->select();
        $two=$shop->where('pathid != 0')->order('px desc')->select();
        $this->assign("one",$one);
        $this->assign("two",$two);
        $this->display();
	}

	//产品类型删除
public function ht_spngldel(){
        $id=I('id');
        $shoptype=M('shoptype');
        $goods=M('commodity')->where(array('com_pathid'=>$id))->find();
        if($goods){
        	echo "<meta charset=\"utf-8\"/> <script>alert('该类型已添加商品,不可删除')</script>";
        	echo '<script>javascript:history.back(-1);</script>';
        	return;
        }
        $bool=$shoptype->where(array('id'=>$id))->delete();
        if($bool){
        	$this->redirect('Goods/ht_spngl');

        }else{
        	echo "<meta charset=\"utf-8\"/> <script>alert('删除失败！')</script>";
        	echo '<script>javascript:history.back(-1);</script>';
        }
}
//产品大类删除
public function ht_spngldelet(){
	    $id=I('id');
        $shoptype=M('shoptype');
        $goods=$shoptype->where(array('pathid'=>$id))->getField('id',true);
		if($goods){
			   $goods=M('commodity')->where(array('com_pathid'=>array('in',$goods)))->select();
			   if($goods){
		        	echo "<meta charset=\"utf-8\"/> <script>alert('该类型已添加商品,不可删除')</script>";
		        	echo '<script>javascript:history.back(-1);</script>';
		        	return;
		        }
		         $bools=$shoptype->where(array('pathid'=>$id))->delete();
		         if($bools){
                     $bool=$shoptype->where(array('id'=>$id))->delete();
		         }
		        if($bool){
		        	$this->redirect('Goods/ht_spngl');

		        }else{
		        	echo "<meta charset=\"utf-8\"/> <script>alert('删除失败！')</script>";
		        	echo '<script>javascript:history.back(-1);</script>';
		        }
		}
     
         $goods=M('commodity')->where(array('com_pathid'=>$id))->find();
        if($goods){
        	echo "<meta charset=\"utf-8\"/> <script>alert('该类型已添加商品,不可删除')</script>";
        	echo '<script>javascript:history.back(-1);</script>';
        	return;
        }
        $bool=$shoptype->where(array('id'=>$id))->delete();
        if($bool){
        	$this->redirect('Goods/ht_spngl');

        }else{
        	echo "<meta charset=\"utf-8\"/> <script>alert('删除失败！')</script>";
        	echo '<script>javascript:history.back(-1);</script>';
        }
}


//================商品类型添加s=================
    public function ht_spadt(){
        $shoptype=M('shoptype');

         if(!empty($_POST)){
         	$dada=I('post.');
         	if(empty($dada['type']))
 			{
                echo "<meta charset=\"utf-8\"/> <script>alert('类型名称不能为空')</script>";
                echo '<script>javascript:history.back(-1);</script>';
                return;
			}

			#++++上传图片++++
			if($_FILES['img']['name']){
				$upload = new \Think\Upload();// 实例化上传类
		        $upload->maxSize   =     3145728 ;// 设置附件上传大小
		        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		        $upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
		        $upload->savePath  =     ''; // 设置附件上传（子）目录
		        $info=  $upload->upload();
		        if(!$info) {
		        		$this->error($upload->getError());
	            		return false;
	    		}
	    		else 
	    		{// 上传成功
		          foreach($info as $file){
						 $img=$file['savepath'].$file['savename'];
					}
				}
				$dada['xcimg']=$img;
			}
			#++++上传图片++++
			// print_r($dada);
			// die;
			if(!empty($dada['id'])){//修改
			     $res=$shoptype->save($dada);   
			}
			else
			{//添加
			     $dada['addtime']=time();
			     $res=$shoptype->add($dada);
			}
			if($res)
			{
                echo "<meta charset=\"utf-8\"/> <script>alert('操作成功')</script>";
                echo '<script>location.href="' . U('Goods/ht_spngl') . '"</script>';
                return;
            }else{
                echo "<meta charset=\"utf-8\"/> <script>alert('操作失败')</script>";
                echo '<script>javascript:history.back(-1);</script>';
                return;
            } 
		 }else{//如果post为空调用模板
		 	 $id=I('id');
	         if(!empty($id)){//修改类型
				$dada=$shoptype->where('id='.$id)->find();
				$up_info=$shoptype->find($dada['pathid']);
				$this->assign('dada',$dada);
				$this->assign('up_info',$up_info);
				$this->shopname="修改类型";
			 }else{//如果get为空则为添加商品
			 	$pathid=I('pathid');
			 	$types=$shoptype->find($pathid);
                $this->assign('up_info',$types);
                if($pathid)
                	$this->shopname="添加子分类";
                else
                	$this->shopname="添加类型";
				

			 }
			$this->display();	
		 }
	   }

//==========================商品类型添加e==============

//====================商品相关的开始================
	    //商品列表
	public function ht_spgl(){
        $commodity=M('commodity');
        $type=I('type',1,'intval');
       
       	$arrData['com_pathid']=$type;
       	$pathid=M('shoptype')->where(array('pathid'=>$type))->getField('id',true);
       	if($pathid)
       		$arrData['com_pathid']=array('in',$pathid);

        if(!empty($_GET)){
			  if(!empty($_GET['com_name'])){//按商品id搜索
			      $arrData['com_name'] = array('like',"%".$_GET['com_name']."%");
		      }
	          if(!empty($_GET['com_hao'])){//按商品编号搜索
			      $arrData['com_hao'] = array('like',"%".$_GET['com_hao']."%"); 
		      }
		      if($_GET['isshop']!=''){//按商品id和名字搜索
		       $arrData['com_type'] =$_GET['isshop'];
		      }
		}
		$count = $commodity->where($arrData)->count('com_id');// 查询满足要求的总记录数
	    $Page   = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
	    $show   = $Page->show();// 分页显示输出
	    $info = $commodity->order('com_pathid asc,com_px asc')->where($arrData)->order('com_id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('info',$info);
        $this->assign('type',$type);
	    $this->assign('page',$show);// 赋值分页输出
	     $this->display();
	}
	    //商品添加编辑
	public function ht_spadd(){
        $commodity=M('commodity');

         if(!empty($_POST)){//如果post不为空为添加或修改商品
         	/**
         	 ======如果post。com_id不为空则为修改商品信息
         	 */
         	$type=$_POST['shoptype'];
			 if(!empty($_POST['com_id'])){
				    $dada1['com_name']=$_POST['com_name']; 
				    $dada1['com_hao']=$_POST['com_hao']; 
				    $dada1['com_pathid']=$_POST['shoptype']; 
				    $dada1['com_yj']=$_POST['com_yj'];
					$dada1['com_xj']=$_POST['com_xj'];
					$dada1['com_box']=$_POST['com_box'];
					$dada1['com_rl']=$_POST['com_rl']; 
					$dada1['com_one']=$_POST['com_one'];
					$dada1['com_two']=$_POST['com_two']; 
					$dada1['com_px']=$_POST['com_px'];
					$dada1['com_yf']=$_POST['com_yf'];
					$dada1['com_type']=$_POST['type'];
					$dada1['com_cs']=$_POST['com_cs'];
					$dada1['com_cs2']=$_POST['com_cs2'];
					$dada1['com_cs3']=$_POST['com_cs3'];
					$dada1['com_spjs']=$_POST['com_spjs'];
					$dada1['com_kc']=$_POST['com_kc'];
					$dada1['com_zjf']=$_POST['com_zjf'];
					$dada1['com_hot']=$_POST['com_hot'];
					$dada1['com_new']=$_POST['com_new'];
					$dada1['com_recommend']=$_POST['com_recommend'];
                    if(empty($dada1['com_name'])){
                        echo "<meta charset=\"utf-8\"/> <script>alert('商品名称不能为空')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
					}
					if(empty($dada1['com_pathid'])){
                        echo "<meta charset=\"utf-8\"/> <script>alert('未选择商品所属')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
					}
					if(empty($dada1['com_px'])){
						$dada1['com_px']=1;
					}
              
			     	$boolData1=$commodity->where('com_id='.$_POST['com_id'])->save($dada1);//商品信息修改
	                if($boolData1){
	                    echo "<meta charset=\"utf-8\"/> <script>alert('修改产品成功!')</script>";
	                    echo '<script>location.href="' . U('Goods/ht_spgl',array('type'=>$type)) . '"</script>';
	                    return;
	                }else{
	                    echo "<meta charset=\"utf-8\"/> <script>alert('修改产品失败!')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
	                }
			 }
			 /**
			 ===========如果post。com_id为空则为添加商品信息==============
			 */
			 else
			 {
				$upload = new \Think\Upload();// 实例化上传类
		        $upload->maxSize   =     3145728 ;// 设置附件上传大小
		        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		        $upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
		        $upload->savePath  =     ''; // 设置附件上传（子）目录
		        $info=  $upload->upload();
		        if(!$info) {
		        		$this->error($upload->getError());
                		return;
        		}
        		else 
        		{// 上传成功
			          foreach($info as $file){
							 $data[$file['key']]=$file['savepath'].$file['savename'];
					  }
				    $dada['com_name']=$_POST['com_name'];
					$dada['com_xc']=$data['com_xc'];
					$dada['com_lb1']=$data['com_lb1'];
					$dada['com_lb2']=$data['com_lb2'];
					$dada['com_lb3']=$data['com_lb3'];
				    $dada['com_yj']=$_POST['com_yj'];
					$dada['com_xj']=$_POST['com_xj'];
					$dada['com_box']=$_POST['com_box'];
					$dada['com_pathid']=$_POST['shoptype'];
					$dada['com_kc']=$_POST['com_kc'];
					$dada['com_zjf']=$_POST['com_zjf'];
					$dada['com_hot']=$_POST['com_hot'];
					$dada['com_new']=$_POST['com_new'];
					$dada['com_recommend']=$_POST['com_recommend'];

					if(empty($dada['com_name'])){
                        echo "<meta charset=\"utf-8\"/> <script>alert('商品名称不能为空')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
					}
					if(empty($dada['com_pathid'])){
                        echo "<meta charset=\"utf-8\"/> <script>alert('未选择商品所属')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
					}
					$dada['com_rl']=$_POST['com_rl']; 
					$dada['com_yf']=$_POST['com_yf'];
					$dada['com_cs']=$_POST['com_cs'];
					$dada['com_cs2']=$_POST['com_cs2'];
					$dada['com_cs3']=$_POST['com_cs3'];
					$dada['com_spjs']=$_POST['com_spjs'];
					$dada['com_time']=time();
					$dada['com_hao']=$_POST['com_hao'];
                    $dada['com_one']=$_POST['com_one'];
					$dada['com_two']=$_POST['com_two']; 
					$dada['com_px']=$_POST['com_px'];
                    $dada['com_type']=2;

            
				     $boolData=$commodity->add($dada);
	                if($boolData){
	                    echo "<meta charset=\"utf-8\"/> <script>alert('添加产品成功')</script>";
	                    echo '<script>location.href="' . U('Goods/ht_spgl',array('type'=>$type)) . '"</script>';
	                    return;
	                }else{
	                    echo "<meta charset=\"utf-8\"/> <script>alert('添加产品失败')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
	                }  
				}
			}
			 
		 }else{//如果post为空调用模板

		 		#++++++商品类型++++++++
		 		$shoptype=M("shoptype");
			 	// 一级
			 	$pid_arr=$shoptype->where('pathid !=0')->order('id')->getField('pathid',true);
			 	if(!empty($pid_arr)){
			 		$up_type=$shoptype->where(array('pathid' =>0,'id'=>array('not in',$pid_arr)))->order('id')->select();
			 		// 二级
				 	$info=$shoptype->where('pathid !=0')->order('px desc')->select();
				 	foreach ($info as $key => $vo) {
				 		$where['id']=$vo['pathid'];
				 		$p_name=$shoptype->where($where)->getField('type');
				 		$info[$key]['type']=$p_name.'--'.$vo['type'];
				 	}
				 	$type_arr=array_merge($up_type,$info);
			 	}else{
			 		$up_type=$shoptype->where(array('pathid' =>0))->order('id')->select();
			 		$type_arr=$up_type;
			 	}

			 	
                $this->assign("type_arr",$type_arr);
                #++++++商品类型++++++++

		        if(!empty($_GET['com_id'])){//如果get不为空则为修改商品
					$dada=$commodity->where('com_id='.$_GET['com_id'])->find();
					$this->assign('dada',$dada);// 赋值数据集
					
				}

				$this->display();
		 }
	   }


	//商品删除
	 public function ht_spdelete(){
		   $commodity=M('commodity');
		   //先删除商品轮播图
            $filedata=$commodity->where('com_id='.$_GET['com_id'])->find();
            @unlink('./Public/Uploads/'.$filedata['com_xc']);
            @unlink('./Public/Uploads/'.$filedata['com_lb1']);
            @unlink('./Public/Uploads/'.$filedata['com_lb2']);
			@unlink('./Public/Uploads/'.$filedata['com_lb3']);
			// @unlink('./Public/Uploads/'.$filedata['com_lb4']);
		 //再删除商品表记录	
		 $data =$commodity->delete($_GET['com_id']);
		 if($data){
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Goods/ht_spgl',array('type'=>$filedata['com_pathid'])).'"</script>';
            return;
        }else{
            echo "<meta charset=\"utf-8\"/> <script>alert('删除失败')</script>";
            echo '<script>history.go(-1);</script>';
            return;
        }
	 }
	
	//====================商品相关的结束================
	
//轮播图添加
public function ht_baneradd(){
        $baner=M('baner');
         if(!empty($_POST)){//如果post不为空为添加或修改
			 if(!empty($_POST['baner_id'])){
			 	$upload = new \Think\Upload();// 实例化上传类
		        $upload->maxSize   =     3145728 ;// 设置附件上传大小
		        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		        $upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
		        $upload->savePath  =     ''; // 设置附件上传（子）目录
		        $info=  $upload->upload();
		        if(!$info) {
		        	
        		}
        		else 
        		{// 上传成功
			          foreach($info as $file){
							 $data[]=$file['savepath'].$file['savename'];
					  }
					  $dada1['baner_url']=$data[0];
			    }
			    	$dada1['baner_type']=$_POST['baner_type'];
				    $dada1['baner_name']=$_POST['baner_name'];
					$dada1['baner_px']=$_POST['baner_px'];
					if(empty($dada1['baner_px'])){
						$dada1['baner_px']=0;
					}
					if(!empty($dada1['baner_url'])){
					 $filedata=$baner->where('baner_id='.$_POST['baner_id'])->getField('baner_url');
			         @unlink('./Public/Uploads/'.$filedata);
					}
					

			     	$boolData1=$baner->where('baner_id='.$_POST['baner_id'])->save($dada1);//信息修改
	                if($boolData1){
	                    echo "<meta charset=\"utf-8\"/> <script>alert('修改成功!')</script>";
	                    echo '<script>location.href="' . U('Goods/ht_banerlb') . '"</script>';
	                    return;
	                }else{
	                    echo "<meta charset=\"utf-8\"/> <script>alert('修改失败!')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
	                }
	            
			 }else{
				$upload = new \Think\Upload();// 实例化上传类
		        $upload->maxSize   =     3145728 ;// 设置附件上传大小
		        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		        $upload->rootPath  =     './Public/Uploads/'; // 设置附件上传根目录
		        $upload->savePath  =     ''; // 设置附件上传（子）目录
		        $info=  $upload->upload();
		        if(!$info) {
		        		$this->error($upload->getError());
                		return;
        		}
        		else 
        		{// 上传成功
			          foreach($info as $file){
							 $data[]=$file['savepath'].$file['savename'];
					  }
					$dada['baner_type']=$_POST['baner_type'];
				    $dada['baner_name']=$_POST['baner_name'];
					$dada['baner_url']=$data[0];
					$dada['baner_px']=$_POST['baner_px'];
				     $boolData=$baner->add($dada);
	                if($boolData){
	                    echo "<meta charset=\"utf-8\"/> <script>alert('添加成功')</script>";
	                    echo '<script>location.href="' . U('Goods/ht_banerlb') . '"</script>';
	                    return;
	                }else{
	                    echo "<meta charset=\"utf-8\"/> <script>alert('添加失败')</script>";
	                    echo '<script>javascript:history.back(-1);</script>';
	                    return;
	                }  
				}
			}
		 
		 }else{//如果post为空调用模板
		        if(!empty($_GET['baner_id'])){//如果get不为空则为修改
					$dada=$baner->where('baner_id='.$_GET['baner_id'])->find();
					$this->assign('dada',$dada);// 赋值数据集
				}
				$this->display();
		 }
	  
}
	//轮播展示
	public function ht_banerlb(){
		$baner=M('baner');
		$banerinfo=$baner->order('baner_px desc')->select();
		$this->assign('banerinfo',$banerinfo);
		$this->display();
	}

//轮播删除
   	 public function ht_banerdelete(){
		   $baner=M('baner');
		   //先删除商品轮播图
           $filedata=$baner->where('baner_id='.$_GET['baner_id'])->getField('baner_url');
		   @unlink('./Public/Uploads/'.$filedata);
		 //再删除商品表记录	
		 $data =$baner->delete($_GET['baner_id']);
		 if($data){
            echo "<meta charset=\"utf-8\"/> <script>alert('删除成功')</script>";
            echo '<script>location.href="'.U('Goods/ht_banerlb').'"</script>';
            return;
        }else{
            echo "<meta charset=\"utf-8\"/> <script>alert('删除失败')</script>";
            echo '<script>location.href="'.U('Goods/ht_banerlb').'"</script>';
            return;
        }
	 }

   private function tree($pid){
       static $i=1;
       static $tree='';
         $shop=M("shoptype");
         $infos=$shop->where(array('pathid'=>$pid))->order('px asc')->select();
        $tree .="<ul style='margin-left:20px' >";
         foreach ($infos as $k => $v) {
              $tree .="<li style='line-height:25px;' >";
              $date=date('Y-m-d H:i',$v['addtime']);
              $tree.="<span>|——{$v['type']}</span>";
              $tree.="<a style='color:red;float:right;' href='".U('Goods/ht_spngldel',array('id'=>$v['id']))."' >删 除</a>";
              $aa['pathid']=$v['id'];
              $inf=$shop->where($aa)->find();
              if($inf){
                $this->tree($v['id'],$str);

              }     
              $tree.="</li>"; 
         }
        $tree.="</ul>"; 
       
       return $tree;
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
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传成功!');location.href='" . U('Goods/ht_spadd',array('com_id'=>$com_id)) . "';</script>";
	 	 	}
	 	 	else{
	 	 		echo "<meta charset=\"utf-8\"/><script>alert('上传失败');</script>";
	 	 		echo "<script>javascript:history.back(-1);</script>";
	 	 	}
	 	 }
	 }
}