<?php
namespace Zadmin\Controller;
use Zadmin\Controller\CommonController;
class RewardController extends CommonController {

    public function _initialize()
    {
        parent::_initialize();
    }

    //导出数据
    public function exportdata()
    {

        // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','account','string');
        if($keyword){
            $condition = array('like', '%' . $keyword . '%');
            $map[$querytype] = $condition;
        }
        
        //按日期搜索
        $date=date_query('create_time');
        if($date){
            $where=$date;
            if($map)
                $map=array_merge($map,$where);
            else
                $map=$where;
        }
        if(empty($map)){
            $this->error('请输入查询条件');
        }

        //每次最多导出5000条记录
        $field="id,manage_name,username,concat(' ',account) account,case type WHEN 1 THEN concat('+',guozi_num) WHEN 2 THEN concat('-',guozi_num) end  AS guozi_num,FROM_UNIXTIME(create_time,'%Y-%m-%d %H:%i:%s') AS datatime,content";
        $data = M('admin_zhuangz')->field($field)->where($map)->order('id desc')->limit(5000)->select();

        //拼接头部信息
        $headArr=array('序号','管理员','用户名','用户账户','数量','日期','说明');
        $filename="FruitsDetail";

        getExcel($filename,$headArr,$data);
    }
   
}
