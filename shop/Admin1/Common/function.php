<?php 

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 * @author jry <598821125@qq.com>
 */
function is_login()
{
    return D('Admin/Manage')->is_login();
}

/**
 * [status_name 表状态配置]
 * @param  [type] $moble [数据表]
 * @param  [type] $value [状态值]
 * @return [type]        [description]
 */
function status_name($moble,$value){
	$arr=array();
	switch ($moble) {
		case 'traing':
			$arr=array(0=>"<span style='color:#2699ed' >出售成功</span>",1=>"<span style='color:#3c763d' >购买者已确认</span>",2=>"<span style='color:#ff7826' >交易完成</span>",3=>"<span style='color:#ef2a2a' >交易取消</span>");
			break;
		
		default:
			# code...
			break;
	}

	return $arr[$value];
}


/**
 * 字节格式化
 * @access public
 * @param string $size 字节
 * @return string
 */
function byte_Format($size) {
    $kb = 1024;          // Kilobyte
    $mb = 1024 * $kb;    // Megabyte
    $gb = 1024 * $mb;    // Gigabyte
    $tb = 1024 * $gb;    // Terabyte

    if ($size < $kb)
        return $size . 'B';

    else if ($size < $mb)
        return round($size / $kb, 2) . 'KB';

    else if ($size < $gb)
        return round($size / $mb, 2) . 'MB';

    else if ($size < $tb)
        return round($size / $gb, 2) . 'GB';
    else
        return round($size / $tb, 2) . 'TB';
}


/**
 * TODO 基础分页的相同代码封装，使前台的代码更少
 * @param $m 模型，引用传递
 * @param $where 查询条件
 * @param int $pagesize 每页查询条数
 * @return \Think\Page
 */
function getpage(&$m,$where,$pagesize=10){
    $m1=clone $m;//浅复制一个模型
    $count = $m->where($where)->count();//连惯操作后会对join等操作进行重置
    $m=$m1;//为保持在为定的连惯操作，浅复制一个模型
    $p=new Think\PageAdmin($count,$pagesize);
    $p->lastSuffix=false;
    $p->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
    $p->setConfig('prev','上一页');
    $p->setConfig('next','下一页');
    $p->setConfig('last','末页');
    $p->setConfig('first','首页');
    
    $p->parameter=I('get.');

    $m->limit($p->firstRow,$p->listRows);

    return $p;
}

//按日期搜索
function date_query($field){

        $date_start=I('date_start');
        $date_end=I('date_end');
        if(!empty($date_start) && !empty($date_end) && ($date_start == $date_end)){
            $map["FROM_UNIXTIME(".$field.",'%Y-%m-%d')"]=$date_end;
        }
        else if($date_start!='' && $date_end!='' && $date_start !=$date_end){
            $map[$field]=array('between',array(strtotime($date_start),strtotime($date_end)+86400));
        }
        else if($date_start!='' && empty($date_end)){
            $map[$field]=array('gt',strtotime($date_start)+86400);
        }
        else if(empty($date_start) && $date_end!=''){
            $map[$field]=array('lt',strtotime($date_end)+86400);
        }
        if($map)
            return $map;
}