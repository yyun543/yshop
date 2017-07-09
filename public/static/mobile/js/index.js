    $('#home_slider').flexslider({
        animation : 'slide',
        controlNav : true,
        directionNav : true,
        animationLoop : true,
        slideshow : false,
        useCSS : false
    });
    $('#CoinBanner').flexslider({
        animation : 'slide',
        controlNav : true,
        directionNav : true,
        animationLoop : true,
        slideshow : false,
        useCSS : false
    });
    $("#home_slider .slide").css("height",$("#home_slider .slide img").height());
    $("#CoinBanner .slide").css("height",200);
    $(".flex-direction-nav").remove();

    $(".classification .lazyLoadImg").lazyload({
            placeholder : "images/lazyDefault.png",
            effect : "fadeIn",
        });
    $(".privilege .lazyLoadImg").lazyload({
            placeholder : "images/vip-lazy.png",
            effect : "fadeIn",
        });
    $(".channel .lazyLoadImg").lazyload({
            placeholder : "images/good-lazy.png",
            effect : "fadeIn",
        });


    var contrl = 0;
    $("#OneHour-btn").on("click",function(){
        $(this).addClass("curr");
        $("#discount-btn").removeClass("curr");
        $("#channel-nav").addClass("switched");
        if(contrl == 0){
            $.ajax({
                    type: 'GET',
                    url: 'json/more.json',
                    dataType: 'json',
                    success: function(data){
                        var result = '';
                        for(var i = 0; i < data.lists.length; i++){
                            result += '<li>'
                                    +'<div class="good-item">'
                                        +'<div class="g-img">'
                                            +'<a href="'+data.lists[i].link+'">'
                                                +'<img class="lazyLoadImg"data-original="'+data.lists[i].pic+'" width="318"height="318">'
                                            +'</a>'
                                        +'</div>'
                                        +'<div class="g-info">'
                                            +'<p class="name"><a href="'+data.lists[i].link+'">'+data.lists[i].title+'</a></p>'
                                            +'<p class="price">'
                                                +'<span class="now-price"><em>￥</em>'+data.lists[i].nowprice+'</span>'
                                                +'<span class="o-price">￥'+data.lists[i].oprice+'</span>'
                                                +'<span class="mark fast">'+data.lists[i].mark+'</span>'
                                            +'</p>'
                                        +'</div>'
                                    +'</div>'
                                +'</li>';
                        }
                        $('#OneHour-list ul').append(result);
                        $("#cc-list").addClass("move-l-640");
                        $(".channel .lazyLoadImg").lazyload({
                            placeholder : "images/good-lazy.png",
                            effect : "fadeIn",
                        });
                        contrl = 1;
                    },
                    error: function(){
                        console.info("获取数据失败了~");
                    }
            });
        }else{
            $("#cc-list").addClass("move-l-640");
        }
            
    });
$("#discount-btn").on("click",function(){
        $(this).addClass("curr");
        $("#OneHour-btn").removeClass("curr");
        $("#cc-list").removeClass("move-l-640");
        $("#channel-nav").removeClass("switched");
});