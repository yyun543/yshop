<?php
/**
 * Created by PhpStorm.
 * Auther: hqq520
 * name: account控制器
 * Date: 2017/6/11
 * Time: 16:00
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class acountController extends \yphp
{
    use view;

    /*
    * 账户信息页面
    */
    public function acount()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/acount.html');
    }

    /*
    * 账户余额页面
    */
    public function cash()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/cash.html');
    }

    /*
       * 账户余额页面2
       */
    public function nocord()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/nocord.html');
    }

    /*
      * 支付提交页面
      */
    public function pay()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/pay.html');
    }

    /*
          * 支付余额页面3
          */
    public function payout()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/payout.html');
    }

    /*
         * 充值页面
         */
    public function recharge()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/recharge.html');
    }

    /*
        * 账户余额页面4
        */
    public function rechargePayout()
    {
        // TODO
        // 渲染前台首页模板
        $this->display('acount/rechargePayout.html');
    }

}