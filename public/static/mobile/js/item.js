//点击收藏
$("#collection").on("click",function(){
    if(!$(this).hasClass("collected")){
        $(this).addClass("collected");
        $(this).find("h4").html("已收藏");
    }else{        
        $(this).removeClass("collected");
        $(this).find("h4").html("收藏");
    }
});

/********************************************************轮播图**/
    $('#home_slider').flexslider({
        animation : 'slide',
        controlNav : true,
        directionNav : true,
        animationLoop : true,
        slideshow : false,
        useCSS : false
    });


    //规格显示详情
    $("#btn-specs a").click(function() {
        if ($("#specs-details").is(':hidden')) {
            $("#btn-specs a label").addClass("turnDown");
            $("#btn-specs a label").removeClass("turnUp");

        } else {
            $("#btn-specs a label").removeClass("turnDown");
            $("#btn-specs a label").addClass("turnUp");
        }
        $("#specs-details").slideToggle();
    });
    //规格选择
    $("#color span").click(function() {
        var val=$(this).html();
        $("#color span").removeClass("active");
        $(this).toggleClass("active");

        $("#s1").html(val);
    });
    $("#proSize span").click(function() {
        var val=$(this).html();
        $("#proSize span").removeClass("active");
        $(this).toggleClass("active");
        $("#s2").html(val);
    });
    //数量增减;
    function minus() {
        var a = parseInt($("#number").val(), 10);
        if (a <= 1) {
            $("#number").val(1);
            $("#s3").html("1")
        } else {
            a--;
            $("#number").val(a);
            $("#s3").html(a )
        }
    }
    function plus() {
        var a = parseInt($("#number").val(), 10);
        if (a >= 999) {
            $("#number").val(1);
            $("#s3").html("1")
        } else {
            a++;
            $("#number").val(a);
            $("#s3").html(a)
        }
    }
    //显示促销
    $("#sales-details a").click(function() {
        if ($(".list-saleinfo").is(':hidden')) {
            $("#sales-details a label").addClass("turnDown");
            $("#sales-details a label").removeClass("turnUp");

        } else {
            $("#sales-details a label").removeClass("turnDown");
            $("#sales-details a label").addClass("turnUp");
        }
        $("#saleInfo").slideToggle();
    });

//图片懒加载
$("img.productImg").lazyload({
    placeholder : "images/good-lazy.png",
    effect : "fadeIn",
});

    /******************************************************************监听滚动条事件*******************************************************************/
    var page = 0;
    var contrl = 1;
    var pagetotal = 5;

    $(function(){
        $(window).scroll(function(){
            if ($(window).scrollTop()>350){
                $("#fixed-bottom").css("display","none");
            }else{
                $("#fixed-bottom").css("display","block");
            }

            var scrollTop = $(window).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(window).height();
            if(scrollTop + windowHeight > scrollHeight-50){
                page++;
                getGoodsMore(page);
            }
            if ($(window).scrollTop()>800){
                $("#scrolltop").show();
            }else{
                $("#scrolltop").hide();
            }
        });
    });

    /******************************************************************下拉加载更多*******************************************************************/

    function getGoodsMore(pageCur){
        if(pageCur<=pagetotal){            
            $.ajax({
                type: 'GET',
                url: 'json/more.json',
                dataType: 'json',
                beforeSend:function(){
                    $("#caseMarronFonce").css("display","block");
                },
                success: function(data){
                    $("#caseMarronFonce").fadeOut(2000,function(){
                        var result = '';
                        for(var i = 0; i < data.lists.length; i++){
                            result +=   '<li class="productShowItem">'
                            +'<a href="'+data.lists[i].link+'" target="_self"><img class="productImg" data-original="'+data.lists[i].pic+'">'
                            +'<p><label class="productName">'+data.lists[i].title+'</label></p>'
                            +'<p><span class="nowPrice">￥<label>'+data.lists[i].nowprice+'</label></span><del><span class="price-icon">¥</span><span class="font-num">128</span></del></p>'
                            +'<p><span class="ratings">90%好评(207人)</span></p>'
                            +'<p class="shadow"></p>'
                            +'</a></li>';
                        }
                        $('.productShowList').append(result);
                        $("img.productImg").lazyload({
                            placeholder : "images/good-lazy.png",
                            effect : "fadeIn",
                        });
                    });
                },
                error: function(){
                    $("#caseMarronFonce").css("display","none");
                }
            });
        }else{
            $("#footer").css("display","block");
        }
    }