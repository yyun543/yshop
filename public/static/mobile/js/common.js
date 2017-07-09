//设置各个元素的宽高
var winH = $(window).height();
var winW = $(window).width();
$("#dlz-wrapper,.main").css("min-height",winH);
$("#pageLoading,#CloseLayer,#right-content,#left-content,.left-content-main").css("height",winH);
$("#menu").css("height",winH-300);
$("#menu a").css({
    "height":(winH-300)/5,
    "line-height":((winH-300)/5)+"px"
});
$("#menu li.cart em,#menu li.message em").css({
    "top":((winH-300)/5-24)/2-12
});
$("#search-select").css("height",winH-315);


$(window).load(function (){
    $("#dlz-wrapper").addClass("fadeIn");//页面淡入效果
    $("#pageLoading").remove();//页面载入完成之后移除页面加载loading
});

//左侧按钮
$("#search-btn").on("click",function(){
    $("#left-content").addClass("left0");
    $(".main").removeClass("move-l-260");
    $("body").addClass("overflow");
    bodyScroll();
});
//右侧按钮
$("#more-btn").on("click",function(){
    $("#left-content").removeClass("left0");
    $(".main").addClass("move-l-260");
    $("#CloseLayer").addClass("move-l-380");
    $("body").addClass("overflow");    
    $(".bottom").addClass("move-l-260");//购物车底部按钮
    $("#fixed-bottom").addClass("move-l-260");//商品详情底部按钮
    bodyScroll();   
});

//点击空白处关闭，回归到默认状态
$("#CloseLayer,#closeSearch").on("click",function(){
    $("#left-content").removeClass("left0");
    $(".main").removeClass("move-l-260");
    $("#CloseLayer").removeClass("move-l-380");
    $("body").removeClass("overflow");
    $(".bottom").removeClass("move-l-260");//购物车底部按钮
    $("#fixed-bottom").removeClass("move-l-260");//商品详情底部按钮
    $("body").unbind("touchmove");//解绑
});


function bodyScroll(){
    $(document.body).bind({touchmove:function(e){
            e.preventDefault();//阻止滑动
        }
    });
}


//左侧--->搜索--->按钮切换
$("#search-switch").on("click",function(){
    if(!$(this).hasClass("switched")){
        $(this).addClass("switched");
        $(".search-switch .good").addClass("curr");
        $(".search-switch .shop").removeClass("curr");
        $("#search-style").val("商品");
    }else{        
        $(this).removeClass("switched");
        $(".search-switch .good").removeClass("curr");
        $(".search-switch .shop").addClass("curr");
        $("#search-style").val("商家");
    }
});
//左侧--->搜索--->输入框
$(".su-list li").on("click",function(){
    $(".su-list li").removeClass("active");
    $(this).addClass("active");
    $("#keyword").val($(this).text());
});



//移动隐藏显示回顶按钮
$(window).scroll(function(){
    var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//滚动条滚动高度
    if (scrollTop>800){
        $("#gototop").addClass("show");
        $("#gotocart-link").addClass("show");
    }else{
        $("#gototop").removeClass("show");
        $("#gotocart-link").removeClass("show");
    }
});
//回到顶部
$("#gototop").click(function(){
    $('body,html').animate({scrollTop:0},500);
});

//返回
$("#backHistory").click(function () {
    history.go(-1);
});