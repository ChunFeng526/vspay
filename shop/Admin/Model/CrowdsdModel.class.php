<?php
namespace Admin\Model;

use Common\Model\ModelModel;
use Think\Model\RelationModel;
/**
 * 用户模型
 *
 */
class CrowdsdModel extends RelationModel
{
    protected $tableName = 'crowds_detail';
    // protected $_link = array(
    //     'Crowds' => array(
    //         'mapping_type'  => self::BELONGS_TO,
    //         'class_name'    => 'Crowds',
    //         'foreign_key'   => 'id',
    //         'condition'     => 'id=crowds_id',
    //         'mapping_name'  => 'crowdss',
    //         'mapping_order' => 'create_time desc',
           
    //     ),
    //     'User' => array(
    //         'mapping_type'  => self::BELONGS_TO,
    //         'class_name'    => 'User',
    //         'foreign_key'   => 'uid',
    //         'mapping_name'  => 'user',
    //         'condition'     => 'userid',
    //         'mapping_fields'=> 'username,mobile',
        
    //     ),
        
    // );
    

}
