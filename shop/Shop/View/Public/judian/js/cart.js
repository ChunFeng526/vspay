$(function(){
	// 消除点击延迟js库
	FastClick.attach(document.body);  


        // 单选
        $(".shopcarts .check").click(function(){
            $(this).toggleClass("selected");
            judgeChecked();
            setTotal();
            // inputchecked();
        })

        function inputchecked(){
            $(".shopcarts dl dd").each(function(){
                if($(this).find(".check").is(".selected")){
                    $(this).find('input').attr("checked",'true');  
                }else{
                    $(this).find('input').removeAttr("checked");             
                }
            });
        };

        $(".handle .state").click(function(){
            inputchecked();            
        })

        // 全选

        $(".balance .checkall").click(function(){
            ifAllChecked();
            $(this).children("span").toggleClass("selected");
            setTotal();            
        })

        function ifAllChecked(){
            if($(".balance .checkall span").is(".selected")){
                $(".shopcarts .check").removeClass("selected");
            }else{
                $(".shopcarts .check").addClass("selected");                
            }
        }

        function judgeChecked(){
                var all = true;
                for (var k = 0; k < $(".shopcarts dl .check").length ; k++) {
                    if (!$(".shopcarts dl .check").eq(k).is(".selected")) {
                        all = false;
                        $(".balance .checkall span").removeClass("selected");
                    };
                };

                if (all) {
                    for (var i = 0; i < $(".shopcarts dl .check").length ; i++) {
                        $(".balance .checkall span").addClass("selected");
                    };
                };
        }

        
        // 商品数量增减
        function addNum(){
            $(".numbers .ad").click(function(){
                var $reduce = $(this).parent().find(".reduce");
                var $input = $(this).parent().find("input");
                var $val = $input.val();
                $val++;
                $input.val($val);
                $reduce.css("color","#999");
                if($val > 10){
                    $(this).css("color","#DDD");  
                    $input.val(10);
                }
                setTotal();
            });
        }

addNum();

        function reduceNum(){
            $(".numbers .reduce").click(function(){
                var $input = $(this).parent().find("input");
                var $val = $input.val();
                if($val > 1){           
                    $val--;
                    $input.val($val);
                    $(this).css("color","#999");           
                }
                if($input.val() <= 1){
                    $(this).css("color","#DDD");            
                }

                setTotal();

            }); 
        }
        // 总价格计算
reduceNum();
        function setTotal(){
            var $totalprice = $(".totalprice span");            
                 s = 0;
            $(".shopcarts dl dd").each(function(){



                if($(this).find(".check").is(".selected")){
                    var $num = $(this).find(".numbers input").val();
                    var $price = $(this).find(".price span").text();
                    s += $num*$price;
                }

                console.log($price);
            });
            $totalprice.html(s);
        }
setTotal();



    // 删除商品
    $(".numbers .detes").click(function(){
        if($(this).parents("dd").find(".check").is(".selected")){
            $(this).parents("dd").remove();
        }
        setTotal();

    });



    // $(".handle .delete").click(function(){
    //     if($(this).parents(".balance").find(".checkall span").is(".selected")){
    //         $(".shopcarts dl dd").remove();
    //     }
    //     if($(".shopcarts dd .check").is(".selected")){
    //         $(this).parents(".balance").siblings(".shopcarts").find("dd .selected").parent("dd").remove();
    //     }
    //     setTotal();
    //     $(".balance .checkall span").removeClass("selected");        
    // })




})






