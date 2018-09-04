<?php

namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class IndexModel extends ModelModel
{
	protected $tableName = 'user';
    public function Getlasts($userid, $y, $lujing)
    {
        $where['userid'] = $userid;
        $path = M('user')->where($where)->getField($lujing);

        $newstr = ltrim($path, '0');
        $newstr = trim($newstr, '-');
        $arr = explode('-', $newstr);

        if (!empty($arr)) {
            rsort($arr);
            $mun = count($arr);
            $newarr = array();
            if ($mun > $y) {
                for ($x = 0; $x < $y; $x++) {
                    $newarr[] = $arr[$x];
                }
            } else {
                $newarr = $arr;
            }
            return $newarr;
        }
    }
    //判断用户等级
    public function Checklevel($memberid){
        $U_money = M('store')->where(array('uid'=>$memberid))->getField('fengmi_num');
        $old_level = M('user')->where(array('userid'=>$memberid))->getField('use_grade');
        $vip_level = M('user')->where(array('userid'=>$memberid))->getField('vip_grade');
        $new_level = 0;
        $new_level_vip = 0;//vip等级
        $vip_bili = M('config')->where(array('group' => 10, 'status' => 1))->order('id asc')->select();//vip比例
        $zhitui_bili = M('config')->where(array('group' => 6, 'status' => 1))->order('id asc')->select();//zhitui比例
        if($U_money < $vip_bili[0]['tip']){
            $new_level_vip = 0;
        }elseif ($U_money >= $vip_bili[0]['tip']){
            $new_level_vip = 1;
        }
        $zhitui_num = M('user')->where(array('pid' => $memberid,'vip_grade'=>1))->count(1);//计算直推人数
        if($zhitui_num >= $vip_bili[1]['tip'] && $new_level_vip == 1){
            $new_level_vip = 2;
        }
        if($U_money<$zhitui_bili[0]['tip']){
            $new_level = 0;
        }else if($U_money >= $zhitui_bili[0]['tip'] && $U_money<$zhitui_bili[1]['tip']){
            $new_level = 1;
        }else if($U_money >= $zhitui_bili[1]['tip'] && $U_money<$zhitui_bili[2]['tip']){
            $new_level = 2;
        }else if($U_money >= $zhitui_bili[2]['tip'] && $U_money<$zhitui_bili[3]['tip']){
            $new_level = 3;
        }else if($U_money >= $zhitui_bili[3]['tip']){
            $new_level = 4;
        }

        if($new_level>$old_level){
            M('user')->where(array('userid'=>$memberid))->setField('use_grade',$new_level);
        }
        if($new_level_vip > $vip_level){
            M('user')->where(array('userid'=>$memberid))->setField('vip_grade',$new_level_vip);
        }

    }
}
