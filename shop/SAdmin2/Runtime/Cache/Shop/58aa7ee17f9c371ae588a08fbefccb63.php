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
    <script type="text/javascript" src="/Public/Public/js/jquery-1.7.1.min.js"></script>

    <script type="text/javascript" src="/Public/Public/js/jquery.touchSlider.js"></script>
    <!-- Demo styles -->
    <script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
	<script>
$(function(){
    $('.btn_style1').click(function(){
	//点击a标签
		    $(this).parents('.allder_nr').find('.detail').toggle();
    })
})
</script>

</head>
<body>
<div class="header">
    <div class="header_l">
      <a href="<?php echo U('member/mine');?>"><img src="/Public/Public/images/lpg.png" alt=""><span>我的订单</span></a>

    </div>
    <div class="header_c"><h1></h1></div>
    <!--<div class="header_r"><a href="<?php echo U('Public/news');?>"><em class="xxd"></em><i class="iconfont"></i><p>消息</p></a></div>-->
    <!-- <span><a href=""><img src="" alt=""></a></span> -->
</div>
<div class="allder">
  <ul>
  <li <?php if($s == 'dede'): ?>class="dianjb"<?php endif; ?> ><a href="<?php echo U('Member/allorder',array('s'=>'dede'));?>">全部订单</a></li>
    <li <?php if($s == '0'): ?>class="dianjb"<?php endif; ?> ><a href="<?php echo U('Member/allorder',array('s'=>0));?>">待付款</a></li>
    <li <?php if($s == '1'): ?>class="dianjb"<?php endif; ?>><a href="<?php echo U('Member/allorder',array('s'=>1));?>">待发货</a></li>
    <li <?php if($s == '2'): ?>class="dianjb"<?php endif; ?>><a href="<?php echo U('Member/allorder',array('s'=>2));?>">待收货</a></li>
    <li <?php if($s == '3'): ?>class="dianjb"<?php endif; ?>><a href="<?php echo U('Member/allorder',array('s'=>3));?>">已完成</a></li>

  </ul>
  <div style="clear: both;"></div>
</div>
<div style="background: #f4f4f4;height: 2vmin;"></div>

<?php if(is_array($orderList)): foreach($orderList as $key=>$order): ?><!-- 未支付 -->
    <?php if($order['status'] == 0): ?><div class="allder_nr">
            <p class="dain">未付款</p>
            <div style="clear: both;"></div>
              <?php
 $allProductNum = 0; $allProductPrice =0; ?>
              <?php if(is_array($order['detail'])): foreach($order['detail'] as $key=>$detail): $allProductNum = $allProductNum + $detail['com_num']; $allProductPrice = $allProductPrice+$detail['com_num']*$detail['com_price']; ?>

            <div class="ddcontent">
                <div class="content_l">
                  <img src="<?php echo ($detail['com_img']); ?>" alt="">
                </div>
                <div class="content_r">
                  <div class="content_rt">
                    <h3 onClick="window.location.href='<?php echo U('Home/details',array('proid'=>$detail['com_id']));?>'"><?php echo ($detail['com_name']); ?></h3>
                    <div class="jaind">
                      <p>￥<?php echo ($detail['com_price']); ?></p>
                      <p>x<?php echo ($detail['com_num']); ?></p>
                    </div>
                  </div>
                </div>
                <div style="clear: both;"></div>
            </div><?php endforeach; endif; ?>
            <div class="total" style="margin-bottom:10vmin">
              <p>共计<?php echo ($allProductNum+0); ?>商品 <span>合计：￥<?php echo ($allProductPrice+0); ?></span></p>

              <a href="javascript:void(0)" onClick="window.location.href='/Shop/Pay/index/oid/<?php echo ($detail['order_id']); ?>'" class="btn_style2">立即支付</a>
			  <a href="javascript:void(0)" class="btn_style1" id="show_odetail">查看详情</a>
            </div>
			<!--订单详情-->
			<div id="o_detail" class="detail" style="display:none;" >
				<span>商家姓名：周园园</span>
				<span>手机号码：18870349047</span>
				<span>微&nbsp;信&nbsp;号：W2820372996</span>
				<span>交易时间：2017-12-03 15:31:06</span>
				<span>支付凭证：</span>
				<img src="/Uploads/image/product/pingzheng2.jpg">
			</div>

            <div style="clear: both;"></div>
            </div>
          <div style="background: #f4f4f4;height: 2vmin;margin-top: 3vmin;"></div>
        <!-- 已支付 -->
      <?php elseif($order['status'] == 1): ?>
            <div class="allder_nr">
            <p class="dain">等待卖家发货</p>
            <div style="clear: both;"></div>
                <?php
 $allProductNum = 0; $allProductPrice =0; ?>
                <?php if(is_array($order['detail'])): foreach($order['detail'] as $key=>$detail): $allProductNum = $allProductNum + $detail['com_num']; $allProductPrice = $allProductPrice+$detail['com_num']*$detail['com_price']; ?>
            <div class="ddcontent">
                <div class="content_l">
                  <img src="<?php echo ($detail['com_img']); ?>" alt="">
                </div>
                <div class="content_r">
                  <div class="content_rt">
                    <h3 onClick="window.location.href='<?php echo U('Home/details',array('proid'=>$detail['com_id']));?>'"><?php echo ($detail['com_name']); ?></h3>
                    <div class="jaind">
                      <p>￥<?php echo ($detail['com_price']); ?></p>
                      <p>x<?php echo ($detail['com_num']); ?></p>
                    </div>
                  </div>
                </div>
                <div style="clear: both;"></div>
            </div><?php endforeach; endif; ?>
            <div class="total">
                <p>共计<?php echo ($allProductNum+0); ?>商品 <span>合计：￥<?php echo ($allProductPrice+0); ?></span></p>
              <a href="javascript:void(0)" onClick="remind()">提醒发货</a>
            </div>
          <div style="clear: both;"></div>
          </div>
          <div style="background: #f4f4f4;height: 2vmin;margin-top: 3vmin;"></div>
          <!-- 已发货 -->
        <?php elseif($order['status'] == 2): ?>
              <div class="allder_nr">
              <p class="dain">卖家已发货</p>
              <div style="clear: both;"></div>
                  <?php
 $allProductNum = 0; $allProductPrice =0; ?>
                  <?php if(is_array($order['detail'])): foreach($order['detail'] as $key=>$detail): $allProductNum = $allProductNum + $detail['com_num']; $allProductPrice = $allProductPrice+$detail['com_num']*$detail['com_price']; ?>
              <div class="ddcontent">
                  <div class="content_l">
                    <img src="<?php echo ($detail['com_img']); ?>" alt="">
                  </div>
                  <div class="content_r">
                    <div class="content_rt">
                      <h3 onClick="window.location.href='<?php echo U('Home/details',array('proid'=>$detail['com_id']));?>'"><?php echo ($detail['com_name']); ?></h3>
                      <div class="jaind">
                        <p>￥<?php echo ($detail['com_price']); ?></p>
                        <p>x<?php echo ($detail['com_num']); ?></p>
                      </div>
                    </div>
                  </div>
                  <div style="clear: both;"></div>
              </div><?php endforeach; endif; ?>
              <div class="total">
                  <p>共计<?php echo ($allProductNum+0); ?>商品 <span>合计：￥<?php echo ($allProductPrice+0); ?></span></p>
                <a order-id="<?php echo ($detail['order_id']); ?>" class="Confirmad">确认收货</a>
                <a href="<?php echo U('Member/stics',array('order_id'=>$order['order_id']));?>" >查看物流</a>
              </div>

            <div style="clear: both;"></div>
            </div>
            <div style="background: #f4f4f4;height: 2vmin;margin-top: 3vmin;"></div>
        <!-- 交易完成 -->
        <?php elseif($order['status'] == 3): ?>
            <div class="allder_nr">
          <p class="dain">交易完成</p>
          <div style="clear: both;"></div>
                <?php
 $allProductNum = 0; $allProductPrice =0; ?>
                <?php if(is_array($order['detail'])): foreach($order['detail'] as $key=>$detail): $allProductNum = $allProductNum + $detail['com_num']; $allProductPrice = $allProductPrice+$detail['com_num']*$detail['com_price']; ?>
          <div class="ddcontent">
              <div class="content_l">
                <img src="<?php echo ($detail['com_img']); ?>" alt="">
              </div>
              <div class="content_r">
                <div class="content_rt">
                  <h3 onClick="window.location.href='<?php echo U('Home/details',array('proid'=>$detail['com_id']));?>'"><?php echo ($detail['com_name']); ?></h3>
                  <div class="jaind">
                    <p>￥<?php echo ($detail['com_price']); ?></p>
                    <p>x<?php echo ($detail['com_num']); ?></p>
                  </div>
                </div>
              </div>
              <div style="clear: both;"></div>
          </div><?php endforeach; endif; ?>
          <div class="total">
              <p>共计<?php echo ($allProductNum+0); ?>商品 <span>合计：￥<?php echo ($allProductPrice+0); ?></span></p>
            <!--<a href="<?php echo U('Home/fbym',array('id'=>$order['order_id']));?>">待评价</a>-->
          </div>

        <div style="clear: both;"></div>
        </div>
        <div style="background: #f4f4f4;height: 2vmin;margin-top: 3vmin;"></div>
      <?php else: endif; endforeach; endif; ?>






<!-- 提醒发货 -->
<div id="light" class="white_contentbb">
    <p>你已经提醒卖家发货啦！</p>
</div>
</body>
</html>
<!--确认收货按钮-->
<script>
    function remind() {
        $("#light").show('2000',function () {
            setTimeout(function() {
                $("#light").hide();
            },1000);
        });
    }




    $('.Confirmad').click(function () {
        var orderid = $(this).attr('order-id');
        layer.confirm('确定要收货吗？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                url: "/Shop/Member/Confirmad",
                type: "post",
                data: {'orderid': orderid},
                datatype: "json",
                success: function (mes) {
                    if (mes.status == 1) {
                        layer.msg(mes.info, {icon: 1});
                        location.reload();
                    } else {
                        layer.msg(mes.info, {icon: 2});
                    }
                }
            })
        });
    })
</script>