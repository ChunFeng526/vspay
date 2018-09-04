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
class YygoodsController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
		$this->breadcrumb1='商城';
		$this->breadcrumb2='一元夺宝';
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
		$search['is_duobao'] = 2;
		$data=$model->show_goods_pageyiyuangou($search);

		$this->category=M('product_cate')->select();

		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出

		$this->display();
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
		$this->action=U('Yygoods/add');
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
			$this->success("修改成功",U("Yygoods/cate"));
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
}
?>