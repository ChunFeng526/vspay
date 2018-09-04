<?php 
namespace Zadmin\Controller;
use Think\Controller;
use \Org\Util\Data;
class CommonController extends Controller{

	public function _initialize()
	{

		if(!isset($_SESSION["aid"]) || !isset($_SESSION["aname"]))
		{
			$this->redirect("Login/login");
		}
		$this->get_goodtype();
	}


	public function get_goodtype(){
		$type=M('shoptype');
		$where['pathid']=0;
		$goodtype=$type->where($where)->order('id')->select();
		$this->goodtype=$goodtype;
	}

	protected function thumbImg($file ,$width = 220, $height = 120){
		$img = new \Think\Image();
		$img->open("./Public/". $file);
		$thumbPath = dirname($file) . "/thumb_" . basename($file);
		$img->thumb($width, $height, \Think\Image::IMAGE_THUMB_FIXED)->save("./Public" . $thumbPath);
		return $thumbPath;
	}

	protected function get_choose($model, $data, $id, $lang){
		$ids = $this->get_son($data, $id);
		$ids[] = $id;
		$strId = implode(',', $ids);
		$choose = $model->where(array("lang" => $lang, "id" => array("not in", "{$strId}")))->select();
		$final = Data::tree($choose, "name", "id", "pid");
		return $final;
	}


	protected function get_son($cate, $id){
		$temp = array();
		foreach ($cate as $k => $v) {
			if($v['pid'] == $id){
				$temp[] = $v["id"];
				$temp = array_merge($temp, $this->get_son($cate, $v['id']));
			}
		}

		return $temp;
	}

	// 获得所属栏目列表
	protected function getColumn($type, $lang = 0)
	{
		$columns = M("Columns")->where(array("lang" => $lang))->select();
		$columns = Data::tree($columns, "name", "id", "pid");
		foreach ($columns as $key => $value) {
			if($value["type"] != $type)
			{
				unset($columns[$key]);
			}
		}
		return $columns;
	}


	// 修改排序
	public function editSort()
	{
		$id = I("post.id");
		$newSort = I("post.newSort", 0, "intval");
		if($m = ucfirst(I("post.m", "")))
		{

			$model = M("$m");
			if($model->find($id))
			{
				$model->where(array("id" => $id))->save(array("sort" => $newSort));
			}
			echo 1;
		}
	}

	// 删除
	public function delById()
	{
		$id = I("post.id");
		if($m = ucfirst(I("post.m", "")))
		{
			$model = M("$m");

			if($model->find($id))
			{
				$model->where(array("id" => $id))->delete();
				echo 1;
				exit;
			}
		}
	}
}



 ?>