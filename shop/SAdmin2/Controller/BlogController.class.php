<?php
namespace SAdmin\Controller;
use SAdmin\Model\BlogModel;
class BlogController extends CommonController{

	protected function _initialize(){
		parent::_initialize();
		$this->breadcrumb1='文章';
		$this->breadcrumb2='文章列表';
	}
	//根据get id查询分类下
	public function chazi(){
		$id = $_GET["bigname"];
		$list = M('blog_category')->where(array('pid'=>$id))->select();
		foreach($list as $k=>$v){
			$zf = M('blog_category')->where(array('pid'=>$v['id']))->select();
			if($zf){
			$list =	array_merge($zf,$list);
			}
		}


		foreach($list as $v=>$k){
			$select[] = array("id"=>$k['id'],"title"=>$k['title'],"price"=>$k['price'],"tj"=>$k['tj']);
		}
		echo json_encode($select);

	}
	public function index(){
		$model=new BlogModel();

		$data=$model->show_blog_page();


		$blog_category = M('blog_category')->select();
		$this->assign('blog_category',$blog_category);
		$this->assign('empty',$data['empty']);// 赋值数据集
		$this->assign('list',$data['list']);// 赋值数据集
		$this->assign('page',$data['page']);// 赋值分页输出
		/**/
		$this->display();
	}
	function add(){

		if(IS_POST){

			$model=new BlogModel();
			$data=I('post.');
			$return=$model->add_blog($data);
			$this->osc_alert($return);
		}
		$category = M('blog_category')->where(array('pid'=>0))->select();
		$this->category=$category;
		$this->action=U('Blog/add');
		$this->crumbs='新增';
		$this->display('edit');
	}

	function edit(){

		$model=new BlogModel();

		if(IS_POST){

			$data=I('post.');
			$return=$model->edit_blog($data);

			$this->osc_alert($return);
		}
		$category = M('blog_category')->where(array('pid'=>0))->select();
		$this->category=$category;

		$this->crumbs='编辑';
		$this->action=U('Blog/edit');
		$this->blog_content=M('blog_content')->where(array('blog_id'=>I('id')))->find();

		$this->blog=$model->get_blog_data(I('id'));

		$this->blog_images=$model->get_blog_image_data(I('id'));

		$this->blog_categories=$model->get_blog_category_data(I('id'));

		$this->display('edit');
	}


	function del(){
		$model=new BlogModel();
		$return=$model->del_blog(I('get.id'));
		$this->osc_alert($return);
	}
}
?>