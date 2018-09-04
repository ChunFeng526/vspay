<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>众筹项目中心</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<link rel="stylesheet" href="/Public/home/wap/layui/css/layui.css">
<link rel="stylesheet" href="/Public/home/wap/css/zhifu.css">
<script src="/Public/home/wap/layui/layui.js"></script>

<body class="bg96">
	
	<div class="header">
	    <div class="header_l">
	    <a href="<?php echo U('Turntable/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c"><h2>众筹项目中心</h2></div>
	    <div class="header_r"><a href="<?php echo U('Turntable/Crowdrecords');?>">记录</a></div>
	</div>

       <div class="big_width100">

            <div class="zy_topul">
            	
            	<ul class="clear_wl">
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds');?>">
	    					<img src="/Public/home/wap/images/zc0-iocn.png" alt="">
	    					<p  >预热中</p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>1));?>">
	    					<img src="/Public/home/wap/images/zc1-iocn.png" alt="">
	    					<p class="nop">进行中</p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Crowds',array('step'=>2));?>">
	    					<img src="/Public/home/wap/images/zc2-iocn.png" alt="">
	    					<p >已结束</p>
	    				</a>
	    				<div class="nj"></div>
	    			</li>
	    		</ul>
            </div>


<style type="text/css">
	
.zcweikais_bottom_jx_a{
  width: 20%;
  background: #5577cc;
  text-align: center;
  height: 22px;
  display: block;
  position: absolute;
  right: 0;
  top:0;
  border-radius: 5px;
  line-height: 22px;
  font-size: 12px;
  color: #eee;
}
a:hover {
    color: #fff;
}
</style>
            <div class="zcweikais">
            	<?php  if($list){ ?>

     
            	
            	<div class="zcweikais_top clear_wl">
            		
            		<img src="/Public/home/wap/images/zhongctub.png" class="zcimg">
            		<div class="zcweikais_topwz">
            			<h3>数字资产</h3>
            			<p class="zcxwz"><span>每个ID限购1000枚</span> 释放比例：100.00%</p>
            			<p>接收币种：<span>余额</span></p>
            		</div>
            		<div class="zcwksshij">
            			<img src="/Public/home/wap/images/naozz.png"><?php echo (date("Y-m-d",$list["open_time"])); ?>
            		</div>


            	</div>
            	<div class="zcweikais_mid clear_wl">
            		<ul>
            			<li class="zcweikais_mid_lia"><p>众筹模式<br/><span><?php echo ((int)($list["num"])); ?>万</span></p></li>
            			<li class="zcweikais_mid_lib"><p>价格<br/><span>1=<?php echo ($list["dprice"]); ?>(￥)</span></p></li>
            			<li class="zcweikais_mid_lic"><p>剩余时间<br/><span class="hse">已开始</span></p></li>
            		</ul>

            	</div>

            	<div class="zcweikais_bottom clear_wl">

            	    

					<div class="zcweikais_bottom_jdzb">
						 <div class="layui-progress layui-progress-big " lay-showPercent="true">
						   <div class="layui-progress-bar layui-bg-blue" lay-percent="<?php echo ($list["jindu"]); ?>%"></div>
						</div>
					</div>
					<a href="#" class="zcweikais_bottom_jx_a" id="goumai">立即购买</a>
            	</div>


            	
			<?php  }else{ echo "<span style='color:#666;'>没找到相关记录</span>"; } ?>
            </div>

	   </div>


<!--浮动层-->
		    <div class="ftc_wzsf" >
		        <div class="srzfmm_box">
		            <div class="qsrzfmm_bt clear_wl">
		                <img src="/Public/home/wap/images/xx_03.jpg" class="tx close fl">
		               <input type="hidden" id="dealid" value="<?php echo ($list["id"]); ?>">
		                <span class="fl goumaiduix">众筹项目：Wpeay数字资产</span></div>
		            <div class="zfmmxx_shop">
		                <div class="xiange_titel">
		                	<p class="xe_pl">限 额：<span class="limit">1000</span></p>
		                	<p class="xe_pr"><?php echo ($coindets['coin_name']); ?></p>
		                </div>
                        <center><form> 
		                  <div class="xiange_titel xiange_titela">
		                	<p class="xe_pl" >价格：</p>
		                	<input type="number" size=40 name="Data"  id="dprice" onkeyup="enfocus()" readonly="readonly" value="<?php echo ($list["dprice"]); ?>" class="jiaoyjis" >
		                	
		                </div>
		                 <div class="xiange_titel">
		                	<p class="xe_pl"><?php echo ($coindets['coin_name']); ?>数：</p>
		                	<input type="number" size=40 name="Data2"   oninput="checkNum(this)"  id="num" onkeyup="enfocus()" class="jiaoyjis livalue" value="" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="请输入数量">
		                	<a href="#"class="xe_pl_a">全额</a>
		                </div>

		                  <div class="xiange_titel">
		                	<p class="xe_pl">余 额：</p>
		                	<input type="number" size=40 name="Copy"   onkeyup="enfocus()"  readonly="readonly" id="copy" class="jiaoyjis"> 
		                	
		                </div>
		            </form></center> 
		            </div>
		            <ul class="mm_box">
		                <li></li><li></li><li></li><li></li><li></li><li></li>
		            </ul>
		        </div>
		        <div class="numb_box">
		            <div class="xiaq_tb">
		                <img src="/Public/home/wap/images/jftc_14.jpg" height="10"></div>
		            <ul class="nub_ggg">
		                <li><a href="javascript:void(0);" class="zf_num">1</a></li>
		                <li><a href="javascript:void(0);" class="zj_x zf_num">2</a></li>
		                <li><a href="javascript:void(0);" class="zf_num">3</a></li>
		                <li><a href="javascript:void(0);" class="zf_num">4</a></li>
		                <li><a href="javascript:void(0);" class="zj_x zf_num">5</a></li>
		                <li><a href="javascript:void(0);" class="zf_num">6</a></li>
		                <li><a href="javascript:void(0);" class="zf_num">7</a></li>
		                <li><a href="javascript:void(0);" class="zj_x zf_num">8</a></li>
		                <li><a href="javascript:void(0);" class="zf_num">9</a></li>
		                <li><a href="javascript:void(0);" class="zf_empty">清空</a></li>
		                <li><a href="javascript:void(0);" class="zj_x zf_num">0</a></li>
		                <li><a href="javascript:void(0);" class="zf_del">删除</a></li>
		            </ul>
		        </div>
		        <div class="hbbj"></div>
		    </div>


 		<script LANGUAGE="JavaScript">

	     	<!-- hide from old browsers 
			function enfocus() 
			{ 
			    var t1 = document.forms[0].Data.value; 
			    var t2 = document.forms[0].Data2.value; 
			    var t3 = document.forms[0].Copy.value ; 



			if(t1!="" && t2!=""){ 
				var floatValue = parseFloat(t1) * parseFloat(t2);
		

			document.getElementById("copy").value = floatValue.toFixed(4) ;  
			} 
			else {document.getElementById("copy").value = "";} 
			} 
			<!-- done hiding --> 
		 </script> 




	   <script>
		//注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
		layui.use('element', function(){
		  var element = layui.element;
		});


		$("#goumai").click(function(){
			$(".ftc_wzsf").show();
             
        });





        //关闭浮动
        $(".close").click(function(){
            $(".ftc_wzsf").hide();
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data","");
            i = 0;
        });



            //数字显示隐藏
        $(".xiaq_tb").click(function(){
            $(".numb_box").slideUp(500);
        });
        $(".mm_box").click(function(){
            $(".numb_box").slideDown(500);
        });
            //----
        var i = 0;
         post_flag = false;
        $(".nub_ggg li .zf_num").click(function(){
                
          
            if(i<6){
                $(".mm_box li").eq(i).addClass("mmdd");
                $(".mm_box li").eq(i).attr("data",$(this).text());

               
                i++
                if (i==6) {
                	
                	
                  
                    var pwd = "";
                        $(".mm_box li").each(function(){
                        pwd += $(this).attr("data");
                    });
                   // alert("支付成功"+data);

					if(post_flag) return; 
           			 post_flag = true;
					
                    var dprice=($('#dprice').val());//支付单价
                    var tprice=($('#copy').val());//支付总价
                    var num = parseFloat($('#num').val());//数量
                    var dealid = parseInt($('#dealid').val());//订单ID
                    var cid =1;//币的种类
                    var ss1=parseFloat($(".limit").text());		
					
                        $.ajax({
                            url:'/Turntable/Crowds_goumai',
                            asyn:false,
                            type:'post',
                            data:{'dprice':dprice,'num':num,'tprice':tprice,'cid':cid,'pwd':pwd,'ss1':ss1,'dealid':dealid},
                            datatype:'json',
                            success:function (mes) {
                            	post_flag = false;
                            
                                if(mes.status == 1){

                                	$(".ftc_wzsf").hide();
                                    msg_alert(mes.message,mes.url);
                                    
                                }else{
                                    msg_alert(mes.message);
                                    
                                }
                            },
                            error: function(){
            post_flag =false; //AJAX失败也需要将标志标记为可提交状态
        }

                          


                        });
                };
            } 
        });
            

		</script>   

</body>

</html>