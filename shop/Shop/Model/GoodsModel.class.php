<?php

namespace Shop\Model;

use Think\Model;

class GoodsModel extends Model
{
	public function show_goods_page($search)
	{
		$sql = 'SELECT pd.id,pd.type_id,pd.name,pd.price,pd.pic,pd.status,pd.stock,pd.ctime,pc.id as cid,pc.name as cname FROM ' . C('DB_PREFIX') . 'product_detail pd,'
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

//        $sql .= ' order by pd.status desc,pd.ctime desc LIMIT ' . $Page->firstRow . ',' . $Page->listRows;

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
}


?>