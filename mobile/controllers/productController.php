<?php
/**
 * 商品列表控制器
 * auther: qy
 * Date: 2017/6/12
 * Time: 14:59
 */
namespace mobile\controllers;

use yphp\view;
use mobile\models;
class productController extends \yphp{

    use view;


    public function productComment()
    {
        /*
      * 商品晒单
       */
        // TODO
        $this->display('product/productComment.html');
    }

    public function productList()
    {
        /*
      * 商品列表
       */
        // TODO
        $this->display('product/productList.html');
    }



}