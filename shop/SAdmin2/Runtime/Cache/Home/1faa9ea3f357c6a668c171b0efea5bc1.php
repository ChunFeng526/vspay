<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>交易</title>
<link rel="stylesheet" href="/Public/home/wap/css/style.css">
<link rel="stylesheet" href="/Public/home/wap/css/digital.css">
<link rel="stylesheet" href="/Public/home/wap/css/zhifu.css">
<script src="/Public/home/wap/js/jquery1.11.1.min.js"></script>
<script type="text/javascript" src="/Public/home/common/js/index.js" ></script>
<script type="text/javascript" src="/Public/home/common/layer/layer.js"></script>
<body class="bg96">
	

  <?php
 $arr=array(1=>"",2=>"比特币",3=>"莱特币",4=>"以太坊",5=>"狗狗币"); ?>
	<div class="header">
	    <div class="header_l">
	     <a href="<?php echo U('Turntable/index');?>"><img src="/Public/home/wap/images/jiant.png" alt=""></a>
	    </div>
	    <div class="header_c" id="dig_xiala"><h2 style="line-height:36px;"><?php echo ($arr[$cid]); ?></h2> <p id="a"></p>
            <div id="dig_xiala_xs">
             <div class="downa">
	             <ul>
                <li><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>1));?>"></a></li>
                <li><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>2));?>">比特币</a></li>
                <li><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>3));?>">菜特币</a></li>
                <li><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>4));?>">以太坊</a></li>
                <li class="off"><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>5));?>">狗狗币</a></li>
              </ul>
            </div>
            <div class="reveal-modal-bg"></div>
            </div>
	    </div>
	    <div class="header_r"></div>
	</div>

    <div class="big_width100">
	    <div class="big_width100">
	    <div class="buy_Wpayzu clear_wl">
	     	 <div class="buy_Wpayzu_l">
	     	 	<p><?php echo ($arr[$cid]); ?></p>
	     	 	<p><?php echo (number_format((isset($minecoins['c_nums']) && ($minecoins['c_nums'] !== ""))?($minecoins['c_nums']):"0.0000",4)); ?></p>
	     	 </div>
	     	 <div class="buy_Wpayzu_l">
	     	 	<p>余额</p>
	     	 	<p>￥<?php echo (number_format((isset($my_yue) && ($my_yue !== ""))?($my_yue):"0.0000",4)); ?></p>
	     	 </div>

	     	 <div class="buy_Wpayzu_z"></div>

     </div>

         <div class="buy_inde_dangq">
      <ul class="clear_wl">
        <li> <p><span>当前价格</span><?php echo ($coindets['coin_price']); ?></p></li>
        <li> <p><span>高</span><?php echo ($coindets['max']); ?> <img src="/Public/home/wap/images/buy_bie.png"></p></li>
        <li> <p><span>低</span><?php echo ($coindets['min']); ?> <img src="/Public/home/wap/images/buy_jiang.png"></p></li>
      </ul>
     </div>

     <div class="wpzicicon_buy">
	    		<ul class="clear_wl">
	    			<li>
	    				<a href="<?php echo U('Turntable/Salesell',array('cid'=>$cid) );?>">
	    					<img src="/Public/home/wap/images/jiaoy01-iocn.png" alt="">
	    					<p>发布出售订单</p>
	    				</a>
	    			</li>
	    			<li>
	    				<a href="<?php echo U('Turntable/Salebuys',array('cid'=>$cid) );?>">
	    					<img src="/Public/home/wap/images/jiaoy02-iocn.png" alt="">
	    					<p>发布购买订单</p>
	    				</a>
	    			</li>
	    			      <li>
              <a href="<?php echo U('Turntable/Orderinfos',array('cid'=>$cid));?>">
                <img src="/Public/home/wap/images/jiaoy03-iocn.png" alt="">
                <p>订单</p>
              </a>
            </li>
            <li>
              <a href="<?php echo U('Turntable/Transreocrds',array('cid'=>$cid));?>">
                <img src="/Public/home/wap/images/jiao04-iocn.png" alt="">
                <p>交易记录</p>
              </a>
            </li>

	    		</ul>
	   </div>

    
    <script type="text/javascript" src="/Public/home/common/layer/highcharts.js"></script>
<script type="text/javascript" src="/Public/home/common/layer/export-data.js"></script>
<style type="text/css">
.highcharts-yaxis-labels,.highcharts-yaxis{

display: none;

}</style>

 <div class="buy_quexiant">
			   
			   <ul class="clear_wl">
			   	  <li id="s1" onclick="cont1();" class="yon">一小时</li>
			   	  <li id="s2"  onclick="cont2();" class="">五小时</li>
			   	  <li id="s3"  onclick="cont3();" class="">日线</li>
			   </ul>

	</div>

<div id="container1"  style="width:100%; height: 12rem; margin: 0 auto;margin-left:0rem;margin-top:0.5rem;margin-bottom:2.5rem;"></div>
<div id="container2"  style="display:none;width:100%; height: 12rem; margin: 0 auto;margin-left:0rem;margin-top:0.5rem;margin-bottom:2.5rem;"></div>
<div id="container3"  style="display:none;width:100%; height: 12rem; margin: 0 auto;margin-left:0rem;margin-top:0.5rem;margin-bottom:2.5rem;"></div>
    

  <?php
 $timen=time(); $nowp= D('coindets')->where(array("cid"=>$cid))->order('coin_addtime desc')->getField("coin_price"); $minute=date("i"); $minute5=$timen-5*60*12; $minute4=$timen-4*60*12; $minute3=$timen-3*60*12; $minute2=$timen-2*60*12; $minute1=$timen-60*12; $mp5=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$minute5.",".$minute4)))->order("coin_addtime desc")->getField("coin_price"); if(!$mp5){ $last_m1=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("lt",$minute5)))->order("coin_addtime desc")->getField("coin_price"); $mp5=$last_m1; }; if(!$mp5)$mp5=$nowp; $theprice=$mp5; $mp4=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$minute4.",".$minute3)))->order("coin_addtime desc")->getField("coin_price"); if(!$mp4)$mp4=$theprice; $theprice=$mp4; $mp3=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$minute3.",".$minute2)))->order("coin_addtime desc")->getField("coin_price"); if(!$mp3)$mp3=$theprice; $theprice=$mp3; $mp2=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$minute2.",".$minute1)))->order("coin_addtime desc")->getField("coin_price"); if(!$mp2)$mp2=$theprice; $theprice=$mp2; $mp1=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$minute1.",".$timen)))->order("coin_addtime desc")->getField("coin_price"); if(!$mp1)$mp1=$theprice; $hour5=$timen-5*60*60; $hour4=$timen-4*60*60; $hour3=$timen-3*60*60; $hour2=$timen-2*60*60; $hour1=$timen-60*60; $hp5=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hour5.",".$hour4)))->order("coin_addtime desc")->getField("coin_price"); if(!$hp5){ $last1=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("lt",$hour5)))->order("coin_addtime desc")->getField("coin_price"); $hp5=$last1; }; if(!$hp5)$hp5=$nowp; $theprice=$hp5; $hp4=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hour4.",".$hour3)))->order("coin_addtime desc")->getField("coin_price"); if(!$hp4)$hp4=$theprice; $theprice=$hp4; $hp3=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hour3.",".$hour2)))->order("coin_addtime desc")->getField("coin_price"); if(!$hp3)$hp3=$theprice; $theprice=$hp3; $hp2=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hour2.",".$hour1)))->order("coin_addtime desc")->getField("coin_price"); if(!$hp2)$hp2=$theprice; $theprice=$hp2; $hp1=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hour1.",".$timen)))->order("coin_addtime desc")->getField("coin_price"); if(!$hp1)$hp1=$theprice; $zerot=strtotime(date("Y-m-d")); $hourn=(int)date("H"); $hours0=$zerot+3600; $hourn0=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$hourn.",".$hours0)))->order("coin_addtime desc")->getField("coin_price"); if(!$hourn0){ $last_z1=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("lt",$zerot)))->order("coin_addtime desc")->getField("coin_price"); $hourn0=$last_z1; }; if(!$hourn0)$hourn0=$nowp; $theprice=$hourn0; $strs=""; $bianlsq=$hourn0; for($i=1;$i<=$hourn;$i++){ $bianls=$zerot+3600*($i+1); $sss=D('coindets')->where(array("cid"=>$cid,"coin_addtime"=>array("between",$bianlsq.",".$bianls)))->order("coin_addtime desc")->getField("coin_price"); if(!$sss)$sss=$theprice; $theprice=$sss; $bianlsq=$bianls; $sss1=$sss-$nowp; $strs.=$sss1.","; } $strs=$hourn0.",".rtrim($strs,","); ?>
        <script type="text/javascript">
Highcharts.chart('container1', {
  chart: {
    type: 'area'
  },
  title: {
    text: ''
  },
  subtitle: {
    text: ''
  },
  xAxis: {
    allowDecimals: false,
    labels: {
      formatter: function () {
        return (5-this.value)*12 +'分钟前';; // clean, unformatted number for year
      },
       
    }
  },
  yAxis: {
    title: {
      text: ''
    },

    max:<?php echo ($mp1); ?>, // 定义Y轴 最大值  
    min:<?php echo ($mp5); ?>, // 定义最小值  
 
    tickInterval:0.01, // 刻度值  


    // labels: {
    //   formatter: function () {
    //     return this.value  ;
    //   }
    // }
  },
  tooltip: {
    pointFormat: '当前值：{point.y}'
  },
  plotOptions: {
    area: {
      pointStart: 1,
      marker: {
        enabled: false,
        symbol: 'circle',
        radius: 2,
        states: {
          hover: {
            enabled: true
          }
        }
      }
    }
  },
  series: [{
    name: '时间',
    data: [
 <?php echo ($mp5); ?>,<?php echo ($mp4); ?>,<?php echo ($mp3); ?>,<?php echo ($mp2); ?>,<?php echo ($mp1); ?>
    ]
  }, ]
});




Highcharts.chart('container2', {
  chart: {
    type: 'area'
  },
  title: {
    text: ''
  },
  subtitle: {
    text: ''
  },
  xAxis: {
    allowDecimals: false,
    labels: {
      formatter: function () {
        return (5-this.value) +'小时前';; // clean, unformatted number for year
      },
       
    }
  },
  yAxis: {
    title: {
      text: ''
    },
    max:<?php echo ($hp1); ?>, // 定义Y轴 最大值  
    min:<?php echo ($hp5); ?>, // 定义最小值  
 
    tickInterval:0.01, // 刻度值  

    // labels: {
    //   formatter: function () {
    //     return this.value  ;
    //   }
    // }
  },
  tooltip: {
    pointFormat: '当前值：{point.y}'
  },
  plotOptions: {
    area: {
      pointStart: 1,
      marker: {
        enabled: false,
        symbol: 'circle',
        radius: 2,
        states: {
          hover: {
            enabled: true
          }
        }
      }
    }
  },
  series: [{
    name: '时间',
    data: [
 <?php echo ($hp5); ?>,<?php echo ($hp4); ?>,<?php echo ($hp3); ?>,<?php echo ($hp2); ?>,<?php echo ($hp1); ?>
    ]
  }, ]
});



Highcharts.chart('container3', {
  chart: {
    type: 'column'
  },
  title: {
    text: ''
  },
  xAxis: {
    categories: ['0', '1', '2', '3', '4', '5', '6', '7', '9', '10', '11', '12', '13', '14', '15', '16', '17','18', '19', '20', '21', '22','23',]
  },
  credits: {
    enabled: false
  },
  series: [{
    name: '价格增幅',
    data: [<?php echo ($strs); ?>]
  }]
});


        </script>




<script type="text/javascript">
  
$(document).ready(function(){ 
　　  $('.highcharts-legend').remove('g');
$('highcharts-background').css('height','20vmin');
}); 


</script>

	  <div class="investment_f">
	  <div class="investment_title">
	    <div > <a href="<?php echo U('Turntable/Transaction',array('cid'=>$cid));?>">购买</a></div>
	    <div class="on"><a href="<?php echo U('Turntable/Transactionsell',array('cid'=>$cid));?>">出售</a></div>
	 
	  </div>
	  <div class="investment_con">
	    <div class="investment_con_list">
	       
	       <ul class="buy_gaomai">

       	
	       	 <?php if(is_array($deals)): foreach($deals as $k=>$v): ?><li>
	       	 	<div class="buy_li_gol">
	       	 		<img src="<?php echo ((isset($v['d_img_head']) && ($v['d_img_head'] !== ""))?($v['d_img_head']):'/Public/home/wap/images/toux-icon.png'); ?>">
	       	 		 <div class="li_gop">
	       	 		 	<p><?php echo ($v['u_name']); ?></p>
	       	 		 	<p><span>限额：<?php echo ($v['d_num']); ?></span></p>
	       	 		 </div>


	       	 	</div>
	       	 	<div class="buy_li_gor">
	       	 		<p>￥<?php echo ($v['d_dprice']); ?></p>
	       	 		<a href="javascript:void(0);" class="ljzf_but " onclick="gbzhi(<?php echo ($v['d_num']); ?>,<?php echo ($v['d_dprice']); ?>,'<?php echo ($v['u_name']); ?>',<?php echo ($v['d_id']); ?>)">卖出</a>
	       	 	</div>

	       	 </li><?php endforeach; endif; ?>

	       </ul>

	    </div>
	    
	   
	  </div>
	</div>




	 </div>	 
 


</body>
 
 
  <!--浮动层-->
		    <div class="ftc_wzsf" >
		        <div class="srzfmm_box">
		            <div class="qsrzfmm_bt clear_wl">
		                <img src="/Public/home/wap/images/xx_03.jpg" class="tx close fl">
		               <input type="hidden" id="dealid">
		                <span class="fl goumaiduix">向[情动之初]出售<br/>Wpeay</span></div>
		            <div class="zfmmxx_shop">
		                <div class="xiange_titel">
		                	<p class="xe_pl">限 额：<span class="limit">3.1551</span></p>
		                	<p class="xe_pr"><?php echo ($coindets['coin_name']); ?></p>
		                </div>
                        <center><form> 
		                  <div class="xiange_titel xiange_titela">
		                	<p class="xe_pl" >价格：</p>
		                	<input type="number" size=40 name="Data"  id="dprice" onkeyup="enfocus()" readonly="readonly" value="0" class="jiaoyjis" >
		                	
		                </div>
		                 <div class="xiange_titel">
		                	<p class="xe_pl"><?php echo ($coindets['coin_name']); ?>数：</p>
		                	<input type="number" size=40 name="Data2"   oninput="checkNum(this)"   id="num" onkeyup="enfocus()" class="jiaoyjis livalue" value="" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="请输入数量">
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

		  

	


		 <script>

      //限制number  输入格式
function checkNum(obj){

 obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d\d\d).*$/,'$1$2.$3');//只能输入三个小数.(\d\d\d) 修改个数  加\d
}


           $('.xe_pl_a').click(function(){
           		var limitvalue = $('.limit').text();
           		$('.livalue').val(limitvalue);
           		enfocus();
           })
		 </script>


	     <script LANGUAGE="JavaScript"><!-- hide from old browsers 
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


         
         <script type="text/javascript">

           $(document).ready(function(){
			  $("#dig_xiala").click(function(){
			  $("#dig_xiala_xs").toggle(); //toggle() 方法切换元素的可见状态。 如果被选元素可见,则隐藏这些元素,如果被选元素隐藏,则显示这些元素。
			  });
			 
			});

         </script>

         <script type="text/javascript">


	function gbzhi(s1,s2,s3,s4) 
			{ 

				$(".limit").text(s1);
				$(".goumaiduix").html("向["+s3+"]出售<br><?php echo ($coindets['coin_name']); ?>");
				$("#dprice").val(s2);	
				$("#dealid").val(s4);	


            $(".ftc_wzsf").show();
  
			
			}



	function cont1(){
$("#container2").hide();
$("#container3").hide();
$("#container1").show();
$("#s2").removeClass("yon");
$("#s1").addClass("yon");
$("#s3").removeClass("yon");
			}

	function cont2(){
$("#container1").hide();
$("#container3").hide();
$("#container2").show();
$("#s1").removeClass("yon");
$("#s2").addClass("yon");
$("#s3").removeClass("yon");
			}


	function cont3(){
$("#container1").hide();
$("#container2").hide();
$("#container3").show();
$("#s2").removeClass("yon");
$("#s3").addClass("yon");
$("#s1").removeClass("yon");
			}

		 $(function(){
        //出现浮动层
        // $(".ljzf_but").click(function(){
        //     $(".ftc_wzsf").show();
        // });
$("#container2").hide();
$("#container3").hide();

		


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
        $(".nub_ggg li .zf_num").click(function(){
                
            if(i<6){
                $(".mm_box li").eq(i).addClass("mmdd");
                $(".mm_box li").eq(i).attr("data",$(this).text());
                i++
                if (i==6) {
                  setTimeout(function(){
                    var pwd = "";
                        $(".mm_box li").each(function(){
                        pwd += $(this).attr("data");
                    });
                   // alert("支付成功"+data);

                    var dprice=($('#dprice').val());//支付单价
                    var tprice=($('#copy').val());//支付总价
                    var num = parseFloat($('#num').val());//数量
                    var dealid = parseInt($('#dealid').val());//订单ID
                    var cid = <?php echo ($cid); ?>;//币的种类
                    var ss1=parseFloat($(".limit").text());

                        $.ajax({
                            url:'/Turntable/yue_chushou',
                            asyn:false,
                            type:'post',
                            data:{'dprice':dprice,'num':num,'tprice':tprice,'cid':cid,'pwd':pwd,'ss1':ss1,'dealid':dealid},
                            datatype:'json',
                            success:function (mes) {
                                if(mes.status == 1){

                                	$(".ftc_wzsf").hide();
                                    msg_alert(mes.message,mes.url);
                                    
                                }else{
                                    msg_alert(mes.message);
                                    
                                }
                            }
                        })


                  },100);
                };
            } 
        });
            
        $(".nub_ggg li .zf_del").click(function(){
            if(i>0){
                i--
                $(".mm_box li").eq(i).removeClass("mmdd");
                $(".mm_box li").eq(i).attr("data","");
            }
        });

        $(".nub_ggg li .zf_empty").click(function(){
            $(".mm_box li").removeClass("mmdd");
            $(".mm_box li").attr("data","");
            i = 0;
        });
         
    });
	   </script>





</html>