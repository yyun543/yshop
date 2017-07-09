//编辑产品
$(".cartEdit").each(function(){
    $(this).click(function(){
        $(this).find("i.icon-edit").toggleClass("icon-check");
        $(this).parent().parent().toggleClass("ondedit");
    });
});
//加减商品数量
$(".itemBody a.minus").each(function(){
    $(this).click(function(){
        var _Number = $(this).next("input");
        var num_id = $(this).next("input").data("amount");
        _Number.val(parseInt(_Number.val())-1);
        if(parseInt(_Number.val())<1){ 
            _Number.val(1);
            $("#num-"+num_id).html(1);
        }
        $("#num-"+num_id).html(_Number.val());
        setTotal(); 
    });
});
$(".itemBody a.plus").each(function(){
    $(this).click(function(){
        var _Number = $(this).prev("input");
        var num_id = $(this).prev("input").data("amount");
        _Number.val(parseInt(_Number.val())+1);
        $("#num-"+num_id).html(_Number.val());
        setTotal(); 
    });
});
//绑定输入事件
$('.itemAmount').bind('input propertychange', function(){
    var _id = $(this).attr("data-amount");
    $("#num-"+_id).text($(this).val());
    setTotal();
}); 

$(".td-chk .td-inner").each(function(){
    $(this).click(function(){
        if($("input[class*=regular-checkbox]").is(':checked')){
            $("#checkAll").addClass("checked");
            setTotal();
        }
    });
});



//计算总价
function setTotal(){
    var s=0,a=0,p=0,aa=0;
    $(".regular-checkbox").each(function(){
        if($(this).prop("checked"))
        {           
            a = parseFloat($(this).parents(".goodsItem").find('input[class*=itemAmount]').val());
            aa+=a;
            p =  parseFloat($(this).parents(".goodsItem").find('input[class*=thisPay]').val());
            s += parseInt(a * p);           
        }
    }); 
    $("#price").html(s);
    $("#ItemNum").html(aa);
    
}



//删除
$(".orderItem .del").each(function(){
    $(".orderItem .del").on("click",function(){
        if($(this).parents(".goodsItem").siblings(".goodsItem").length>0)
        {
            $(this).parents(".goodsItem").remove();
        }
        else
        {
            $(this).parents(".orderItem").remove();
        }
        setTotal(); 
        //var oid = $(this).find("a").attr("data-oid");
        //$("#orderHolder_s_"+oid).remove();
        
    });    
});
$(".regular-checkbox").each(function() {
    $(this).click(function()
    {
        setTotal();
        $("#SelectAllCbx").prop("checked", false);
        $(this).parents(".goodsItem").siblings(".cartShop").find(".regular-allcheckbox").prop("checked",false);
    });
;});

//商店全选    
$(".shopAllSelect").click(function(){
    
   
    if($(this).children(".regular-allcheckbox").prop("checked"))
    {       
        $(this).children(".regular-allcheckbox").prop("checked", false);
        $(this).parent().siblings(".goodsItem").find(".regular-checkbox").prop("checked",false);
        setTotal();     
    }
    else
    {       
        $(this).children(".regular-allcheckbox").prop("checked", true);
        $(this).parent().siblings(".goodsItem").find(".regular-checkbox").prop("checked",true); 
        setTotal();     
    }   
    return false;
});




//全选
$("#checkAll").on("click",function(){
    
    if(!$(this).hasClass("checked")){
        $(this).addClass("checked");
        $("#SelectAllCbx").prop("checked", true);
        $(".orderItem input").prop("checked",true);
        setTotal();
    }else{
        $(this).removeClass("checked");
        $("#SelectAllCbx").prop("checked", false);
        $(".orderItem input").prop("checked",false);
        $("#price").html("0.00");
        $("#ItemNum").html("0");
    }
});