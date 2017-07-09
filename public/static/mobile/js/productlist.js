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

            if($(window).scrollTop()>150){
                $("#selcetGood").addClass("fixed-top").css("box-shadow","0 2px 10px #ddd");
            }else{
                $("#selcetGood").removeClass("fixed-top").css("box-shadow","none");
            }
            var scrollTop = $(window).scrollTop();
            var scrollHeight = $(document).height();
            var windowHeight = $(window).height();

            if(scrollTop + windowHeight > scrollHeight-150){
                $("#caseMarronFonce").css("display","block");
            }
            if(scrollTop + windowHeight > scrollHeight-5){
                page++;
                getGoodsMore(page);
            }
        });
    });

    /******************************************************************下拉加载更多*******************************************************************/
    function getGoodsMore(pageCur){
        if(pageCur<=pagetotal){
            $.ajax({
                type: 'GET',
                url: 'json/productlist.json',
                dataType: 'json',
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
            $("#caseMarronFonce").remove();
            $("#footer").removeClass("none");
        }
    }






        var pageCur = 0;
        var pagetotal = 5;//总页数
        $(function(){
            $(window).scroll(function(){
                var scrollTop = $(window).scrollTop();
                var scrollHeight = $(document).height();
                var windowHeight = $(window).height();
                if(scrollTop + windowHeight > scrollHeight-5){
                    pageCur++;
                    AjaxGetMore(pageCur,targetEl,LoadingEl,url,data);
                }
            });
        });
/*
*pageCur--->当前页数
*targetEl--->目标DIV的ID名
*LoadingEl--->加载DIV的ID名
*url--->Ajax请求的URL
*data--->返回的数据


*/
        function AjaxGetMore(pageCur,targetEl,LoadingEl,url,data){
            if(pageCur<=pagetotal){
                $.ajax({
                    type: 'GET',
                    url: url,
                    dataType: 'json',
                    beforesend:function(){
                        LoadingEl.css("display","block");
                    },
                    success: function(data){
                        LoadingEl.fadeOut(2000,function(){                        
                            targetEl.append(data);
                        });
                    },
                    error: function(){
                        LoadingEl.css("display","none");
                    }
                });
            }else{
                LoadingEl.remove();
                $("#footer").removeClass("none");
            }
        }
