<?php
/**
 * Created by PhpStorm.
 * User: LIMON qy
 * Date: 2017/6/11
 * Time: 18:14
 * 关于订单
=======
 * 商城首页控制器

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class orderController extends \yphp{

    use view;


    public function order()
    {
        //订单
        $this->display('order/order.html');
    }

    public function orderTmpty()
    {
        //订单空白
        $this->display('order/order_tmpty.html');
    }


    public function orderBak()
    {
        /*
       * 我的订单
        */
        // TODO
        $this->display('order/order-bak.html');
    }

    public function orderPayment()
    {
        /*
       * 支付
        */
        // TODO
        $this->display('order/order-payment.html');
    }


    public function orderList()
    {
        /*
       * 我的订单
       */
        // TODO
        $this->display('order/orderList.html');
    }

    public function payment()
    {
        /*
      * 订单详情
      */
        // TODO
        $this->display('order/payment.html');
    }


    public function productComment()
    {
        /*
      * 商品晒单
       */
        // TODO
        $this->display('order/productComment.html');
    }

    public function productList()
    {
        /*
      * 商品列表
       */
        // TODO
        $this->display('order/productList.html');
    }



}