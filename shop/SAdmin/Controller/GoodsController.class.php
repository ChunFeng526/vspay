<?php
/**
 * oscshop 电子商务系统
 *
 * ==========================================================================
 * @link      http://www.oscshop.cn/
 * @copyright Copyright (c) 2015 oscshop.cn.
 * @license   http://www.oscshop.cn/license.html License
 * ==========================================================================
 *
 * @author    李梓钿
 *
 */
namespace SAdmin\Controller;
use SAdmin\Model\GoodsModel;
class GoodsController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
		$this->breadcrumb1='商城';
		$this->breadcrumb2='商品管理';
	}

	public function index(){
		$model=new GoodsModel();

		$filter=I('get.');

		$search=array();

		if(isset($filter['name'])){
			$search['name']=$filter['name'];
		}
		if(isset($filter['category'])){
			$search['category']=$filter['category'];
			$this->get_category=$search['category'];
		}
		if(isset($filter['status'])){
			$search['status']=$filter['status'];
			$this->get_status=$search['status'];
		}

		$data=$model->show_goods_page($search);

		$this->category=M('product_cate')->select();

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出


		$this->display();
	}

 public function dianpu(){

		if(IS_POST){
			$model=new GoodsModel();
			$data=I('post.');
			$return=$model->add_dianpu($data);
			 $this->osc_alert($return);
		}
		$category = array();
		$cateList = M('product_cate')->select();

		//查出最后一级
		foreach ($cateList as $key => $value) {
			$count = M("product_cate")->where(array("pid"=>$value["id"]))->count();
			if($count==0){
				$category[] = $value;
			}
		}
$proid = 1;
		$this->goods = M("gerenshangpu")->where(array("id"=>$proid))->find();
$this->id=$proid;
		$this->category=$category;
		$this->action=U('Goods/dianpu');
		$this->breadcrumb2='总后台店铺';
		$this->crumbs='修改店铺';

		$this->display('dianpu');

    }






	function add(){

		if(IS_POST){
			$model=new GoodsModel();
			$data=I('post.');
			$return=$model->add_goods($data);
			$this->osc_alert($return);
		}
		$category = array();
		$cateList = M('product_cate')->select();

		//查出最后一级
		foreach ($cateList as $key => $value) {
			$count = M("product_cate")->where(array("pid"=>$value["id"]))->count();
			if($count==0){
				$category[] = $value;
			}
		}


		$this->category=$category;
		$this->action=U('Goods/add');
		$this->crumbs='新增';
		$this->display('add');
	}





	public function cate(){

		$protype = M('product_cate');
		$oneCate = array();
		$twoCate = array();
		$threeCate = array();

		//查询当前产品分类
		$oneList = $protype ->where(array("pid"=>0))->order("sort desc")->select();
		foreach($oneList as $keyy => $one){
			//添加一级
			array_push($oneCate,$one);
			$twoList = $protype -> where(array('pid'=>$one['id'])) -> select();
			foreach ($twoList as $key => $two) {
				//添加二级
				array_push($twoCate,$two);
				$threeList = $protype -> where(array('pid'=>$two['id'])) -> select();
				foreach ($threeList as $k => $three) {
					//添加三级
					array_push($threeCate,$three);
				}
			}

		}


		$this->assign("oneCate",$oneCate);
		$this->assign("twoCate",$twoCate);
		$this->assign("threeCate",$threeCate);

		$this->breadcrumb2='分类管理';
		$this->display();
	}



	public function delCate(){
		$id = I("id");
		//该ID是否存在下级分类
		$count = M("product_cate")->where(array("pid"=>$id))->count();
		if($count>0){
			$this->error("存在子分类，无法删除。");
		}else{
			M("product_cate")->where(array("id"=>$id))->delete();
			$this->success("删除成功");
		}
	}


	public function editCate(){
		$id = I("id");

		$protype = M('product_cate');

		$cate = $protype->where(array("id"=>$id))->find();

		$this->assign("cate",$cate);


		$this->breadcrumb2='分类管理';


		$this->display("edcate");
	}

	public function cateUpdate(){
		$pic = I("pic");
		$name = I("name");
		$id = I("id");
		$data['id'] = $id;
		$data['name'] = $name;


		$res = img_uploading();
		$photo = $res['res'];
		$data['pic'] = "/Uploads/image/touxiang/".$photo;

		$isSave = M("product_cate")->save($data);

		if($isSave){
			$this->success("修改成功",U("Goods/cate"));
		}else{
			$this->error("修改失败");
		}

	}

	public function cateAdd(){
		$pic = I("pic");
		$name = I("name");
		$pid = I("pid");
		if(!$name){
			$this->error("参数不能为空");
		}


		//当前分类下是否存在相同名字
		$count = M("product_cate")->where(array("name"=>$name,"pid"=>$pid))->count(1);
		if($count>0){
			$this->error("已经存在该分类标题");
		}

		if(!$pid)$pid=0;

		$res = img_uploading();
		$photo = $res['res'];
		$data['pic'] = "/Uploads/image/touxiang/".$photo;
		$data['name'] = $name;
		$data['pid'] = $pid;
		$data['ctime'] = time();

		$isAdd = M("product_cate")->add($data);
		if($isAdd){
			$this->success("添加商品分类成功");
		}else{
			$this->error("商品分类添加失败");
		}


	}



	function edit(){
		$model=new GoodsModel();

		if(IS_POST){
			$data=I('post.');
			$return=$model->edit_goods($data);
			$this->osc_alert($return);
		}
		$this->crumbs='编辑';
//		$this->action=U('Goods/edit');

		$category = array();
		$cateList = M('product_cate')->select();

		//查出最后一级
		foreach ($cateList as $key => $value) {
			$count = M("product_cate")->where(array("pid"=>$value["id"]))->count();
			if($count==0){
				$category[] = $value;
			}
		}
		$this->category=$category;
		$proid = I("id");
		$this->goods = M("product_detail")->where(array("id"=>$proid))->find();
		$this->id=$proid;
		$this->display('edit');
	}

	function test(){
		$a = ',1,2,3';
		$b = 1;
		$a = explode(',',$a);
		if(in_array($b, $a)){
			echo 2;
		}else{
			echo 3;
		}
	}

	function copy_goods(){
		$id =I('id');
		$model=new GoodsModel();
		if($id){
			foreach ($id as $k => $v) {
				$model->copy_goods($v);
			}
//			$data['redirect']=U('Goods/index');
			$this->ajaxReturn($data);
			die;
		}
	}

	function del(){
		$model=new GoodsModel();
		$return=$model->del_goods(I('get.id'));
		$this->osc_alert($return);
	}

  public function ggshop(){
  	$id['id']=array('neq',1);
  	$ggshop=M('gerenshangpu')->where($id)->select();
  	$this->breadcrumb1='商家入驻';
  	$this->breadcrumb2='个人店铺';
  	$this->assign('ggshop',$ggshop);
  	$this->display();
  }


  public function verify(){

  	$data = M('verify_list')->order("status asc")->select();
  	$this->data = $data;
  	$this->breadcrumb1='商家入驻';
  	$this->breadcrumb2='认证列表';
  	$this->display();
  }

  public function saveVerify(){
  		$id = I("id");
  		$status = I("status");

  		if(empty($id)||!isset($id)){
  			$this->error("参数错误");
  		}

  		if(empty($status)||!isset($status)){
  			$this->error("参数错误");
  		}

  		$verifyInfo = M("verify_list")->where(array("status"=>0,"id"=>$id))->find();
  		$type = $verifyInfo['type'];
  		$typeField = $type==2?"is_e_verify":"is_p_verify";
  		$statusField = $status==1?1:0;
  		$isVerify = M("verify_list")->where(array("status"=>0,"id"=>$id))->setField("status",$status);

  		M("member")->where(array("member_id"=>$verifyInfo['uid']))->setField($typeField,$statusField);
  		if($type==2){
  			M("member")->where(array("member_id"=>$verifyInfo['uid']))->setField("is_dailishang",2);
  		}

  		if($isVerify){
  			$this->success("操作成功");
  		}else{
  			$this->error("操作失败");
  		}

  }


    public function level(){
	  	$data = M('level_list')->order("status asc")->select();
	  	foreach ($data as $key => $value) {
	  		$data[$key]['account'] = M("member")->where(array("member_id"=>$value['uid']))->getField("phone");
	  		$data[$key]['username'] = M("member")->where(array("member_id"=>$value['uid']))->getField("uname");
	  	}

	  	$this->data = $data;
	  	$this->breadcrumb1='会员等级';
	  	$this->breadcrumb2='升级列表';
	  	$this->display();
  	}


  	public function levelup(){
  		$id = I("id");
  		$status = I("status");

  		if(empty($id)||!isset($id)){
  			$this->error("参数错误");
  		}

  		if(empty($status)||!isset($status)){
  			$this->error("参数错误");
  		}


  		$verifyInfo = M("level_list")->where(array("status"=>0,"id"=>$id))->find();
  		$isVerify = M("level_list")->where(array("status"=>0,"id"=>$id))->setField("status",$status);

  		if($status==1){
  			$isVerify = M("member")->where(array("member_id"=>$verifyInfo['uid']))->setField("member_grade",$verifyInfo['level']);
  		}

  		if($isVerify){
  			$this->success("操作成功");
  		}else{
  			$this->error("操作失败");
  		}


  	}
  	    public function wen(){
  	    	$this->breadcrumb1='商家入驻';
	  	$this->breadcrumb2 = '个人店铺';


		$id = I('id');
		$configsAll = M('gerenshangpu');
		$msgll = $configsAll->where(array('id' => $id))->find();
		$this->assign('id', $id);
		$this->assign('msgll', $msgll);
	  	$this->display();
  	}
  	public function Savewen()
	{
		$id = I('id');
		$configsAll = M('gerenshangpu');
		$data['shop_stort'] = I('shop_stort');
		if(empty($id)){
            echo '<script>alert("没有找到店铺"); window.history.back(-1); </script>';
            return;
        }else{
        	$configsAll->where(array('id'=>$id))->save($data);
        	$this->success("修改成功",U("Goods/ggshop"));
        }

    }
      	public function zhuangtai()
	{
		$id = I('id');
		$configsAll = M('gerenshangpu');
		$data['shop_zhuangtai'] = I('shop_zhuangtai');
		if(empty($id)){
            echo '<script>alert("没有找到店铺"); window.history.back(-1); </script>';
            return;
        }else{
        	$configsAll->where(array('id'=>$id))->save($data);
        	$this->success("修改成功",U("Goods/ggshop"));
        }

    }
          	public function dltgeren()
	{
		$id = I('id');
		$configsAll = M('gerenshangpu');

		if(empty($id)){
            echo '<script>alert("没有找到店铺"); window.history.back(-1); </script>';
            return;
        }else{
        	$configsAll->where(array('id'=>$id))->delete();
        	$this->success("删除成功",U("Goods/ggshop"));
        }

    }





}
?>