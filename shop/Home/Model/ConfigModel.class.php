<?php
namespace Home\Model;

use Common\Model\ModelModel;

/**
 * 用户模型
 *
 */
class ConfigModel extends ModelModel
{
    

    protected $tableName = 'config';
    
    public function getValue($field){

        $where['name']=$field;
        return $this->where($where)->getField('value');
    }

    public function getById($id){
        $where['id']=$id;
        return $this->where($where)->field('value,tip')->find();
    }

    //获取拆分概率
    public function getVl(){
        
        $config=D('Config')->field('name,value')->where(array('type'=>5))->select();
        //转一维数组
        foreach ($config as $key => $val) {
           $data[$val['name']]=$val['value'];
        }
        return $data;
    }

    public function getMaxLand($type){
        switch ($type) {
            case 1:
                $where['id']=9;
                break;
            case 2:
                $where['id']=11;
                break;
            case 3:
                $where['id']=13;
                break;
            case 4:
                $where['id']=37;
                break;
            default:
               return false;
                break;
        }
       return $this->where($where)->getField('value');

    }


}
