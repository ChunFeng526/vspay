<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?php echo ($config['SITE_TITLE']); ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />

    <!-- Link Swiper's CSS -->

    <link rel="stylesheet" type="text/css" href="/Public/Public/css/style.css">
    <link rel="stylesheet" type="text/css" href="/Public/Public/css/foot.css">

    <link rel="stylesheet" href="/Public/Public/css/head.css">
    <link rel="stylesheet" href="/Public/Public/icon/iconfont.css">

    <!--<script src="/Public/Public/js/mui.min.js"></script>
<link href="/Public/Public/css/mui.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/Public/Public/css/styleshop.css" />
<link rel="stylesheet" href="/Public/Public/icon/iconfont.css">-->

    <script type="text/javascript" src="/Public/Public/js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript" src="/Public/Public/js/jquery.touchSlider.js"></script>
    <!-- Demo styles -->
    <!--弹框JS-->
    <script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
</head>

<script type="text/javascript">
    $(document).ready(function(){
//        allPrice = $('#allPrice').text(0);
        function flushPrice(){
            var allPrice = 0;
            $(".shop_sel").each(function(i,v){
                if($(this).is(':checked')){
                    var mbbr = $(".maibdr_bbr:eq("+i+")");
                    var p = mbbr.find(".tt").attr('data-price');

                    var price =  parseFloat(p);//p.substr(1,p.length-1)

                    var num = mbbr.find(".aab").find("input").val();
                    var all = price*num;
                    allPrice = allPrice+all;
                }

            });
            $("#allPrice").html(allPrice);
        }


        function fulshAllPrice(){
            var allPrice = 0;
            $(".maibdr_bbr").each(function(){
                var price = $(this).find(".tt").html();
                var num = $(this).find(".aab").find("input").val();
                var all = price*num;
                allPrice = allPrice+all;
            });
            $("#allPrice").html(allPrice);
        }

        $("#sel_all").click(function(){
            if($(this).attr("checked")=="checked"){
                $(".shop_sel:checkbox").attr("checked",true);
            }else{
                $(".shop_sel:checkbox").attr("checked",false);
            }
            flushPrice();
        });


        $("#buy_now").click(function(){
            var allPrice = $('#allPrice').text();
            if(allPrice <= 0){
                layer.msg('请至少选中一件商品', {shift: -1, time: 1200}, function () {
                });
                return;
            }
            var content = $(this).text();
            if(content == '删除'){

                $(".shop_sel:checked").each(function(i,v){
                    var maidb_edit = $(this).parents(".maidb_edit");
                    var p = $(this).attr('data-pid');
                    var g = $(this).attr('data-gid');
                    $.post("<?php echo U('Car/delcar');?>",{p:p,g:g},function(data){
                        if(data.status=="1"){
                            maidb_edit.remove();
                            $("#allPrice").html("0");
                            layer.msg(data.info, {shift: -1, time: 1200}, function () {

                            });
                        }

                    },"json");
                });
            }else{
                $("#buy_form").submit();
            }
        });

        /*选中商品显示价格*/
        $(".shop_sel").click(function(){
            flushPrice();
        });

        /*购物车编辑*/
        $("#doedit").click(function () {
            $('#buy_now').text('删除');
            $(this).hide()
        });

        $(".jia").click(function(){
            var abb = $(this).parents(".aab");
            var  num_input =  abb.find("input");
            var num = num_input.val();
            num++;
            num_input.val(num);


            var price = num_input.attr("data-price");
            var anglePrice = price*num;
            $(this).parents(".maibdr_bbr").find(".tt").html("￥"+anglePrice);

            var p = num_input.attr("data-id");
            var s = num_input.attr("data-size");
            var c = num_input.attr("data-color");
            var jtype = num_input.attr("data-type");



            $.post("<?php echo U('Car/editCar');?>",{p:p,n:num,s:s,c:c,'jtype':jtype},function(data){
                layer.msg(data.info, {shift: -1, time: 1200}, function () {
                    flushPrice();
                });
            },"json");
        });



        $(".jian").click(function(){
            var abb = $(this).parents(".aab");
            var  num_input =  abb.find("input");
            var num = num_input.val();
            if(num<=1)return;
            else num--;
            num_input.val(num);

            var price = num_input.attr("data-price");
            var anglePrice = price*num;
            $(this).parents(".maibdr_bbr").find(".tt").html("￥"+anglePrice);

            var p = num_input.attr("data-id");
            var s = num_input.attr("data-size");
            var c = num_input.attr("data-color");
            var jtype = num_input.attr("data-type");


            $.post("<?php echo U('Car/editCar');?>",{p:p,n:num,s:s,c:c,'jtype':jtype},function(data){
                layer.msg(data.info, {shift: -1, time: 1200}, function () {
                    flushPrice();
                });
            },"json");
        });

    });
</script>


<body>
<div class="header">
    <div class="header_l" style="width: 15%;">
        <a href="<?php echo U('shop/home/index');?>"><img src="/Public/Public/images/b1.png" alt=""></a>
    </div>
    <div class="header_c" style="width: 70%;"> <h1 style="color:#000">购物车</h1></div>
    <!--<div class="header_r" style="width: 15%;"><a href="<?php echo U('Public/news');?>"><em class="xxd"></em><i class="iconfont"></i><p>消息</p></a></div>-->
    <!-- <span><a href=""><img src="" alt=""></a></span> -->
</div>



<!-- 计算价格 -->
<?php $allPrice = 0;?>

<div class="edit"><input type="checkbox" name="sel_all" id="sel_all" value="ok"> 全选<a id="doedit" href="javascript:void(0)">编辑</a></div>
<form action="/Shop/Home/order" method="post" id="buy_form">
    <?php if(is_array($carList)): foreach($carList as $key=>$car): if(is_array($car)): foreach($car as $k=>$product): $sp_id=$product['pid']; $shop=M('product_detail')->where(array('id'=>$sp_id))->find(); $uid=$shop['shangjia']; $dianpu=M('gerenshangpu')->where('userid='.$uid)->find(); ?>

            <div class="maidb_edit">
                <div class="maidb_edit_cc"><input name="shop_sel[]" class="shop_sel" data-pid="<?php echo ($product['pid']); ?>"  data-gid="<?php echo ($k); ?>" data-color="<?php echo ($product['color']); ?>" data-num ="<?php echo ($product['num']); ?>" data-price="<?php echo ($product['price']); ?>"  value="<?php echo ($product['pid']); ?>|<?php echo ($k); ?>" type="checkbox"></div>
                <div class="maidbl_bbl" style="width: 23%;"><img src="<?php echo ($product['pic']); ?>" alt=""></div>
                <div class="maibdr_bbr" style="width: 66%;">
                    <p onClick="window.location.href='<?php echo U('Home/details',array('proid'=>$product['pid']));?>'"><?php echo ($product['name']); ?></p>
                    <p class="kw">     <img src="<?php echo ($dianpu['shop_logo']); ?>">店铺：<?php echo ($dianpu['shop_name']); ?></p>
                    <p class="tt" data-price="<?php echo ($product['price']); ?>" >￥<?php echo ($product['num']*$product['price']); ?></p>

                    <div class="aab">
                        <span class="jian"  style="cursor: pointer;">-</span>
                        <input readonly="readonly" data-id="<?php echo ($product['pid']); ?>" data-size="<?php echo ($product['size']); ?>" data-type="<?php echo ($product['jtype']); ?>" data-price="<?php echo ($product['price']); ?>" data-color="<?php echo ($product['color']); ?>" class="num" name="num"  type="text" value="<?php echo ($product['num']); ?>">
                        <span class="jia" style="cursor: pointer;">+</span>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div style="height: 2vmin;background: #f2f2f2;"></div>
            <?php $allPrice=$allPrice+$product['num']*$product['price']; endforeach; endif; endforeach; endif; ?>

    <div style="height: 30vmin;"></div>
    <div class="submit_foot">
        <div class="submit_footl">
            <p><span>合计：￥<i id="allPrice">0</i></span></p>
        </div>
        <div class="submit_footr">
            <a id="buy_now">提交订单</a>
            <!--<a id="buy_now">删除</a>-->
        </div>
    </div>
</form>