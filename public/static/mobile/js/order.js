$("#info_detail").css("height",winH);


$("#view_more_info").on("click",function(){
    $("body").addClass("overflow");
    $("#info_detail").addClass("move-to-r0");
    bodyScroll();
    $("#info_detail").unbind("touchmove");//解绑
});
$("#close_info_detail").on("click",function(){
    $("body").removeClass("overflow");
    $("#info_detail").removeClass("move-to-r0");
    $("body").unbind("touchmove");//解绑
});

//显示出每个店铺的活动信息
$(".shop-activity").on("click",function(){
    $(this).parent().parent().toggleClass("show-shop-info-detail");
});


















