<?php

namespace SAdmin\Model;

use Think\Model;

class GoodsModel extends Model
{

	function copy_goods($goods_id)
	{
		$query = M()->query("SELECT DISTINCT * FROM " . C('DB_PREFIX') . "goods p LEFT JOIN " . C('DB_PREFIX') . "goods_description pd ON (p.goods_id = pd.goods_id) WHERE p.goods_id =" . (int)$goods_id);

		if ($query) {
			$data = $query[0];

			$data['viewed'] = '0';
			$data['image'] = '';

			$data['goods_description'] = M('goods_description')->where(array('goods_id' => $goods_id))->find();

			$data['goods_description']['name'] = $data['name'];

			$data['goods_discount'] = M('goods_discount')->where(array('goods_id' => $goods_id))->select();

			$category = M('goods_to_category')->where(array('goods_id' => $goods_id))->select();

			foreach ($category as $k => $v) {
				$data['goods_category'][] = $v['category_id'];
			}

			$this->add_Goods($data);
		}
	}


	public function del_Goods($id)
	{
		try {
			M("product_detail")->where(array("id" => $id))->delete();
			return array(
				'status' => 'success',
				'message' => '删除成功',
				'jump' => U('Goods/index')
			);
		} catch (Exception $e) {
			return array(
				'status' => 'fail',
				'message' => '删除失败,未知异常',
				'jump' => U('Goods/index')
			);
		}
	}

	public function get_goods_data($id)
	{

		$d = M('Goods')->find($id);

		$d['thumb_image'] = resize($d['image'], 100, 100);

		return $d;

	}

	public function get_goods_image_data($id)
	{

		$d = M('goods_image')->where(array('goods_id' => $id))->select();

		foreach ($d as $k => $v) {
			$d[$k]['thumb'] = resize($v['image'], 100, 100);
		}

		return $d;

	}

	public function get_goods_category_data($id)
	{

		$sql = 'SELECT pc.name,ptc.category_id FROM ' . C('DB_PREFIX') . 'goods_to_category ptc,'
			. C('DB_PREFIX') . 'goods_category pc WHERE pc.id=ptc.category_id AND ptc.goods_id=' . $id;

		$d = M()->query($sql);


		return $d;

	}

	public function show_goods_page($search)
	{

		$sql = 'SELECT pd.id,pd.type_id,pd.name,pd.price,pd.pic,pd.status,pd.shangjia,pd.stock,pd.ctime,pc.id as cid,pc.name as cname FROM ' . C('DB_PREFIX') . 'product_detail pd,'
			. C('DB_PREFIX') . 'product_cate pc WHERE pd.type_id=pc.id';

		if (isset($search['name'])) {
			$sql .= " and pd.name like '%" . $search['name'] . "%'";
		}
		if (isset($search['category'])) {
			$sql .= " and pc.id=" . $search['category'];
		}
		if (isset($search['status'])) {
			$sql .= " and pd.status=" . $search['status'];
		}
		$duobao = 1;
		$sql.=" and pd.is_duobao=".$duobao;
		$count = count(M()->query($sql));

		$Page = new \Think\Page($count, C('BACK_PAGE_NUM'));

		$show = $Page->show();// 分页显示输出

		$sql .= ' order by pd.status desc,pd.ctime desc LIMIT ' . $Page->firstRow . ',' . $Page->listRows;


		$list = M()->query($sql);


		foreach ($list as $key => $value) {
			$list[$key]['pic'] = $value['pic'];
			$list[$key]['time'] = date("Y-m-d H:i:s", $value['ctime']);
		}


		return array(
			'empty' => '<tr><td colspan="20">~~暂无数据</td></tr>',
			'list' => $list,
			'page' => $show
		);

	}
	public function show_shangpin($search)
	{
			$sql = 'SELECT pd.id,pd.type_id,pd.count_price,pd.jifen_nums,pd.name,pd.price,pd.pic,pd.status,pd.stock,pd.ctime,pc.id as cid,pc.name as cname FROM ' . C('DB_PREFIX') . 'product_detail pd,'
			. C('DB_PREFIX') . 'product_cate pc WHERE pd.type_id=pc.id';

		if (isset($search['name'])) {
			$sql .= " and pd.name like '%" . $search['name'] . "%'";
		}
		if (isset($search['category'])) {
			$sql .= " and pc.id=" . $search['category'];
		}
		if (isset($search['status'])) {
			$sql .= " and pd.status=" . $search['status'];
		}

		$duobao = 1;
		$sql.=" and pd.is_duobao=".$duobao;
		$count = count(M()->query($sql));

		$Page = new \Think\Page($count, C('BACK_PAGE_NUM'));

		$show = $Page->show();// 分页显示输出

		$sql .= ' order by pd.status desc,pd.ctime desc LIMIT ' . $Page->firstRow . ',' . $Page->listRows;


		$goodsdet = M()->query($sql);
	

		foreach ($goodsdet as $key => $value) {
			$goodsdet[$key]['pic'] = $value['pic'];
			$goodsdet[$key]['time'] = date("Y-m-d H:i:s", $value['ctime']);
		}


		return array(
			'empty' => '<tr><td colspan="20">~~暂无数据</td></tr>',
			'goodsdet' => $goodsdet,
			'page' => $show
		);


	}

	/*一元购*/
	public function show_goods_pageyiyuangou($search){

		$sql='SELECT pd.id,pd.type_id,pd.name,pd.price,pd.pic,pd.status,pd.stock,pd.ctime,pc.id as cid,pc.name as cname FROM '.C('DB_PREFIX').'product_detail pd,'
			.C('DB_PREFIX').'product_cate pc WHERE pd.type_id=pc.id';

		if(isset($search['name'])){
			$sql.=" and pd.name like '%".$search['name']."%'";
		}
		if(isset($search['category'])){
			$sql.=" and pc.id=".$search['category'];
		}
		if(isset($search['status'])){
			$sql.=" and pd.status=".$search['status'];
		}
		$duobao = 2;
		$sql.=" and pd.is_duobao=".$duobao;
		$count=count(M()->query($sql));

		$Page = new \Think\Page($count,C('BACK_PAGE_NUM'));

		$show  = $Page->show();// 分页显示输出

		$sql.=' order by pd.status desc,pd.ctime desc LIMIT '.$Page->firstRow.','.$Page->listRows;


		$list=M()->query($sql);


		foreach ($list as $key => $value) {
			$list[$key]['pic']=$value['pic'];
			$list[$key]['time']=date("Y-m-d H:i:s",$value['ctime']);
		}


		return array(
			'empty'=>'<tr><td colspan="20">~~暂无数据</td></tr>',
			'list'=>$list,
			'page'=>$show
		);

	}

	public function validate($data)
	{

		$error = array();
		if (empty($data['name'])) {
			$error = '产品名称必填';
		}
		if (empty($data['price'])) {
			$error = '产品价格必填';
		}
		if (empty($data['pic'])) {
			$error = '产品封面图必填';
		}
//			if(empty($data['csize'])){
//				$error='产品尺寸必填';
//			}
//			if(empty($data['color_cate'])){
//				$error='产品颜色必填';
//			}
/*
		if (empty($data['category'])) {
			$error = '产品分类必填';
		}
*/
	if (empty($data['stock'])) {
			$error = '库存必填';
		}
	if (empty($data['content'])) {
			$error = '产品详情必填';
		}

		if ($error) {
			return array(
				'status' => 'back',
				'message' => $error
			);
		}

	}

	public function edit_Goods($data)
	{
		$error = $this->validate($data);

		if ($error) {
			return $error;
		}

		$id = $data['id'];

		$goods['id'] = $id;
		$goods['name'] = $data['name'];


		$zong_s=M('gerenshangpu')->where(array('id'=>1))->find();
		$type_a['type']=$zong_s['shop_type'];
		$zong_a=M('product_cate')->where($type_a)->find();


		$goods['type_id'] = $zong_a['id'];

/*   var_dump($zong_s);die;*/


		$goods['s_desc'] = $data['s_desc'];
		$goods['price'] = $data['price'];
		$goods['old_price'] = $data['old_price'];
		$goods['pic'] = $data['pic'];
		$goods['pic1'] = $data['pic1'];
		$goods['pic2'] = $data['pic2'];
		$goods['pic3'] = $data['pic3'];
		$goods['pic4'] = $data['pic4'];
		$goods['pic5'] = $data['pic5'];
		$goods['freight'] = $data['freight'];
		$goods['address'] = $data['address'];
		$goods['is_sort'] = $data['sort'];
		$goods['is_hot'] = $data['hot'];
		$goods['is_new'] = $data['new'];
		$goods['is_duobao'] = 1;
		$goods['is_tuijian'] = $data['tuijian'];
		//消费积分使用比例
		$goods['xiaofei_bili'] = $data['xiaofei_bili'];
		//商品价格可参与三级分销
		$goods['sanji_use'] = $data['sanji_use'];

		/*三个参数选择*/
		$goods['color_cate'] = $data['color_cate'];
		$goods['csize'] = $data['csize'];
		$jifen_type = '';
		foreach ($data['jifen_type'] as $jf_key => $jifen) {
			if ($jf_key != (count($data['jifen_type']) - 1)) {
				$jifen_type = $jifen_type . $jifen . ",";
			} else {
				$jifen_type = $jifen_type . $jifen;
			}
		}
		$goods['jifen_type'] = trim($jifen_type, ',');
		$goods['stock'] = $data['stock'];
		$goods['content'] = $data['content'];
		$goods['status'] = $data['status'];
		$goods['jifen_nums'] = $data['jifen_nums'];
		//开奖人数条件
		$goods['kaijiang_nums'] = $data['kaijiang_nums'];
		//夺宝产品还是普通产品
	
		$r = M('product_detail')->save($goods);

		if($goods['is_duobao'] == 2){
			if ($r) {
				return array(
					'status' => 'success',
					'message' => '修改成功',
					'jump' => U('Yygoods/index')
				);
			} else {
				return array(
					'status' => 'fail',
					'message' => '修改失败',
					'jump' => U('Yygoods/index')
				);
			}
		}else{
			if ($r) {
				return array(
					'status' => 'success',
					'message' => '修改成功',
					'jump' => U('Goods/index')
				);
			} else {
				return array(
					'status' => 'fail',
					'message' => '修改失败',
					'jump' => U('Goods/index')
				);
			}
		}

	}

	function add_Goods($data)
	{

		$error = $this->validate($data);

		if ($error) {

			return $error;
		}

		$goods['name'] = $data['name'];
		$goods['s_desc'] = $data['s_desc'];
		$zong_s=M('gerenshangpu')->where(array('id'=>1))->find();
		$type_a['type']=$zong_s['shop_type'];
		$zong_a=M('product_cate')->where($type_a)->find();


		$goods['type_id'] = $zong_a['id'];

		$goods['price'] = $data['price'];
		$goods['old_price'] = $data['old_price'];
		$goods['pic'] = $data['pic'];
		$goods['pic1'] = $data['pic1'];
		$goods['pic2'] = $data['pic2'];
		$goods['pic3'] = $data['pic3'];
		$goods['pic4'] = $data['pic4'];
		$goods['pic5'] = $data['pic5'];
		$goods['freight'] = $data['freight'];
		$goods['address'] = $data['address'];
		$goods['is_sort'] = $data['sort'];
		$goods['is_hot'] = $data['hot'];
		$goods['is_new'] = $data['new'];
		$goods['is_tuijian'] = $data['tuijian'];
		$goods['color_cate'] = $data['color_cate'];
		$goods['csize'] = $data['csize'];
		$goods['stock'] = $data['stock'];
		$goods['content'] = $data['content'];
		$goods['status'] = $data['status'];
		$goods['is_duobao'] = 1;
		$goods['jifen_nums'] = $data['jifen_nums'];
		//开奖条件
		$goods['kaijiang_nums'] = $data['kaijiang_nums'];

		//消费积分使用比例
		$goods['xiaofei_bili'] = $data['xiaofei_bili'];
		//商品价格可参与三级分销
		$goods['sanji_use'] = $data['sanji_use'];
		$goods['jifen_type'] = trim($data['alltypes'], ',');


		$goods['ctime'] = time();
		//夺宝产品还是普通产品

		$goods_id = M('product_detail')->add($goods);
		if($goods['is_duobao'] == 2){
			if ($goods_id) {
				return array(
					'status' => 'success',
					'message' => '新增成功',
					'jump' => U('Yygoods/index')
				);
			} else {
				return array(
					'status' => 'fail',
					'message' => '新增失败',
					'jump' => U('Yygoods/index')
				);
			}
		}else{
			if ($goods_id) {
				return array(
					'status' => 'success',
					'message' => '新增成功',
					'jump' => U('Goods/index')
				);
			} else {
				return array(
					'status' => 'fail',
					'message' => '新增失败',
					'jump' => U('Goods/index')
				);
			}
		}
	}
function add_dianpu($data)
	{

		$error = $this->zongdian($data);

		if ($error) {

			return $error;
		}
        
        $id['id'] = 1;
		$goods['shop_name'] = $data['shop_name'];
       
		$goods['shop_logo'] = $data['shop_logo'];
		$goods['shop_vpay'] = $data['shop_vpay'];
		$goods['shop_weixin'] = $data['shop_weixin'];
		$goods['shop_zhifubao'] = $data['shop_zhifubao'];
    
	
		$goods['shop_address'] = $data['shop_address'];
		$goods['shop_type'] = $data['shop_type'];


		$goods_id = M('gerenshangpu')->where($id)->save($goods);

			if ($goods_id) {
				return array(
					'status' => 'success',
					'message' => '修改成功',
					'jump' => U('goods/dianpu')
				);
			} else {
				return array(
					'status' => 'fail',
					'message' => '修改失败',
					'jump' => U('goods/dianpu')
				);
			}


	}

	public function zongdian($data)
	{

		$error = array();
		if (empty($data['shop_name'])) {
			$error = '店铺名称必填';
		}
		if (empty($data['shop_address'])) {
			$error = '发货地址必填';
		}
		if (empty($data['shop_logo'])) {
			$error = '店铺logo图必填';
		}
//			if(empty($data['csize'])){
//				$error='产品尺寸必填';
//			}
//			if(empty($data['color_cate'])){
//				$error='产品颜色必填';
//			}

		if (empty($data['shop_type'])) {
			$error = '产品分类必填';
		}


		if ($error) {

			return array(
				'status' => 'back',
				'message' => $error
			);

		}


	}






	function get_goods_options($goods_id)
	{
		$goods_option_data = array();

		$goods_option_query = M()->query("SELECT * FROM " . C('DB_PREFIX') . "goods_option po LEFT JOIN "
			. C('DB_PREFIX') . "option o ON po.option_id = o.option_id WHERE po.goods_id =" . (int)$goods_id);

		foreach ($goods_option_query as $goods_option) {
			$goods_option_value_data = array();

			$goods_option_value_query = M()->query("SELECT * FROM " . C('DB_PREFIX')
				. "goods_option_value WHERE goods_option_id = '"
				. (int)$goods_option['goods_option_id'] . "'");

			foreach ($goods_option_value_query as $goods_option_value) {
				$goods_option_value_data[] = array(
					'goods_option_value_id' => $goods_option_value['goods_option_value_id'],
					'option_value_id' => $goods_option_value['option_value_id'],
					'quantity' => $goods_option_value['quantity'],
					'subtract' => $goods_option_value['subtract'],
					'price' => $goods_option_value['price'],
					'price_prefix' => $goods_option_value['price_prefix'],
					'image' => $goods_option_value['image'],
					'weight' => $goods_option_value['weight'],
					'weight_prefix' => $goods_option_value['weight_prefix']
				);
			}

			$goods_option_data[] = array(
				'goods_option_id' => $goods_option['goods_option_id'],
				'option_id' => $goods_option['option_id'],
				'name' => $goods_option['name'],
				'type' => $goods_option['type'],
				'option_value' => $goods_option['name'],
				'required' => $goods_option['required'],
				'goods_option_value' => $goods_option_value_data,
			);
		}

		return $goods_option_data;
	}


}

?>