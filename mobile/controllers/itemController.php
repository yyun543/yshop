<?php
/**
Author:zhoulin
Date:2017/6/11

 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class itemController extends \yphp{

    use view;


    public function item()
    {
        //商品详情
        $this->display('item/item.html');
    }

    public function index()
    {
        //订单空白
        $this->display('item/item.html');
    }



}