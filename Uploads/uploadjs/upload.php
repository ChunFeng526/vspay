<?php

    $picname = $_FILES['uploadfile']['name']; 
    $picsize = $_FILES['uploadfile']['size']; 
    if ($picname != "") { 
        if ($picsize > 2014000) { //限制上传大小 
            echo '{"status":0,"content":"图片大小不能超过2M"}';
            exit; 
        } 
        $type = strstr($picname, '.'); //限制上传格式 
        if ($type != ".gif" && $type != ".jpg" && $type != "png") {
            echo '{"status":2,"content":"图片格式不对！"}';
            exit; 
        }
        $rand = rand(100, 999); 
        $pics = uniqid() . $type; //命名图片名称 
        //上传路径 
        $pic_path = "images/". $pics; 
        move_uploaded_file($_FILES['uploadfile']['tmp_name'], $pic_path); 
    } 
    $size = round($picsize/1024,2); //转换成kb 
    echo '{"status":1,"name":"'.$picname.'","url":"'.$pic_path.'","size":"'.$size.'","content":"上传成功"}';     
?>