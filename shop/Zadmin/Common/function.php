<?php

/**
 * 生成分类链接
 *
 * @param $m
 * @param $where
 * @param int $pagesize
 * @return \Think\Page
 */

// function getpage(&$m,$where,$pagesize=10){
//     $m1=clone $m;
//     $count = $m->where($where)->count();
//     $m=$m1;
//     $p=new \Think\Page($count,$pagesize);
//     $p->rollPage   = 3;// 分页栏每页显示的页数
//     $p->lastSuffix=false;
//     $p->setConfig('header','<a>共<b>%TOTAL_ROW%</b>条记录 <b>%NOW_PAGE%</b>/<b>%TOTAL_PAGE%</b></a>');
//     $p->setConfig('prev','上一页');
//     $p->setConfig('next','下一页');
//     $p->setConfig('last','末页');
//     $p->setConfig('first','首页');
//     $p->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
//     $p->parameter=I('get.');
//     $m->limit($p->firstRow,$p->listRows);
//     return $p;
// }
 //图片上传公共方法
    function img_uploading($path_old=null)
    {    
        $images_path='./Public/uploads/';   
        if (!is_dir($images_path)) {
            mkdir($images_path);
        }
            $upload             = new \Think\Upload();// 实例化上传类    
            $upload->maxSize    =     3145728 ;// 设置附件上传大小    
            $upload->exts       =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
            $upload->rootPath   =      $images_path; // 设置上传根目录    // 上传文件     
            $upload->savePath   =      ''; // 设置上传子目录    // 上传文件     
            $info               =   $upload->upload(); 
                if(!$info)
                {// 上传错误提示错误信息
                    $res['stats']='error';        
                    $res['error']=$upload->getError();
                }
                else
                {// 上传成功 
                    foreach($info as $file){ 

                           $img_path = $file['savepath'].$file['savename'];
                    }
                    //上传成功后删除原来的图片
                    if($path_old && $img_path)
                    {
                        unlink($images_path.$path_old);
                       // echo '删除成功';
                    }
                    $res['stats']='success';
                    $res['res']=$img_path;
                }
            return $res;
    }  
   
    /**
     * [get_typename 获取类型名称]
     * @return [type] [description]
     */
   function get_typename($id){
        if(!isset($id) || empty($id))
            return false;
        $type=M('shoptype');
        $where['id']=$id;
        $type_name=$type->where($where)->getField('type');
        return $type_name;

   }
    


   //导出数据到Excel
    function getExcel($fileName,$headArr,$data){
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        import("Org.Util.PHPExcel");
        import("Org.Util.PHPExcel.Writer.Excel5");
        import("Org.Util.PHPExcel.IOFactory.php");

        $date = date("Y_m_d",time());
        $fileName .= "_{$date}.xls";

        //创建PHPExcel对象，注意，不能少了\
        $objPHPExcel = new \PHPExcel();
        $objProps = $objPHPExcel->getProperties();

        //设置表头
        $key = ord("A");
        //print_r($headArr);exit;
        foreach($headArr as $v){
            $colum = chr($key);
            $objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum.'1', $v);
            $objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum.'1', $v);
            $key += 1;
        }

        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();

        //print_r($data);exit;
        foreach($data as $key => $rows){ //行写入
            $span = ord("A");
            foreach($rows as $keyName=>$value){// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j.$column, $value);
                $span++;
            }
            $column++;
        }

        $fileName = iconv("utf-8", "gb2312", $fileName);
        //重命名表
        //$objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }